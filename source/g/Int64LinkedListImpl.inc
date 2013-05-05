function Create(const aValue: Int64): PInt64LinkedList; inline;
begin
  New(result);
  result.Value := aValue;
  result.Next := nil;
end;

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64);
var
  item: PInt64LinkedList;
begin
  item := Create(aValue);
	if
		aTail <> nil
	then
		aTail.Next := item
	else
		aList := item;
	aTail := item;
end;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean;
begin
	result := aCurrent <> nil;
	if
		result
	then
	begin
		aValue := aCurrent.Value;
		aCurrent := aCurrent.Next;
	end;
end;

function DisposeList(const aList: PInt64LinkedList): PInt64LinkedList;
var
  item: PInt64LinkedList;
begin
  result := aList;
  while
    result <> nil
  do
  begin
    item := result;
    result := result.Next;
    Dispose(item);
  end;
end;


