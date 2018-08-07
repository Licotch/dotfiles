### prompt for pts ###

NEWLINE=$'\n'

function zle-line-init zle-keymap-select {
    case $KEYMAP in
    main|viins)
        VISTATE="── INSERT ──"
        ;;
    vicmd)
        VISTATE="── NORMAL ──"
        ;;
    esac

    PS1="%(?..%F{red}──> %?)$NEWLINE%F{green}╭─╴ %F{cyan}%n%f@%F{magenta}%m %f%~$NEWLINE%F{green}│  %F{yellow} $VISTATE$NEWLINE%F{green}╰─>%f "
    PS2="%F{green}   %F{yellow} $VISTATE$NEWLINE%F{green}    %f"

    zle reset-prompt
}

function zle-line-finish {
    PS1="%(?..%F{red}──> %?)$NEWLINE%F{green}╭─╴ %F{cyan}%n%f@%F{magenta}%m %f%~$NEWLINE%F{green}╰─> %f"
    PS2="%F{green}    %f"

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
