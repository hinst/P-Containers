unit Int64LinkedListNoTemplate;

interface

uses
  SysUtils,
	LinkedList;

type
	
	PInt64LinkedList = ^TInt64LinkedList;
	
	TInt64LinkedList = object(TLinkedList)
	public
		Value: Int64;
	end;

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64); overload; inline;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean; overload; inline;

{$Include g/SortInt64LinkedListInterface.inc}

implementation

function Create(const aValue: Int64): PInt64LinkedList;
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
	LinkedList.Append(aList, aTail, item);
end;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean;
var
	item: PLinkedList;
begin
	result := LinkedList.Next(aCurrent, item);
	aValue := PInt64LinkedList(item).Value;
end;

{$Include g/SortInt64LinkedListImplementation.inc}

end.




