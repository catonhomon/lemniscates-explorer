unit LemniscateFrame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, StdCtrls, Dialogs,
  Spin, EditBtn;

type

  { TTLemniscateFrame }

  TLemniscateFrame = class(TFrame)
    btnColor: TColorButton;
    btnAdd: TButton;
    btnRemove: TButton;
    edtName: TEdit;
    edtFocuses: TEdit;
    edtRadius: TFloatSpinEdit;
    edtThickness: TFloatSpinEdit;
    lblName: TLabel;
    lblRadius: TLabel;
    lblThickness: TLabel;
    lblColor: TLabel;
    lblFocuses: TLabel;
    Shape1: TShape;
  private
  public
  end; 

implementation

{$R *.lfm}

end.

