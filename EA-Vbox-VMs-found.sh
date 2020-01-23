#!/bin/zsh
#------------------------------------------------------------------------------
#
# Author: Mahlman, John
# Creation Date: Jan 23,2020
#
#------------------------------------------------------------------------------

vm=()
vm_prefs="/Library/Application Support/Company/vbox-vms-found"

# Cleanup file to start fresh
[ -f "$vm_prefs" ] && rm "$vm_prefs"
touch "$vm_prefs"

# Lets find all vbox files and put them in an array.
while IFS= read -r line
do
  vm+=( "$line" )
done < <(find "/Users" -name "*.vbox" -maxdepth 6 -print 2>/dev/null )

for configs in "${vm[@]}"; do
  echo "$configs, guessing OS: $(cat $configs | grep OSType | sed 's/.*OSType="\([a-zA-Z0-9_]*\)".*/\1/')" >> "$vm_prefs"
done

echo "<result>$(cat "$vm_prefs")</result>"
