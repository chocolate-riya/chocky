#! /bin/bash

echo "Hey, Chocolate!"
echo ""
echo "What is that you want to know"

read -p "Enter the number: " n
for (( i = 1; i <= $n; i++));do
	echo "$i"
done
