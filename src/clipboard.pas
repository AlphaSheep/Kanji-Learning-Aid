{
Copyright (C) 2005, Brendan James Gray

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/.
}

unit clipboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DBCtrls, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Panel2: TPanel;
    DBImage1: TDBImage;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Quick;

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  form2.Visible:=false;
  form1.enabled:=true;
end;

end.
