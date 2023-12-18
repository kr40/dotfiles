#!/bin/bash

# This script installs the dotfiles locally. Note that it should be run from the
# dotfiles folder so that the links are set properly!

function bannerSimple() {
	local msg="${2} ${1} ${2}"
	local edge
	edge=${msg//?/$2}
	echo "${edge}"
	echo "$(tput bold)${msg}$(tput sgr0)"
	echo "${edge}"
	echo
}

bannerSimple "kr40's Bash DotFiles Installer" "*"

echo "Moving already existing .bashrc and .bash_aliases to bashrc.bak and bashaliaes.bak"

# Rename the existing bashrc and bash_aliases files.
mv "$HOME/.bashrc" "$HOME/bashrc.bak"
mv "$HOME/.bash_aliases" "$HOME/bash_aliases.bak"

echo "Symlinking alises.sh and bashrc.sh to .bashrc and .bash_aliases"

# Create links for the shell configuration.
ln -sf "$PWD/aliases.sh" "$HOME/.bash_aliases"
ln -sf "$PWD/bashrc.sh" "$HOME/.bashrc"

echo "Successfully installed dotfiles!"
echo "Read system-setup for further information."

echo "Restart your terminal to see the changes!"
