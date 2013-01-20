vimconf
=======

My Vim configuration.
* Easy to install
* Every setting is explained
* All required files included \*

The install process heavily relies upon the genius plugin manager Vundle, 
thus it is included.  

\* **Packages required by plugins:** clang, ruby, ctags   
See .vimrc for more info. 

### Installation
To install clone and copy all the files to your home-folder,   

    cp -r vimconf/.vim ~

**or** symlink your ~/.vimrc to your git clone so in order to update
only a git pull is needed.  

    ln -s vimconf/.vimrc ~/.vimrc

Then open an empty file with Vim and run this to install the plugins.  
It's the same command for updating, but with an appended !   

    :BundleInstall

See [Vundle](https://github.com/gmarik/vundle) for more information on how 
to use it.

**Note**: This configuration uses 'fancy' glyphs for 
[Powerline](https://github.com/Lokaltog/vim-powerline) and therefore requires 
a [patched font](https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts) 
for it to work. A patched version of DejaVu Sans Mono is included in .fonts 
Either disable  or use an appropriate font. See the 
[docs](https://github.com/Lokaltog/vim-powerline#troubleshooting) for more 
information.  

### Configuration
Use a ~/.vimrc.local for your own settings. In this way you can still easily 
update this config without  
having to maintain your personal changes. It will be sourced automatically.  
As for Gvim I'd still recommend using .vimrc.local since noexrc is enabled.

### Preview
![Preview](http://i.imgur.com/rdTew.png "Vim screenshot")

[Writing a small perl-script using Vim](http://youtu.be/DrzAuLsxgwU)

### Todo
* Better plugins and binds for Python (feel free to give me 
suggestions)
* Replace vim-powerline with the new 
[powerline](https://github.com/Lokaltog/powerline) when it's ready
