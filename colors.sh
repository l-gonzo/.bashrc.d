# Definición de colores
if [ "$EUID" -eq 0 ]; then
    # Colores para el usuario root
    USER_COLOR="\[\e[38;5;255m\]"  # Blanco para el usuario
    HOST_COLOR="\[\e[38;5;196m\]"   # Rojo Sangre para el host
    DIR_COLOR="\[\e[38;5;14m\]"    # Cian Profundo para el directorio
    GIT_BRANCH_COLOR="\[\e[38;5;13m\]" # Púrpura para la rama de Git
    VENV_COLOR="\[\e[38;5;228m\]"  # Verde para el entorno virtual
else
    # Colores para el usuario normal
    VENV_COLOR="\e[32m"       # Verde
    USER_COLOR="\e[34m"       # Azul
    HOST_COLOR="\e[36m"       # Cian
    DIR_COLOR="\e[35m"        # Magenta
    GIT_BRANCH_COLOR="\e[33m" # Amarillo
fi

# Otros códigos para el prompt
ARROW_ICON="➜"  # Flecha estilizada
RESET_COLOR="\[\e[0m\]"        # Resetear colores
PROMPT_COLOR="\[\e[38;5;255m\]" # Blanco (se puede ajustar si es root o no)