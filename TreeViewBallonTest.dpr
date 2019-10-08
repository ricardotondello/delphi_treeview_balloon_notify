program TreeViewBallonTest;

uses
  Vcl.Forms,
  TreeViewBallon in 'TreeViewBallon.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

