# Dotfiles et cetera

A collection of dotfiles and instructions for reproducing my work environment
on unix machines (primarily ubuntu and derivatives).

## Overview

I use the [text triumvirate](
http://stackoverflow.com/questions/12714930/how-to-get-the-current-url-into-clipboard-using-vimperator])
of zsh, vim, and tmux, to work as much as I can in the terminal.

Python receives a lot of attention since I do all my data science projects with
it.

### ZSH

I'm using zsh, together with oh-my-zsh, as a replacement for the bash shell.
I'm still not entirely sure what benefit this provides and, more importantly,
how portable it will be. But since others have had good luck with zsh, I will
trust their experience, for now.

Installation instructions are here:

Install zsh

`apt-get install zsh`

Install oh-my-zsh

`wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh`

Change shell (do not use `sudo`!)

`chsh -s \`which zsh`

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

### COLORS

I use the [base16](http://chriskempson.github.io/base16/) color scheme and its
variants. This
[repository](https://github.com/chriskempson/base16-gnome-terminal) contains
shell scripts that can be used to generate gnome terminal profiles. The default
(dark and light) is a solid option. 

I find that I don't have to change the color scheme in vim if my terminal
colors are good to begin with.

### FONTS

I use the (Hack)[https://github.com/chrissimpkins/Hack] font for writing code.

### PYTHON

I use the Ubuntu repositories for setting up my python environment. Get the
latest version of (python 3) directly from the repository with

`apt-get install python3`

While it is possible to use the system repositories to install the various
python libraries -- and cause less grief -- it may be a better idea to work
with virtual environments and install the libraries with (pip) instead. I can't
tell yet how beneficial this is for data science projects, although I can see
the benefit for general development tasks, so I am working with the assumption
that such project isolation will pay off in the long run in spite of the
additional work I have to do to get things running.

The following subsections contain brief instructions for the important bits.
(Note: instructions for install pip are missing, so I will add them the next
time I am setting up a fresh machine).

VIRTUALENV

Keep in mind that `virtualenv` needs to be installed with su rights, so do

`sudo pip install virtualenv`

To make a new virtual environment

`cd project-directory`
`virtualenv VENV_NAME`

To activate

`source VENV_NAME/bin/activate`

As of late, virtual environments are activated with the option to *not* include
global packages (`--no-site-packages). This keeps the project requirements
clear. To view project requirements, do

`pip list`

It is also possible to 'freeze' the current state of the environment packages
with

`pip freeze > requirements.txt`

The file we redirected to can then be used to automatically recreate the
environment with

`pip install -r requirements.txt`

To deactivate a virtual environment, use

`deactivate`

I have not been able to get zsh's prompt to show the active virtualenv. I am
not very happy with this but I will have to work with it for now with 

`alias vpi="virtualenv_prompt_info"`

which displays the active vritual environment, if any. The above line is
present in (.zshrc).

NUMPY

Numpy is the easiest of them all, just

`pip install numpy`

I suspect that having the (lapack/blas) and/or (atlas) libraries might allow
compilation with those numerical libraries, but I haven't tested this. See the
section on (scikit-learn) for installing the libraries.

MATPLOTLIB

On Ubuntu, I have to make sure to install 

`apt-get install libfreetype6-dev libxft-dev`

at the system level to ensure that pip can install the latest matplotlib
version. These provide (true-type-font) and (png) support.

Clean virtual environments lack a matplotlib backend which, unfortunately,
means that figures will not display properly. The correct way to set this up
is:

* Install (TkInter) with `apt-get install tcl-dev tk-dev python-tk python3-tk`.
* Activate the virtual environment.
* Use pip to uninstall matplotlib, if it is already installed.
* Pull down the [matplotlib](https://github.com/matplotlib/matplotlib)
  repository from GitHub.
* Install matplotlib from source using `setup.py`.

It takes a while, but it is worth it for project isolation.

SCIKIT-LEARN

The machine learning library requires scipy. Scipy requires the (lapack) and
(atlas) libraries, so get those first with

`apt-get install libatlas-dev liblapack-dev`

We also require a fortran compiler:

`apt-get install gfortran`

Then get scipy (it takes a while, presumably compiling):

`pip install scipy`

Finally, install the library itself

`pip install scikit-learn`

### LATEX

I use the full LaTeX distribution from the Ubuntu repositories -- i.e.

`apt-get install texlive`

### WEBSERVER

I generally have a webserver running on my machine for keeping notebooks and
journals.
