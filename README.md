# Dotfiles et cetera

A collection of dotfiles and instructions for cloning my work environment on
unix machines.

## Overview

I use the [text triumvirate](
http://stackoverflow.com/questions/12714930/how-to-get-the-current-url-into-clipboard-using-vimperator])
of zsh, vim, and tmux, to work as much as I can in the terminal.

### ZSH

I'm using zsh, together with oh-my-zsh, as a replacement for the bash shell.
I'm still not entirely sure what benefit this provides and, more importantly,
how portable it will be. But since others have had good luck with zsh, I will
trust their experience, for now.

Installation instructions are here:

Install zsh

`apt-get install zsh`

Install oh-my-zsh

`wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O
- | zsh`

Change shell (do not use `sudo`!)

` chsh -s `which zsh`

Restart

sudo shutdown -r 0

The .zshrc is included in this repository and acts like .bashrc. Note the
changes to the 'pygmalion' theme and the terminal setting to a 256-color xterm.

### VIM

I decided against using neovim, for the time being, because of minor -- but
frustrating -- issues when working under tmux. Vim packages are managed with
[Vundle](https://github.com/VundleVim/Vundle.vim), which is easy to set up. 

The .vimrc file contains customizations to vim itself and to the packages I
use.

### TMUX

I find tmux extremely useful, but occasionally fiddly. I have a few minor
adjustments in .tmux.conf to make sure everything works consistently with and
without tmux emulation.

One thing that still eludes me is getting the HOME and END keys to work
everywhere. I've gotten them to work under vim, but I still have problems with
python and ipython. In linux, at least, Ctrl-a and Ctrl-e serve as the HOME and
END keys, so I suppose I'll use those.

### Colors

I use the [base16](http://chriskempson.github.io/base16/) color scheme and its
variants. This
[repository](https://github.com/chriskempson/base16-gnome-terminal) contains
shell scripts that can be used to generate gnome terminal profiles. The default
(dark and light) is a solid option. 

I find that I don't have to change the color scheme in vim if my terminal
colors are good to begin with.




