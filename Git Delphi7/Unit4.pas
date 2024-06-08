unit Unit4;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TDataModule4 = class(TDataModule)
    ZConnection1: TZConnection;
    dskategori: TDataSource;
    Zkategori: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule4: TDataModule4;

implementation

uses
  Unit3;

{$R *.dfm}

end.
 