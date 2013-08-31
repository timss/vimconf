"----------------------------------------------"
" Author:       timsateroy@gmail.com           "
" Source:       http://vim.thevoid.no (github) "
" Date:         06.05.13 (rougly)              "
"----------------------------------------------"

" vimconf is not vi-compatible
set nocompatible

""" Automatically make needed files and folders on first run
""" If you don't run *nix you're on your own (as in remove this) {{{
    call system("mkdir -p $HOME/.vim/{backup,plugin,undo}")
    if !filereadable($HOME . "/.vimrc.bundles") | call system("touch $HOME/.vimrc.bundles") | endif
    if !filereadable($HOME . "/.vimrc.first") | call system("touch $HOME/.vimrc.first") | endif
    if !filereadable($HOME . "/.vimrc.last") | call system("touch $HOME/.vimrc.last") | endif
""" }}}
""" Vundle plugin manager {{{
    """ Automatically setting up Vundle, taken from
    """ http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
        let has_vundle=1
        if !filereadable($HOME."/.vim/bundle/vundle/README.md")
            echo "Installing Vundle..."
            echo ""
            silent !mkdir -p $HOME/.vim/bundle
            silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
            let has_vundle=0
        endif
    """ }}}
    """ Initialize Vundle {{{
        filetype off                                " required to init
        set rtp+=$HOME/.vim/bundle/vundle/          " include vundle
        call vundle#rc()                            " init vundle
    """ }}}
    """ Github repos, uncomment to disable a plugin {{{
    " Recursive vundle, omg!
    Bundle 'gmarik/vundle'

    """ Local bundles (and only bundles in this file!) {{{{
        if filereadable($HOME."/.vimrc.bundles")
            source $HOME/.vimrc.bundles
        endif
    """ }}}

    " Edit files using sudo/su
    Bundle 'chrisbra/SudoEdit.vim'

    " <Tab> everything!
    Bundle 'ervandew/supertab'

    " Fuzzy finder (files, mru, etc)
    Bundle 'kien/ctrlp.vim'

    " A much better statusline
    Bundle 'Lokaltog/vim-powerline'

    " Easy... motions... yeah.
    Bundle 'Lokaltog/vim-easymotion'

    " Glorious colorscheme
    Bundle 'nanotech/jellybeans.vim'

    " Super easy commenting, toggle comments etc
    Bundle 'scrooloose/nerdcommenter'

    " A file tree explorer
    Bundle 'scrooloose/nerdtree'

    " Color text based on RGB, hex, colornames
    Bundle 'ap/vim-css-color'

    " Autoclose (, " etc
    Bundle 'Townk/vim-autoclose'

    " Git wrapper inside Vim
    Bundle 'tpope/vim-fugitive'

    " Handle surround chars like ''
    Bundle 'tpope/vim-surround'

    " Align your = etc.
    Bundle 'vim-scripts/Align'

    " Snippets like textmate
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    Bundle 'honza/vim-snippets'
    Bundle 'garbas/vim-snipmate'

    " Awesome syntax checker.
    " REQUIREMENTS: See :h Syntastic
    Bundle 'scrooloose/syntastic'

    " Functions, class data etc.
    " REQUIREMENTS: (exuberant)-ctags
    Bundle 'majutsushi/tagbar'

    " C/C++ autocomplete
    " REUIREMENTS: clang compiler
    Bundle 'Rip-Rip/clang_complete'

    " Python autocomplete
    " REQUIREMENTS: python package 'jedi', also in virtenvs
    Bundle 'davidhalter/jedi-vim'
    """ }}}
    """ Installing plguins the first time {{{
        if has_vundle == 0
            echo "Installing Bundles, please ignore key map error messages"
            echo ""
            :BundleInstall
        endif
    """ }}}
""" }}}
""" Local leading config, only use for prerequisites as it will be
""" overwritten by anything below {{{{
    if filereadable($HOME."/.vimrc.first")
        source $HOME/.vimrc.first
    endif
""" }}}
""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin indent on                   " detect file plugin+indent
        syntax on                                   " syntax highlighting
        set t_Co=256                                " 256-colors
        set background=dark                         " we're using a dark bg
        colors jellybeans                           " select colorscheme
        highlight Normal ctermbg=NONE               " use terminal background
        highlight nonText ctermbg=NONE              " use terminal background
        au BufRead,BufNewFile *.txt set ft=sh       " opens .txt w/highlight
        """ Tab colors {{{
            hi TabLineFill ctermfg=NONE ctermbg=233
            hi TabLine ctermfg=241 ctermbg=233
            hi TabLineSel ctermfg=250 ctermbg=233
        """ }}}
    """ }}}
    """ Interface general {{{
        set cursorline                              " hilight cursor line
        set more                                    " ---more--- like less
        set number                                  " line numbers
        set scrolloff=3                             " lines above/below cursor
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set vb t_vb=                                " disable beep and flashing
        set wildignore=.bak,.pyc,.o,.ojb,.,a,       " ignore said files
                       \.pdf,.jpg,.gif,.png,
                       \.avi,.mkv,.so
        set wildmenu                                " better auto complete
        set wildmode=longest,list                   " bash-like auto complete
        """ Encoding {{{
            " If you're having problems with Powerline glyphs you can force
            " UTF-8 if your locale is something else.
            " WARNING: this will affect encoding used when editing files!
            "
            " set encoding=utf-8                    " for Powerline glyphs
        """ }}}
        """ Gvim {{{
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
            set guioptions-=m                       " remove menubar
            set guioptions-=T                       " remove toolbar
            set guioptions-=r                       " remove right scrollbar
        """ }}}
        """ Powerline {{{
            let g:Powerline_symbols = 'compatible'  " see :h Powerline_symbols
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
    set history=1000                                " default 20
    set iskeyword+=_,$,@,%,#                        " not word dividers
    set laststatus=2                                " always show statusline
    set linebreak                                   " don't cut words on wrap
    set listchars=tab:>\                            " > to highlight <tab>
    set list                                        " displaying listchars
    set mouse=                                      " disable mouse
    set noshowmode                                  " hide mode, got powerline
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " keep cursor column pos
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    set shortmess+=I                                " disable startup message
    set splitbelow                                  " splits go below w/focus
    set splitright                                  " vsplits go right w/focus
    set ttymouse=xterm2                             " experimental
    """ Folding {{{
        set foldcolumn=0                            " hide folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set foldlevelstart=99                       " folds open by default
    """ }}}
    """ Search and replace {{{
        set gdefault                                " default s//g (global)
        set incsearch                               " "live"-search
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
    set backupdir=$HOME/.vim/backup                 " backup director{y,ies}
    set backupext=~                                 " append ~ to backups
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set updatecount=50                              " update swp after 50chars
    """ Persistent undo. Requires Vim 7.3 {{{
        if has('persistent_undo') && exists("&undodir")
            set undodir=$HOME/.vim/undo/            " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif
    """ }}}
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set cinkeys-=0#                                 " don't force # indentation
    set expandtab                                   " no real tabs
    set ignorecase                                  " by default ignore case
    set nrformats+=alpha                            " incr/decr letters C-a/-x
    set shiftround                                  " be clever with tabs
    set shiftwidth=4                                " default 8
    set smartcase                                   " sensitive with uppercase
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=4                               " "tab" feels like <tab>
    set tabstop=4                                   " replace <TAB> w/4 spaces
    """ Only auto-comment newline for block comments {{{
        au FileType c,cpp setlocal comments -=:// comments +=f://
    """ }}}
""" }}}
""" Keybindings {{{
    """ General {{{
        " Remap <leader>
        let mapleader=","

        " Quickly edit/source .vimrc
        noremap <leader>ve :edit $HOME/.vimrc<CR>
        noremap <leader>vs :source $HOME/.vimrc<CR>

        " Yank(copy) to system clipboard
        noremap <leader>y "+y

        " Toggle text wrapping
        nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

        " Toggle folding
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
        vnoremap <Space> zf

        " Bubbling (bracket matching)
        nmap <C-up> [e
        nmap <C-down> ]e
        vmap <C-up> [egv
        vmap <C-down> ]egv

        " Move faster
        map <C-j> <C-d>
        map <C-k> <C-u>

        " Treat wrapped lines as normal lines
        nnoremap j gj
        nnoremap k gk

        " Move a line of text using ALT-{j,k}
        nmap <M-j> mz:m+<CR>`z
        nmap <M-k> mz:m-2<CR>`z

        " Rebind æøå (Norwegian keys)
        noremap ø :
        noremap å [
        noremap æ ]

        " Working ci(, works for both breaklined, inline and multiple ()
        nnoremap ci( %ci(

        " We don't need any help!
        inoremap <F1> <nop>
        nnoremap <F1> <nop>
        vnoremap <F1> <nop>
    """ }}}
    """ Functions or fancy binds {{{{
        """ Toggle syntax highlighting {{{
            map <F4> :if exists("syntax_on")
                \<Bar>syntax off<Bar>else<Bar>syntax enable<Bar>endif<CR>
        """ }}}
        """ Highlight characters past 79, toggle with <leader>h {{{
            let g:overlength_enabled = 0
            highlight OverLength ctermbg=black guibg=#212121

            function! ToggleOverLengthHighlight()
                if g:overlength_enabled == 0
                    match OverLength /\%79v.*/
                    let g:overlength_enabled = 1
                    echo 'OverLength highlighting turned on'
                else
                    match
                    let g:overlength_enabled = 0
                    echo 'OverLength highlighting turned off'
                endif
            endfunction

            nnoremap <leader>h :call ToggleOverLengthHighlight()<CR>
        """ }}}
        """ Toggle relativenumber using <leader>r {{{
            nnoremap <leader>r :call NumberToggle()<CR>

            function! NumberToggle()
                if(&relativenumber == 1)
                    set number
                else
                    set relativenumber
                endif
            endfunction
        """ }}}
        """ Remove multiple empty lines {{{
            function! DeleteMultipleEmptyLines()
                g/^\_$\n\_^$/d
            endfunction

            nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>
        """ }}}
        """ Split to relative header/source {{{
            function! SplitRelSrc()
                let s:fname = expand("%:t:r")

                if expand("%:e") == "h"
                    set nosplitright
                    exe "vsplit" fnameescape(s:fname . ".cpp")
                    set splitright
                elseif expand("%:e") == "cpp"
                    exe "vsplit" fnameescape(s:fname . ".h")
                endif
            endfunction

            nnoremap <leader>le :call SplitRelSrc()<CR>
        """ }}}
        """ Strip trailing whitespace, return to cursors at save {{{
            function! <SID>StripTrailingWhitespace()
                let l = line(".")
                let c = col(".")
                %s/\s\+$//e
                call cursor(l, c)
            endfunction

            autocmd FileType c,cpp,css,html,perl,python,sh autocmd 
                        \BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
        """ }}}
    """ }}}
    """ Plugins {{{
        " Toggle tagbar (definitions, functions etc.)
        map <F1> :TagbarToggle<CR>

        " Toggle the NERDTree file browser
        map <F2> :NERDTreeToggle<CR>

        " Toggle pastemode, doesn't indent
        set pastetoggle=<F3>

        " Syntastic - toggle error list. Probably should be toggleable.
        noremap <silent><leader>lo :Errors<CR>
        noremap <silent><leader>lc :lcl<CR>
    """ }}}
""" }}}
""" Misc plugin settings {{{
    " clang_complete - C++11
    let g:clang_user_options="-std=c++0x"

    " CtrlP - don't recalculate files on start (slow)
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_working_path_mode = 'ra'

    " NERDTree
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeHijackNetrw = 1

    " TagBar
    let g:tagbar_left = 0
    let g:tagbar_width = 30
    set tags=tags;/

    " Syntastic - This is largely up to your own usage, and override these
    "             changes if be needed. This is merely an exemplification.
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_compiler_options = ' -std=c++0x'
    let g:syntastic_mode_map = {
        \ 'mode': 'passive',
        \ 'active_filetypes':
            \ ['c', 'cpp', 'perl', 'python'] }

    " Automatically remove preview window after autocomplete (mainly for clang_complete)
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
""" }}}
""" Local ending config, will overwrite anything above. Generally use this. {{{{
    if filereadable($HOME."/.vimrc.last")
        source $HOME/.vimrc.last
    endif
""" }}}
