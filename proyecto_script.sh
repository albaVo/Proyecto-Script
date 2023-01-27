#!/bin/bash
menu(){
    echo "Elige una opción: "
    echo "
    1) Actualizar el software del sistema
    2) Instalar un paquete deseado
    3) Información sobre el software y el hardware del sistema
    4) Configuración de los usuarios
    5) Configuración de los grupos
    6) Supervisar el rendimiento
    7) Salir del menu
    "
}


actualizar(){
    sudo apt update
    sudo apt upgrade
    echo ""
    echo "----- ACTUALIZACIÓN COMPLETADA -----"
    echo ""
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
   10) Información de las redes
   11) Salir"
   echo ""
   read -p "Selecciona una opción escribiendo su respectivo número a continuación: " opcion
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


usuarios(){
    echo "¿Qué deseas configurar?"
    echo "
    1) Crear usuarios
    2) Modificar usuarios
    3) Eliminar usuarios
    4) Salir"
    echo ""
    read -p "Selecciona una opción escribiendo su respectivo número a continuación: " opcion
    if [ "$opcion" = "1" ]
    then
        clear
        echo "CREACIÓN DE UN USUARIO"
        echo "------------------------"
        read -p "Introduce el nombre del usuario para crearlo: " usuario
        sudo useradd $usuario
        cat /etc/passwd | grep $usuario
        echo ""
        echo "Introduce una contraseña para el usuario: "
        sudo passwd $usuario
        echo ""
        echo "---- Usuario creado con éxito ----"
        echo ""
    elif [ "$opcion" = "2" ]
    then
        clear
        echo "MODIFICACIÓN DE UN USUARIO"
        echo "----------------------------"
        echo ""
        echo "¿Qué deseas modificar?"
        echo "
        1) Cambiar el nombre del usuario
        2) Cambiar la contraseña del usuario
        3) Bloquear la contraseña de un usuario
        4) Desbloquear la contraseña de un usuario
        5) Agregar información a la cuenta del usuario"
        echo ""
        read -p "Selecciona una opción escribiendo su respectivo número a continuación: " opcion
        if [ "$opcion" = "1" ]
        then
            clear
            read -p "Introduce el nombre del usuario que desees modificar: " usuario
            read -p "Introduce el nuevo nombre del usuario: " nombre
            echo ""
            sudo usermod -l $nombre $usuario
            echo ""
            cat /etc/passwd | grep $nombre
            echo ""
            echo "---- Usuario modificado con éxito ----"
            echo ""
        elif [ "$opcion" = "2" ]
        then
            clear
            read -p "Introduce el nombre del usuario que desees modificar: " usuario
            read -p "Introduce la nueva contraseña: " contra
            echo ""
            sudo usermod -p $contra $usuario
            echo ""
            echo "---- Usuario modificado con éxito ----"
            echo ""
        elif [ "$opcion" = "3" ]
        then
            clear
            read -p "Introduce el nombre del usuario del que desees bloquear la contraseña: " usuario
            sudo usermod -L $usuario
            echo ""
            echo "---- Contraseña bloqueada con éxito ----"
            echo ""
        elif [ "$opcion" = "4" ]
        then
            clear
            read -p "Introduce el nombre del usuario del que desees desbloquear la contraseña: " usuario
            sudo usermod -U $usuario
            echo ""
            echo "---- Contraseña desbloqueada con éxito ----"
            echo ""
        elif [ "$opcion" = "5" ]
        then
            clear
            read -p "Introduce el nombre del usuario del que desees agregar información: " usuario
            sudo chfn $usuario
            echo ""
            echo "--- Información agragada con éxito ---"
            echo ""
        fi
    elif [ "$opcion" = "3" ]
    then
        clear
        echo "ELIMINACIÓN DE UN USUARIO"
        echo "----------------------------"
        echo ""
        read -p "Introduce el nombre del usuario para eliminarlo: " usuario
        sudo userdel $usuario
        echo ""
        echo "---- Usuario eliminado con éxito ----"
        echo ""
    fi
}


grupos(){
    echo "¿Qué deseas configurar?"
    echo "
    1) Crear grupos
    2) Modificar grupos
    3) Eliminar grupos
    4) Añadir usuarios a un grupo
    5) Quitar usuarios de un grupo
    6) Salir"
    echo ""
    read -p "Selecciona una opción escribiendo su respectivo número a continuación: " opcion
    if [ "$opcion" = "1" ]
    then
        clear
        echo "CREACIÓN DE UN GRUPO"
        echo "----------------------"
        read -p "Introduce el nombre del grupo para crearlo: " grupo
        echo ""
        sudo groupadd $grupo
        cat /etc/group | grep $grupo
        echo ""
        echo "---- Grupo creado con éxito ----"
        echo ""
    elif [ "$opcion" = "2" ]
    then
        clear
        echo "MODIFICACIÓN DE UN GRUPO"
        echo "--------------------------"
        echo ""
        read -p "Introduce el nombre del grupo que desees modificar: " grupo
        read -p "Introduce el nuevo nombre del grupo: " nombre
        echo ""
        sudo groupmod -n $nombre $grupo
        cat /etc/group | grep $nombre
        echo ""
        echo "---- Grupo modificado con éxito ----"
        echo ""
    elif [ "$opcion" = "3" ]
    then
        clear
        echo "ELIMINACIÓN DE UN GRUPO"
        echo "--------------------------"
        echo ""
        read -p "Introduce el nombre del grupo que desees eliminar: " grupo
        echo ""
        sudo groupdel -f $grupo
        echo ""
        echo "---- Grupo eliminado con éxito ----"
        echo ""
    elif [ "$opcion" = "4" ]
    then
        clear
        echo "AÑADIR USUARIOS A UN GRUPO"
        echo "--------------------------"
        echo ""
        read -p "Introduce el nombre del usuario: " usuario
        read -p "Introduce el nombre del grupo: " grupo
        echo ""
        sudo adduser $usuario $grupo
        echo ""
        echo "--- Usuario añadido al grupo con éxito ---"
        echo ""
    elif [ "$opcion" = "5" ]
    then
        clear
        echo "QUITAR USUARIOS DE UN GRUPO"
        echo "--------------------------"
        echo ""
        read -p "Introduce el nombre del usuario: " usuario
        read -p "Introduce el nombre del grupo: " grupo
        echo ""
        sudo deluser $usuario $grupo
        echo ""
        echo "--- Usuario quitado del grupo con éxito ---"
        echo ""
    fi
}


rendimiento(){
    top
}


while true;do
    menu
    read -p "Introduce una opción del menú anterior: " opcion
    case $opcion in
        1)clear;actualizar;;
        2)clear;instalar;;
        3)clear;informacion;;
        4)clear;usuarios;;
        5)clear;grupos;;
        6)clear;rendimiento;;
        7)exit;;
        *)echo "Ha introducido una opción no válida";break;;
    esac
done