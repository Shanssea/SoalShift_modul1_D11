read -r file
input=$(cat "/home/sea/Documents/Sisop/Modul_1/Soal4/$file")
alphabet=({a..z})
bigalpha=({A..Z})
trans=()
bigtr=()
hour=`awk -v var="$file" 'BEGIN {print var}' | awk -F ':' '{print $1}'`
hourr=$(( 26 - $hour ))

if [ "$hourr" -ge "10" ]
then
jam=$hourr
else
jam=$((0x$hourr))
fi

trans+=( "${alphabet[@]:(-(26-$jam))}" )
trans+=( "${alphabet[@]:0:$(( $jam + 1 ))}" )
bigtr+=( "${bigalpha[@]:(-(26-$jam))}" )
bigtr+=( "${bigalpha[@]:0:$(( $jam + 1 ))}" )
result=$( echo "$input" | tr "${alphabet[*]}" "${trans[*]}" | tr "${bigalpha[*]}" "${bigtr[*]}")

echo "$result" > "/home/sea/Documents/Sisop/Modul_1/Soal4/dek_$file"


