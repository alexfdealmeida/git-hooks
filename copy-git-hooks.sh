#!/bin/bash

vScriptCopyFile="scripts/shell/copy-file.sh"
vHookCommitMsg="policies/gcs/commit-msg"
vHookPostCheckout="policies/gcs/post-checkout"

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

	./$vScriptCopyFile ./$vHookCommitMsg "$vDestinationDirectory"
	if [ "$?" -ne "0" ]; then
		echo "Nao foi possivel copiar o hook '$vHookCommitMsg' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$vScriptCopyFile ./$vHookPostCheckout "$vDestinationDirectory"
	if [ "$?" -ne "0" ]; then
		echo "Nao foi possivel copiar o hook '$vHookPostCheckout' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi
fi