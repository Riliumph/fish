function path
  echo $PATH | string replace -ar " " "\n"
end
