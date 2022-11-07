#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function doIt() {
		rsync \
		--verbose \
		--recursive \
		-avh --no-perms \
		~/.aliases  \
		~/.bash_profile  \
		~/.bash_prompt  \
		~/.curlc  \
		~/.editorconfig  \
		~/.exports  \
		~/.extra  \
		~/.functions  \
		~/.gdbinit  \
		~/.gitattributes  \
		~/.gitconfig  \
		~/.gitignore  \
		~/.gvimrc  \
		~/.hgignore  \
		~/.hushlogin  \
		~/.inputrc  \
		~/.tmux.conf  \
		~/.vim  \
		~/.vimrc  \
		~/.wgetrc . 


}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your repository. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
