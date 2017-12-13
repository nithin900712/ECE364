#! /bin/bash

#---------------------------------------
# $Author: ee364d27 $
# $Date: 2017-09-06 11:01:27 -0400 (Wed, 06 Sep 2017) $
#---------------------------------------

# Do not modify above this line.

if (( $# != 1 ))
then
	echo "Usage: ./sorting_data.bash <input file>"
	exit 1
fi

filename=$1

if [[ ! -r $filename ]]
then
	echo "Error: ${filename} is not a readable file."
	exit 2
fi

echo "./sorting_data.bash ${filename}"

echo "Your choices are:"
echo "1) First 10 people"
echo "2) Last 5 names by highest zipcode"
echo "3) Address of 6th-10th by reverse e-mail"
echo "4) First 12 companies"
echo "5) Pick a number of people"
echo "6) Exit"

while (( 0 == 0 ))
do

read -p "Your choice: " acommand

if (( $acommand == 1 ))
then

tail -n +2 ${filename} | sort -t"," -k7,7 -k5,5 -k2,2 -k1,1 | head -n 10  

elif (( $acommand == 2 ))
then
tail -n +2 ${filename} | sort -t"," -k8,8nr | head -n 5  | sort -t"," -k8,8n | cut -d"," -f1,2

elif (( $acommand == 3 ))
then

tail -n +2 ${filename} | sort -t"," -k11,11r | head -n 10  | tail -n 5 | cut -d"," -f4

elif (( $acommand == 4 ))
then

tail -n +2 ${filename} | sort -t"," -k3,3 | head -n 12 | cut -d"," -f3

elif (( $acommand == 5 ))
then

read -p "Enter a number: " number45

tail -n +2 ${filename} | sort -t"," -k2,2 -k1,1 | head -n ${number45}

elif (( $acommand == 6 ))
then
	echo "Have a nice day!"
	exit 0
else
	echo "Error! Invalid Selection!"
fi

done

exit 0
