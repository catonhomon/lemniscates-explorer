program lemniscatesexplorer;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, UnitMain, LemniscateFrame, SetOfLemniscates
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Lemniscates Explorer';
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

