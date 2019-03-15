#!/bin/bash

input=$(cat /var/log/syslog)
alphabet=({a..z})
bigalpha=({A..Z})
trans=()
bigtr=()
hour=$(date +%H)

if [ "$hour" -ge 10 ]
then
jam=$hour
else
jam=$((0x$hour))
fi

trans+=( "${alphabet[@]:(-(26-$jam))}" )
trans+=( "${alphabet[@]:0:$(( $jam + 1 ))}" )
bigtr+=( "${bigalpha[@]:(-(26-$jam))}" )
bigtr+=( "${bigalpha[@]:0:$(( $jam + 1 ))}" )
result=$( echo "$input" | tr "${alphabet[*]}" "${trans[*]}" | tr "${bigalpha[*]}" "${bigtr[*]}")

timestamp='+%H:%M:%S %Y-%m-%d'

echo "$result" > "/home/sea/Documents/Sisop/Modul_1/Soal4/$(date "$timestamp").txt"

