set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""
" Vundle plugin definitions "

Plugin 'tpope/vim-fugitive'  " git wrapper
Plugin 'flazz/vim-colorschemes'  " colors!
Plugin 'kien/ctrlp.vim'  " full path everything finder

Plugin 'scrooloose/syntastic'  " syntax checking
Plugin 'vim-scripts/Tagbar'  " tag browsing
Plugin 'tpope/vim-commentary'  " comment with motions
" Plugin 'Valloric/YouCompleteMe'  " autocomplete - trouble
Plugin 'davidhalter/jedi'  " python autocompelte / static analysis
Plugin 'bling/vim-airline'  " statusbar upgrade
" Plugin 'chriskempson/base16-vim'

" Vundle plugin definitions "
"""""""""""""""""""""""""""""

" Load plugins
call vundle#end()
filetype plugin indent on

" Colors (this probably doesn't do much)
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Syntax
syntax on
set showmatch

" Lines and wrapping
set number
set textwidth=79
set colorcolumn=80

" Indentation
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" Shortcut to disable auto indenting in current file
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" Airline
set laststatus=2

" CtrlP configuration
nnoremap <leader>. :CtrlPTag<cr>

" Colorscheme
" colorscheme Tomorrow

" Spelling
set spell
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Misc
set title
set wildmenu
set mouse=a
set cmdheight=2

" Syntastic

" Syntastic configuration
" set statusline+=%warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" When/how to check the file
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use python3 linter
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8', 'pep8', 'python']

" Jedi-vim 
" Using <C-N> for omnicompletion
inoremap <silent> <buffer> <C-N> <c-x><c-o>
let g:jedi#popup_select_first=0  " don't automatically select the first item

" Fix the pink(!) autocomplete suggestion menu
hi Pmenu cterm=none ctermfg=Blue ctermbg=none

" Related, but not of jedi-vim
set completeopt=menuone,longest,preview

" ------------
" Commands ---

" Visual selection by range
command! -range Vis call setpos('.', [0,<line1>,0,0]) |
                    \ exe "normal V" |
                    \ call setpos('.', [0,<line2>,0,0])
