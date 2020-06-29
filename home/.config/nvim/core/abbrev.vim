" ============================================================================
" FileName: abbrev.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! s:SetCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call s:SetCommandAbbrs('ar', 'AsyncRun')
call s:SetCommandAbbrs('as', 'AsyncStop')
call s:SetCommandAbbrs('at', 'AsyncTask')
call s:SetCommandAbbrs('ca', 'CocAction')
call s:SetCommandAbbrs('cc', 'CocConfig')
call s:SetCommandAbbrs('cf', 'CocFix')
call s:SetCommandAbbrs('ci', 'CocInstall')
call s:SetCommandAbbrs('cl', 'CocList')
call s:SetCommandAbbrs('cm', 'CocCommand')
call s:SetCommandAbbrs('cr', 'CocRestart')
call s:SetCommandAbbrs('cs', 'CocSearch')
call s:SetCommandAbbrs('cu', 'CocUninstall')
call s:SetCommandAbbrs('gap', 'Git add -p')
call s:SetCommandAbbrs('gc', 'Gcommit -v')
call s:SetCommandAbbrs('gca', 'Gcommit --amend -v')
call s:SetCommandAbbrs('gco', 'AsyncRun git checkout .')
call s:SetCommandAbbrs('gd', 'Gvdiff')
call s:SetCommandAbbrs('gl', 'Git lg')
call s:SetCommandAbbrs('gpull', 'AsyncRun git pull')
call s:SetCommandAbbrs('gpush', 'AsyncRun git push')
call s:SetCommandAbbrs('gs', 'Gstatus')
call s:SetCommandAbbrs('gw', 'Gw')
call s:SetCommandAbbrs('pc', 'PlugClean')
call s:SetCommandAbbrs('pi', 'PlugInstall')
call s:SetCommandAbbrs('pu', 'PlugUpdate')
call s:SetCommandAbbrs('sl', 'CocCommand session.load default')
call s:SetCommandAbbrs('ss', 'CocCommand session.save default')
call s:SetCommandAbbrs('st', 'Startify')
call s:SetCommandAbbrs('sw', 'SwitchWindow')
call s:SetCommandAbbrs('tm', 'TabMessage')
call s:SetCommandAbbrs('w!!', '%!sudo tee >/dev/null %')
