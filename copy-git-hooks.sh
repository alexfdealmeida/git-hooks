#!/bin/bash

vScriptCopyFile="scripts/shell/copy-file.sh"
vHookCommitMsg="policies/default/commit-msg"
vHookPostCheckout="policies/default/post-checkout"
vHookPreCommit="policies/default/pre-commit"
vHookPrePush="policies/default/pre-push"
vHookPostMerge="policies/default/post-merge"

if [ -f $vScriptCopyFile ]; then
	if [ -f ".git" ]; then
		vGitdirSubmodule="$(cat .git | sed "s/gitdir://g" | sed "s/ //g")"
	else
		vGitdirSubmodule=""
	fi

	if [ -z "$vGitdirSubmodule" ]; then
		vDestinationDirectory="./.git/hooks/"
	else
		vDestinationDirectory="./$vGitdirSubmodule/hooks/"
	fi

	chmod +x $vScriptCopyFile

	echo "Copiando os hooks no repositorio git-hooks '$(dirname "$0")/$(basename "$0")'..."

	./$vScriptCopyFile ./$vHookCommitMsg "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "Nao foi possivel copiar o hook '$vHookCommitMsg' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$vScriptCopyFile ./$vHookPostCheckout "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "Nao foi possivel copiar o hook '$vHookPostCheckout' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$vScriptCopyFile ./$vHookPreCommit "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "Nao foi possivel copiar o hook '$vHookPreCommit' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$vScriptCopyFile ./$vHookPrePush "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "Nao foi possivel copiar o hook '$vHookPrePush' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$vScriptCopyFile ./$vHookPostMerge "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "Nao foi possivel copiar o hook '$vHookPostMerge' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi
fi