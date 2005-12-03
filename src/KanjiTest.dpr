program KanjiTest;

uses
  Forms,
  test in 'test.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Quick Kanji Tester';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
