#!/bin/sh
xrandr --newmode 2561x1441 146.27  2560 2680 2944 3328  1440 1441 1444 1465  -HSync +Vsync
xrandr --addmode DisplayPort-1 2561x1441
xrandr --output DisplayPort-1 --mode 2561x1441
