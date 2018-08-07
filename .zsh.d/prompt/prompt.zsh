### prompt ###

if (tty|fgrep -q 'tty'); then
    source $ZDOTDIR/prompt/tty.zsh
else
    source $ZDOTDIR/prompt/pts.zsh
fi
