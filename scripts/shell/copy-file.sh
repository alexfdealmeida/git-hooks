#!/bin/sh

copyFileValidate () {
	if [ -z "$1" ]; then
		echo "Informe o arquivo que sera copiado!"
		exit 1
	fi

	if ! [ -f "$1" ]; then
		echo "Arquivo nao existe: '$1'!"
		exit 1
	fi

	if [ -z "$2" ]; then
		echo "Informe o diretorio destino!"
		exit 1
	fi

	if ! [ -d "$2" ]; then
		echo "Diretorio destino nao existe: '$2'!"
		exit 1
	fi
}

copyFileExec () {
	vFileName="$1"
	vDestinationDirectory="$2"

	echo "Copiando o arquivo '$vFileName' para '$vDestinationDirectory'"
	cp -p "$vFileName" "$vDestinationDirectory"
}

copyFileValidate "$@"

copyFileExec "$@"