#!/bin/bash

input=$(cat /var/log/syslog)
alphabet=({a..z})
trans=()
jam=$(date +%H)

trans+=( "${alphabet[@]:(-(26-$jam))}" )
trans+=( "${alphabet[@]:0:$(( $jam + 1 ))}" )
result=$( echo "$input" | tr "${alphabet[*]}" "${trans[*]}" )
timestamp=$(date +%H:%M_%d-%m-%y)

echo "$result" > /home/sea/Documents/Sisop/Modul_1/Soal4/$timestamp.txt

