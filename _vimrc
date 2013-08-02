set nocompatible

set background=dark
colorscheme molokai
syntax enable

let mapleader=","

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

set history=2048 

set number
set autoread 
set showcmd  
set ttyfast
set hidden
set fileformats=unix,mac,dos
set t_Co=256
set noeb vb t_vb=

set cmdheight=2
set laststatus=2
set cc=80

set scrolloff=2

set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set autoindent
set expandtab
set backspace=indent,eol,start
set nowrap
set nolinebreak
set ruler
set showmatch

set nobackup
set nowritebackup
set noswapfile
set noautowrite
set noautowriteall

set splitright
set splitbelow

set hlsearch
set incsearch
set smartcase
set gdefault

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.git,_node_modules

set guioptions=i
set shellslash

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <F3> :call Tex_RunLaTeX() %<CR>
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set foldmethod=indent
set foldnestmax=10
set foldlevel=1

filetype on
filetype plugin on
filetype indent on

function! ToggleGUI() 
    if &guioptions=='i'
        exec('set guioptions=imTrL')
    else
        exec('set guioptions=i')
    endif
endfunction

" Plugins that handle LaTeX didn't ever work for me, so I just did this.
function! CompileLatex()
    if &ft=='tex'
        let b:tex_flavor='pdflatex'
        compiler tex
        make %
    endif
endfunction

au BufRead,BufNewFile *.json set ft=javascript
au BufWritePost *.tex silent call CompileLatex()

if has('gui_running')
    if has('gui_win32')
        set guifont=DejaVu\ Sans\ Mono:h10:cANSI
    endif
endif

execute pathogen#infect()
