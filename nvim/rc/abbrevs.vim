" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description: from chemzqm/dotfiles
" ============================================================================

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('as', 'AsyncRun')
call SetupCommandAbbrs('ass', 'AsyncStop')
call SetupCommandAbbrs('ca', 'CocAction')
call SetupCommandAbbrs('cc', 'CocConfig')
call SetupCommandAbbrs('cf', 'CocFix')
call SetupCommandAbbrs('ci', 'CocInstall')
call SetupCommandAbbrs('cm', 'CocCommand')
call SetupCommandAbbrs('cs', 'CocSearch')
call SetupCommandAbbrs('cu', 'CocUninstall')
call SetupCommandAbbrs('cl', 'CocList')
call SetupCommandAbbrs('cr', 'CocRestart')
call SetupCommandAbbrs('gap', 'Git add -p')
call SetupCommandAbbrs('gd', 'Gvdiff')
call SetupCommandAbbrs('gl', 'Git lg')
call SetupCommandAbbrs('gs', 'Gstatus')
call SetupCommandAbbrs('gc', 'Gcommit -v')
call SetupCommandAbbrs('gca', 'Gcommit --amend -v')
call SetupCommandAbbrs('gco', 'AsyncRun git checkout .')
call SetupCommandAbbrs('gpush', 'AsyncRun git push')
call SetupCommandAbbrs('gpull', 'AsyncRun git pull')
call SetupCommandAbbrs('sl', 'CocCommand session.load default')
call SetupCommandAbbrs('ss', 'CocCommand session.save default')
call SetupCommandAbbrs('tm', 'TabMessage')
