# Función personalizada para ls con íconos
ls_with_icons() {
    # Usar el comando ls original y procesar su salida
    if [[ "$1" == "-l" ]]; then
        command ls -l "$@" | while IFS= read -r line; do
            if [[ "$line" =~ ^total ]]; then
                echo "$line"
                continue
            fi

            permissions=$(echo "$line" | awk '{print $1}')
            owner=$(echo "$line" | awk '{print $3}')
            file_name=$(echo "$line" | awk '{print $9}')
            file_type=${permissions:0:1}

            case $file_type in
                d) # Directorio
                    printf "\033[1;34m📁 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                    ;;
                -) # Archivo regular
                    case "${file_name##*.}" in
                        rpm|deb) # Paquetes RPM y DEB
                            printf "\033[1;35m📦 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        sh) # Archivo de script shell
                            printf "\033[1;33m💲 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        py) # Archivo de Python
                            printf "\033[1;36m🐍 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        md|txt) # Documentos de texto, markdown
                            printf "\033[1;32m📜 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        tar|gz|zip|rar|7z) # Archivos comprimidos
                            printf "\033[1;37m🗂️ %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        iso) # Archivo ISO
                            printf "\033[1;35m💿 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        log) # Archivos de log
                            printf "\033[1;30m📜 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        json) # Archivos JSON
                            printf "\033[1;36m📄 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        xml) # Archivos XML
                            printf "\033[1;34m📄 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        css) # Archivos CSS
                            printf "\033[1;33m🎨 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        js) # Archivos JavaScript
                            printf "\033[1;32m📜 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        md5) # Archivos MD5
                            printf "\033[1;35m🔒 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        conf) # Archivos Conf
                            printf "\033[1;36m🔧 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        htm|html) # Archivos HTML
                            printf "\033[1;31m🌐 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        sql) # Archivos SQL
                            printf "\033[1;35m🛢️ %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        ipynb) # Archivos Jupyter Notebook
                            printf "\033[1;36m📓 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                        *) # Otros archivos regulares
                            printf "\033[1;32m📄 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                            ;;
                    esac
                    ;;
                l) # Enlace simbólico
                    printf "\033[1;36m🔗 %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                    ;;
                *) # Otro tipo
                    printf "\033[1;31m❓ %s (Owner: %s, Permissions: %s)\033[0m\n" "$file_name" "$owner" "$permissions"
                    ;;
            esac
        done
    else
        command ls -1 "$@" | while IFS= read -r line; do
            if [[ -d "$line" ]]; then
                printf "\033[1;34m📁 %s\033[0m\n" "$line"
            elif [[ -f "$line" ]]; then
                case "${line##*.}" in
                    rpm|deb) # Paquetes RPM y DEB
                        printf "\033[1;35m📦 %s\033[0m\n" "$line"
                        ;;
                    sh) # Archivo de script shell
                        printf "\033[1;33m💲 %s\033[0m\n" "$line"
                        ;;
                    py) # Archivo de Python
                        printf "\033[1;36m🐍 %s\033[0m\n" "$line"
                        ;;
                    md|txt) # Documentos de texto, markdown
                        printf "\033[1;32m📜 %s\033[0m\n" "$line"
                        ;;
                    tar|gz|zip|rar|7z) # Archivos comprimidos
                        printf "\033[1;37m🗂️ %s\033[0m\n" "$line"
                        ;;
                    iso) # Archivo ISO
                        printf "\033[1;35m💿 %s\033[0m\n" "$line"
                        ;;
                    log) # Archivos de log
                        printf "\033[1;30m📜 %s\033[0m\n" "$line"
                        ;;
                    json) # Archivos JSON
                        printf "\033[1;36m📄 %s\033[0m\n" "$line"
                        ;;
                    xml) # Archivos XML
                        printf "\033[1;34m📄 %s\033[0m\n" "$line"
                        ;;
                    css|scss) # Archivos CSS
                        printf "\033[1;33m🎨 %s\033[0m\n" "$line"
                        ;;
                    js) # Archivos JavaScript
                        printf "\033[1;32m📜 %s\033[0m\n" "$line"
                        ;;
                    md5) # Archivos MD5
                        printf "\033[1;35m🔒 %s\033[0m\n" "$line"
                        ;;
                    conf) # Archivos Conf
                        printf "\033[1;36m🔧 %s\033[0m\n" "$line"
                        ;;
                    htm|html) # Archivos HTML
                        printf "\033[1;31m🌐 %s\033[0m\n" "$line"
                        ;;
                    sql) # Archivos SQL
                        printf "\033[1;35m🛢️ %s\033[0m\n" "$line"
                        ;;
                    ipynb) # Archivos Jupyter Notebook
                        printf "\033[1;36m📓 %s\033[0m\n" "$line"
                        ;;
                    *) # Otros archivos regulares
                        printf "\033[1;32m📄 %s\033[0m\n" "$line"
                        ;;
                esac
            else
                printf "\033[1;31m❓ %s\033[0m\n" "$line"
            fi
        done
    fi
}


# Alias para usar la nueva función
alias ls='ls_with_icons'
