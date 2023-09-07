function __fish_exa_install --on-event fish-exa_install
    function _set
        if not set --query --universal --export $argv[1]
            set --universal --export $argv[1] $argv[2..-1]
          end
    end

    # Prefer eza as exa is unmaintained
    if type -q eza
        set -Ux __FISH_EXA_BINARY eza
    else
        set -Ux __FISH_EXA_BINARY exa
    end

    set -Ux __FISH_EXA_BASE_ALIASES l ll lg le lt lc lo
    set -Ux __FISH_EXA_EXPANDED a d i id aa ad ai aid aad aai aaid
    set -Ux __FISH_EXA_EXPANDED_OPT_NAME LA LD LI LID LAA LAD LAI LAID LAAD LAAI LAAID
    set -Ux __FISH_EXA_OPT_NAMES
    set -Ux __FISH_EXA_ALIASES
    set -Ux __FISH_EXA_SORT_OPTIONS name .name size ext mod old acc cr inode

    _set EXA_STANDARD_OPTIONS "--group" "--header" "--group-directories-first"

    # Base aliases
    _set EXA_L_OPTIONS
    _set EXA_LL_OPTIONS "--long"
    _set EXA_LG_OPTIONS "--git" "--git-ignore" "--long"
    _set EXA_LE_OPTIONS "--extended" "--long"
    _set EXA_LT_OPTIONS "--tree" "--level"
    _set EXA_LC_OPTIONS "--across"
    _set EXA_LO_OPTIONS "--oneline"

    # Extended aliases
    _set EXA_LI_OPTIONS "--icons"
    _set EXA_LD_OPTIONS "--only-dirs"
    _set EXA_LID_OPTIONS "--icons" "--only-dirs"
    _set EXA_LA_OPTIONS "--all" "--binary"
    _set EXA_LAD_OPTIONS "--all" "--binary" "--only-dirs"
    _set EXA_LAI_OPTIONS  "--all" "--binary" "--icons"
    _set EXA_LAID_OPTIONS  "--all" "--binary" "--icons" "--only-dirs"
    _set EXA_LAA_OPTIONS "--all" "--all" "--binary"
    _set EXA_LAAD_OPTIONS "--all" "--all" "--binary" "--only-dirs"
    _set EXA_LAAI_OPTIONS  "--all" "--all" "--binary" "--icons"
    _set EXA_LAAID_OPTIONS  "--all" "--all" "--binary" "--icons" "--only-dirs"

    for a in $__FISH_EXA_BASE_ALIASES
        set -l opt_name (string join '_' "EXA" (string upper $a) "OPTIONS")
        if test $a = "ll"
            alias --save "$a" "exa_git"
        else
            alias --save "$a" "$__FISH_EXA_BINARY \$EXA_STANDARD_OPTIONS \$$opt_name"
        end
        set -a __FISH_EXA_OPT_NAMES "$opt_name"
        set -a __FISH_EXA_ALIASES "$a"

        for i in (seq (count $__FISH_EXA_EXPANDED))
            set -l name "$a$__FISH_EXA_EXPANDED[$i]"
            # --tree is useless given --all --all
            if test $name = "ltaa"; or test $name = "ltaac"
                continue
            end
            set -l exp_opt_name (string join '_' "EXA" $__FISH_EXA_EXPANDED_OPT_NAME[$i] "OPTIONS")
            if string match --quiet 'll*' "$name"
                alias --save "$name" "exa_git \$$exp_opt_name"
            else
                alias --save "$name" "$__FISH_EXA_BINARY \$EXA_STANDARD_OPTIONS \$$exp_opt_name \$$opt_name"
            end
            set -a __FISH_EXA_ALIASES "$name"

            if not contains $exp_opt_name $__FISH_EXA_OPT_NAMES
                set -a __FISH_EXA_OPT_NAMES $exp_opt_name
            end
        end
    end
end

function __fish_exa_update --on-event fish-exa_update
    __fish_exa_uninstall
    __fish_exa_install
end

function __fish_exa_uninstall --on-event fish-exa_uninstall
    for a in $__FISH_EXA_ALIASES
        functions --erase $a
        funcsave $a
    end

    set --erase __FISH_EXA_BASE_ALIASES
    set --erase __FISH_EXA_ALIASES
    set --erase __FISH_EXA_EXPANDED
    set --erase __FISH_EXA_EXPANDED_OPT_NAME
    set --erase __FISH_EXA_OPT_NAMES
    set --erase __FISH_EXA_SORT_OPTIONS
    set --erase __FISH_EXA_BINARY
end
