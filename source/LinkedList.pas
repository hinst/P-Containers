unit LinkedList;

interface

type
	PLinkedList = ^TLinkedList;
	
	TLinkedList = object
	public
		Next: PLinkedList;
	end;
	
procedure Append(var aList, aTail: PLinkedList; const aItem: PLinkedList); overload; inline;

function Next(var aCurrent: PLinkedList; out aItem: PLinkedList): Boolean; overload; inline;

procedure DisposeList(const aList: PLinkedList); overload; inline;

implementation

procedure Append(var aList, aTail: PLinkedList; const aItem: PLinkedList);
begin
	if 
		aTail <> nil
	then
		aTail.Next := aItem
	else
		aList := aItem;
	aTail := aItem;
end;

function Next(var aCurrent: PLinkedList; out aItem: PLinkedList): Boolean;
begin
	result := aCurrent <> nil;
	if 
		result
	then
	begin
		aItem := aCurrent;
		aCurrent := aCurrent.Next;
	end;
end;

procedure DisposeList(const aList: PLinkedList);
var
	current, item: PLinkedList;
begin
	current := aList;
	while 
		Next(current, item)
	do
		Dispose(item);
end;

end.
