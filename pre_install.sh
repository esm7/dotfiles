#!/bin/bash
rm -rf ~/dotfiles_old

if [[ ! -f /bin/zsh && ! -f /usr/bin/zsh ]]; then
	echo "ZSH not found, will try to install it"
	if [[ -n "$(command -v apt-get)" ]]; then
		sudo apt-get -y install zsh
	else
		sudo yum -y install zsh
	fi
fi

chmod 700 -R ~/.oh-my-zsh
chmod 700 -R ~/dotfiles/oh-my-zsh-custom
