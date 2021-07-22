function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    #set_color $fish_color_host
    #echo -n (hostname -s)
    #set_color normal

    echo -n ':'

    # PWD
    set fish_color_cwd ffff5f
    set_color $fish_color_cwd
    echo -n (pwd)
    set_color normal

    __terlar_git_prompt
    __fish_hg_prompt
    echo

    # Status Face
    if [ $last_status -eq 0 ]
        set face "(*'_')< "
        echo -n $face
        set fish_color_fine green
        set_color $fish_color_fine
        echo -n $last_status
    else
        set face "(*;_;)< "
        echo -n $face
        set_color $fish_color_error
        echo -n $last_status
    end
    set_color normal

    echo -n ' ➤ '
end
