#!/usr/bin/env bash -S x

PASS=$1

if [ ${#PASS} -lt 10 ]
then
    echo "Error: Password is less than 10 characters."
    exit 1
fi

if [[ ! $PASS =~ ^[[:alnum:]]*[[:alpha:]][[:alnum:]]*$ ]]
then
    echo "Error: Does not contain both numbers and letters"
    exit 1
fi

if [[ ! $PASS == *[A-Z]* ]]
then
    echo "Error: Does not contain an uppercase letter"
    exit 1
fi

if [[ ! $PASS == *[a-z]* ]]
then
    echo "Error: Does not contain a lowercase letter"
    exit 1
fi
