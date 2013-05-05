begin
  if
    aFirst.Value < aSecond.Value
  then
    result := -1
  else
    if
      aFirst.Value > aSecond.Value
    then
      result := 1
    else
      result := 0;
end;
