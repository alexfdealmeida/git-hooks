#!/bin/sh

function copyFileValidate () {
	if [ -z "$1" ]; then
		echo "Informe o arquivo que sera copiado!"
		exit 1
	fi

	if ! [ -f "$1" ]; then
		echo "Arquivo invalido: '$1'!"
		exit 1
	fi

	if ! [ -e "$1" ]; then
		echo "Arquivo nao existe: '$1'!"
		exit 1
	fi

	if [ -z "$2" ]; then
		echo "Informe o diretorio destino!"
		exit 1
	fi

	if ! [ -d "$2" ]; then
		echo "Diretorio destino invalido: '$2'!"
		exit 1
	fi
}

function copyFileExec () {
	vFileName="$1"
	vDestinationDirectory="$2"

	echo "Copiando o arquivo '$vFileName' para '$vDestinationDirectory'"
	scp $vFileName $vDestinationDirectory
}

copyFileValidate $*

copyFileExec $*