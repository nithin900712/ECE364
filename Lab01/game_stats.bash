#! /bin/bash 

#---------------------------------------
# $Author: ee364d27 $
# $Date: 2017-08-27 23:57:14 -0400 (Sun, 27 Aug 2017) $
#---------------------------------------

# Do not modify above this line.

num_students=0
total_hrs=0
highest_student="blah"
h_hrs=-1
lowest_student="blahblah"
l_hrs=1000000

if (( $# != 2 ))
then
	echo "Usage: ./game_stats.bash <file> <game>"
	echo
	exit 1
fi

if [[ ! -e $1 ]]
then
	filename=$1
	echo "Error: ${filename} does not exist"
	echo
	exit 2
fi



while IFS= read -r line
do
name=$(echo $line | cut -f1 -d",")
game=$(echo $line | cut -f2 -d",")
hours=$(echo $line | cut -f3 -d",")
if [[ $2 = $game ]]
then
	if (( $hours >= $h_hrs ))
	then
		highest_student=$name
		h_hrs=$hours
	fi

	if (( $hours <= $l_hrs ))
	then
		lowest_student=$name
		l_hrs=$hours
	fi

	num_students=$((num_students+1))
	total_hrs=$((total_hrs+$hours))
fi
done < "$1"


echo "Total students: ${num_students}"
echo "Total hours spent in a day: ${total_hrs}"
echo "${highest_student} spent the highest amount of time in a day: ${h_hrs}"
echo "${lowest_student} spent the least amount of time in a day: ${l_hrs}"
echo

exit 0
