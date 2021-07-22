# File & Directory
if [ (which trash-put) ]
    alias rm='trash-put'
else if [ (which rmtrash) ]
    alias rm='rmtrash'
else
    abbr rm 'rm -v'
end
abbr mv 'mv -v'
abbr cp 'cp -v'
abbr mkdirs 'mkdir -p'
abbr link 'ln -v'
abbr symlink 'link -nsf'

# list command
if [ (type exa) ]
    alias ls='exa -F'
    abbr la 'ls -a'
    abbr ll 'la -l -ghHimS'
    abbr lt 'll -T'
else
    abbr ls 'ls -FGx'
    abbr la 'ls -A'
    abbr ll 'clear; and la -lhT'
end

# show command
abbr df 'df -h'
abbr less 'less -gMNRqW'
abbr printenv 'printenv | sort -f'
if [ (which htop) ]
    alias top htop
end

# patch command
abbr unpatch 'patch -R'
abbr test_patch 'patch --dry-run'

# rename command
abbr targz 'tar cfvz'
abbr untargz 'tar xfvz'

# Don't save in history
abbr -a cd ' cd'
abbr -a rm ' rm'
abbr -a fg ' fg'
abbr -a bg ' bg'
abbr -a git ' git'
