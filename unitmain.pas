unit UnitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Menus, Lemniscate, LemniscateFrame;

type

  { TFormMain }

  TFormMain = class(TForm)
    btnAdd: TButton;
    btnRemove: TButton;
    workspace: TImage;
    mainMenu: TMainMenu;
    miAbout: TMenuItem;
    miHelpHelp: TMenuItem;
    miHelp: TMenuItem;
    miProperties: TMenuItem;
    miPicture: TMenuItem;
    miView: TMenuItem;
    miTransparent: TMenuItem;
    miNew: TMenuItem;
    miQuit: TMenuItem;
    miSaveSreen: TMenuItem;
    miSave: TMenuItem;
    miOpen: TMenuItem;
    miFile: TMenuItem;
    pnlMain: TPanel;
    pnlButtons: TPanel;
    boxWorkspace: TScrollBox;
    boxLemniscates: TScrollBox;
  private
    //lemniscates: TSetOfLemniscates;
    focuses: array of TFocus;
    lemniscateFrames: array of TLemniscateFrame;
    procedure GenFrames;
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.GenFrames;
{var
  i: integer;
}begin{
  for i := 0 to Length(lemniscateFrames) - 1 do
  begin
    lemniscateFrames[i].Free;
  end;
  SetLength(lemniscateFrames, Length(lemniscates));
  for i := 0 to Length(lemniscates) - 1 do
  begin
    lemniscateFrames[i] := TLemniscateFrame.Create(boxLemniscates);
    lemniscateFrames[i].Align := alTop;
    lemniscateFrames[i].edtName.Text := lemniscates[i].GetName;
    lemniscateFrames[i].edtThickness.Value := lemniscates[i].GetThickness;
    lemniscateFrames[i].edtRadius.Value := lemniscates[i].GetRadius;
  end;}
end;

end.

