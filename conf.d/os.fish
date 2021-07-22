### Judge operation system
if [ (uname) = Darwin ]
    set -U OS Mac
else if [ string sub (uname -s) --start=1 --length=5 = Linux ]
    set -U OS Linux
else if string sub (uname -s) --start=1 --length=10 = MINGW32_NT ]
    set -U OS Cygwin
else
    set_color $fish_color_error
    echo "Your platform" (uname -a) "is not supported."
    set_color $fish_color_normal
end
