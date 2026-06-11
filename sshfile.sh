#!/bin/bash
cat <<'EOF'

  ███████╗██████╗ ███████╗ █████╗ ██████╗ ███████╗██████╗
  ██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
  ███████╗██████╔╝█████╗  ███████║██████╔╝█████╗  ██████╔╝
  ╚════██║██╔══██╗██╔══╝  ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
  ███████║██║  ██║███████╗██║  ██║██║     ███████╗██║  ██║
  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

            ENVIA O RECIBE ARCHIVOS CON SSH
           github.com/sreaperr/SCRIPTS

EOF
echo "*** SCRIPT DE ENVIO O DESCARGA DE ARCHIVOS O DIRECTORIOS CON SSH ***"
echo "*"
echo "*"
echo "*"
echo "PARA PODER EJECUTAR ESTE SCRIPT DEBEMOS DE TENER EL FICHERO CONFIG CREADO"
echo "SI NO LO TIENES, EXISTE UN SCRIPT DE MI REPOSITORIO QUE TE AGILIZA EL TRABAJO"
sleep 4
clear 

#-- MENU
MENU(){
    echo "*** MENU PARA ENVIAR/RECIBIR ARCHIVOS O DIRECTORIOS MEDIANTE SCP ***"
    read -p "Quieres enviar o recibir(e/r): " OPTION1
    read -p "Dime Host de la máquina remota: " OPTION2
    read -p "Dime Puerto SSH(Default 22): " OPTION3
}

#-- ENVIAR
SEND(){
    read -p "Nombre del archivo o directorio que quieres enviar: " SEND_OP
        FIND=$(find / -name "$SEND_OP" 2>/dev/null)
        #-- COMPROBAR QUE FIND MUESTRA 0,1 O MÁS ARCHIVOS
        if [[ -z "$FIND" ]]; then
            NUM=0
        else 
            NUM=$(echo "$FIND" | wc -l)
        fi
        #-- RESPUESTA DEPENDIENDO DE CUANTOS DIRECTORIOS MUESTRE
        if [[ $NUM -eq 0 ]]; then 
            echo "No se encontraron archivos con ese nombre." && exit 1 
        elif [[ $NUM -gt 1 ]]; then 
            echo "Existe más de un archivo o directorio con ese nombre." 
            echo "$FIND"
        elif [[ $NUM -eq 1 ]]; then 
            echo "Existe una coincidencia." 
            echo "$FIND"
        fi
    read -p "Escribe aquí el archivo o directorio a enviar(poner ruta absoluta): " RUTA
    read -p "Escribe aqui el directorio de la máquina remota al que quieres que se envie: " DESTINO
    if [[ -f "$RUTA" ]]; then
        scp -P "$OPTION3" "$RUTA" "$OPTION2:$DESTINO"
    elif [[ -d "$RUTA" ]]; then
        scp -r -P "$OPTION3" "$RUTA" "$OPTION2:$DESTINO"
    else
        echo "La ruta introducida no existe o no es valida" && exit 1
    fi
}

