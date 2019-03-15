#!/bin/bash
 
count=1

while test -e "password$count.txt"; 
do
	i=$(( $i + 1 ))
   	count="$( printf -- '%d' "$i" )"
done

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > password$count.txt

