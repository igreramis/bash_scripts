#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -n num_nawafil_today"
   echo -e "\t-n Numbers Of Nawafils Today"
   exit 1 # Exit script after printing help
}

while getopts "n:" opt
do
   case "$opt" in
      n ) parameterA="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
	  : ) echo "Entering the fucking argument for the option dumbfuck!!!"
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ] || [ -z "$parameterB" ] || [ -z "$parameterC" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "$parameterA"
echo "$parameterB"
echo "$parameterC"	