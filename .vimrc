set nocompatible

" Setup vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

" Add plugins here
Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'jnurmine/Zenburn'
" Languages
Plug '2072/PHP-Indenting-for-VIm'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/indentpython.vim'
" Linting
Plug 'scrooloose/syntastic'
" Snippet manager
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" Settings for syntastic
let g:syntastic_check_on_open=1
let g:syntastic_rust_checkers = ['rustc']

"Key binding changes
"   Navigation between splits: Ctrl+<vim navigation key>
let g:tmux_navigator_no_mappings = 1
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

" Save all vim panes when switching to a tmux pane
let g:tmux_navigator_save_on_switch = 2

" Run RustFmt on filesave
let g:rustfmt_autosave = 1

hi Trail ctermbg=red guibg=red

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
au BufWinEnter * match Trail /\s\+$/ " Copy pasted from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
nmap <F8> :TagbarToggle<CR>

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Set colorscheme 
colo desert

"Visual changes
syntax enable
set number
set cursorline
set showmatch
let python_highlight_all = 1

set incsearch
