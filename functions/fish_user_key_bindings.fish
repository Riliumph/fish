# The following settings are required for the *marked part
# item2: Preference -> Profiles -> Keys -> Left Option Key: ESC+ (Not Meta)
function fish_user_key_bindings
  bind \e\x7F 'kill-whole-line' # *
  bind \cR 'peco_history'
  bind \e\e\[A 'cd ../; commandline -f repaint'
  bind \e\e\[B 'cd (find ./ -maxdepth 1 -mindepth 1 -type d | sort -f | peco); and commandline -f repaint'
end

