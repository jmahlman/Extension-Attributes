#!/bin/zsh
#------------------------------------------------------------------------------
#
# Author: Mahlman, John
# Creation Date: Jan 23,2020
#
#------------------------------------------------------------------------------

vm=()
vm_prefs="/Library/Application Support/Company/parallels-vms-found"

# Cleanup file to start fresh
[ -f "$vm_prefs" ] && rm "$vm_prefs"
touch "$vm_prefs"

# Lets find all Parallels VmInfo preference files and put them in an array.
while IFS= read -r line
do
  vm+=( "$line" )
done < <(find "/Users" -name "VmInfo.pvi" -maxdepth 6 -print 2>/dev/null )

for configs in "${vm[@]}"; do
  echo "$configs, guessing OS: $(cat $configs | grep -E '\<RealOsType\>|\<RealOsVersion\>' | sed -n 's:.*<RealOsType>\(.*\)</RealOsType>.*:\1:p' | cut -d, -f1)" >> "$vm_prefs"
done

echo "<result>$(cat "$vm_prefs")</result>"
