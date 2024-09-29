# Función para obtener la rama actual de Git
get_git_branch() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local branch_name
        branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)  # Obtener el nombre corto de la rama
        if [[ -n "$branch_name" ]]; then
            echo " (${branch_name})"  # Mostrar la rama de Git
        fi
    fi
}

# Función para obtener el nombre del entorno virtual
get_virtual_env() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "($(basename "$VIRTUAL_ENV")) "
    fi
}

# Configurar el prompt
PROMPT_COMMAND='PS1="${VENV_COLOR}\$(get_virtual_env)${RESET_COLOR}${USER_COLOR}\u${RESET_COLOR}@${HOST_COLOR}\h ${DIR_COLOR}\w${GIT_BRANCH_COLOR}\$(get_git_branch)${RESET_COLOR}\n${ARROW_ICON} ${RESET_COLOR}${PROMPT_COLOR}"'
