unit LinkedList;

interface

	PLinkedList = ^TLinkedList;
	
	TLinkedList = object
	public
		Next: PLinkedList;
	end;

procedure Append(var aList, aTail: PLinkedList; const aItem: PLinkedList); inline;

function Next(var aCurrent: PLinkedList; out aItem: PLinkedList): Boolean; inline;

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

end.
