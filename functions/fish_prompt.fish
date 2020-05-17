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
  set fish_color_cwd "ffff5f"
  set_color $fish_color_cwd
  echo -n (pwd)
  set_color normal

  __terlar_git_prompt
  __fish_hg_prompt
  echo

  set status_face "(*'_')"
  if not test $last_status -eq 0
    set_color $fish_color_error
    set status_face "(*;_;)"
  end

  echo -n $status_face'➤ '
  set_color normal
end
