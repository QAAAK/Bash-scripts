#!/bin/bash

set -uexo pipefail;

group_name=bigdata_rubbles_dsw
check_group=$(cat /etc/passwd | grep "$group_name" | wc -l)

if [[ $check_group == 1 ]]; then
     echo "Group found, nothing do"
else
     echo -en "+@$group_name::::::" >> /etc/passwd
fi 

check_sudoers_group=$(ls -lah /etc/sudoers.d/ | grep "$group_name" | wc -l)
if [[ $check_sudoers_group == 1 ]]; then
     echo "Sudoers group found, nothing do"
else
     sudo chattr -i /etc/sudoers.d
     echo -n "+$group_name ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$group_name
     chmod 600 /etc/sudoers.d/$group_name
     sudo chattr -R +i /etc/sudoers.d
fi
