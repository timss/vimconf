vimconf
=======

My Vim configuration.
* Easy to install
* Every setting is explained
* All required files included

The install process heavily relies upon the genius plugin manager Vundle, 
thus it is included.  
It doesn't matter if it's outdated, it'll update itself.

### Installation
To install clone and copy all the files to your home-folder,   
alternatively symlink your ~/.vimrc to your git clone so in order to update
only a git pull is needed.  

    ln -s /dir/vimconf/.vimrc ~/.vimrc

Then open an empty file with Vim and run this to install the plugins.  
It's the same command for updating.  

    :BundleInstall

See [Vundle](https://github.com/gmarik/vundle) for more information on how 
to use it.

**Note**: This configuration uses 'fancy' glyphs for 
[Powerline](https://github.com/Lokaltog/vim-powerline) and therefore requires 
a patched font for it to work.  
Either disable this or use an appropriate font. See the docs for more 
information.  
If you're having problems with displaying the glyphs, check that you're using 
UTF8 as encoding.  
You could also force encoding, but this will affect files 
edited.

### Configuration
Use a ~/.vimrc.local for your own settings. In this way you can still easily 
update this config without  
having to maintain your personal changes. It will be sourced automatically.  
As for Gvim I'd still recommend using .vimrc.local since noexrc is enabled.

### Preview
![Preview](http://i.imgur.com/rdTew.png "Vim screenshot")

[Writing a small perl-script using Vim](http://youtu.be/DrzAuLsxgwU)
