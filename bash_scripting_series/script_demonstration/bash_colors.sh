source fake_next_input.sh

# To set colors, first you need to use Control Sequence Introducer command
# which is represented by \033[
ESC="\033["

# No Color
NC="${ESC}0m"
# Normal Brightness
NO="0;"
# Bright
BR="1;"
# Underline
UL="4;"
# Flashing
FL="5;"
# Invert colors
IN="7;"

# Hide cursor
HC="${ESC}?25l"

# show cursor
SC="${ESC}?25h"

# Foreground Text Colors
BLACK="${ESC}${NO}30m"
GRAY="${ESC}${BR}30m"
RED="${ESC}${NO}31m"
BR_RED="${ESC}${BR}31m"
GREEN="${ESC}${NO}32m"
BR_GREEN="${ESC}${BR}32m"
DARK_YELLOW="${ESC}${NO}33m"
YELLOW="${ESC}${BR}33m"
DARK_BLUE="${ESC}${NO}34m"
BLUE="${ESC}${BR}34m"
PURPLE="${ESC}${NO}35m"
PINK="${ESC}${BR}35m"
CYAN="${ESC}${NO}36m"
LIGHT_CYAN="${ESC}${BR}36m"
WHITE="${ESC}${BR}37m"
LIGHT_GRAY="${ESC}${NO}37m"

# Background Text Colors
# This is just for documentation, not in use at the moment
BK_BLACK=40
BK_RED=41
BK_GREEN=42
BK_YELLOW=43
BK_BLUE=44
BK_PURPLE=45
BK_CYAN=46
BK_WHITE=47
