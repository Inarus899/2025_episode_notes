#!/bin/bash
. ./bash_colors.sh

# these can be changed after file has been sourced/imported
SPEED=20
temp_prompt="${BR_GREEN}TheExhaustedProgrammer${NC}:${YELLOW}youtube $ "

next_input () {
    read -s -p ""
    clear
    echo -n -e $temp_prompt
    echo -n -e "${ESC}1C"
    echo -e "${script_text}" | pv -qL $SPEED
}
