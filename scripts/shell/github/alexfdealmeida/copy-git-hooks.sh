#!/bin/bash

ALERT="[alert]"
INFO="[info]"
ERROR="[ERROR]"

SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT="./git-hooks/scripts/shell/copy-file-to-git-hooks-superproject.sh"

pGitdirSubmodule="$1"

if [ -f $SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT ]; then
	echo "$INFO Running the script '$(dirname "$0")/$(basename "$0")'"
	chmod +x $SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT

	$SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT "./../../policies/default/commit-msg" "$pGitdirSubmodule"
	$SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT "./../../policies/default/post-checkout" "$pGitdirSubmodule"
	$SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT "./../../policies/default/pre-commit" "$pGitdirSubmodule"
	# $SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT "./../../policies/default/pre-push" "$pGitdirSubmodule"
	# $SCRIPT_COPY_FILE_TO_GIT_HOOKS_SUPERPROJECT "./../../policies/default/post-merge" "$pGitdirSubmodule"
fi