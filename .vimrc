"----------------------------------------------"
" Author:       timsateroy@gmail.com           "
" Source:       http://vim.thevoid.no (github) "
" Date:         05.01.13                       "
"----------------------------------------------"

""" Vundle plugin manager {{{
    filetype off                                    " required to init 
    set rtp+=~/.vim/bundle/vundle/                  " include vundle
    call vundle#rc()                                " init vundle
    """ github repos, uncomment to disable a plugin {{{
        Bundle 'chrisbra/SudoEdit.vim'
        Bundle 'ervandew/supertab'
        Bundle 'gmarik/vundle'
        Bundle 'kien/ctrlp.vim'
        Bundle 'lilydjwg/colorizer'
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'msanders/snipmate.vim'
        Bundle 'nanotech/jellybeans.vim'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'scrooloose/nerdtree'
        Bundle 'Townk/vim-autoclose'
        Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-pastie'
        Bundle 'trapd00r/x11colors.vim'
        Bundle 'vim-scripts/Align'
        Bundle 'vim-scripts/mru.vim'

        " Requires flake8 or similar code checker, see docs
        Bundle 'scrooloose/syntastic'

        " Requires ctags installed
        Bundle 'vim-scripts/taglist.vim'
""" }}}
""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin indent on                   " enable ft+plugin detect
        syntax on                                   " syntax highlighting
        set t_Co=256                                " 256-colors
        set background=dark                         " we're using a dark bg
        colors jellybeans                           " select colorscheme
        highlight Normal ctermbg=NONE               " use terminal background
        highlight nonText ctermbg=NONE              " use terminal background
        au BufRead,BufNewFile *.txt set ft=sh       " opens .txt w/highlight
    """ }}}
    """ Interface general {{{
        set cursorline                              " hilight cursor line
        set more                                    " ---more--- like less
        set number                                  " line numbers
        set scrolloff=5                             " lines above/below cursor
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set visualbell                              " visual instead of beep
        set wildignore=.bak,.pyc,.o,.ojb,.,a,       " ignore said files
                       \.pdf,.jpg,.gif,.png,
                       \.avi,.mkv,.so
        set wildmenu                                " better cmd-completion
        set wildmode=list:longest                   " wildmode huge list
        """ Encoding {{{
            " If you're having problems with Powerline glyphs you can force
            " UTF-8 if your locale is something else. 
            " WARNING: this will affect encoding used when editing files!
            "
            " set encoding=utf-8                    " For Powerline glyphs
        """ }}}
        """ Gvim {{{
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
            set guioptions-=m                       " remove menubar
            set guioptions-=T                       " remove toolbar
            set guioptions-=r                       " remove right scrollbar
        """ }}}
        """ Powerline {{{
            let g:Powerline_symbols = 'fancy'       " glyphs, req. fontpatch
            let g:Powerline_symbols_override = {
                        \ 'BRANCH': [0x2213],
                        \ }                         " use ∓
            """ Powerline mode names {{{
                let g:Powerline_mode_n  = ' N '
                let g:Powerline_mode_i  = ' I '
                let g:Powerline_mode_R  = ' R '
                let g:Powerline_mode_v  = ' V '
                let g:Powerline_mode_V  = 'V·L'
                let g:Powerline_mode_cv = 'V·B'
                let g:Powerline_mode_s  = ' S '
                let g:Powerline_mode_S  = 'S·L'
                let g:Powerline_mode_cs = 'S·B'
            """ }}}
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set hidden                                      " buffer change, more undo
    set history=200                                 " default 20
    set iskeyword+=_,$,@,%,#                        " not word dividers
    set laststatus=2                                " always show statusline
    set listchars=tab:>\                            " > to highlight <tab>
    set list                                        " displaying listchars
    set mouse=a                                     " mouse in all modes
    set nocompatible                                " don't vi-compatible
    set noshowmode                                  " hide mode in cmd-line
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " no goto #1 char in line
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    """ Folding {{{
        set foldcolumn=0                            " hide folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set foldlevelstart=99                       " folds open by default
    """ }}}
    """ Search and replace {{{
        set gdefault                                " default s//g (global)
        set incsearch                               " "live"-search
        set ignorecase                              " case insensitive search
    """ }}}
    """ Matching {{{
        set matchtime=2                             " time to blink match {}
        set matchpairs+=<:>                         " for ci< or ci>
        set showmatch                               " tmpjump to match-bracket
    """ }}}
    """ Return to last edit position when opening files {{{
        autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
    """ }}}
