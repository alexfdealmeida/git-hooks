#!/bin/bash

vScriptName="$(basename "$0")"
vPrefixGettingStarted="[$vScriptName]"

vScriptCopyGitHooks="copy-git-hooks.sh"

if [ -f $vScriptCopyGitHooks ]; then
	echo "$vPrefixGettingStarted $vScriptCopyGitHooks"
	chmod +x $vScriptCopyGitHooks
	./$vScriptCopyGitHooks
	echo ""
fi