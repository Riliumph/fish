function get_unique_dirh
    # string replace --regex '^.+?\/' means triming "xx) "
    # string trim -lr means triming space from beggining and last
    dirh | string replace --regex '^.+?\/' / | string trim -lr | trim_duplication | trim_empty_line | peco
end
