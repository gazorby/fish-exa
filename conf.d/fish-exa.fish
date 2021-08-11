alias l 'exa'
alias ll 'exa_git'
alias la 'exa $EXA_STANDARD_OPTIONS $EXA_LA_OPTIONS'
alias ld 'exa $EXA_STANDARD_OPTIONS $EXA_LD_OPTIONS'
alias lg 'exa $EXA_STANDARD_OPTIONS $EXA_LG_OPTIONS'
alias le 'exa $EXA_STANDARD_OPTIONS $EXA_LE_OPTIONS'
alias lt 'exa $EXA_STANDARD_OPTIONS $EXA_LT_OPTIONS'

function __fish_exa_install --on-event fish-exa_install
    set -Ux EXA_STANDARD_OPTIONS "--long" "--all" "--group" "--header"
    set -Ux EXA_LA_OPTIONS "--binary" "--links" "--inode" "--blocks"
    set -Ux EXA_LD_OPTIONS "--list-dirs"
    set -Ux EXA_LG_OPTIONS "--git"
    set -Ux EXA_LE_OPTIONS "--extended"
    set -Ux EXA_LT_OPTIONS "--tree" "--level"
end

function __fish_exa_update --on-event fish-exa_update
    __fish_exa_uninstall
    __fish_exa_install
end

function __fish_exa_uninstall --on-event fish-exa_uninstall
    set --erase EXA_STANDARD_OPTIONS
    set --erase EXA_LA_OPTIONS
    set --erase EXA_LD_OPTIONS
    set --erase EXA_LG_OPTIONS
    set --erase EXA_LE_OPTIONS
    set --erase EXA_LT_OPTIONS
    functions --erase l
    functions --erase ll
    functions --erase exa_git
    functions --erase la
    functions --erase ld
    functions --erase lt
    functions --erase lg
    functions --erase le
end
