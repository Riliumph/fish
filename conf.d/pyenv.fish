# Pyenv
if [ (which pyenv) ]
    set -Ux PYENV_ROOT $HOME/.config/pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    status is-login; and pyenv init --path | source
end
