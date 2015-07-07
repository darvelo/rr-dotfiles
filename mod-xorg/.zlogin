if command -v startx &>/dev/null; then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -bs -store
else
    echo 'startx not found'
fi
