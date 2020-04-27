if not set -q EXA_STANDARD_OPTIONS; set -gx EXA_STANDARD_OPTIONS "--long" "--all" "--group" "--header"; end
if not set -q EXA_LA_OPTIONS; set -gx EXA_LA_OPTIONS "--binary" "--links" "--inode" "--blocks"; end
if not set -q EXA_LD_OPTIONS; set -gx EXA_LD_OPTIONS "--list-dirs"; end
if not set -q EXA_LG_OPTIONS; set -gx EXA_LG_OPTIONS "--git"; end
if not set -q EXA_LE_OPTIONS; set -gx EXA_LE_OPTIONS "--extended"; end
if not set -q EXA_LT_OPTIONS; set -gx EXA_LT_OPTIONS "--tree" "--level"; end

alias l 'exa $argv'
alias la 'exa $EXA_STANDARD_OPTIONS $EXA_LA_OPTIONS $argv'
alias ld 'exa $EXA_STANDARD_OPTIONS $EXA_LD_OPTIONS $argv'
alias lg 'exa $EXA_STANDARD_OPTIONS $EXA_LG_OPTIONS $argv'
alias le 'exa $EXA_STANDARD_OPTIONS $EXA_LE_OPTIONS $argv'
alias lt 'exa $EXA_STANDARD_OPTIONS $EXA_LT_OPTIONS $argv'

set -l uninstall (basename (status -f) .fish)_uninstall

function __$uninstall --on-event $uninstall
    set --erase EXA_STANDARD_OPTIONS
    set --erase EXA_LA_OPTIONS
    set --erase EXA_LD_OPTIONS
    set --erase EXA_LG_OPTIONS
    set --erase EXA_LE_OPTIONS
    set --erase EXA_LT_OPTIONS
    functions --erase l
    functions --erase ll
    functions --erase la
    functions --erase ld
    functions --erase lt
    functions --erase lg
    functions --erase le
end
