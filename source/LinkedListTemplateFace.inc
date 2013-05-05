type
  P_LT = ^T_LT;
  T_LT = record
    Value: _T;
    Next: P_LT;
  end;

procedure Append(var aList, aTail: P_LT; const aValue: _T); overload; inline;

function Next(var aCurrent: P_LT; out aValue: _T): boolean; overload; inline;

function DisposeList(const aList: P_LT): P_LT; overload; inline;


