program GenerateSortInt64LinkedListRoutine;

uses
  FileTemplater;

var
  templater: TFileTemplater;

begin
  templater := TFileTemplater.Create(nil);
  templater.AddStringReplacer('_SortFunction', 'Sort');
  templater.AddStringReplacer('_PT', 'PInt64LinkedList');
  templater.AddFileReplacer('_CompareFunctionBody', 'Int64LinkedListCompareProcedureBody.inc');
  templater.AddStringReplacer('_Next', 'Next');
  templater.FileName[0] := '../../P-SortLinkedList/source/SortLinkedListTemplateInterface.inc';
  templater.FileName[1] := 'g/SortInt64LinkedListInterface.inc';
  templater.Run;
  templater.FileName[0] := '../../P-SortLinkedList/source/SortLinkedListTemplateImplementation.inc';
  templater.FileName[1] := 'g/SortInt64LinkedListImplementation.inc';
  templater.Run;
  templater.Free;
end.

