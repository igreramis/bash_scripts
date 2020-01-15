#!/bin/bash
file="nafal_records.txt"
helpFunction()
{
   echo ""
   echo "Usage: $0 [-n num_nawafil_today] [-t display total num of nafal recorded]"
   echo -e "\t-n Numbers Of Nawafils Today"
   echo -e "\t-t display total num of nafal recorded"
   exit 1 # Exit script after printing help
}

update_records()
{
	base_10="10#"
	base_10_num_nafal_today=$base_10$num_nafal_today
	echo "`date`-$base_10_num_nafal_today" >> $file
}

analyze_records()
{ 	
	total_nafal_completed=0
	while IFS= read -r line
	do
		nafal=`echo $line|awk -F- '{print $2}'`
		total_nafal_completed=$((total_nafal_completed + nafal))
	done < "$file"
	echo "total_nafal_completed: $total_nafal_completed"
}

while getopts "n:t" opt
do
   case "$opt" in
      n ) num_nafal_today="$OPTARG"
		  if [ -z "$num_nafal_today" ]
		  then
			echo "Some or all of the parameters are empty";
			helpFunction
		  fi
		  update_records ;;
	  t ) analyze_records ;;
      ? ) helpFunction ;;
	  : ) echo "Entering the fucking argument for the option dumbfuck!!!"
   esac
done
