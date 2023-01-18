#!/bin/bash
menu(){
    echo "Elige una opción: "
    echo "
    1) Actualizar el software del sistema
    2) Instalar un paquete deseado
    3) Salir del menu"
}

actualizar(){
    sudo apt update
    sudo apt upgrade
    echo ""
    echo "----- ACTUALIZACIÓN COMPLETADA -----"
}

instalar(){
    echo "Busca el paquete que deseas instalar para ver si está disponible "
    read -p "Introduce el nombre del paquete: " paquete
    apt-cache search $paquete
    echo ""
    read -p "Elige una de las opciones para instalar " opcion
    sudo apt-get install $opcion
    echo ""
    echo "----- PAQUETE INSTALADO -----"
    echo ""
}

while true;do
    menu
    read -p "Introduce una opción del menú anterior: " opcion
    case $opcion in
        1)clear;actualizar;;
        2)clear;instalar;;
        3)exit;;
        *)echo "Ha introducido una opción no válida";break;;
    esac
done