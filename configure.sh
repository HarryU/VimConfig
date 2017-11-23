#!/bin/bash

# Update and upgrade package
sudo apt-get update && sudo apt-get upgrade

# Install packages
declare -a packages=("cmake"
		     "build-essential"
		     "tmux"
		     "make"
		     "nasm"
		     "qemu"
		     "vlc"
		     "htop"
		     "cheese"
		     "python-dev"
		     "conky"
		     "git"
		     "vim")

for package in "${packages[@]}"
do
	sudo apt-get -y install "$package"
done

# Install rustup and related things
curl https://sh.rustup.rs -sSf | sh
cargo install xargo

# Setup vim and tmux
cd ~
git clone https://github.com/HarryU/VimConfig.git
ln -s ~/VimConfig/.vimrc ~/.vimrc
ln -s ~/VimConfig/.tmux.conf ~/.tmux.conf
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursvie
./install.py
ln -s ~/VimConfig/powerline /usr/local/lib/python2.7/dist-packages/powerline