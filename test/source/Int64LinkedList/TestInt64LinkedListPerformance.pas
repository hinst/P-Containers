program TestInt64LinkedListPerformance;

uses
	SysUtils,
	DateUtils,
	Classes, 
	Int64LinkedList;
	
const
	Multiplier = 10000;
	WarmUpMultiplier = 3000;

function TimeToStr(const aTime: TDateTime): String;
begin
	result := FormatDateTime('hh:nn:ss.zzz', aTime);
end;
	
function TestAdditionWithTList(const aCount: Integer): TDateTime;
var
	list: TList;
	repeatIndex, i: Integer;
	time: TDateTime;
begin
	// Warm Up section
	for repeatIndex := 1 to WarmUpMultiplier do
	begin
		list := TList.Create;
		for i := 0 to aCount - 1 do
			list.Add(Pointer(PtrInt(i)));
		list.Free;
	end;
	// Dirty section
	time := Now;
	for repeatIndex := 1 to Multiplier do
	begin
		list := TList.Create;
		for i := 0 to aCount - 1 do
			list.Add(Pointer(PtrInt(i)));
		list.Free;
	end;
	time := Now - time;
	WriteLn('Dirty addition time: ', TimeToStr(time));
	result := time;
	// Dirt section
	time := Now;
	for repeatIndex := 1 to Multiplier do
	begin
		list := TList.Create;
		list.Free;
	end;
	time := Now - time;
	WriteLn('Dirt addition time: ', TimeToStr(time));
	// Clean section
	result := result - time;
end;

function TestEnumerationWithTList(const aCount: Integer): TDateTime;
var
	list: TList;
	x: PtrInt;
	repeatIndex, i: Integer;
begin
	// Prepare list section
	list := TList.Create;
	for i := 0 to aCount - 1 do
		list.Add(Pointer(PtrInt(i)));
	// Warm Up section
	for repeatIndex := 1 to WarmUpMultiplier do
	begin
		for i := 0 to aCount - 1 do
			x := PtrInt(list[i]);
	end;
	// Clean section
	result := Now;
	for repeatIndex := 1 to Multiplier do
	begin
		for i := 0 to aCount - 1 do
			x := PtrInt(list[i]);
	end;
	result := Now - result;
	list.Free;
end;

procedure TestWithLinkedList(const aCount: Integer);
begin
	
end;

var
	kind: String;
	count: Integer;
	time: TDateTime;
	
begin
	kind := ParamStr(1);
	count := StrToInt(ParamStr(2));
	WriteLn('Now testing: ', kind, ', count: ', count, ', multiplier: ', Multiplier);
	if 
		kind = 'TList'
	then
	begin
		time := TestAdditionWithTList(count);
		WriteLn('Addition time: ', TimeToStr(time));
		time := TestEnumerationWithTList(count);
		WriteLn('Enumeration time: ', TimeToStr(time));
  end;
end.



