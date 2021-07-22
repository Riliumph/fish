# The following settings are required for the *marked part
# item2: Preference -> Profiles -> Keys -> Left Option Key: ESC+ (Not Meta)
function fish_user_key_bindings
    # Option-Del
    bind \e\x7F backward-kill-word # *
    # Ctrl+R
    bind \cR peco_history
    # Option-Up
    bind \e\[1\;3A 'cd ../; and commandline -f repaint' # iterm2
    bind \e\e\[A 'cd ../; and commandline -f repaint' # Terminal.app
    # Option-Down
    bind \e\[1\;3B 'cd (get_current_dirs); and commandline -f repaint' # iterm2
    bind \e\e\[B 'cd (get_current_dirs); and commandline -f repaint' # Terminal.app
end
