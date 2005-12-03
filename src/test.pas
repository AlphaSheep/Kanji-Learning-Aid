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

unit test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ActnMan, ActnColorMaps,
  XPMan;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Image1: TImage;
    ComboBox1: TComboBox;
    edit12: TEdit;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    edit5: TEdit;
    XPManifest1: TXPManifest;
    TwilightColorMap1: TTwilightColorMap;
    ComboBox3: TComboBox;
    richedit1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  y,z:integer;
  corr,sel:integer;
  ans:string;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var name:string;
    word1:string;
    fl:textfile;
    x,grd:integer;
    sr:TSearchrec;
    cont:boolean;
begin
  richedit1.Items.clear;
  assignfile(fl,'problems.txt');
  Reset(fl);
  while not eof(fl) do begin
    readln(fl,word1);
    richedit1.Items.Add(word1);
   end;
  Closefile(fl);
  combobox1.Items.Clear;
  combobox3.Items.Clear;
  assignfile(fl,'kanjilist.txt');
  rewrite(fl);
  z:=1;
  for grd:=1 to 9 do if grd<>7 then begin
    FindFirst('grade '+inttostr(grd)+'\*.bmp',faAnyFile,sr);
    name := sr.Name;
    delete(name,0,7);
    delete(name,length(name)-3,4);
    writeln(fl,name);
    z:=z+1;
    cont:=true;
    while (findnext(sr)=0) and cont do begin
      if sr.name=name then cont := false;
      name := sr.Name;
      delete(name,0,7);
      delete(name,length(name)-3,4);
      if not ((name[length(name)]='2')
         or   (name[length(name)]='3')
         or   (name[length(name)]='4')
         or   (name[length(name)]='5')
         or   (name[length(name)]='6'))
       then begin writeln(fl,name);z:=z+1; end;
     end;
    findclose(sr);
   end;
  closefile(fl);
  rewrite(fl);
  y:=1;
  FindFirst(combobox2.Text+'\*.bmp',faAnyFile,sr);
  name := sr.Name;
  delete(name,0,7);
  delete(name,length(name)-3,4);
  writeln(fl,name);
  y:=y+1;
  cont:=true;
  while (findnext(sr)=0) and cont do begin
    if sr.name=name then cont := false;
    name := sr.Name;
    delete(name,0,7);
    delete(name,length(name)-3,4);
    if not ((name[length(name)]='2')
       or   (name[length(name)]='3')
       or   (name[length(name)]='4')
       or   (name[length(name)]='5')
       or   (name[length(name)]='6'))
     then begin writeln(fl,name);y:=y+1; end;
   end;
  findclose(sr);
  closefile(fl);
  reset(fl);
  y:=y-1;
  for x:= 1 to y do begin
    readln(fl,word1);
    combobox1.Items.add(word1);
    combobox3.Items.Add('0')
   end;
  closefile(fl);
  edit12.Text:=inttostr(z)+' words';
  edit5.Text:=inttostr(y)+' out of';
  combobox1.ItemIndex:=0;
  combobox3.ItemIndex:=combobox1.ItemIndex;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Halt;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
const l:array[1..6]of char=('a','b','c','d','e','f');
var fl:string;
  a:integer;
begin
  randomize;
  ans:=ComboBox1.Items.Strings[Random(y)];
  fl:=ComboBox2.Text+'/'+ans+'.bmp';
  image1.Picture.LoadFromFile(fl);
  radiogroup1.Items.Clear;
  corr:=random(6)+1;
  if corr<>1 then for a := 1 to corr-1 do radiogroup1.Items.Add('('+l[a]+')  -  '+combobox1.Items.Strings[Random(y)]);
  radiogroup1.Items.Add('('+l[corr]+')  -  '+ans);
  if corr<>6 then for a := (corr+1) to 6 do radiogroup1.Items.Add('('+l[a]+')  -  '+combobox1.Items.Strings[Random(y)]);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var mk,pn:integer;
    nt:string;
    s,st:string;
begin
  sel:=RadioGroup1.ItemIndex+1;
  s:=radiogroup1.items.Strings[sel-1];
  st:=copy(s,9,length(s)-8);
  if sel=corr
   then begin
     edit9.Text:=floattostr(strtoint(edit9.Text)+1);
     combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)]:=floattostr(strtoint(Combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)])-1);
     If strtoint(combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)])=1
       then richedit1.items.Delete(richedit1.Items.IndexOf(ans));
    end
   else if st=ans
    then begin
      edit9.Text:=floattostr(strtoint(edit9.Text)+1);
      combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)]:=floattostr(strtoint(Combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)])-1);
      If strtoint(combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)])=1
        then richedit1.items.Delete(richedit1.Items.IndexOf(ans));
     end
    else begin
      combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)]:=floattostr(strtoint(Combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)])+1);
      nt:='Wrong, the correct answer is : '+ans;
      messagedlg(nt,mtInformation,[mbok],0);
      If strtoint(combobox3.Items.Strings[ComboBox1.Items.IndexOf(ans)])=2
        then richedit1.items.Add(ans);
     end;
  edit8.Text:=floattostr(strtoint(edit8.Text)+1);
  bitbtn4click(sender);
  mk:=round(strtoint(edit9.Text)/strtoint(edit8.Text)*100);
  edit10.Text:=floattostr(mk)+' %';
  pn:=round(strtoint(edit9.Text)/y*100);
  edit11.Text:=floattostr(pn)+' %';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var k:integer;
  fl:textfile;
begin
  assignfile(fl,'problems.txt');
  rewrite(fl);
  for k:=0 to (richedit1.Items.capacity-1) do
    writeln(fl,richedit1.items.strings[k]);
  closefile(fl);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
    ShowMessage('A multiple choice kanji test'+#13#10+
                'Copyright (c) 2005 Brendan Gray'+#13#10+
                ''+#13#10+
                'This program is free software: you can redistribute it and/or modify'+#13#10+
                'it under the terms of the GNU General Public License as published by'+#13#10+
                'the Free Software Foundation, either version 3 of the License, or'+#13#10+
                '(at your option) any later version.'+#13#10+
                ''+#13#10+
                'This program is distributed in the hope that it will be useful,'+#13#10+
                'but WITHOUT ANY WARRANTY; without even the implied warranty of'+#13#10+
                'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the'+#13#10+
                'GNU General Public License for more details.'+#13#10+
                ''+#13#10+
                'You should have received a copy of the GNU General Public License'+#13#10+
                'along with this program.  If not, see <http://www.gnu.org/licenses/>.'
                );

end;

end.




