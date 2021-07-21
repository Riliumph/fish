# Judge Operation System
set --export OS (uname)

# Fish
set --export FISH_ROOT $HOME/.config/fish
source $FISH_ROOT/init.fish
# Pyenv
if test (which pyenv) ^/dev/null
  set --export PYENV_ROOT $HOME/.config/pyenv
  set PATH $PATH $PYENV_ROOT/bin
  source (pyenv init - | psub)
end

