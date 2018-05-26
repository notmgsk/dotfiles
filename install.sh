#!/bin/bash

# Uncomment the following for testing.
# HOME="/home/mgsk/HOME2"
# mkdir -p "$HOME"

find | grep -v "^./.git" | grep -v "install.sh" | egrep -v "^\./?$" | while read x; do
    f=$(echo "$x" | cut -c "3-")
    [ -d "$x" ] && mkdir -vp "$HOME/$f" && echo "$HOME/$f" && continue
    [ -L "$HOME/$f" ] || [ -f "$HOME/$f" ] && cp "$HOME/$f" "$HOME/$f-backup.$(date +%s)" \
        && rm "$HOME/$f" && echo "Found symbolic link or file $HOME/$f; backed up"
    ln -s "$(pwd)/$x" "$HOME/$f"
done 
