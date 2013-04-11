vimconf
=======
* Autocomplete, syntax checker, plugin manager and much more!
* Easy to install
* Everything in vimrc is explained!

\* **Packages required by plugins:** clang, ruby, ctags, jedi (python-package)   
See .vimrc for more info.   

Installation
------------

    git clone https://github.com/timss/vimconf.git
    cp -r vimconf/.vim ~
    ln -s vimconf/.vimrc ~/.vimrc

Symlink your ~/.vimrc so in order to update only a git pull is needed!   
Run vim and it'll download and install all plugins for you!

Configuration
-------------
Use a ~/.vimrc.local for your own settings. This way you can still easily 
update this config without   
having to maintain your personal changes. It will be sourced automatically.   

As for Gvim I'd still recommend using .vimrc.local since noexrc is enabled.

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

And enable it in .vimrc

    let g:Powerline_symbols = 'fancy'

Optional: local additions
-------------------------
Add .vimrc.{bundles,first,last} to $HOME if you want to customize but don't Git it.   
Bundles can be added as usual, with `Bundle 'user/repo'`

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
