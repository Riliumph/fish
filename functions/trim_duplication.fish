function trim_duplication
    awk '!dictionary[$0]++'
end
