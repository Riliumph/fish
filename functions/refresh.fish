function refresh
    source $FISH_ROOT/config.fish
    if [ $status -ne 0 ]
        echo 1
    end
    echo "Refresh fish!"
    return true
end
