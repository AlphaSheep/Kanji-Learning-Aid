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

unit Quick;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnMan, ActnColorMaps, XPMan, Buttons,
  ComCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    TwilightColorMap1: TTwilightColorMap;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Image1: TImage;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    TrackBar1: TTrackBar;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Image2: TImage;
    ListBox1: TListBox;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  max,at:integer;
  y:integer;

implementation

uses clipboard;

{$R *.dfm}

procedure TForm1.Edit1Change(Sender: TObject);
var flc,flt,fl3,fl4,fl5,fl6:string;
    grade,number,x:integer;
    found,possible:boolean;
begin
  if not (Edit1.Text='') then begin
    while ComboBox1.Items.Strings[ComboBox1.ItemIndex]>Edit1.Text do
      ComboBox1.ItemIndex:=ComboBox1.ItemIndex-1;
    while ComboBox1.Items.Strings[ComboBox1.ItemIndex]<edit1.text do
      ComboBox1.ItemIndex:=ComboBox1.ItemIndex+1;
   end else
  ComboBox1.ItemIndex:=0;
  found:=false;
  number:=0;
  edit3.text:='';
  possible:=false;
  max:=0;
  for grade:=1 to 9 do
   for x:=1 to 26 do
     if fileexists('grade '+inttostr(grade)+'\'+edit1.Text+chr(96+x)+'*'+'.bmp')
       or fileexists('grade '+inttostr(grade)+'\'+edit1.Text+#32+'*'+'.bmp')
      then possible:=true;
  if not possible
   then begin edit3.Text:='No possible characters loaded'; edit4.text:=''end
   else begin edit3.Text:='Word incomplete';edit4.Text:='Further possibilities exist'end;
  for grade := 1 to 9 do begin
    flc := 'grade '+inttostr(grade)+'\'+edit1.Text+'.bmp';
    flt := 'grade '+inttostr(grade)+'\'+edit1.Text+'2.bmp';
    fl3 := 'grade '+inttostr(grade)+'\'+edit1.Text+'3.bmp';
    fl4 := 'grade '+inttostr(grade)+'\'+edit1.Text+'4.bmp';
    fl5 := 'grade '+inttostr(grade)+'\'+edit1.Text+'5.bmp';
    fl6 := 'grade '+inttostr(grade)+'\'+edit1.Text+'6.bmp';
    if fileexists(flc) then begin
      image1.picture.LoadFromFile(flc);
      edit2.Text:='Grade '+inttostr(grade);
      found:=true;
      inc(number);
      edit3.Text:=inttostr(number)+' character matches';
      label1.Caption:=inttostr(number);
      max:=number;
      at:=max;
     end;
    if fileexists(flt) then begin
      image1.picture.LoadFromFile(flt);
      edit2.Text:='Grade '+inttostr(grade);
      found:=true;
      inc(number);
      edit3.Text:=inttostr(number)+' character matches';
      label1.Caption:=inttostr(number);
      max:=number;
      at:=max;
     end;
    if fileexists(fl3) then begin
      image1.picture.LoadFromFile(fl3);
      edit2.Text:='Grade '+inttostr(grade);
      found:=true;
      inc(number);
      edit3.Text:=inttostr(number)+' character matches';
      label1.Caption:=inttostr(number);
      max:=number;
      at:=max;
     end;
    if fileexists(fl4) then begin
      image1.picture.LoadFromFile(fl4);
      edit2.Text:='Grade '+inttostr(grade);
      found:=true;
      inc(number);
      edit3.Text:=inttostr(number)+' character matches';
      label1.Caption:=inttostr(number);
      max:=number;
      at:=max;
     end;
    if fileexists(fl5) then begin
      image1.picture.LoadFromFile(fl5);
      edit2.Text:='Grade '+inttostr(grade);
      found:=true;
      inc(number);
      edit3.Text:=inttostr(number)+' character matches';
      label1.Caption:=inttostr(number);
      max:=number;
      at:=max;
     end;
    if fileexists(fl6) then begin
      image1.picture.LoadFromFile(fl6);
      edit2.Text:='Grade '+inttostr(grade);
      found:=true;
      inc(number);
      edit3.Text:=inttostr(number)+' character matches';
      label1.Caption:=inttostr(number);
      max:=number;
      at:=max;
     end;
   end;
  if not found then begin
    image1.picture:=nil;
    edit2.text:='';
    label1.Caption:='0';
   end;
  if possible then edit4.Text:='Further possibilities exist';
  if at>1 then SpeedButton2.Enabled:=true else SpeedButton2.Enabled:=false;
  SpeedButton1.Enabled:=false;
  TrackBar1.Max:=y;
  TrackBar1.Position:=ComboBox1.ItemIndex;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var grade,number:integer;
    flc:string;
    adv:byte;
begin
  if at<max then inc(at);
  if at=max then SpeedButton1.Enabled:=false;
  if at>1 then SpeedButton2.Enabled:=true;
  number:=0;
  grade:=0;
  adv:=0;
  while (number<at)and(grade<=9) do begin
    if adv=5 then inc(grade);
    if adv=5 then adv:=0 else inc(adv);
    flc := 'grade '+inttostr(grade)+'\'+edit1.Text;
    if adv=1 then flc:=flc+'2';
    if adv=2 then flc:=flc+'3';
    if adv=3 then flc:=flc+'4';
    if adv=4 then flc:=flc+'5';
    if adv=5 then flc:=flc+'6';
    flc:=flc+'.bmp';
    if fileexists(flc) then begin
      image1.picture.LoadFromFile(flc);
      edit2.Text:='Grade '+inttostr(grade);
      inc(number);
      label1.Caption:=inttostr(number);
     end;
   end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var grade,number:integer;
    flc:string;
    adv:byte;
begin
  if at>1 then dec(at);
  if at =1 then SpeedButton2.Enabled:=false;
  if at<max then SpeedButton1.Enabled:=true;
  number:=0;
  grade:=0;
  adv:=0;
  while (number<at)and(grade<=9) do begin
    if adv=5 then inc(grade);
    if adv=5 then adv:=0 else inc(adv);
    flc := 'grade '+inttostr(grade)+'\'+edit1.Text;
    if adv=1 then flc:=flc+'2';
    if adv=2 then flc:=flc+'3';
    if adv=3 then flc:=flc+'4';
    if adv=4 then flc:=flc+'5';
    if adv=5 then flc:=flc+'6';
    flc:=flc+'.bmp';
    if fileexists(flc) then begin
      image1.picture.LoadFromFile(flc);
      edit2.Text:='Grade '+inttostr(grade);
      inc(number);
      label1.Caption:=inttostr(number);
     end;
   end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  messagedlg('Just type the english word in the box, or select a word from the list.',mtInformation,[mbok],0);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var name:string;
    word1,line:string;
    fl:textfile;
    grd,x:integer;
    sr:TSearchrec;
    cont:boolean;
begin
  assignfile(fl,'problems.txt');
  reset(fl);
  while not eof(fl) do begin
    readln(fl,line);
    listbox1.Items.Add(line);
   end;
  closefile(fl);
  TwilightColorMap1.UpdateColors;
  combobox1.Items.Clear;
  assignfile(fl,'kanjilist.txt');
  rewrite(fl);
  y:=1;
  for grd:=1 to 9 do if grd<>7 then begin
    FindFirst('grade '+inttostr(grd)+'\*.bmp',faAnyFile,sr);
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
   end;
  closefile(fl);
  reset(fl);
  y:=y-1;
  for x:= 1 to y do begin
    readln(fl,word1);
    combobox1.Items.add(word1);
   end;
  closefile(fl);
  edit5.Text:=inttostr(y)+' words';
  combobox1.ItemIndex:=0;
  edit1.Text:=ComboBox1.Text;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  edit1.text:=combobox1.Text;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  edit1.Text:=ComboBox1.Text;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then edit1.Text:=ComboBox1.Text;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  randomize;
  edit1.Text:=ComboBox1.Items.Strings[random(y)];
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  deletefile('kanjilist.txt');
  halt;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  deletefile('kanjilist.txt');
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  halt;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if messagedlg('Are you absolutely certain that is what you really want?',
       mtconfirmation,[mbyes,mbno],0)=mryes
   then deletefile('kanjilist.txt')
   else action:=caNone;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  form2.Visible:=true;
  form1.Enabled:=false;
  form2.DBImage1.Hide;
  form2.DBImage1.Show;
  form2.dbimage1.Picture:=Image1.Picture;
  form2.dbimage1.CopyToClipboard;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  edit1.Text:=listbox1.Items.Strings[listbox1.itemindex];
end;

end.
