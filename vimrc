"
" usual options
" 
syntax on
set nocompatible
set ts=2 sts=2 sw=2 sr
set autoindent expandtab 
set incsearch nowrap nu modeline autoread
set guioptions=agi
set spelllang=de
set undofile
set undodir=~/.vimundo
set mouse=a
set hidden " required for CtrlSpace

" 
" Vundle plugin management
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" plugin on GitHub repo: 'user/repo'
" plugin from http://vim-scripts.org/vim/scripts.html: 'name'
" plugin via any git: 'git://path/to/repo.git'
" plugin on local machine: 'file:///path/to/plugin'
" more options and examples on github.com/VundleVim/Vundle.vim

Plugin 'VundleVim/Vundle.vim'		" vundle itself
"Plugin 'flazz/vim-colorschemes'		" colorschemes, way to many
"use Tomorrow-Night
Plugin 'jnurmine/Zenburn'			" Zenburn colorscheme

Plugin 'fatih/vim-go'				" golang tools
Plugin 'tpope/vim-fugitive'			" git, mostly for airline
" Plugin 'tpope/vim-vinegar'		" netrw enhancement
" Plugin 'scrooloose/nerdtree'		" file tree browser
Plugin 'tpope/vim-commentary'		" commenting
" Plugin 'vim-syntastic/syntastic'	" syntax checking
Plugin 'kien/ctrlp.vim'				" fuzzy finder
Plugin 'Valloric/YouCompleteMe'		" know-it-all auto-popup code completion
Plugin 'easymotion/vim-easymotion'  " motion helper and highlighter
Plugin 'vim-airline/vim-airline'	" status line
Plugin 'Haskell-Cuteness'           " Unicode characters for common haskell symbols! :D
Plugin 'Haskell-Highlight-Enhanced' " highlighting for common haskell functions and operators
"Plugin 'eagletmt/ghcmod-vim'        " ghc-mod for vim with type checking and linting
"Plugin 'Shougo/vimproc.vim'         " async execution library, needed by ghc-mod 


call vundle#end()
filetype plugin indent on

colorscheme zenburn

" plugin settings
let g:go_fmt_command = "goimports"

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
:
"
" jump to last cursor position when opening files
" 
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
" -------------------------------------------
