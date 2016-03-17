#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
# Taken from https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="zshrc vimrc vimrc.base vim oh-my-zsh"    # list of files/folders to symlink in homedir

##########

already_existed=0
if [ -d $olddir ]; then
	already_existed=1
fi

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

git pull --quiet
git submodule update --init --quiet

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    mv ~/.$file ~/dotfiles_old/ 2>/dev/null
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == /bin/zsh ]]; then
        chsh -s /bin/zsh
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -n "$(command -v apt-get)" ]]; then
            sudo apt-get install zsh
        else
            sudo yum -y install zsh
        fi
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

if [ $already_existed = 0 ]; then
	read -p "Should I install oh-my-zsh and change the shell? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		install_zsh
	fi
fi

echo "Done makesymlinks.sh"
