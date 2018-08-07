### prompt for pts ###

## for use Git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:git:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

local NEWLINE=$'\n'
local PROMPT_STYLE=2

function zle-line-init zle-keymap-select {
    case $KEYMAP in
    main|viins)
        local VISTATE="%F{yellow}── INSERT ──%f"
        ;;
    vicmd)
        local VISTATE="%F{yellow}── NORMAL ──%f"
        ;;
    esac

    local GITSTATUS=$vcs_info_msg_0_

    local LEFT0="%(?..%F{red}──> %?)"
    local LEFT1="%F{green}╭─╴ %F{cyan}%n%f@%F{magenta}%m %f%~"
    local LEFT2="%F{green}│  %f "
    local LEFT3="%F{green}╰─>%f "

    case $PROMPT_STYLE in
    1)
        if [[ ! $#GITSTATUS == 0 ]]; then
            local LEFT1_LENGTH=${#${(S%%)LEFT1//(\%([KF1]|)\{*\}|\%[Bbkf])}}
            local GITSTATUS_LENGTH=${#${(S%%)GITSTATUS//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    
            local NUM_FILLER=$((COLUMNS - LEFT1_LENGTH - GITSTATUS_LENGTH - 2))
            local FILLER="%F{green}${(l:$NUM_FILLER::─:)}$RIGHT1$NWELINE%f"
    
            local RIGHT1=" $FILLER $GITSTATUS"
        else
            local RIGHT1=""
        fi
        ;;
    2)
        if [[ ! $#GITSTATUS == 0 ]]; then
            local RIGHT1=" $GITSTATUS"
        else
            local RIGHT1=" $GITSTATUS"
        fi
        ;;
    3)
        if [[ ! $#GITSTATUS == 0 ]]; then
            local RIGHT2=" $GITSTATUS"
        else
            local RIGHT2=""
        fi
        ;;
    esac

    local LINE0="$LEFT0$NEWLINE"
    local LINE1="$LEFT1$RIGHT1$NEWLINE"
    local LINE2="$LEFT2$VISTATE$RIGHT2$NEWLINE"
    local LINE3="$LEFT3"

    PS1="$LINE0$LINE1$LINE2$LINE3"
    PS2="%F{green}    $VISTATE$NEWLINE%F{green}    %f"

    zle reset-prompt
}

function zle-line-finish {
    local LINE0="%(?..%F{red}──> %?)$NEWLINE"
    local LINE1="%F{green}╭─╴ %F{cyan}%n%f@%F{magenta}%m %f%~$NEWLINE"
    local LINE2="%F{green}╰─> %f"

    PS1="$LINE0$LINE1$LINE2"
    PS2="%F{green}    %f"

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
