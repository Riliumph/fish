function cd
  set -l argc (count $argv)
  set -l dest $argv
  switch $argc
    case 0
      if type peco > /dev/null ^&1
        set dest (find ./ -maxdepth 1 -mindepth 1 -type d | sort -f | peco)
      end
    case 1
      set dest $argv[1]
    case *
      echo "too many arguments"
      return 0
  end

  ### Don't move $HOME
  if test (count $dest) = 0
    echo 'Missing args'
    return 1;
  end

  ### Memorize current path to compare in the future
  # Attention: Don't use prevd command
  #            At first boot shell, prevd hasn't working yet
  set -l OLD_PWD $PWD

  ### Go to OLD_PWD
  if test "$argv" = "-"
    if test "$__fish_cd_direction" = "next"
      nextd
    else
      prevd
    end
    return $status
  end

  builtin cd $dest
  set -l cd_status $status
  set -l has_moved (test "$PWD"!="$OLD_PWD")

  if test $cd_status -ne 0
    return 1
  end

  ### Log history after moving
  echo "[$OLD_PWD] -> [$PWD] result:($has_moved)"
  if test $has_moved -eq 0
    set -q dirprev[$MAX_DIR_HIST]
    and set -e dirprev[1]
        set -g dirprev $dirprev
        set -e dirnext
        set -g __fish_cd_direction prev
  end

  clear
  ls
  return $status
end

