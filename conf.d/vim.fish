# Vim
if [ (which vim) ]
    set -l VIM_ROOT_CANDIDATE /Users/riliumph/.config/vim
    if [ -d $VIM_ROOT_CANDIDATE ]
        set --export VIM_ROOT $VIM_ROOT_CANDIDATE
        source $VIM_ROOT/init.fish
    else
        set_color $fish_color_error
        echo "[ERROR] Cannot find" $VIM_ROOT_CANDIDATE
        set_color $fish_color_normal
    end
end
