#!/bin/bash
cat <<'EOF'

  ███████╗██████╗ ███████╗ █████╗ ██████╗ ███████╗██████╗
  ██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
  ███████╗██████╔╝█████╗  ███████║██████╔╝█████╗  ██████╔╝
  ╚════██║██╔══██╗██╔══╝  ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
  ███████║██║  ██║███████╗██║  ██║██║     ███████╗██║  ██║
  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

                        BACKUPS
           github.com/sreaperr/SCRIPTS

EOF
echo "*** SCRIPT DE COPIAS DE SEGURIDAD/BACKUPS ***"
#VARIABLES
B_DIRECTORY="$HOME/BACKUPS"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
#-- FUNCIÓN QUE CREA EL DIRECTORIO BACKUPS
CREATE_BACKUP(){
    if [[ ! -d "$B_DIRECTORY" ]]; then
        mkdir "$B_DIRECTORY"
        echo "Directorio '$B_DIRECTORY' creado."
    fi
}

# -- FUNCIÓN QUE PIDE UN ARCHIVO
DIRECTORY_FILE(){
    read -p "INTRODUCE EL NOMBRE DEL DIRECTORIO: " D_NAME
    FIND=$(find / -type d -name "$D_NAME" 2>/dev/null)
    #-- COMPROBAR QUE FIND MUESTRA 0,1 O MÁS DIRECTORIOS
    if [[ -z "$FIND" ]]; then
        NUM=0
    else 
        NUM=$(echo "$FIND" | wc -l)
    fi
    #-- RESPUESTA DEPENDIENDO DE CUANTOS DIRECTORIOS MUESTRE
    if [[ $NUM -eq 0 ]]; then 
        echo "No se encontraron directorios con ese nombre." && exit 1 
    elif [[ $NUM -gt 1 ]]; then 
        echo "Existe más de un directorio con ese nombre, cambia nombres de directorios para que no esten repetidos." 
        echo "$FIND" && exit 1 
    fi
    echo "Ruta del directorio: '$FIND'"
    read -p "Es esta la ruta del directorio(s/n): " OPTION
}
#=== LANZAMIENTO DEL SCRIPT ===
#--
#--
#--
CREATE_BACKUP
DIRECTORY_FILE
# -- BUCLE WHILE PARA REBUSCAR EL DIRECTORIO
while [[ "${OPTION,,}" == "n" || "${OPTION,,}" == "no" ]]; do 
    DIRECTORY_FILE
done

#-- CREAR EL BACKUP
if [[ "${OPTION,,}" == "s" || "${OPTION,,}" == "si" ]]; then
    echo "CREANDO COPIA DE SEGURIDAD..."
    tar -czf "$B_DIRECTORY/${D_NAME}_$DATE.tar.gz" "$FIND"   
    clear
    echo "*** BACKUP CREADO SCRIPT FINALIZADO ***"
else
    echo "FALLO EN EL SCRIPT... REVISA RUTAS..." && exit 1
fi


