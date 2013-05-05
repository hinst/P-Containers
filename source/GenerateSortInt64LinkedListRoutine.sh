#!/bin/bash
fpc @fpcIncludeStreamReplacer.cfg @fpcIncludeStrings.cfg GenerateSortInt64LinkedListRoutine.pas
if [ $? == 0 ]
then
	../compiled/GenerateSortInt64LinkedListRoutine
else
	echo 'Compilation failed.'
fi