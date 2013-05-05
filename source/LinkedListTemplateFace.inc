type
  P_TL = ^_TL;
  _TL = record
    Value: _T;
    Next: P_TL;
  end;

procedure Append(var aList, aTail: P_TL; const aValue: _T); overload; inline;

function Next(var aCurrent: P_TL; out aValue: _T): boolean; overload; inline;


