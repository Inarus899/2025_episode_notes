#!/bin/bash
fake_next_input () {
    echo -n -e $temp_prompt
    echo -n -e "${ESC}1C"
    read -s -p ""
    echo -e "${LIGHT_GRAY}echo Hello" | pv -qL $SPEED
}
