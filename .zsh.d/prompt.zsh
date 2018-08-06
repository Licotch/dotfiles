### prompt ###

NEWLINE=$'\n'

if echo $TTY | grep pts > /dev/null; then
    ARROW1='──'
    ARROW2='──>'
    ARROW3='╭─╴'
    ARROW4='│'
    ARROW5='╰─>'
else
    ARROW1='--'
    ARROW2='-->'
    ARROW3=',--'
    ARROW4='|'
    ARROW5='`->'
fi

function zle-line-init zle-keymap-select {
    case $KEYMAP in
    main|viins)
        VISTATE="$ARROW1 INSERT $ARROW1"
        ;;
    vicmd)
        VISTATE="$ARROW1 NORMAL $ARROW1"
        ;;
    esac

    PS1="%(?..%F{red}$ARROW2 %?)$NEWLINE%F{green}$ARROW3 %F{cyan}%n%f@%F{magenta}%m %f%~$NEWLINE%F{green}$ARROW4  %F{yellow} $VISTATE$NEWLINE%F{green}$ARROW5%f "
    PS2="%F{green}   %F{yellow} $VISTATE$NEWLINE%F{green}    %f"

    zle reset-prompt
}

function zle-line-finish {
    PS1="%(?..%F{red}$ARROW2 %?)$NEWLINE%F{green}$ARROW3 %F{cyan}%n%f@%F{magenta}%m %f%~$NEWLINE%F{green}$ARROW5 %f"
    PS2="%F{green}    %f"

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
