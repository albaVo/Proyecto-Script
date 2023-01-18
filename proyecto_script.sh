#!/bin/bash
menu(){
    echo "Elige una opción: "
    echo "
    1) Actualizar el software del sistema
    2) Instalar un paquete deseado
    3) Información sobre el software y el hardware del sistema
    4) Salir del menu"
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

informacion(){
   echo "¿Sobre qué deseas ver información?"
   echo "
   1) Información del fabricante y del modelo
   2) Información del procesador
   3) Información de la memoria RAM y la partición swap
   4) Información sobre el kernel
   5) Información sobre el shell
   6) Información sobre la distribución
   7) Información sobre el entorno del usuario
   8) Información del hardware
   9) Información sobre los medios de almacenamiento y arranque
   10) Información de las redes"
   echo ""
   read -p "Selecciona una opción escribiendo su respectivo número a continuación:  " opcion
    if [ "$opcion" = "1" ]
    then
        clear
        echo "INFORMACIÓN DEL FABRICANTE Y DEL MODELO"
        echo "-----------------------------------------"
        echo ""
        echo "Fabricante del equipo: "  
        sudo dmidecode -s system-manufacturer
        echo ""
        echo "Nombre del producto: "  
        sudo dmidecode -s system-product-name
        echo ""
        echo "Número de serie del equipo: "  
        sudo dmidecode -s system-serial-number
        echo ""
        echo "Fabricante del equipo: "  
        sudo dmidecode -s system-manufacturer
        echo ""
        echo ""
    elif [ "$opcion" = "2" ]
    then
        clear
        echo "INFORMACIÓN DEL PROCESADOR"
        echo "----------------------------"
        echo ""
        echo "Nombre del fabricante, modelo y velocidad: "
        grep 'vendor_id' /proc/cpuinfo ; grep 'model name' /proc/cpuinfo ; grep 'cpu MHz' /proc/cpuinfo  
        echo ""
        echo "Arquitectura (32 o 64 bits): "  
        sudo lshw -C CPU | grep width
        echo ""
        echo ""
    elif [ "$opcion" = "3" ] 
    then
        clear
        echo "INFORMACIÓN DE LA MEMORIA RAM Y PARTICIÓN SWAP"
        echo "------------------------------------------------"
        echo ""
        echo "Total de memoria RAM y la particón swap: "  
        free -m
        echo ""
        echo ""
    elif [ "$opcion" = "4" ]
    then
        clear
        echo "INFORMACIÓN SOBRE EL KERNEL"
        echo "------------------------"
        echo ""
        echo "Nombre y versión: "
        uname -sr 
        echo ""
        echo ""
    elif [ "$opcion" = "5" ]
    then
        clear
        echo "INFORMACIÓN SOBRE EL SHELL"
        echo "-----------------------"
        echo ""
        echo "Shell en uso: "  
        echo $SHELL
        echo ""
        echo ""
    elif [ "$opcion" = "6" ]
    then
        clear
        echo "INFORMACIÓN SOBRE LA DISTRIBUCIÓN"
        echo "-----------------------------------"
        echo ""
        echo "Nombre, versión y nombre clave de la distribución: "
        lsb_release -idc 
        echo ""
        echo ""
    elif [ "$opcion" = "7" ]
    then
        clear
        echo "INFORMACIÓN SOBRE EL ENTORNO DEL USUARIO"
        echo "------------------------------------------"
        echo ""
        echo "Nombre del usuario actual: "  
        echo $USER
        echo ""
        echo "Nombre del equipo: "  
        hostname
        echo ""
        echo "Directorio base del usuario actual: "  
        echo $HOME
        echo ""
        echo ""
    elif [ "$opcion" = "8" ]
    then
        clear
        echo "INFORMACIÓN DEL HARDWARE"
        echo "--------------------------"
        echo ""
        echo "Listar los dispositivos PCI / PCIe: "  
        lspci
        echo ""
        echo "Listar los dispositivos USB: "  
        lsusb
        echo ""
        echo "Listar el hardware (información resumida): "  
        sudo lshw -short
        echo ""
        echo ""
    elif [ "$opcion" = "9" ]
    then
        clear
        echo "INFORMACIÓN SOBRE LOS MEDIOS DE ALMACENAMIENTO Y ARRANQUE"
        echo "-----------------------------------------------------------"
        echo ""
        echo "Listar las particiones en los medios de almacenamiento: "  
        sudo fdisk -l
        echo ""
        echo "Espacio usado y disponible en las particiones: "
        df -h
        echo ""
        echo "Valor UUID de todas las particiones: "
        sudo blkid
        echo ""
        echo ""
    elif [ "$opcion" = "10" ]
    then
        clear
        echo "INFORMACIÓN DE LAS REDES"
        echo "--------------------------"
        echo ""
        echo "Listar los dispositivos de red alámbricos PCI: "
        lspci | grep -i ethernet
        echo ""
        echo "Resolución de nombres de dominio: "
        cat /etc/resolv.conf
        echo ""
        echo "Contenido del archivo hosts: "
        cat /etc/hosts
        echo ""
        echo "Tabla de enrutamiento: "
        sudo route -n
        echo ""
        echo "Configuración de red TCP/IP: "
        ifconfig
        echo ""
        echo ""
    else
        echo ""
        echo "Elige una opción válida"
        echo ""
    fi
}

while true;do
    menu
    read -p "Introduce una opción del menú anterior: " opcion
    case $opcion in
        1)clear;actualizar;;
        2)clear;instalar;;
        3)clear;informacion;;
        4)exit;;
        *)echo "Ha introducido una opción no válida";break;;
    esac
done