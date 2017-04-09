set nocompatible
filetype off  

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'rust-lang/rust.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jnurmine/Zenburn'

call vundle#end()
filetype plugin indent on

"Settings for syntastic
let g:syntastic_check_on_open=1

"Key binding changes
"   Navigation between splits: Ctrl+<vim navigation key>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
"   <space> + g binds to goto declaration of function/class
    map <space>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"   Open new splits to the right or below instead of left or above.
    set splitbelow
    set splitright

" UTF-8 Support
set encoding=utf-8

" YCM window definitely closes
let g:ycm_autoclose_preview_window_after_completion=1

"Python indentation settings (PEP8)
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.php
    \ set filetype=php |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"Allow mouse resizing of splits in putty
set mouse+=a
if &term =~ '^screen'
	"tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

if has('gui_running')
   set background=dark
   colorscheme solarized
 else
   colorscheme zenburn
endif

"Visual changes
syntax enable
set number
set cursorline
set showmatch
let python_highlight_all = 1
