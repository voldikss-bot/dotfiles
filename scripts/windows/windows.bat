@Rem 确保在 d:\code\dotfiles 目录下
cd d:\code\dotfiles

@echo off

IF exist "c:\Users\voldikss\.vim" (echo "c:\Users\voldikss\.vim already exists")ELSE (mklink /J c:\Users\voldikss\.vim d:\code\dotfiles\vim)

If exist "c:\Users\voldikss\AppData\Local\nvim\coc-settings.json" (echo "c:\Users\voldikss\AppData\Local\nvim\coc-settings.json already exists")ELSE (mklink  c:\Users\voldikss\AppData\Local\nvim\coc-settings.json d:\code\dotfiles\vim\coc-settings.json)

If exist "c:\Users\voldikss\AppData\Local\nvim\init.vim" (echo "c:\Users\voldikss\AppData\Local\nvim\init.vim")ELSE (mklink  c:\Users\voldikss\AppData\Local\nvim\init.vim d:\code\dotfiles\vim\init.vim)

If exist "c:\Users\voldikss\AppData\Local\nvim\ginit.vim" (echo "c:\Users\voldikss\AppData\Local\nvim\ginit.vim")ELSE (mklink  c:\Users\voldikss\AppData\Local\nvim\ginit.vim d:\code\dotfiles\vim\init.vim)

