unit Int64LinkedList;

{$Mode Delphi}

interface

type
	
	PInt64LinkedList = ^TInt64LinkedList;
	
	TInt64LinkedList = object
	public
		Value: Int64;
		Next: PInt64LinkedList;
	end;

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64); overload; inline;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean; overload; inline;

procedure DisposeList(const aList: PInt64LinkedList); inline;

implementation

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64);
var
	item: PInt64LinkedList;
begin
	New(item);
	item.Value := aValue;
	item.Next := nil;
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

procedure DisposeList(const aList: PInt64LinkedList);
var
	next, current: PInt64LinkedList;
begin
	current := aList;
	while
		current <> nil
	do
	begin
		next := current.Next;
		Dispose(current);
		current := next;
	end;
end;

end.




