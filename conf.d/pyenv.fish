# Pyenv
if [ (which pyenv) ]
    set -l PYENV_ROOT_CANDIDATE $HOME/.config/pyenv
    if [ -d $PYENV_ROOT_CANDIDATE ]
        set -Ux PYENV_ROOT $PYENV_ROOT_CANDIDATE
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
        status is-login; and pyenv init --path | source
    else
        set_color $fish_color_error
        echo "Cannot find " $PYENV_ROOT_CANDIDATE
        set_color $fish_color_normal
    end
end
