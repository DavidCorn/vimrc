set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","       " leader is comma
let g:mapleader=','

" Colors  {{{
" Space and Tabs
set tabstop=4
set softtabstop=4
set expandtab
" }}}

" UI Config {{{
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch " highlight matching parenthesis
" }}}

" Searching {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Movement {{{
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last insert text
nnoremap gV `[v`]
" }}}

" Split {{{
nnoremap <leader>\ :vs<CR>
nnoremap <leader>- :sp<CR>
" }}}

" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
" space open/close folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
set foldlevel=0
set modelines=1
" }}}

" Vundle Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'micha/vim-colors-solarized'

Plugin 'kien/ctrlp.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'
" Show git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

" vim easy-motion
Plugin 'Lokaltog/vim-easymotion'

" tagbar
Plugin 'majutsushi/tagbar'

" interesting word
Plugin 'lfv89/vim-interestingwords'

" auto-comp-letion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu

Plugin 'mhinz/vim-startify'

Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" Ctrl-P Funky
nnoremap <Leader>Fu :CtrlPFunky<Cr>
" Don't tab complete binary files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.a,*.o
set wildignore+=.DS_Store,.git,.hg,.svn
" }}}

" TMUX setting {{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" Powerline settings {{{
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

set t_Co=256

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2 
set guifont=Source\ Code\ Pro\ for\ Powerline:h12 
set noshowmode
" }}}

" NerdTree {{{
nnoremap <F10> :exe 'NERDTreeToggle'<CR>
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
" }}}

" Tagbar quickstart {{{
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" }}}

" Copy & Paste {{{
set clipboard=unnamed
set pastetoggle=<F9>
" }}}

" Theme {{{
syntax enable
set background=dark
colorscheme solarized
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}

" vim-devicon {{{
set encoding=utf8
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=DroidSansMono\ Nerd\ Font:h11
" or:
set guifont=DroidSansMono_Nerd_Font:h11
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
" }}}

" vim:foldmethod=marker:foldlevel=0
