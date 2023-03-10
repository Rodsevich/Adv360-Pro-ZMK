#!/bin/bash
kPathIzq=/Volumes/padIzq/
kPathDer=/Volumes/padDer/
read -p "enchufa un usb en el pad IZQUIERDO y tocá Mod + (1) hasta q titilen las luces y apreta enter en este script"
disco=`diskutil list | grep ADV360PRO | rev | cut -d' ' -f1 | rev`
if [ -z $disco ]
then
    echo "No pude encontrar el disco. Asegurate q este todo bien y empeza de nuevo"
    exit 1
else
    echo "El sistema detecto el teclado como el disco: $disco"
fi
sudo diskutil unmount /dev/$disco
sudo mkdir $kPathIzq
sudo mount -w -t msdos /dev/$disco $kPathIzq
read -p "pegá el archivo left.uf2 que hayas generado en donde se abra el finder en $kPathIzq. Toca Enter para abrirlo ahora"
open $kPathIzq
read -p "Ahora enchufa el usb en el pad DERECHO (sacalo del izquierdo) y tocá Mod + (3) hasta q titilen las luces y apreta enter en este script"
disco=`diskutil list | grep ADV360PRO | rev | cut -d' ' -f1 | rev`
if [ -z $disco ]
then
    echo "No pude encontrar el disco. Asegurate q este todo bien y empeza de nuevo"
    exit 1
else
    echo "El sistema detecto el teclado como el disco: $disco"
fi
sudo diskutil unmount /dev/$disco
sudo mkdir $kPathDer
sudo mount -w -t msdos /dev/$disco $kPathDer
read -p "pegá el archivo left.uf2 que hayas generado en donde se abra el finder en $kPathDer. Toca Enter para abrirlo ahora"
open $kPathDer