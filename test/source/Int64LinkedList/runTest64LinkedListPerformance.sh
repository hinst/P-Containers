#!/bin/bash

fpc TestInt64LinkedListPerformance.pas

if [ $? != 0 ]
then
	echo "Compilation failed; can not test the performance"
	exit 1
fi

count=30000

../../compiled/TestInt64LinkedList/TestInt64LinkedListPerformance TList $count
../../compiled/TestInt64LinkedList/TestInt64LinkedListPerformance LinkedList $count


