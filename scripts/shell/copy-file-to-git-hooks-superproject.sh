#!/bin/sh

function copyFileToGitHooksSuperProjectValidate () {
	if [ -z "$1" ]; then
		echo "Informe o arquivo que sera copiado!"
		exit 1
	fi
}

function copyFileToGitHooksSuperProjectExec () {
	vFileName="$1"
	vGitdirSubmodule="$2"

	if [ -z "$vGitdirSubmodule" ]; then
		vDestinationDirectory="./../../../.git/hooks/"
	else
		vDestinationDirectory="./../../../$vGitdirSubmodule/hooks/"
	fi

	vRootDirectory="$(pwd)"
	vScriptsDirectory="$vRootDirectory/git-hooks/scripts/shell"

	cd $vScriptsDirectory
	#echo "Alterado diretorio raiz para o diretorio dos scripts '$vScriptsDirectory'"

	./copy-file.sh $vFileName $vDestinationDirectory
	if [ "$?" -ne "0" ]; then
		echo "Nao foi possivel copiar o hook '$1' para o diretorio '$vDestinationDirectory'!"
		#exit 1
	fi

	cd $vRootDirectory
	#echo "Alterado diretorio dos scripts para o diretorio raiz '$vRootDirectory'"
}

copyFileToGitHooksSuperProjectValidate $*

copyFileToGitHooksSuperProjectExec $*