"-----------------------------------------"
" Source: http://github.com/timss/vimconf "
"-----------------------------------------"

""" Automatically create needed files and folders on first run (*nix only) {{{
    call system('mkdir -p $HOME/.vim/{autoload,bundle,swap,undo}')
    if !filereadable($HOME.'/.vimrc.plugins') | call system('touch $HOME/.vimrc.plugins') | endif
    if !filereadable($HOME.'/.vimrc.first') | call system('touch $HOME/.vimrc.first') | endif
    if !filereadable($HOME.'/.vimrc.last') | call system('touch $HOME/.vimrc.last') | endif
""" }}}
""" vim-plug plugin manager {{{
    " Automatic installation
    " https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
    if empty(glob('~/.vim/autoload/plug.vim'))
        let g:clone_details = 'https://github.com/junegunn/vim-plug.git $HOME/.vim/bundle/vim-plug'
        silent call system('git clone --depth 1 '. g:clone_details)
        if v:shell_error | silent call system('git clone ' . g:clone_details) | endif
        silent !ln -s $HOME/.vim/bundle/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
        augroup FirstPlugInstall
            autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
        augroup END
    endif

    """ Plugins to be disabled {{{
    """ https://github.com/timss/vimconf/issues/13
        " Create empty list with names of disabled plugins if not defined
        let g:plugs_disabled = get(g:, 'plug_disabled', [])

        " Trim and extract repo name
        " Same substitute/fnamemodify args as vim-plug itself
        " https://github.com/junegunn/vim-plug/issues/469#issuecomment-226965736
        function! s:plugs_disable(repo)
            let l:repo = substitute(a:repo, '[\/]\+$', '', '')
            let l:name = fnamemodify(l:repo, ':t:s?\.git$??')
            call add(g:plugs_disabled, l:name)
        endfunction

        " Append to list of repo names to be disabled just like they're added
        " UnPlug 'junegunn/vim-plug'
        command! -nargs=1 -bar UnPlug call s:plugs_disable(<args>)
    """ }}}

    " Default to same plugin directory as vundle etc
    call plug#begin('~/.vim/bundle')

    " <Tab> everything!
    Plug 'ervandew/supertab'

    " Fuzzy finder (files, mru, etc)
    Plug 'ctrlpvim/ctrlp.vim'

    " A pretty statusline, bufferline integration
    Plug 'itchyny/lightline.vim'
    Plug 'bling/vim-bufferline'

    " Undo history visualizer
    Plug 'mbbill/undotree'

    " Glorious colorscheme
    " To avoid errors during automatic installation
    " https://github.com/junegunn/vim-plug/issues/225
    Plug 'nanotech/jellybeans.vim'

    " Universal commenting with toggle, motions, embedded syntax and more
    Plug 'tomtom/tcomment_vim'

    " Autoclose (, " etc
    Plug 'somini/vim-autoclose'

    " UNIX shell command helpers, e.g. sudo, chmod, remove etc.
    Plug 'tpope/vim-eunuch'

    " Git wrapper inside Vim
    Plug 'tpope/vim-fugitive'

    " Handle surround chars like ''
    Plug 'tpope/vim-surround'

    " Align your = etc.
    Plug 'junegunn/vim-easy-align'

    " Snippets like textmate
    if has('python') || has('python3')
        Plug 'honza/vim-snippets'
        Plug 'sirver/ultisnips'
    endif

    " A fancy start screen, shows MRU etc.
    Plug 'mhinz/vim-startify'

    " Vim signs (:h signs) for modified lines based off VCS (e.g. Git)
    Plug 'mhinz/vim-signify'

    " Awesome syntax checker.
    " REQUIREMENTS: See :h syntastic-intro
    Plug 'vim-syntastic/syntastic'

    " Functions, class data etc.
    " depends on either exuberant-ctags or universal-ctags
    if executable('ctags-exuberant') || executable('ctags')
        Plug 'majutsushi/tagbar'
    endif

    " Local plugins
    if filereadable($HOME.'/.vimrc.plugins')
        source $HOME/.vimrc.plugins
    endif

    " Remove disabled plugins from installation/initialization
    " https://vi.stackexchange.com/q/13471/5070
    call filter(g:plugs, 'index(g:plugs_disabled, v:key) == -1')

    " Initalize plugin system
    call plug#end()
