#!/bin/bash

ALERT="[alert]"
INFO="[info]"
ERROR="[ERROR]"

SCRIPT_COPY_FILE="scripts/shell/copy-file.sh"
PATH_POLICIES_DEFAULT="policies/default"
HOOK_COMMIT_MSG="$PATH_POLICIES_DEFAULT/commit-msg"
HOOK_POST_CHECKOUT="$PATH_POLICIES_DEFAULT/post-checkout"
HOOK_PRE_COMMIT="$PATH_POLICIES_DEFAULT/pre-commit"
HOOK_PRE_PUSH="$PATH_POLICIES_DEFAULT/pre-push"
HOOK_POST_MERGE="$PATH_POLICIES_DEFAULT/post-merge"

if [ -f $SCRIPT_COPY_FILE ]; then
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

	echo "$INFO Running the script '$(dirname "$0")/$(basename "$0")'"
	chmod +x $SCRIPT_COPY_FILE

	./$SCRIPT_COPY_FILE ./$HOOK_COMMIT_MSG "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "$ALERT Nao foi possivel copiar o hook '$HOOK_COMMIT_MSG' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$SCRIPT_COPY_FILE ./$HOOK_POST_CHECKOUT "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "$ALERT Nao foi possivel copiar o hook '$HOOK_POST_CHECKOUT' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$SCRIPT_COPY_FILE ./$HOOK_PRE_COMMIT "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "$ALERT Nao foi possivel copiar o hook '$HOOK_PRE_COMMIT' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$SCRIPT_COPY_FILE ./$HOOK_PRE_PUSH "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "$ALERT Nao foi possivel copiar o hook '$HOOK_PRE_PUSH' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi

	./$SCRIPT_COPY_FILE ./$HOOK_POST_MERGE "$vDestinationDirectory"
	if [ $? -ne 0 ]; then
		echo "$ALERT Nao foi possivel copiar o hook '$HOOK_POST_MERGE' para o diretorio destino '$vDestinationDirectory'!"
		#exit 1
	fi
fi