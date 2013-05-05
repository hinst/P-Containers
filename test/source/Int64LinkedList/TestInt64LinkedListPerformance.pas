program TestInt64LinkedListPerformance;

uses
	SysUtils,
	DateUtils,
	Classes, 
	LinkedList,
	Int64LinkedList;
	

function TimeToStr(const aTime: TDateTime): String;
begin
  if
    aTime > 100 * OneMillisecond
  then
  	result := FormatDateTime('hh:nn:ss.zzz', aTime)
  else
    result := FloatToStr(aTime/OneSecond);
end;

procedure WarmUp(const aCount, aMultiplier: Integer);
var
	list: TList;
	repeatIndex, i: Integer;
begin
	for repeatIndex := 1 to aMultiplier do
	begin
		list := TList.Create;
		for i := 0 to aCount - 1 do
			list.Add(nil);
		list.Free;
	end;
end;

function TestAdditionWithTList(const aCount, aMultiplier: Integer): TDateTime;
var
	list: TList;
	repeatIndex, i: Integer;
	time: TDateTime;
begin
	// Dirty section
	time := Now;
	for repeatIndex := 1 to aMultiplier do
	begin
		list := TList.Create;
		for i := 0 to aCount - 1 do
			list.Add(Pointer(1));
		list.Free;
	end;
	time := Now - time;
	result := time;
	// Dirt section
	time := Now;
	for repeatIndex := 1 to aMultiplier do
	begin
		list := TList.Create;
		list.Free;
	end;
	time := Now - time;
	// Clean section
	result := result - time;
end;

function TestEnumerationWithTList(const aCount, aMultiplier: Integer): TDateTime;
var
	list: TList;
	x: PtrUInt;
	repeatIndex, i: Integer;
begin
	// Prepare list section
	list := TList.Create;
	for i := 0 to aCount - 1 do
		list.Add(Pointer(1));
	// Clean section
	result := Now;
	for repeatIndex := 1 to aMultiplier do
	begin
		for i := 0 to aCount - 1 do
			x := PtrInt(list[i]);
	end;
	result := Now - result;
	list.Free;
end;

function CompareFunction(Item1, Item2: Pointer): Integer;
begin
  if
    PtrUInt(Item1) < PtrUInt(Item2)
  then
    result := -1
  else
    if
      PtrUInt(Item1) > PtrUInt(Item2)
    then
      result := 1
    else
      result := 0;
end;

function TestSortingWithTList(const aCount, aMultiplier: Integer): TDateTime;
var
  list: TList;
  x: PtrInt;
  repeatIndex, i: Integer;
  time: TDateTime;
begin
  // Dirty section
  result := Now;
  for repeatIndex := 1 to aMultiplier do
  begin
    list := TList.Create;
    for i := 0 to aCount - 1 do
      list.Add(Pointer(PtrInt(Random(100))));
    list.Sort(CompareFunction);
    list.Free;
  end;
  result := Now - result;
  // Dirt section
  time := Now;
  for repeatIndex := 1 to aMultiplier do
  begin
    list := TList.Create;
    for i := 0 to aCount - 1 do
      list.Add(Pointer(PtrInt(Random(100))));
    list.Free;
  end;
  time := Now - time;
  // Clean section
  result := result - time;
end;

function TestAdditionWithLinkedList(const aCount, aMultiplier: Integer): TDateTime;
var
	list, tail: PInt64LinkedList;
	repeatIndex, i: Integer;
	x: Int64;
begin
	x := 0;
	result := Now;
	for repeatIndex := 1 to aMultiplier do
	begin
    list := nil;
		tail := nil;
		for i := 0 to aCount - 1 do
			Append(list, tail, x);
		DisposeList(list);
	end;
	result := Now - result;
end;

function TestEnumerationWithLinkedList(const aCount, aMultiplier: Integer): TDateTime;
var
	list, tail: PInt64LinkedList;
	repeatIndex, i: Integer;
	x: Int64;
begin
	// Prepare list section
  list := nil;
	tail := nil;
	for i := 0 to aCount - 1 do
		Append(list, tail, Int64(0));
	// Evaluate section
	result := Now;
	for repeatIndex := 1 to aMultiplier do
	begin
		tail := list;
		while 
			Next(tail, x) 
		do 
			;
	end;
	result := Now - result;
	DisposeList(list);
end;

function TestSortingWithLinkedList(const aCount, aMultiplier: Integer): TDateTime;
var
  list, tail: PInt64LinkedList;
  repeatIndex, i: Integer;
  time: TDateTime;
begin
  // Dirty section
  result := Now;
  for repeatIndex := 1 to aMultiplier do
  begin
    list := nil;
    tail := nil;
    for i := 0 to aCount - 1 do
      Append(list, tail, PtrInt(Random(100) - 199));
    list := Sort(list);
    DisposeList(list);
  end;
  result := Now - result;
  // Dirt section
  time := Now;
  for repeatIndex := 1 to aMultiplier do
  begin
    list := nil;
    tail := nil;
    for i := 0 to aCount - 1 do
      Append(list, tail, PtrInt(Random(100) - 199));
    DisposeList(list);
  end;
  time := Now - time;
  // Clean section
  result := result - time;
end;

const
  DesiredCount = 30000;

var
	count, multiplier: Integer;
	time: TDateTime;

procedure ReportTime;
begin
	WriteLn('  Overall: ', TimeToStr(time));
  WriteLn('  Per array[', count, ']: ', TimeToStr(time / multiplier));
  WriteLn('  Per element: ', TimeToStr(time / multiplier / count));
end;
	
begin
  Randomize;
  count := 300000;
  multiplier := 1000;
  WarmUp(count, multiplier);
  // ADDITION
  //count := 300000;
  multiplier := 5000;
	WriteLn('TList addition: ', count, ' items, ', multiplier, ' times');
  time := TestAdditionWithTList(count, multiplier);
  ReportTime;

  // ENUMERATION
  //count := 30000;
  multiplier := 50000;
  WriteLn('TList enumeration: ', count, ' items ', multiplier, ' times');
  time := TestEnumerationWithTList(count, multiplier);
  ReportTime;

  // SORTING
  /count := 30000;
  multiplier := 1000;
  WriteLn('TList sorting: ', count, ' items ', multiplier, ' times');
  time := TestSortingWithTList(count, multiplier);
  ReportTime;

  count := 30000;
  multiplier := 200;
  WriteLn('LinkedList addition: ', count, ' items ', multiplier, ' times');
  time := TestAdditionWithLinkedList(count, multiplier);
  ReportTime;

  count := 30000;
  multiplier := 2000;
  WriteLn('LinkedList enumeration: ', count, ' items ', multiplier, ' times');
  time := TestEnumerationWithLinkedList(count, multiplier);
  ReportTime;

  count := 30000;
  multiplier := 100;
  WriteLn('LinkedList sorting: ', count, ' items ', multiplier, ' times');
  time := TestSortingWithLinkedList(count, multiplier);
  ReportTime;
end.



