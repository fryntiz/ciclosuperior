#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Crea un script que muestre el siguiente menú al usuario con las siguientes opciones:
# 1. Copiar un archivo a otro directorio
# 2. Mover un archivo a otro directorio
# 3. Cambiar de nombre a un archivo
# 4. Borrar archivo
# 6. Salir

function menu() {
	clear
	echo ""
	echo "1. Copiar un archivo a otro directorio"
	echo "2. Mover un archivo a otro directorio"
	echo "3. Cambiar de nombre a un archivo"
	echo "4. Borrar archivo"
	echo "6. Salir"
	echo ""
	echo "Introduce una opción del menú"
}

function copiar() {
	echo "Introduce el archivo a copiar"
	read arch1
	
	echo "Introduce donde copiarlo"
	read arch2
	
	if [ -f $arch1 ]; then
		cp $arch1 $arch2
		if [ -f $arch2 ]; then
			echo "Se ha copiado el archivo"
		fi
	else
		echo "No se ha copiado el archivo"
	fi
}

while true; do
	menu
	read input
	
	case $input in
		1) copiar;;
		6) break;;
		*) echo "Opción incorrecta";;
done

exit 0