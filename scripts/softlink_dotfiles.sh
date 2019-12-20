#! /usr/bin/env bash

for file in ../dotfiles/.*[!.]; do
    fullpath=$(readlink -f "$HOME/$(basename "$file")")
    if [ ! -f $fullpath ]; then
        echo ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)"
        ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)"
    else
        echo "file $fullpath alread exists, override?"
        read -r ans
        case $ans in
            [Yy]*)
            echo ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)"
            ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)";;
        esac
    fi
done
