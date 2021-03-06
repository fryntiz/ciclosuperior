#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Script que toma como parámetros una serie de nombres de fichero de texto
# y muestra en la salida estándar el nombre del fichero que tenga más líneas.
# Si hay más de un fichero con el número máximo de líneas debe mostrar el
# nombre de todos ellos. La opción –l de esta orden sirve para que muestre
# en la salida estándar el número de líneas del fichero que se pase como
# parámetro, junto con su nombre.

MAYOR=`echo $1`
ELE=false

if [ `echo $1` = "-l" ]; then
	shift 1
	MAYOR=`echo $1`
	ELE=true
fi

for i in $*; do
	if [ $ELE ]; then
		echo `wc -l $i`
		if [ `wc -l $i | cut -d " " -f1` -gt `wc -l $MAYOR | cut -d " " -f1` ]; then
			MAYOR=$i
		fi
	elif [ `wc -l $i | cut -d " " -f1` -gt `wc -l $MAYOR | cut -d " " -f1` ]; then
		MAYOR=$i
	fi
done

echo "El archivo mayor es $MAYOR con un total de `wc -l $MAYOR | cut -d " " -f1` Líneas"

exit 0