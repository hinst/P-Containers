function Create(const aValue: _T): P_LT; inline;
begin
  New(result);
  result.Value := aValue;
  result.Next := nil;
end;

procedure Append(var aList, aTail: P_LT; const aValue: _T);
var
  item: P_LT;
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

function Next(var aCurrent: P_LT; out aValue: _T): boolean;
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

function DisposeList(const aList: P_LT): P_LT;
var
  item: P_LT;
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


