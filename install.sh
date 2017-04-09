cd
git clone git@github.com:HarryU/VimConfig.git
ln -s ~/VimConfig/.vimrc ~/.vim/bundle/Vundle.vim

apt remove vim-tiny
apt update
apt install vim

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

apt install build-essential cmake
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py
