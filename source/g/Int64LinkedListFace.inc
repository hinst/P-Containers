type
  PInt64LinkedList = ^TInt64LinkedList;
  TInt64LinkedList = record
    Value: Int64;
    Next: PInt64LinkedList;
  end;

procedure Append(var aList, aTail: PInt64LinkedList; const aValue: Int64); overload; inline;

function Next(var aCurrent: PInt64LinkedList; out aValue: Int64): boolean; overload; inline;

function DisposeList(const aList: PInt64LinkedList): PInt64LinkedList; overload; inline;


