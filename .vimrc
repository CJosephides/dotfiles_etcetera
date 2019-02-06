" Disable some Vi defaults.
set nocompatible

" Turn on filetype plugins.
if has('autocmd')
    filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax')
    syntax enable
endif

" Autoindent when starting new line.
set autoindent

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Don't scan included files since the .tags file is more performant.
set complete-=i

" Use 'shiftwiidth' when using `<Tab>` in front of a line.
" By default, it is used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including `Esc` while preserving zero timeout for
" pressing it manually.
set ttimeout
set ttimeoutlen=100

" Enable highlighted, case-insensitive, incremental search.
set incsearch

" Indent using four spaces.
set tabstop=4
set shiftwidth=4
set expandtab

" Use `Ctrl-L` to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Alow show window statuses, even if there is only one.
set laststatus=2

" Show the line and column number of the cursor position.
set ruler

" Show the selected block in visual mode.
set showcmd

" Autocomplete commands.
" Enalbe `Ctrl-N` and `Ctrl-P` to scroll through matches.
set wildmenu

" When 'wrap' is on, display last line even if it doesn't fit.
set display+=lastline

" Force utf-8 encoding.
set encoding=utf-8

" Search upwards for tags file instead of only locally.
if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
endif

" Reload unchanged files automatically.
set autoread

" Increase history size to 1000 items.
set history=1000

" Allow color schemes to do bright colors with forcing bold.
if &t_Co == 8 && TERM !~# '^linux'
    set t_Co=16
endif

" Dark background
set background=dark

" Y yanks from the cursor to the end of line as expected (see :help Y)
nnoremap Y y$

" Highlight line under cursor.
"set cursorline

" Keep some lines above or below cursor when scrolling.
set scrolloff=8

" Keep some columns on either side of the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" If opening buffer search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking to save them.
set hidden

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Autocomplete as much as possible.
set wildmode=longest,full

" Show line numbers.
set number

" Disable error beeps.
set noerrorbells
set visualbell

" Do not fold by default; if folding, do for some levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Enable mouse for scrolling and window resizing.
set mouse=a

" Disable swap.
set noswapfile

" Enable search highlighting.
set hlsearch

" Ignore case when searching.
set ignorecase

" Show mode in statusbar not separately.
"set noshowmode

" Don't ignore case when search does have a cpital letter.
set smartcase

" Use dash as word separator
set iskeyword+=-

" Add gems.tags to files searched for tags.
set tags+=gems.tags

" Disable output, vcs, archive, rails, temp and backup files.
"set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
"set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
"set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
"set wildignore+=*.swp,*~,._*

" Set window title by default.
set title

" Always focus on split window.
set splitright
set splitbelow

" Do not display messages on starting Vim.
set shortmess+=I
