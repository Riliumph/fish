# Judge Operation System
set --export OS (uname)

# Fish
set --export FISH_ROOT $HOME/.config/fish
source $FISH_ROOT/init.fish

# Vim
#if test (which vim) ^/dev/null
#  set --export VIM_ROOT $HOME/.config/vim
#  source $VIM_ROOT/init.fish
#end

# Pyenv
#if test (which pyenv) ^/dev/null
#  set --export PYENV_ROOT (which pyenv)
#  set PATH $PATH $PYENV_ROOT/bin
#  source (pyenv init - | psub)
#end

