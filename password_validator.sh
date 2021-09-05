#!/usr/bin/env bash -S x

PASS=$1

if [ ${#PASS} -lt 10 ]
then
    echo "Error: Password is less than 10 characters."
    exit 1
fi
