#!/bin/bash

echo "a"
printf "\n"
result=`awk -F ',' '{if ($7 == 2012) {i[$1]+=$10;}} END  {for (x in i) print i[x] " " x;}' WA_Sales_Products_2012-14.csv | sort -nr | head -1`
echo "$result"
printf "\n"
#--------------------------------------------

echo "b"
printf "\n"
#oldIFS=$IFS
IFS=$'\n'

arr=( $( awk -F ',' '{if ($7 == 2012 && $1 = $result ) {i[$4]+=$10;}} END {for (x in i) print i[x] " " x;}' WA_Sales_Products_2012-14.csv | sort -nr ) )
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
echo "untuk $a"
awk -F ',' '{if ($7 == 2012 && $1 = $result && $4 == "Personal Accessories" ) {i[$6]+=$10;}} END {for (x in i) print i[x] " " x;}' WA_Sales_Products_2012-14.csv | sort -nr | head -3
printf "\n"
echo "untuk $b"
awk -F ',' '{if ($7 == 2012 && $1 = $result &&  $4 == "Camping Equipment" ) {i[$6]+=$10;}} END {for (x in i) print i[x] " " x;}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 
printf "\n"
echo "untuk $c"
awk -F ',' '{if ($7 == 2012 && $1 = $result &&  $4 = "Outdoor Protection" ) {i[$6]+=$10;}} END {for (x in i) print i[x] " " x;}' WA_Sales_Products_2012-14.csv | sort -nr | head -3
