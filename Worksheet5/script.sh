#!/bin/bash

# Redirect entries from United States to 'United_States.txt'
awk -F, '{ if($8 == "United States") print $0;}' 'Global YouTube Statistics.csv' >> United_States.txt

# Redirect entries from United States to their respective category file
IFS=$'\n'
for entry in $(cat United_States.txt)
do
	category=$(cut -d',' -f5 <<< $entry);
	echo $entry >> "United States/$category.txt";
done

# Display number of entries
echo "NUMBER OF ENTRIES IN ..." >> ws5.txt
for category in "Music" "Entertainment" "Gaming" "Comedy"
do
	echo "\"Worksheet5/United States/$category.txt\":" >> ws5.txt
	wc -l "United States/$category.txt" >> ws5.txt
done
