function Create(const aValue: _T): P_TL; inline;
begin
  New(result);
  result.Value := aValue;
  result.Next := nil;
end;

procedure Append(var aList, aTail: P_TL; const aValue: _T);
var
  item: P_TL;
begin
  item := Create(aValue);
	if
		aTail <> nil
	then
		aTail.Next := aItem
	else
		aList := aItem;
	aTail := aItem;
end;

function Next(var aCurrent: P_TL; out aValue: _T): boolean;
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


