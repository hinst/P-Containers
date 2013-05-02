unit Int64LinkedList;

{$Mode Delphi}

interface

uses
	LinkedList;

type
	
	PInt64LinkedList = ^TInt64LinkedList;
	
	TInt64LinkedList = object(TLinkedList)
	public
		Value: Int64;
	end;

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64); overload; inline;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean; overload; inline;

implementation

function Create(const aValue: Int64): PInt64LinkedList; overload;
begin
	New(result);
	result.Value := aValue;
	result.Next := nil;
end;

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64);
begin
	LinkedList.Append(aList, aTail, Create(aValue));
end;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean; overload;
var
	item: PLinkedList;
begin
	result := LinkedList.Next(aCurrent, item);
	aValue := PInt64LinkedList(item).Value;
end;

end.




