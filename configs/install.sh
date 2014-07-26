#!/bin/bash
for x in .bashrc .vimrc .vim .inputrc .minttyrc; do
	source=$HOME/$x
	target=$source~
	rm -rf "$target"
	if [ -e "$source" ] || [ -L "$source" ]; then
		mv "$source" "$target"
	fi
done

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir "$HOME/.vim"
ln -s "$DIR/vim-plugins" "$HOME/.vim/bundle"
ln -s "$DIR/vimrc" "$HOME/.vimrc"
ln -s "$DIR/bashrc" "$HOME/.bashrc"
ln -s "$DIR/inputrc" "$HOME/.inputrc"
ln -s "$DIR/minttyrc" "$HOME/.minttyrc"

shopt -s nocasematch
if [[ "$(uname)" =~ cygwin ]]; then
	for x in .bashrc .vimrc .vim .inputrc .minttyrc; do
		winpath=$(cygpath -w "$HOME")\\$x
		attrib +h +s "$winpath"
	done
fi