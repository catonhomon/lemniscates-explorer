unit Lemniscate;

{$mode objfpc}{$H+}

interface

uses
  Forms, Classes, SysUtils, Graphics, ExtCtrls, Math;

const
  defaultFocusX = 50;
  defaultFocusY = 50;
  defaultRadius = 100;
  defaultThickness = 1;
  defaultActiveFocus = -1;
  defaultColor = clBlack;

type
  TFocus = record
    x, y: extended;
  end;

  { TLemniscate }

  TLemniscate = class
  private
    Name: string;
    focuses: array of TFocus;
    radius, thickness: extended;
    color, activeFocus: integer;
  public
    constructor Create(iName: string);
    destructor Free;
    function GetFocusX(iIndex: integer): extended;
    function GetFocusY(iIndex: integer): extended;
    function GetLengthFocuses: integer;
    function GetName: string;
    function GetRadius: extended;
    function GetThickness: extended;
    function GetColor: integer;
    function GetActiveFocus: integer;
    procedure SetFocusX(iIndex: integer; x: extended);
    procedure SetFocusY(iIndex: integer; y: extended);
    procedure SetName(iName: string);
    function SetRadius(iRadius: extended): byte;
    function SetThickness(iThickness: extended): byte;
    procedure SetColor(iColor: integer);
    function SetActiveFocus(iActiveFocus: integer): byte;
    procedure AddFocus;
    function DeleteFocus(iIndex: integer): byte;
    procedure Draw(var iImage: TImage);
  end;

implementation

{ TLemniscate }

constructor TLemniscate.Create(iName: string);
begin
  Name := iName;
  radius := defaultRadius;
  thickness := defaultThickness;
  activeFocus := defaultActiveFocus;
  color := defaultColor;
end;

destructor TLemniscate.Free;
begin
  name := '';
  SetLength(focuses, 0);
  radius := 0;
  thickness := 0;
  activeFocus := 0;
  color := 0;
end;

function TLemniscate.GetFocusX(iIndex: integer): extended;
begin
  Result := focuses[iIndex].x;
end;

function TLemniscate.GetFocusY(iIndex: integer): extended;
begin
  Result := focuses[iIndex].y;
end;

function TLemniscate.GetLengthFocuses: integer;
begin
  Result := Length(focuses);
end;

function TLemniscate.GetName: string;
begin
  Result := Name;
end;

function TLemniscate.GetRadius: extended;
begin
  Result := radius;
end;

function TLemniscate.GetThickness: extended;
begin
  Result := thickness;
end;

function TLemniscate.GetColor: integer;
begin
  Result := color;
end;

function TLemniscate.GetActiveFocus: integer;
begin
  Result := activeFocus;
end;

procedure TLemniscate.SetFocusX(iIndex: integer; x: extended);
begin
  focuses[iIndex].x := x;
end;

procedure TLemniscate.SetFocusY(iIndex: integer; y: extended);
begin
  focuses[iIndex].y := y;
end;

procedure TLemniscate.SetName(iName: string);
begin
  Name := iName;
end;

function TLemniscate.SetRadius(iRadius: extended): byte;
begin
  Result := 0;
  if iRadius < 0 then
    Result := 1
  else
    radius := iRadius;
end;

function TLemniscate.SetThickness(iThickness: extended): byte;
begin
  Result := 0;
  if iThickness < 0 then
    Result := 1
  else
    thickness := iThickness;
end;

procedure TLemniscate.SetColor(iColor: integer);
begin
  color := iColor;
end;

function TLemniscate.SetActiveFocus(iActiveFocus: integer): byte;
begin
  Result := 0;
  if (iActiveFocus > Length(focuses) - 1) or (iActiveFocus < -1) then
    Result := 1
  else
    activeFocus := iActiveFocus;
end;

procedure TLemniscate.AddFocus;
begin
  SetLength(focuses, Length(focuses) + 1);
  focuses[Length(focuses) - 1].x := defaultFocusX;
  focuses[Length(focuses) - 1].y := defaultFocusY;
end;

function TLemniscate.DeleteFocus(iIndex: integer): byte;
var
  fs: array of TFocus;
  i: integer;
begin
  Result := 0;
  if (iIndex < 0) or (iIndex > Length(focuses) - 1) then
    Result := 1
  else
  begin
    SetLength(fs, 0);
    for i := 0 to Length(focuses) - 1 do
      if i <> iIndex then
      begin
        SetLength(fs, Length(fs) + 1);
        fs[Length(fs) - 1] := focuses[i];
      end;
    focuses := fs;
  end;
end;

procedure TLemniscate.Draw(var iImage: TImage);
var
  x, y, i: integer;
  multFocuses, powerRadius: extended;
begin
  if Length(focuses) > 0 then
  begin
    powerRadius := 0;
    power(powerRadius, Length(focuses));
    for x := 0 to iImage.Width do
      for y := 0 to iImage.Height do
      begin
        multFocuses := 1;
        for i := 0 to Length(focuses) - 1 do
          multFocuses := multFocuses * sqrt(sqr(focuses[i].x - x) +
            sqr(focuses[i].y - y));
        if abs(powerRadius - multFocuses) <= thickness then
          iImage.Canvas.Pixels[x, y] := color;
      end;
  end;
end;

end.