""" }}}
""" Files {{{
    set autochdir                                   " always use curr. dir.
    set autoread                                    " refresh if changed
    set backup                                      " backup curr file
    set backupdir=~/.vim/backup                     " backup director{y,ies}
    set backupext=~                                 " append ~ to backups
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set updatecount=50                              " update swp after 50chars
    """ Persistent undo, saved when exiting a buffer. Vim 7.3 {{{
        if has('persistent_undo') && exists("&undodir")
            set undodir=~/.vim/undo/                " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif
    """ }}}
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set expandtab                                   " no real tabs
    set nrformats+=alpha                            " incr/decr letters C-a/-x
    set shiftround                                  " be clever with tabs
    set shiftwidth=4                                " default 8
    set smartcase                                   " igncase,except capitals
    set smartindent                                 " see autoindent
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=4                               " "tab" feels like <tab>
    set tabstop=4                                   " replace <TAB> w/4 spaces
""" }}}
""" Keybindings {{{
    """ General {{{
        " Remap <leader>
        let mapleader=","

        " Quickly edit/source .vimrc
        noremap <leader>ve :edit ~/.vimrc<CR>
        noremap <leader>vs :source ~/.vimrc<CR>

        " Yank(copy) to system clipboard
        noremap <leader>y "+y

        " Toggle text wrapping
        nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR> 

        " Toggle folding
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
        vnoremap <Space> zf

        " Delete previous word with C-BS, doesn't work in all terminals
        imap <C-BS> <C-W>

        " Bubbling (bracket matching)
        nmap <C-up> [e
        nmap <C-down> ]e
        vmap <C-up> [egv
        vmap <C-down> ]egv

        " Move faster
        map <C-j> <C-d>
        map <C-k> <C-u>

        " Move a line of text using ALT-{j,k}
        nmap <M-j> mz:m+<cr>`z
        nmap <M-k> mz:m-2<cr>`z

        " Rebind æøå (Norwegian keys)
        noremap ø :
        noremap å [
        noremap æ ]
    """ }}}
    """ Plugins {{{
        " Snipmate remapping
        imap <tab> <C-r>=TriggerSnippet()<CR>

        " Toggle the NERDTree file browser
        noremap <F2> :NERDTreeToggle<CR>

        " Toggle pastemode, doesn't indent
        set pastetoggle=<F3>

        " Toggle taglist (definitions, functions etc.)
        map <F4> <ESC>:TlistToggle<CR>
    """ }}}
    """ Highlight characters past 80, toggle with <leader>h {{{
        nnoremap <Leader>h :call ToggleOverLengthHighlight()<CR>
        let g:overlength_enabled = 0
        highlight OverLength ctermbg=black guibg=#212121

        function! ToggleOverLengthHighlight()
            if g:overlength_enabled == 0
                match OverLength /\%80v.*/
                let g:overlength_enabled = 1
                echo 'OverLength highlighting turned on'
            else
                match
                let g:overlength_enabled = 0
                echo 'OverLength highlighting turned off'
            endif
        endfunction
    """ }}}
""" }}}
""" Use ~/.vimrc.local if exists {{{{
    if filereadable($HOME."/.vimrc.local")
        source $HOME/.vimrc.local
    endif
""" }}}
