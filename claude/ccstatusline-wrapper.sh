#!/bin/bash
# Read terminal width directly from /dev/tty, which works even in non-TTY stdin contexts
cols=$(stty size < /dev/tty 2>/dev/null | awk '{print $2}')
if [ -n "$cols" ] && [ "$cols" -gt 0 ] 2>/dev/null; then
  CCSTATUSLINE_WIDTH="$cols" ccstatusline
else
  ccstatusline
fi
