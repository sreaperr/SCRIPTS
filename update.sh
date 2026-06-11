#!/bin/bash
cat <<'EOF'

  ███████╗██████╗ ███████╗ █████╗ ██████╗ ███████╗██████╗
  ██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
  ███████╗██████╔╝█████╗  ███████║██████╔╝█████╗  ██████╔╝
  ╚════██║██╔══██╗██╔══╝  ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
  ███████║██║  ██║███████╗██║  ██║██║     ███████╗██║  ██║
  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

            GLOBAL UPDATE AND UPGRADE
           github.com/sreaperr/SCRIPTS

EOF
echo "*** SCRIPT DE ACTUALIZACIONES ***"

#-- UPDATE PACMAN
UPDATE_PACMAN(){
    echo "ACTUALIZANDO PAQUETES DE PACMAN..."
    sudo pacman -Syu || { echo "Se ha producido un error" && exit 1; }
    echo "LIMPIANDO CACHES(SAFE MODE)..."
    sudo pacman -Sc --noconfirm || { echo "Se ha producido un error" && exit 1; }
}
#-- UPDATE PARU
UPDATE_PARU(){
    echo "ACTUALIZANDO PAQUETES DE PARU..."
    paru -Sua || { echo "Se ha producido un error" && exit 1; }
    echo "LIMPIANDO CACHES(SAFE MODE)..."
    paru -Sc --noconfirm || { echo "Se ha producido un error" && exit 1; }
}

UPDATE_PACMAN
UPDATE_PARU
clear
echo "*** ACTUALIZACIONES TERMINADAS ***"

