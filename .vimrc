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
Plugin 'jpalardy/vim-slime'
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

" Snippet shortcuts
nnoremap ,html :-1read $HOME/VimConfig/snippets/skeleton.html<CR>3jwf>a
nnoremap ,def :-1read $HOME/VimConfig/snippets/method.py<CR>3la
nnoremap ,test :-1read $HOME/VimConfig/snippets/test.py<CR>f(i

" UTF-8 Support
set encoding=utf-8

" YCM window definitely closes
let g:ycm_autoclose_preview_window_after_completion=1

" Vim Slime
let g:slime_target = "tmux"

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

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

" Set colorscheme 
colo zenburn

"Visual changes
syntax enable
set number
set cursorline
set showmatch
let python_highlight_all = 1
