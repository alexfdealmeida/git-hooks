#!/bin/sh

ALERT="[alert]"
INFO="[info]"
ERROR="[ERROR]"

copyFileValidate () {
	if [ -z "$1" ]; then
		echo "$ERROR Informe o arquivo que sera copiado!"
		exit 1
	fi

	if ! [ -f "$1" ]; then
		echo "$ERROR Arquivo nao existe: '$1'!"
		exit 1
	fi

	if [ -z "$2" ]; then
		echo "$ERROR Informe o diretorio destino!"
		exit 1
	fi

	if ! [ -d "$2" ]; then
		echo "$ERROR Diretorio destino nao existe: '$2'!"
		exit 1
	fi
}

copyFileExec () {
	pFileName="$1"
	pDestinationDirectory="$2"

	echo "Copying the file '$pFileName' to '$pDestinationDirectory'"
	cp -p "$pFileName" "$pDestinationDirectory"
}

copyFileValidate "$@"

copyFileExec "$@"