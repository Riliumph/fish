function get_current_dirs
    set -l trim_prefix "cut -c4-" # trim .//
    find ./ -maxdepth 1 -mindepth 1 -type d | eval $trim_prefix | sort -f | peco
end
