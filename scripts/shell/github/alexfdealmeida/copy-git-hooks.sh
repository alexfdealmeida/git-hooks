#!/bin/bash

vScript="./git-hooks/scripts/shell/copy-file-to-git-hooks-superproject.sh"
vGitdirSubmodule="$1"

if [ -e $vScript ] && [ -f $vScript ]; then
	echo "Copiando os hooks por organizacao '$(dirname "$0")/$(basename "$0")'..."

	$vScript "./../../policies/default/commit-msg" "$vGitdirSubmodule"
	$vScript "./../../policies/default/post-checkout" "$vGitdirSubmodule"
fi