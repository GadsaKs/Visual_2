object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 723
  Top = 403
  Height = 150
  Width = 261
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\gadsa\Desktop\Kuliah\Softwares\Delphi 7\LIbrary\libmysq' +
      'l\libmysql.dll'
    Left = 24
    Top = 24
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 184
    Top = 24
  end
  object Zkategori: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * from kategori')
    Params = <>
    Left = 104
    Top = 16
  end
end
