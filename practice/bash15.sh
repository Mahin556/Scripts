#!/bin/bash

echo "Enter fruite"
read fruite

case $fruite in
	"apple")
		echo "This is apple"
		;;
	"banana")
		echo "This is banana"
		;;
	"orange")
		echo "This is banana"
		;;
	*)
		echo "Unknown fruite"
		;;
esac

