#!/bin/zsh
#------------------------------------------------------------------------------
#
# Author: Mahlman, John
# Creation Date: Jan 23,2020
#
#------------------------------------------------------------------------------

vm=()
vm_prefs="/Library/Application Support/Company/vmware-vms-found"

# Cleanup file to start fresh
[ -f "$vm_prefs" ] && rm "$vm_prefs"
touch "$vm_prefs"

# Lets find all VMWare Fusion VMX files and put them in an array.
while IFS= read -r line
do
  vm+=( "$line" )
done < <(find "/Users" -name "*.vmx" -maxdepth 6 -print 2>/dev/null )

for configs in "${vm[@]}"; do
  echo "$configs, guessing OS: $(cat $configs | grep guestOS\ \= | awk '{print $3}' | tr -d '""' )" >> "$vm_prefs"
done

echo "<result>$(cat "$vm_prefs")</result>"
