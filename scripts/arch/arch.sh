#! /usr/bin/env bash

instll_base(){
    declare -a apps=("cgdb")

    for app in ${apps[@]}
    do
        sudo pacman -S $app --noconfirm
    done
}
