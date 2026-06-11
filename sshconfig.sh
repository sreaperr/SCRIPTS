#!/bin/bash
cat <<'EOF'

  ███████╗██████╗ ███████╗ █████╗ ██████╗ ███████╗██████╗
  ██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
  ███████╗██████╔╝█████╗  ███████║██████╔╝█████╗  ██████╔╝
  ╚════██║██╔══██╗██╔══╝  ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
  ███████║██║  ██║███████╗██║  ██║██║     ███████╗██║  ██║
  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

        CONFIGURACIÓN DE ARCHIVO ~/.ssh/config
           github.com/sreaperr/SCRIPTS

EOF
#-- VARIABLES
CONFIG="$HOME/.ssh/config"
if [[ ! -f "$CONFIG" ]]; then
    echo "Creando archivo config..."
    touch "$CONFIG"
fi
    echo "*** SCRIPT QUE AÑADE HOST A ARCHIVO CONFIG ***"
    read -p "Dime el nombre que vas a querer usar para acceder a este host: " Host
    read -p "Dime la IP de la máquina: " IP
    read -p "Dime el usuario: " User
    read -p "Dime la ruta de la clave: " Ruta
    read -p "Dime el puerto: " Port
    echo "Añadiendo '$Host' a archivo config..."
    cat >> "$CONFIG"<<EOF
Host $Host
    HostName $IP
    User $User
    IdentityFile $Ruta
    IdentitiesOnly yes
    Port $Port
EOF

