#!/usr/bin/env bash -S x

cecho(){
	# Took from:
	# https://aarvik.dk/echo-colors/index.html
	BLACK="\033[0;30m"
	BLUE="\033[0;34m"
	GREEN="\033[0;32m"
	CYAN="\033[0;36m"
	RED="\033[0;31m"
	PURPLE="\033[0;35m"
	ORANGE="\033[0;33m"
	LGRAY="\033[0;37m"
	DGRAY="\033[1;30m"
	LBLUE="\033[1;34m"
	LGREEN="\033[1;32m"
	LCYAN="\033[1;36m"
	LRED="\033[1;31m"
	LPURPLE="\033[1;35m"
	YELLOW="\033[1;33m"
	WHITE="\033[1;37m"
	NORMAL="\033[m"

	color=\$${1:-NORMAL}

	echo -ne "$(eval echo ${color})"
	/bin/cat

	echo -ne "${NORMAL}"
}

if [[ $1 == "-f" ]]
then
    # Reading from file
    PASS=$(/bin/cat $2)
else
    PASS=$1
fi

if [ ${#PASS} -lt 10 ]
then
    echo "Error: Password is less than 10 characters." | cecho RED
    exit 1
fi

if [[ ! $PASS =~ ^[[:alnum:]]*[[:alpha:]][[:alnum:]]*$ ]]
then
    echo "Error: Does not contain both numbers and letters" | cecho RED
    exit 1
fi

if [[ ! $PASS == *[A-Z]* ]]
then
    echo "Error: Does not contain an uppercase letter" | cecho RED
    exit 1
fi

if [[ ! $PASS == *[a-z]* ]]
then
    echo "Error: Does not contain a lowercase letter" | cecho RED
    exit 1
fi

# Should be by default
exit 0
