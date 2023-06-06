#!/bin/bash

vScriptName="$(basename "$0")"
vPrefixGettingStarted="[$vScriptName]"

vScriptCopyGitHooks="copy-git-hooks.sh"
vScriptNodeNpmInstall="node-npm-install.sh"

if [ -f $vScriptNodeNpmInstall ]; then
	echo "$vPrefixGettingStarted $vScriptNodeNpmInstall"
	chmod +x $vScriptNodeNpmInstall
	./$vScriptNodeNpmInstall
	echo ""
fi

if [ -f $vScriptCopyGitHooks ]; then
	echo "$vPrefixGettingStarted $vScriptCopyGitHooks"
	chmod +x $vScriptCopyGitHooks
	./$vScriptCopyGitHooks
	echo ""
fi