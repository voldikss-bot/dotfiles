- > v2ray 安装之后 google 无法访问

  使用 DNS 为 114.114.114.114

- > 触摸板多手势操作

  https://segmentfault.com/a/1190000011327776

- > resolv.conf 被覆盖

  https://wiki.archlinux.org/index.php/NetworkManager_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#%E5%9C%A8resolv.conf%E4%B8%AD%E4%BF%9D%E7%95%99%E6%94%B9%E5%8A%A8

- > Ctrl-H 变成 <BS>键

  原理：http://www.skywind.me/blog/archives/1857

  做法：在配置文件里面选择一个按键绑定，注意查看里面的 <BS> 发送的不是 `^H`的就可以。配置文件一般在 `/usr/share/konsole` 里面（可以用 `whereis konsole`查找），以 `.keytab` 结尾。然后 Vim 里面的 `<C-h>` 就工作正差啦，不过终端下还是和删除键一样的功能，这个应该本来就这样。
