#!/bin/bash

#for  i in $(df -h | awk 'NR>1 {print $1}'); do
#	disk+=($i)
#done

#for  i in $(df -h | awk 'NR>1 {print $NF}'); do
#        mount+=($i)
#done


#for i in ${disk[@]};do
#	echo ${i}
#done

# Check if both conditions are true
#if [[ "${disk[*]}" =~ /dev/sr1 ]] && [[ "${mount[*]}" =~ /mnt/pkgs ]]; then
#    echo "present"
#fi

if grep -qE '^/dev/sr1 /mnt/pkgs' /proc/mounts ; then
    echo "present"
else
    echo "not present"
fi

