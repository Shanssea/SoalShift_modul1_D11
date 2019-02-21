#!/bin/bash

echo "a"
printf "\n"
result=`awk -F ',' '{if ($7 == 2012) {i[$1]+=$10;}} END  {for (x in i) print i[x] "," x}' WA_Sales_Products_2012-14.csv | sort -nr | head -1 | awk -F ',' '{print $2}'`
echo "$result"
printf "\n"
#--------------------------------------------

echo "b"
printf "\n"
#oldIFS=$IFS
IFS=$'\n'

arr=( $( awk -F ',' '{if ($7 == 2012 && $1 = $result ) {i[$4]+=$10;}} END {for (x in i) print i[x] "," x;}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F ',' '{print $2}' ) )
#IFS=$oldIFS

a="${arr[0]}"
b="${arr[1]}"
c="${arr[2]}"

echo "$a"
echo "$b"
echo "$c"
printf "\n"
#--------------------------------------------

echo "c"
printf "\n"
awk -F ',' '{if ($1 == "United States" && $7 == 2012 && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection" )) {i[$6]+=$10;}} END {for (x in i) print i[x] "," x;}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F ',' '{print $2}'
printf "\n"

#----------------------------------
