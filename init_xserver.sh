if [ "$DISPLAY" == '' ]; then
    startx
else
    xrandr --output Virtual-1 --mode 1920x1080
fi