""" }}}
""" Local leading config, only for prerequisites and will be overwritten {{{
    if filereadable($HOME.'/.vimrc.first')
        source $HOME/.vimrc.first
    endif
""" }}}
""" User interface {{{
    """ Syntax highlighting {{{
        " https://stackoverflow.com/a/33380495/1076493
        if !exists('g:syntax_on')
            syntax enable
        endif

        let g:jellybeans_overrides = {
        \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
        \    'SignColumn': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none' },
        \    'CursorLine': { 'ctermbg': '235'},
        \}
        silent! colorscheme jellybeans
        """ Force behavior and filetypes, and by extension highlighting {{{
            augroup FileTypeRules
                autocmd!
                autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
                autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
                autocmd BufNewFile,BufRead *.txt set ft=sh tw=79
            augroup END
        """ }}}
        """ 256 colors for maximum jellybeans bling. See commit log for info {{{
            if (&term =~# 'xterm') || (&term =~# 'screen')
                set t_Co=256
            endif
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
        """ Depending on your setup you may want to enforce UTF-8. {{{
        """ Should generally be set in your environment LOCALE/$LANG
            " set encoding=utf-8                    " default $LANG/latin1
            " set fileencoding=utf-8                " default none
        """ }}}
        """ Gvim {{{
            set guifont=DejaVu\ Sans\ Mono\ 9
            set guioptions-=m                       " remove menubar
            set guioptions-=T                       " remove toolbar
            set guioptions-=r                       " remove right scrollbar
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set completeopt=menu,preview,longest            " insert mode completion
    set hidden                                      " buffer change, more undo
    set history=1000                                " default 20
    set laststatus=2                                " always show statusline
    set linebreak                                   " don't cut words on wrap
    set listchars=tab:>\                            " > to highlight <Tab>
    set list                                        " displaying listchars
    set mouse=                                      " disable mouse
    set noshowmode                                  " hide mode cmd line
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " keep cursor column pos
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    set shortmess+=I                                " disable startup message
    set splitbelow                                  " splits go below w/focus
    set splitright                                  " vsplits go right w/focus
    set ttyfast                                     " for faster redraws etc
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
    """ Wildmode/wildmenu command-line completion {{{
        set wildignore+=*.bak,*.swp,*.swo
        set wildignore+=*.a,*.o,*.so,*.pyc,*.class
        set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.pdf
        set wildignore+=*/.git*,*.tar,*.zip
        set wildmenu
        set wildmode=longest:full,list:full
    """ }}}
    """ Return to last edit position when opening files {{{
        augroup LastPosition
            autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
        augroup END
    """ }}}
""" }}}
""" Files {{{
    set autoread                                    " refresh if changed
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set nobackup                                    " disable backups
    """ Persistent undo. Requires Vim 7.3 {{{
        if has('persistent_undo') && exists('&undodir')
            set undodir=$HOME/.vim/undo/            " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif
    """ }}}
    """ Swap files, unless vim is invoked using sudo {{{
    """ https://github.com/tejr/dotfiles/blob/master/vim/vimrc
        if !strlen($SUDO_USER)
            set directory^=$HOME/.vim/swap//        " default cwd, // full path
            set swapfile                            " enable swap files
            set updatecount=50                      " update swp after 50chars
            """ Don't swap tmp, mount or network dirs {{{
                augroup SwapIgnore
                    autocmd! BufNewFile,BufReadPre /tmp/*,/mnt/*,/media/*
                        \ setlocal noswapfile
                augroup END
            """ }}}
        else
            set noswapfile                          " dont swap sudo'ed files
        endif
    """ }}}
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set cinkeys-=0#                                 " don't force # indentation
    set expandtab                                   " indents <Tab> as spaces
    set ignorecase                                  " by default ignore case
    set nrformats+=alpha                            " incr/decr letters C-a/-x
    set shiftround                                  " round indent of 'sw'
    set shiftwidth=0                                " =0 uses 'ts' value
    set smartcase                                   " sensitive with uppercase
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=-1                              " =-1 uses 'sw' value
    set tabstop=4                                   " <Tab> as 4 spaces indent
    """ Only auto-comment newline for block comments {{{
        augroup AutoBlockComment
            autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
        augroup END
    """ }}}
    """ Take comment leaders into account when joining lines, :h fo-table {{{
    """ http://ftp.vim.org/pub/vim/patches/7.3/7.3.541
        if has('patch-7.3.541')
            set formatoptions+=j
        endif
    """ }}}
""" }}}
""" Keybindings {{{
    """ General {{{
        " Remap <Leader>
        let g:mapleader=','

        " Quickly edit/source .vimrc
        noremap <Leader>ve :edit $HOME/.vimrc<CR>
        noremap <Leader>vs :source $HOME/.vimrc<CR>

        " Yank(copy) to system clipboard
        noremap <Leader>y "+y

        " Toggle pastemode, doesn't indent
        set pastetoggle=<F3>

        " Toggle folding
        " http://vim.wikia.com/wiki/Folding#Mappings_to_toggle_folds
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

        " Toggle relativenumber
        nnoremap <silent> <Leader>r :set relativenumber!<CR>

        " Treat wrapped lines as normal lines
        nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
        nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

        " Quickly switch buffers
        nnoremap <Leader>n :bnext<CR>
        nnoremap <Leader>p :bprevious<CR>
        nnoremap <Leader>f :b#<CR>
        nnoremap <Leader>1 :1b<CR>
        nnoremap <Leader>2 :2b<CR>
        nnoremap <Leader>3 :3b<CR>
        nnoremap <Leader>4 :4b<CR>
        nnoremap <Leader>5 :5b<CR>
        nnoremap <Leader>6 :6b<CR>
        nnoremap <Leader>7 :7b<CR>
        nnoremap <Leader>8 :8b<CR>
        nnoremap <Leader>9 :9b<CR>
        nnoremap <Leader>0 :10b<CR>

        " Highlight last inserted text
        nnoremap gV '[V']
    """ }}}
    """ Functions and/or fancy keybinds {{{
        """ Toggle syntax highlighting {{{
            function! ToggleSyntaxHighlighthing()
                if exists('g:syntax_on')
                    syntax off
                else
                    syntax enable
                endif
            endfunction

            nnoremap <Leader>s :call ToggleSyntaxHighlighthing()<CR>
        """ }}}
        """ Highlight characters past 79, toggle with <Leader>h {{{
        """ You might want to override this function and its variables with
        """ your own in .vimrc.last which might set for example colorcolumn or
        """ even the textwidth. See https://github.com/timss/vimconf/pull/4
            let g:overlength_enabled = 0
            highlight OverLength ctermbg=238 guibg=#444444

            function! ToggleOverLength()
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

            nnoremap <Leader>h :call ToggleOverLength()<CR>
        """ }}}
        """ Toggle text wrapping, wrap on whole words {{{
        """ For more info see: http://stackoverflow.com/a/2470885/1076493
            function! WrapToggle()
                if &wrap
                    set list
                    set nowrap
                else
                    set nolist
                    set wrap
                endif
            endfunction

            nnoremap <Leader>w :call WrapToggle()<CR>
        """ }}}
        """ Remove multiple empty lines {{{
            function! DeleteMultipleEmptyLines()
                g/^\_$\n\_^$/d
            endfunction

            nnoremap <Leader>ld :call DeleteMultipleEmptyLines()<CR>
        """ }}}
        """ Split to relative header/source {{{
            function! SplitRelSrc()
                let l:fname = expand('%:t:r')

                if expand('%:e') ==? 'h'
                    set nosplitright
                    exe 'vsplit' fnameescape(l:fname . '.cpp')
                    set splitright
                elseif expand('%:e') ==? 'cpp'
                    exe 'vsplit' fnameescape(l:fname . '.h')
                endif
            endfunction

            nnoremap <Leader>le :call SplitRelSrc()<CR>
        """ }}}
        """ Strip trailing whitespace, return to cursor at save {{{
            function! StripTrailingWhitespace()
                let l:save = winsaveview()
                %s/\s\+$//e
                call winrestview(l:save)
            endfunction

            augroup StripTrailingWhitespace
                autocmd!
                autocmd FileType c,cpp,cfg,conf,css,html,perl,python,sh,tex,yaml
                    \ autocmd BufWritePre <buffer> :call
                    \ StripTrailingWhitespace()
            augroup END
        """ }}}
    """ }}}
    """ Plugins {{{
        " Toggle tagbar (definitions, functions etc.)
        if exists('g:plugs["tagbar"]')
            nnoremap <F2> :TagbarToggle<CR>
        endif

        " Toggle undo history tree
        nnoremap <F5> :UndotreeToggle<CR>

        " Syntastic - toggle error list. Probably should be toggleable.
        noremap <silent><Leader>lo :Errors<CR>
        noremap <silent><Leader>lc :lclose<CR>

        " EasyAlign - interactive mode (e.g. vipga/gaip)
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    """ }}}
""" }}}
""" Plugin settings {{{
    """ Startify {{{
        let g:startify_bookmarks = [
            \ $HOME . '/.vimrc', $HOME . '/.vimrc.first',
            \ $HOME . '/.vimrc.last', $HOME . '/.vimrc.plugins'
            \ ]
        let g:startify_custom_header = [
            \ '   http://github.com/timss/vimconf',
            \ ''
            \ ]
        let g:startify_files_number = 5
    """ }}}
    """ CtrlP {{{
        " Don't recalculate files on start (slow)
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_working_path_mode = 'ra'

        " Don't split in Startify
        let g:ctrlp_reuse_window = 'startify'
    """ }}}
    """ TagBar {{{
        set tags=tags;/

        " Proportions
        let g:tagbar_left = 0
        let g:tagbar_width = 30

        " Used in lightline.vim
        let g:tagbar_status_func = 'TagbarStatusFunc'
    """ }}}
    """ Syntastic {{{
        " Automatic checking for active, only when :SyntasticCheck for passive
        " NOTE: override these in $HOME/.vimrc.first as needed!
        " https://github.com/timss/vimconf/issues/9
        let g:syntastic_mode_map = get(g:, 'syntastic_mode_map', {
            \ 'mode': 'passive',
            \ 'active_filetypes':
                \ ['c', 'cpp', 'perl', 'python'] })

        " Skip check on :wq, :x, :ZZ etc
        let g:syntastic_check_on_wq = 0
    """ }}}
    """ Netrw {{{
        let g:netrw_banner = 0
        let g:netrw_list_hide = '^\.$'
        let g:netrw_liststyle = 3
    """ }}}
    """ Supertab {{{
        " Complete based on context (compl-omni, compl-filename, ..)
        let g:SuperTabDefaultCompletionType = 'context'

        " Longest common match, e.g. 'b<Tab>' => 'bar' for 'barbar', 'barfoo'
        let g:SuperTabLongestEnhanced = 1
        let g:SuperTabLongestHighlight = 1
    """ }}}
    """ UltiSnips {{{
        let g:UltiSnipsExpandTrigger='<Tab>'
        let g:UltiSnipsJumpForwardTrigger='<Tab>'
        let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
    """ }}}
    """ Automatically remove preview window after autocomplete {{{
    """ (mainly for clang_complete)
        augroup RemovePreview
            autocmd!
            autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
            autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
        augroup END
    """ }}}
    """ Lightline {{{
        let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['readonly', 'fugitive'],
            \         ['ctrlpmark', 'bufferline']
            \     ],
            \     'right': [
            \         ['lineinfo'],
            \         ['percent'],
            \         ['fileformat', 'fileencoding', 'filetype', 'syntastic']
            \     ]
            \ },
            \ 'component': {
            \     'paste': '%{&paste?"!":""}'
            \ },
            \ 'component_function': {
            \     'mode'         : 'LightlineMode',
            \     'fugitive'     : 'LightlineFugitive',
            \     'readonly'     : 'LightlineReadonly',
            \     'ctrlpmark'    : 'LightlineCtrlPMark',
            \     'bufferline'   : 'LightlineBufferline',
            \     'fileformat'   : 'LightlineFileformat',
            \     'fileencoding' : 'LightlineFileencoding',
            \     'filetype'     : 'LightlineFiletype'
            \ },
            \ 'component_expand': {
            \     'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \     'syntastic': 'middle',
            \ },
            \ 'subseparator': {
            \     'left': '|', 'right': '|'
            \ }
            \ }

        " Ensure that each mode indicator is the same size and casing
        let g:lightline.mode_map = {
            \ 'n'      : ' N ',
            \ 'i'      : ' I ',
            \ 'R'      : ' R ',
            \ 'v'      : ' V ',
            \ 'V'      : 'V-L',
            \ 'c'      : ' C ',
            \ "\<C-v>" : 'V-B',
            \ 's'      : ' S ',
            \ 'S'      : 'S-L',
            \ "\<C-s>" : 'S-B',
            \ '?'      : '      ' }

        function! LightlineMode()
            let l:fname = expand('%:t')
            return l:fname ==# '__Tagbar__' ? 'Tagbar' :
                \ l:fname ==# 'ControlP' ? 'CtrlP' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
        endfunction

        function! LightlineFugitive()
            try
                if expand('%:t') !~? 'Tagbar' && exists('*fugitive#head')
                    let l:branch = fugitive#head()
                    return l:branch !=# '' ? '± '.l:branch : ''
                endif
            catch
            endtry
            return ''
        endfunction

        function! LightlineReadonly()
            return &filetype !~? 'help' && &readonly ? '≠' : '' " or ⭤
        endfunction

        function! LightlineCtrlPMark()
            if expand('%:t') =~# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        " https://github.com/itchyny/lightline.vim/issues/36
        function! LightlineBufferline()
            call bufferline#refresh_status()
            let b = g:bufferline_status_info.before
            let c = g:bufferline_status_info.current
            let a = g:bufferline_status_info.after
            let alen = strlen(a)
            let blen = strlen(b)
            let clen = strlen(c)
            let w = winwidth(0) * 4 / 11
            if w < alen+blen+clen
                let whalf = (w - strlen(c)) / 2
                let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
                let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
                return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
            else
                return b . c . a
            endif
        endfunction

        function! LightlineFileformat()
            return winwidth(0) > 90 ? &fileformat : ''
        endfunction

        function! LightlineFileencoding()
            return winwidth(0) > 80 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
        endfunction

        function! LightlineFiletype()
            return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
        endfunction

        let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

        function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
            let g:lightline.ctrlp_regex = a:regex
            let g:lightline.ctrlp_prev = a:prev
            let g:lightline.ctrlp_item = a:item
            let g:lightline.ctrlp_next = a:next
            return lightline#statusline(0)
        endfunction

        function! CtrlPStatusFunc_2(str)
            return lightline#statusline(0)
        endfunction

        function! TagbarStatusFunc(current, sort, fname, ...) abort
            let g:lightline.fname = a:fname
            return lightline#statusline(0)
        endfunction

        function! s:syntastic()
            SyntasticCheck
            call lightline#update()
        endfunction

        augroup AutoSyntastic
            autocmd!
            execute 'autocmd FileType ' .
                \join(g:syntastic_mode_map['active_filetypes'], ',') .
                \' autocmd BufWritePost <buffer> :call s:syntastic()'
        augroup END
    """ }}}
""" }}}
""" Local ending config, will overwrite anything above. Generally use this. {{{
    if filereadable($HOME.'/.vimrc.last')
        source $HOME/.vimrc.last
    endif
""" }}}
