program QuickViewer;

uses
  Forms,
  Quick in 'Quick.pas' {Form1},
  clipboard in 'clipboard.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
