function SortCompare(const aFirst, aSecond: PInt64LinkedList): Integer; inline;
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


function Sort(list: PInt64LinkedList): PInt64LinkedList;
var
	p, q, e, tail, oldhead: PInt64LinkedList;
	insize, nmerges, psize, qsize, i: Integer;
begin
	if 
		nil = list
	then
		result := nil
	else
	begin
		insize := 1;
		while
			True
		do
		begin
			p := list;
			oldhead := list;
			list := nil;
			tail := nil;
			nmerges := 0;
			while 
				p <> nil
			do
			begin
				Inc(nmerges);
				q := p;
				psize := 0;
				for i := 0 to insize - 1 do
				begin
					Inc(psize);
					q := PInt64LinkedList(q.Next);
					if 
						q = nil
					then
						break;
				end;
				qsize := insize;
				while 
					(psize > 0)
					or
					(
						(qsize > 0)
						and
						(q <> nil)
					)
				do
				begin
					if 
						0 = psize
					then
					begin
						e := q;
						q := PInt64LinkedList(q.Next);
						Dec(qsize);
					end
					else if
						(0 = qsize) or (nil = q)
					then
					begin
						e := p;
						p := PInt64LinkedList(p.Next);
						Dec(psize);
					end
					else if
						SortCompare(p, q) <= 0
					then
					begin
						e := p;
						p := PInt64LinkedList(p.Next);
						Dec(psize);
					end
					else
					begin
						e := q;
						q := PInt64LinkedList(q.Next);
						Dec(qsize);
					end;
					if 
						tail <> nil
					then
						tail.Next := e
					else
						list := e;
					tail := e;
				end;
				p := q;
			end;
			tail.Next := nil;
			if 
				nmerges  <= 1
			then
			begin
				result := list;
				break;
			end
			else
				insize := 2 * insize;
		end;
	end;
end;
