#! /usr/bin/env bash

for file in ../dotfiles/.*[!.]; do
    src=$(readlink -f "$file")
    dst=$(readlink -f "$HOME/$(basename "$file")")
    # TODO: 对于文件夹暂时不创建软链接，因为软链接会有问题（会在文件夹里面再套一个文件夹）
    # 解决方法： 递归地遍历文件夹，如果文件夹不存在则创建，然后只软链接里面的文件
    # 目前先只对文件创建软链接，文件夹里面的部分需要的是哈手动创建
    if [ -f $src]; then
        if [ ! -f $dst ]; then
            echo ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)"
            ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)"
        else
            echo "file $dst alread exists, override?"
            read -r ans
            case $ans in
                [Yy]*)
                echo ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)"
                ln -sf "$(readlink -f $file)" "$HOME/$(basename $file)";;
            esac
        fi
    fi
done
