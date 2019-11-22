function peco_history
  set -l peco_options --query (commandline)

  history | peco $peco_options | read result

  if [ $result ]
    commandline $result
  else
    commandline ''
  end
end
