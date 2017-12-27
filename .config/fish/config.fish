eval (dircolors /home/mgsk/.dir_colors/dircolors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')
set -g fish_greeting ""
set PATH /home/mgsk/software/bin $PATH
