unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm3 = class(TForm)
    e1: TEdit;
    lblNAME: TLabel;
    Button1: TButton;
    btn1: TButton;
    delbtn: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    btn2: TButton;
    dbgrd1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure delbtnClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: string;

implementation

uses
  Unit4;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('insert into kategori values (null, "'+e1.Text+'")');
DataModule4.Zkategori.ExecSQL;

DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('select * from kategori');
DataModule4.Zkategori.Open;
ShowMessage('Data Berhasil Disimpan!');

end;

procedure TForm3.btn1Click(Sender: TObject);
begin
with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('update kategori set name= "'+e1.text+'" where id= "'+a+'"');
ExecSQL;

SQL.Clear;
SQL.Add('select * from kategori');
Open;
end;
ShowMessage('Data Berhasil Diupdate!');
end;

procedure TForm3.delbtnClick(Sender: TObject);
begin
with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('delete from kategori where id = "'+a+'"');
ExecSQL;

SQL.Clear;
SQL.Add('select * from kategori');
Open;
end;
ShowMessage('Data Berhasil DiDelete!');
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
e1.Text:= DataModule4.Zkategori.Fields[1].AsString;
a:= DataModule4.Zkategori.Fields[0].AsString;
end;

end.
