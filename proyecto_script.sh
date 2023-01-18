#!/bin/bash
menu(){
    echo "Elige una opción: "
    echo "
    1) Actualizar el software del sistema
    ) Salir del menu"
}

actualizar(){
    sudo apt update
    sudo apt upgrade
}

while true;do
    menu
    read -p "Introduce una opción del menú anterior: " opcion
    case $opcion in
        1)actualizar;;
        )exit;;
        *)echo "Ha introducido una opción no válida";break;;
    esac
done