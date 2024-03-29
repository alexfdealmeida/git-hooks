#!/bin/bash

vScript="./git-hooks/scripts/shell/copy-file-to-git-hooks-superproject.sh"
vGitdirSubmodule="$1"

if [ -f $vScript ]; then
	echo "Copiando os hooks por organizacao '$(dirname "$0")/$(basename "$0")'..."

	chmod +x $vScript
	$vScript "./../../policies/default/commit-msg" "$vGitdirSubmodule"
	$vScript "./../../policies/default/post-checkout" "$vGitdirSubmodule"
	$vScript "./../../policies/default/pre-commit" "$vGitdirSubmodule"
	#$vScript "./../../policies/default/pre-push" "$vGitdirSubmodule"
	#$vScript "./../../policies/default/post-merge" "$vGitdirSubmodule"
fi