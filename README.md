vimconf
=======
* Super easy to install and extend
* Everything in the vimrc is explained
* A universal configuration with a syntax checker, plugin manager and more

Installation
------------
**Required packages:** ctags, ruby

    git clone https://github.com/timss/vimconf.git
    ln -s vimconf/.vimrc ~/.vimrc

Run vim and it'll download and install all plugins automatically!

Configuration
-------------
If you choose to symlink your `~/.vimrc` you can easily maintain an updated
version of this vim configuration by using the local additions.

`~/.vimrc.bundles`  Add your personal bundles (plugins) here.   
`~/.vimrc.first`    Prerequisites only, as it will be overwritten by whatever below.   
`~/.vimrc.last`     Overrides everything. Generally use this.   

I've chosen to include mostly universal plugins and configuration, meaning that
not a lot is language specific and should be fitting for most use cases. If you
want additional plugins for autocomplete and more you can do so easily using
your local files mentioned above.

Some useful plugins could be:

* [clang\_complete](https://github.com/Rip-Rip/clang_complete) - C/C++ autocompletion using Clang
* [jedi-vim](https://github.com/davidhalter/jedi-vim) - Python autocompletion using the Jedi library.
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) - Autocompletion for several languages (C/C++, Python, ...)

Preview
-------

\(Outdated, different statusline, no longer C++ autocomplete support, ...)   
![Preview](http://i.imgur.com/L0axH7e.png "Vim screenshot, C++ autocomplete")

\(Also pretty outdated...\)    
[Writing a small perl-script using Vim](http://youtu.be/DrzAuLsxgwU)

Suggestions and questions
-------------------------
Feel free to give me suggestions, ask questions or point out things that needs
to be fixed by adding an [issue](https://github.com/timss/vimconf/issues).

Disclaimer
----------
Even if this configuration can be used out of the box or tweaked using
the local files, I urge you to build your own if you have the time and
energy to do so. Only then will you be able to properly understand the
reasoning behind each setting and tailor it to your personal workflow.

However I still believe my Vim setup will help you get a basis configuration
for your own, introducing core ideas such as a plugin manager and
`.vimrc` structure. Use this configuration well, but do not blindly trust it to
suit you perfectly. It's intended to be played with!

Todo
----
* Update preview (gifs)
* Extract some language/plugin specific configuration to an example file (wiki)?
* Statusline:
    * Previously used vim-powerline, then airline and now lightline.
    * Lightline is much easier to configure, but missing some functionality
      out of the box.
    * Interact with tagbar (etc)?
    * Override tabline changes?
