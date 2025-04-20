#!/bin/bash

if [[ $# -eq 0 ]]
then
  echo 'Please provide file to convert'
  exit 0
fi

original_name=$(basename -- "$1")
filename="${original_name%.*}.sh"

cp $1 $filename

# find every line that doesn't begin with # and put !! at the beginning
vim -c "v/^#/ s/^/!!/" +wq $filename

# if line only contains !!, make it a blank line
vim -c "%s/^!!$//" +wq $filename

# add a blank line to help with readability
vim -c "g/^!!/normal o" +wq $filename

# for lines that still contain !!, duplicate the line and remove the !! at the
# beginning of the second line
vim -c "g/^!!/ copy . | s///g" +wq $filename

# This fix is to deal with a very specific issue for one video. 
vim -c "%s/^next_input/fake_next_input/" +wq $filename

# this is where we add a lot of escape replacements, like
# replace " with \"
vim -c 'g/^!!/ s/"/\\"/g' +wq $filename

# at the end, close the quotes for the variable
vim -c "g/^!!/ s/$/\"/" +wq $filename

# We can use the !! token to add lines between the text for echo and the actual
# command that is ran. ! is added to normal to prevent recursion, though I think
# it's not needed here.
vim -c "g/^!!/normal! onext_input" +wq $filename

# replace the !! at the beginning with the characters needed to set the variable
# that will be shown on screen
vim -c "g/^!!/ s/^!!/script_text=\"\${LIGHT_GRAY}/" +wq $filename

# add needed lines to the beginning
sed -i "1i\
#\!/bin/bash\n\n\
. ./bash_scripting.sh\n\n\
" $filename

# make file executable
chmod 755 $filename
