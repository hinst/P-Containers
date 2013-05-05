program TestInt64LinkedListSorting;

uses
  LinkedList,
  Int64LinkedList;

const
  Count = 13;

var
  list, tail: PInt64LinkedList;
  i: Integer;
  x: Int64;

begin
  Randomize;
  list := nil;
  tail := nil;
  for i := 1 to Count do
  begin
    x := Random(100) - 49;
    Write(x, ' ');
    Append(list, tail, x);
  end;
  WriteLn;
  tail := list;
  while
    Next(tail, x)
  do
    Write(x, ' ');
  WriteLn;
  list := Sort(list);
  tail := list;
  while
    Next(tail, x)
  do
    Write(x, ' ');
  WriteLn;
  DisposeList(list);
end.

