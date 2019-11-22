# Rarely command
alias refresh='source $HOME/.config/fish/config.fish; and echo "Refresh fish!"'
alias version='fish -v'

# File & Directory
if which trash-put >/dev/null ^&1
  alias rm='trash-put'
else
  alias rm='rm -v'
end
alias mv='mv -v'
alias cp='cp -v'
alias mkdirs='mkdir -p'
alias link='ln -v'
alias symlink='link -nsf'

# list command
alias ls='ls -FGx'
alias la='ls -A'
alias ll='clear; and la -lhT'

# show command
alias df='df -h'
alias less='less -gMNRqW'
alias printenv='printenv | sort -f'
if which htop > /dev/null ^&1
  alias top='htop'
end

# patch command
alias unpatch='patch -R'
alias test_patch='patch --dry-run'

# date command
alias today='date +%Y/%m/%d'
alias now='date +%H:%M:%S'

# rename command
alias targz='tar cfvz'
alias untargz='tar xfvz'

# abbreviation
abbr -a cd ' cd'
abbr -a fg ' fg'
abbr -a bg ' bg'
abbr -a git ' git'
