#!/bin/bash
########################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

########## Variables

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"           # dotfiles directory
olddir=~/dotfiles_old      # old dotfiles backup directory
echo "$dir"
files="bashrc bash_profile vimrc vim zshrc ssh/config gitconfig tmux.conf aliases"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $HOME/.oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

if [[ "$(hostname)" == "myServer" ]]; then {}; fi
install_zsh
if [[ ! -f $HOME/.zplug/init.zsh ]]; then
	mkdir -p $HOME/.zplug
	export ZPLUG_HOME=$HOME/.zplug
	git clone https://github.com/zplug/zplug $ZPLUG_HOME --depth=1 $HOME/.zplug
	source $ZPLUG_HOME/init.zsh
fi
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [[ ! -d $ZSH_CUSTOM/plugins/autojump ]]; then
  mkdir -p $ZSH_CUSTOM/plugins/autojump
  git clone git://github.com/wting/autojump.git --depth=1 $ZSH_CUSTOM/plugins/autojump 
  cd "$ZSH_CUSTOM/plugins/autojump" 
  ./install.py
fi

if [[ ! -d $HOME/.fzf ]] ; then
    git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


