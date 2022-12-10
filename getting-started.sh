#!/bin/bash

vPrefixGettingStarted="[$(basename "$0")]"

vScriptCopyGitHooks="copy-git-hooks.sh"
vScriptNodeNpmInstall="node-npm-install.sh"

if [ -f $vScriptNodeNpmInstall ]; then
	echo "$vPrefixGettingStarted $vScriptNodeNpmInstall"
	./$vScriptNodeNpmInstall
	echo ""
fi

if [ -f $vScriptCopyGitHooks ]; then
	echo "$vPrefixGettingStarted $vScriptCopyGitHooks"
	./$vScriptCopyGitHooks
	echo ""
fi