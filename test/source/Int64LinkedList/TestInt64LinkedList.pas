program TestInt64LinkedList;

uses
	Classes, 
	LinkedList,
	Int64LinkedList;

procedure Test;
const
	count = 10;
var
	list, tail: PInt64LinkedList;
	i: Integer;
	x: Int64;
begin
	list := nil;
	tail := nil;
	for i := 0 to count - 1 do
	begin
		x := Random(100);
		Write(x);
		Write(' ');
		Append(list, tail, x);
	end;
	WriteLn;
	tail := list;
	while 
		Next(tail, x)
	do
	begin
		Write(x);
		Write(' ');
	end;
	DisposeList(list);
	WriteLn;
end;

begin
	Randomize;
	Test;
end.