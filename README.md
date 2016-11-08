VimConfig
===============

Pull the repository to a any location. Create a symbolic link to the pulled .vimrc:

```bash
cd VimConfig
ln -s ./.vimrc ~/.vimrc
```
Now make sure the VIm is the full version with Python support:

```bash
sudo apt-get remove vim-tiny
sudo apt-get update
sudo apt-get install vim
```

Clone [Vundle](https://github.com/VundleVim/Vundle.vim), a VIm package manager.

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open VIm, and enter the command ```:PluginInstall```.

Now compile YouCompleteMe:

```bash
sudo apt-get install build-essential make
cd ~/.vim/bundle/YouCompleteMe
./install.py
```
