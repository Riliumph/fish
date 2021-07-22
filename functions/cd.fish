function cd -d "custom cd"
    set -l argc (count $argv)
    set -l dest
    # Check variable input
    switch $argc
        case 0
            if [ (type peco) ]
                set dest (get_current_dirs)
            end
        case 1
            set dest $argv[1]
        case '*'
            set_color $fish_color_error
            echo "too many arguments"
            return 1
    end

    ### Memorize current path to compare in the future
    # Attention: Don't use prevd command
    #            At first boot shell, prevd hasn't working yet
    set -l OLD_PWD $PWD

    ### History option
    if [ "$dest" = - ]
        if [ (type peco) ]
            set dest (get_unique_dirh)
        else
            ### Go to OLD_PWD
            if [ "$__fish_cd_direction" = next ]
                nextd
            else
                prevd
            end
            return $status
        end
    end

    ### Check exist path
    if [ ! -d $dest ]
        set_color $fish_color_error
        echo "Missing: $dest"
        return 1
    end

    ### Change Directory
    builtin cd $dest
    set -l cd_status $status
    if [ $cd_status -ne 0 ]
        set_color $fish_color_error
        echo 'Failed to change directory'
        return 1
    end

    ### Post Process
    clear
    ls

    ### Log history
    if [ "$PWD" != "$OLD_PWD" ]
        set -U MAX_DIR_HIST 100
        set -U -q dirprev or set -U dirprev
        set -q dirprev[$MAX_DIR_HIST] and set -e dirprev[1]

        # If dirprev, dirnext, __fish_cd_direction
        # are set as universal variables, honor their scope.

        set -U -a dirprev (pwd)
        set -U -e dirnext

        set -U -q __fish_cd_direction
        and set -U __fish_cd_direction prev
        or set -g __fish_cd_direction prev
    end
    return $status
end
