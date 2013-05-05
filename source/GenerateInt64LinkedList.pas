program GenerateInt64LinkedList;

uses
  FileTemplater;

var
  templater: TFileTemplater;

begin
  templater := TFileTemplater.Create(nil);
  templater.AddStringReplacer('_T', 'Int64');
  templater.AddStringReplacer('_LT', 'Int64LinkedList');
  templater.FileName[0] := 'LinkedListTemplateFace.inc';
  templater.FileName[1] := 'g/Int64LinkedListFace.inc';
  templater.Run;
  templater.FileName[0] := 'LinkedListTemplateImpl.inc';
  templater.FileName[1] := 'g/Int64LinkedListImpl.inc';
  templater.Run;
  templater.Free;
end.

