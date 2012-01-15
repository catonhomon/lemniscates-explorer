unit SetOfLemniscates;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Lemniscate;

type

  { TSetOfLemniscates }

  TSetOfLemniscates = class
  private
    lemniscates: array of TLemniscate;
    newLemniscateNumber: integer;
  public
    constructor Create;
    function GetLength: integer;
    procedure AddLemniscate;
    function DeleteLemniscate(iIndex: integer): byte;
    procedure Clear;
  end;

implementation

{ TSetOfLemniscates }

constructor TSetOfLemniscates.Create;
begin
  SetLength(lemniscates, 0);
  newLemniscateNumber := 0;
end;

function TSetOfLemniscates.GetLength: integer;
begin
  Result := Length(lemniscates);
end;

procedure TSetOfLemniscates.AddLemniscate;
begin
  SetLength(lemniscates, Length(lemniscates) + 1);
  lemniscates[Length(lemniscates) - 1] :=
    TLemniscate.Create('lemniscate' + IntToStr(newLemniscateNumber));
end;

function TSetOfLemniscates.DeleteLemniscate(iIndex: integer): byte;
var
  ls: array of TLemniscate;
  i: integer;
begin
  Result := 0;
  if (iIndex < 0) or (iIndex > Length(lemniscates) - 1) then
    Result := 1
  else
  begin
    SetLength(ls, 0);
    for i := 0 to Length(lemniscates) - 1 do
      if i <> iIndex then
      begin
        SetLength(ls, Length(ls) + 1);
        ls[Length(ls) - 1] := lemniscates[i];
      end;
    lemniscates := ls;
  end;
end;

procedure TSetOfLemniscates.Clear;
var
  i: integer;
begin
  for i := 0 to Length(lemniscates) - 1 do
    lemniscates[i].Free;
  SetLength(lemniscates, 0);
  newLemniscateNumber := 0;
end;

end.

