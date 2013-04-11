vimconf
=======
* Super easy to install
* Everything in vimrc is explained
* Autocomplete, syntax checker, plugin manager and much more

\* **Packages required by plugins:** clang, ruby, ctags, jedi (python-package)   
See .vimrc for more info.   

Installation
------------

    git clone https://github.com/timss/vimconf.git
    ln -s vimconf/.vimrc ~/.vimrc

Run vim and it'll download and install all plugins for you!

Configuration
-------------
If you choose to symlink your `~/.vimrc` you can easily maintain an updated
version of this vim configuration by using the local additions.

`~/.vimrc.bundles`  Add your personal bundles here.
`~/.vimrc.first`    Prerequisites only, as it will be overwritten by whatever below.
`~/.vimrc.last`     Overrides everything. Generally use this.

Preview
-------
![Preview](http://i.imgur.com/rdTew.png "Vim screenshot")

[Writing a small perl-script using Vim](http://youtu.be/DrzAuLsxgwU)

Optional: fancier powerline
---------------------------
If you want to use fancy powerline you need a 
[patched font](https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts)   
A patched version of DejaVu Sans Mono is included in .fonts
See the [docs](https://github.com/Lokaltog/vim-powerline#troubleshooting) for more 
information.   

If you want to use the included DejaVu Sans Mono fonts, do the following:   

    mkdir -p ~/.fonts
    cp vimconf/.vim/.fonts/* ~/.fonts/
    fc-cache -vf

And enable it in .vimrc.last (overrides .vimrc)

    let g:Powerline_symbols = 'fancy'

Todo
----
* Potentially add [YouCompleteMe](https://github.com/Valloric/YouCompleteMe),
which would replace [clang\_complete](https://github.com/Rip-Rip/clang_complete), 
[supertab](https://github.com/ervandew/supertab) and maybe even 
[jedi-vim](https://github.com/davidhalter/jedi-vim)
* Better/more plugins and binds for Python (feel free to give me 
suggestions).
* Maybe replace vim-powerline with the new 
[powerline](https://github.com/Lokaltog/powerline).   
For now just using the old one. Don't see any reason to upgrade.   
Will require new fonts (.ttf for windows) and easy install using Vundle.
* Conditional expressions for testing whether or not plugin X is enabled,   
and if so; enable plugin settings (Syntastic etc).
