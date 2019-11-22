# The following settings are required for the *marked part
# item2: Preference -> Profiles -> Keys -> Left Option Key: ESC+ (Not Meta)
function fish_user_key_bindings
  bind \e\x7F 'kill-whole-line' # *
  bind \cR 'peco_history'
  bind \e\e\[A 'cd ../; commandline -f repaint'
end
