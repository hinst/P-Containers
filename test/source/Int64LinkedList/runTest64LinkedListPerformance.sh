#!/bin/bash

fpc TestInt64LinkedListPerformance.pas

if [ $? != 0 ]
then
	echo "Compilation failed"
	exit 1
fi

count=30000

for i in {1..1}
do
	../../compiled/TestInt64LinkedList/TestInt64LinkedListPerformance TList $count
done

