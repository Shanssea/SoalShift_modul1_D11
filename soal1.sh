#!/bin/bash

i="1"
for var in /home/sea/Documents/Sisop/Modul_1/nature/*.jpg
do 
 base64 -d $var | xxd -r > /home/sea/Documents/Sisop/Modul_1/nature_republic/$i.jpg
 i=$(($i + 1))
done
