### prompt for tty ###

export LANG='C'

NEWLINE=$'\n'

function zle-line-init zle-keymap-select {
    case $KEYMAP in
    main|viins)
        VISTATE="-- INSERT --"
        ;;
    vicmd)
        VISTATE="-- NORMAL --"
        ;;
    esac

    local LEFT0="%(?..%F{red}--> %?)"
    local LEFT1="%F{green},-- %F{cyan}%n%f@%F{magenta}%m %f%~"
    local LEFT2="%F{green}|  %F{yellow} $VISTATE"
    local LEFT3="%F{green}\`->%f "

    local LINE0="$LEFT0$NEWLINE"
    local LINE1="$LEFT1$NEWLINE"
    local LINE2="$LEFT2$NEWLINE"
    local LINE3="$LEFT3"

    PS1="$LINE0$LINE1$LINE2$LINE3"
    PS2="%F{green}   %F{yellow} $VISTATE$NEWLINE%F{green}    %f"

    zle reset-prompt
}

function zle-line-finish {
    local LINE0="%(?..%F{red}--> %?)$NEWLINE"
    local LINE1="%F{green},-- %F{cyan}%n%f@%F{magenta}%m %f%~$NEWLINE"
    local LINE2="%F{green}\`-> %f"

    PS1="$LINE0$LINE1$LINE2"
    PS2="%F{green}    %f"

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
