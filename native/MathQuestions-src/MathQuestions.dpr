program MathQuestions;

uses
  Forms,
  Frm_Main in 'Frm_Main.pas' {frmMain},
  Cls_MathQuestions in 'Cls_MathQuestions.pas',
  Cls_CanvasWriter in 'Cls_CanvasWriter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
