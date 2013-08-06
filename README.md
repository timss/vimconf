vimconf
=======
* Super easy to install
* Everything in vimrc is explained
* Autocomplete, syntax checker, plugin manager and much more

Installation
------------

    git clone https://github.com/timss/vimconf.git
    ln -s vimconf/.vimrc ~/.vimrc

Run vim and it'll download and install all plugins for you!

**Packages required by plugins (see `.vimrc` for more info):**    
- clang, ruby, ctags, jedi

Configuration
-------------
If you choose to symlink your `~/.vimrc` you can easily maintain an updated
version of this vim configuration by using the local additions.

`~/.vimrc.bundles`  Add your personal bundles here.   
`~/.vimrc.first`    Prerequisites only, as it will be overwritten by whatever below.   
`~/.vimrc.last`     Overrides everything. Generally use this.   

Even if this configuration can be used out of the box or tweaked using
the local files, I urge you to build your own if you have the time and
energy to do so. Only then will you be able to properly understand the
reasoning behind each setting and tailor it to your personal workflow.

However I still believe my Vim setup will help you get a basis configuration
for your own, introducing core ideas such as a plugin manager and
`.vimrc` structure. Use this configuration well, but do not blindly trust it to
suit you perfectly. It's intended to be played with!

Preview
-------
![Preview](http://i.imgur.com/L0axH7e.png "Vim screenshot, C++ autocomplete")

[Writing a small perl-script using Vim](http://youtu.be/DrzAuLsxgwU) \(pretty outdated\)

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

Suggestions and questions
-------------------------
Feel free to give me suggestions, ask questions or point out things that needs
to be fixed by adding an [issue](https://github.com/timss/vimconf/issues).

Todo
----
* Potentially add [YouCompleteMe](https://github.com/Valloric/YouCompleteMe),
which would replace [clang\_complete](https://github.com/Rip-Rip/clang_complete), 
[supertab](https://github.com/ervandew/supertab) and maybe even 
[jedi-vim](https://github.com/davidhalter/jedi-vim)
* Better/more plugins and binds for Python
* Maybe replace vim-powerline with the new 
[powerline](https://github.com/Lokaltog/powerline).   
For now just using the old one. Don't see any reason to upgrade.   
Will require new fonts (.ttf for windows) and easy install using Vundle.
    * Instead use [vim-airline](https://github.com/bling/vim-airline)?
