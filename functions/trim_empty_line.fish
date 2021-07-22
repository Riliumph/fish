function trim_empty_line
    sed -E '/^\$/d'
end
