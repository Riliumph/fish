function cd
  set -l argc (count $argv)
  set -l dest $argv
  set trim_duplication 'awk \'!dictionary[$0]++\''
  switch $argc
    case 0
      if type peco > /dev/null ^&1
        set dest (find ./ -maxdepth 1 -mindepth 1 -type d | sort -f | peco)
      end
    case 1
      set -l dest $argv[1]
      if type peco > /dev/null ^&1
        if test "$dest" = "-"
          set -l delete_empty_line "sed -E '/^\$/d'"
          set -l remove_dirh_header "sed -E 's/^ *[0-9]*) *//g'"
          set -l dest (dirh | eval $delete_empty_line | eval $remove_dirh_header | eval $trim_duplication | peco)
        end
      end
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
  if test "$dest" = "-"
    if test "$__fish_cd_direction" = "next"
      nextd
    else
      prevd
    end
    return $status
  end

  echo "[$PWD] -> [$dest]"
  builtin cd $dest
  set -l cd_status $status
  if test $cd_status -ne 0
    return 1
  end

  ### Log history after moving
  if test "$PWD" != "$OLD_PWD"
    set -U MAX_DIR_HIST 100
    set -U -q dirprev or set -U dirprev
    set -q dirprev[$MAX_DIR_HIST] and set -e dirprev[1]

    # If dirprev, dirnext, __fish_cd_direction
    # are set as universal variables, honor their scope.

    set -U -a dirprev (pwd)
    set -U -e dirnext

    set -U -q __fish_cd_direction
    and set -U __fish_cd_direction prev
  end

  clear
  ls
  return $status
end
