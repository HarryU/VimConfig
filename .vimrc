set nocompatible
filetype off  

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()
filetype plugin indent on

"Key binding changes
"   Navigation between splits: Ctrl+<vim navigation key>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
"   Code folding on space
    nnoremap <space> za
"   <space> + g binds to goto declaration of function/class
    map <space>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Turn on folding at indent level
set foldmethod=indent
set foldlevel=99

" UTF-8 Support
set encoding=utf-8

" YCM window definitely closes
let g:ycm_autoclose_preview_window_after_completion=1

"Python indentation settings (PEP8)
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"Visual changes
syntax enable
set number
set cursorline
set showmatch
let python_highlight_all = 1
colo elflord
