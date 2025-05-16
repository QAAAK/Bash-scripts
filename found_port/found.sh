#!/bin/bash
attempts=$(($2+1))
## all working nodes
# {3..19} {22..24} {27..28} {30..38}
declare -a sc613='2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 22 23 24 27 28 30 31 32 33 34 35 36 37 38'
# {3..19} {22.24}
declare -a sc619='3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 22 23 24'

function check_613() {
echo 'Проверка доступности хостов сети '$ip_h 'из '$(uname -n)
for (( count=1; count < $attempts; count++ )); do
echo '-----------[ step' $count'/'$(($attempts-1))' ]' $(date +%d.%m.%y) $(date +%H:%M) '---------'
  for ip in $sc613; do
      if ! [[ $(fping -qa ${ip_h}.${ip}) ]]; then
           echo ${ip_h}.${ip} is dead!
      fi
  done
done
}

function check_619() {
echo 'Проверка доступности хостов сети '$ip_h 'из '$(uname -n)
for (( count=1; count < $attempts; count++ )); do
echo '-----------[ step' $count'/'$(($attempts-1))' ]' $(date +%d.%m.%y) $(date +%H:%M) '---------'
  for ip in $sc619; do
      if ! [[ $(fping -qa ${ip_h}.${ip}) ]]; then
           echo ${ip_h}.${ip} is dead!
      fi
  done
done
}

function usage() {
echo 'Укажите номер VLAN (613 или 619) и кол-во попыток!'
}

if [ $# != 2 ]; then
   usage
else
   case $1 in
      613)
      ip_h="10.55.126"
      check_613;;
      619)
      ip_h="172.17.5"
      check_619;;
      *)
      usage;;
   esac
fi
