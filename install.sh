#!/bin/bash

# TODO Consider using GNU Stow to simplify things (it has support for
# XDG config): 
# https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

# Uncomment the following for testing.
# HOME="/home/mgsk/HOME2"
# mkdir -p "$HOME"

# Read all file paths in dotfiles directory, ignoring git files, this
# file, and "." (current dir).
find | grep -v "^./.git" | grep -v "install.sh" | egrep -v "^\./?$" | while read x; do
    # Cut off the first 2 characters ("./")
    f=$(echo "$x" | cut -c "3-")
    # If the path is a directory, create a directory of same name in
    # our home dir, and then continue on to next path (skip rest of
    # this)
    [ -d "$x" ] && mkdir -vp "$HOME/$f" && echo "$HOME/$f" && continue
    # If a symbolic link or file with the same path in the home dir,
    # copy it to a back up, and remove the original
    [ -L "$HOME/$f" ] || [ -f "$HOME/$f" ] && cp "$HOME/$f" "$HOME/$f-backup.$(date +%s)" \
        && rm "$HOME/$f" && echo "Found symbolic link or file $HOME/$f; backed up"
    # Create symbolic link in home dir to the dotfiles path
    ln -s "$(pwd)/$x" "$HOME/$f"
done 
