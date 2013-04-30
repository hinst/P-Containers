program TestInt64LinkedListPerformance;

uses
	SysUtils,
	Classes, 
	Int64LinkedList;
	
procedure TestWithTList(const aCount: Integer);
	procedure WriteLn(const s: String);
	begin
		WriteLn('TList: ', s);
	end;
var
	list: TList;
	time: TDateTime;
	x: Integer;
begin
	// Section Addition
	time := Now;
	for i := 0 to aCount -1 do
		list.Add(i);
	time := Now - time;
	WriteLn('Addition time: ' + TimeToStr(time));
	// Section Enumeration
	time := Now;
	for i := 0 to list.Count - 1 do
		x := list[i];
	time := Now - time;
	WriteLn('Enumeration time: ' + TimeToStr(time));
	// Section Deconstruction
	list.Free;
end;

var
	kind: String;
	count: Integer;

begin
	kind := ParamStr(1);
	count := ParamStr(2);
	WriteLn('Now testing: ', kind, ', count: ', count, '...');
	if 
		kind = 'TList'
	then
		TestWithTList(count);
end.