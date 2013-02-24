vimconf
=======

* Autocomplete, syntax checker, plugin manager and much more!
* Easy to install
* Every setting is explained
* All required files included \*

The install process heavily relies upon the genius plugin manager Vundle, 
thus it is included.  

\* **Packages required by plugins:** clang, ruby, ctags, jedi (python-package)   
See .vimrc for more info.   

### Installation
To install clone and copy the .vim-folder to your home-folder.   

    cp -r vimconf/.vim ~

Symlink your ~/.vimrc to your git clone so in order to update
only a git pull is needed:   

    ln -s vimconf/.vimrc ~/.vimrc

Then open an empty file with Vim and run this to install the plugins.  
It's the same command for updating, but with an appended !   
Don't mind all the errors that pop up after the install is finished.   

    :BundleInstall

See [Vundle](https://github.com/gmarik/vundle) for more information on how 
to use it.

**Note**: This configuration uses 'fancy' glyphs for 
[Powerline](https://github.com/Lokaltog/vim-powerline) and therefore requires 
a [patched font](https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts) 
for it to work.   
A patched version of DejaVu Sans Mono is included in .fonts
See the [docs](https://github.com/Lokaltog/vim-powerline#troubleshooting) for more 
information.   

If you want to use the included DejaVu Sans Mono fonts, do the following:   

    mkdir -p ~/.fonts
    cp vimconf/.vim/.fonts/* ~/.fonts/
    fc-cache -vf

To disable this feature, change the powerline symbols setting to 'compatible' or 'unicode'   

    let g:Powerline_symbols = 'compatible'

### Configuration
Use a ~/.vimrc.local for your own settings. This way you can still easily 
update this config without   
having to maintain your personal changes. It will be sourced automatically.  
As for Gvim I'd still recommend using .vimrc.local since noexrc is enabled.

### Preview
![Preview](http://i.imgur.com/rdTew.png "Vim screenshot")

[Writing a small perl-script using Vim](http://youtu.be/DrzAuLsxgwU)

### Todo
* Better/more plugins and binds for Python (feel free to give me 
suggestions).
* Maybe replace vim-powerline with the new 
[powerline](https://github.com/Lokaltog/powerline).   
For now just using the old one. Don't see any reason to upgrade.   
Will require new fonts (.ttf for windows) and easy install using Vundle.
* Conditional expressions for testing whether or not plugin X is enabled,   
and if so; enable plugin settings (Syntastic etc).
* Change from .vimrc.local to .vimrc.{first,last}
