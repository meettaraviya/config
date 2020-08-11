set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}



" My plugins
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/syntastic'
" Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'valloric/youcompleteme'
" Plugin 'kien/ctrlp.vim'
" Plugin 'mattn/emmet-vim'
" Plugin 'w0rp/ale'
" Plugin 'godlygeek/tabular'
" Plugin 'ocaml/vim-ocaml'
" Plugin 'junegunn/fzf'
Plugin 'vim-python/python-syntax'
" All of your Plugins must be added before the following line
call vundle#end()            " required



" autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror


set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes)

" Airline
let g:airline_theme='luna'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" set background=dark
" colorscheme solarized

" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on
syntax enable

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Toggle mouse usage and line numbers
map <F3> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>:set invnumber <CR>


" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Disables swp files **IMPORTANT**
set noswapfile

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldmethod=syntax

 " Call the .vimrc.plug file
 if filereadable(expand("~/.vimrc.plug"))
     source ~/.vimrc.plug
 endif

set whichwrap+=<,>,[,]

noremap <C-Z> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

autocmd VimEnter * call NERDTreeAddKeyMap({'key': 't', 'callback': 'NERDTreeMyOpenInTab', 'scope': 'FileNode', 'override': 1 })

function NERDTreeMyOpenInTab(node)
      call a:node.open({'reuse': "all", 'where': 't'})
endfunction


noremap j k
noremap k j

noremap K <C-E>j
noremap J <C-Y>k

"noremap <C-K> <C-E>j<C-E>j<C-E>j<C-E>j<C-E>j<C-E>j<C-E>j<C-E>j<C-E>j<C-E>j
"noremap <C-J> <C-Y>k<C-Y>k<C-Y>k<C-Y>k<C-Y>k<C-Y>k<C-Y>k<C-Y>k<C-Y>k<C-Y>k

noremap <C-K> 10j
noremap <C-J> 10k

noremap <PageUp> 50k
noremap <PageDown> 50j

" Cycle through panes
noremap gb <C-W>w
noremap gB <C-W>W

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

filetype indent on
set autoindent

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let g:python_highlight_all = 1

