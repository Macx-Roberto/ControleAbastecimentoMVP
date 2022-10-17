unit uAbastecimento.Model.Utils;

interface

uses
  System.SysUtils, System.IOUtils;

type
  TModelUtils=class
    class function GetDatabasePath: String;
  end;

implementation


class function TModelUtils.GetDatabasePath: String;
var
  sPath: String;
  oFile: TextFile;
begin
  sPath := System.SysUtils.GetCurrentDir;
  sPath := System.IOUtils.TPath.Combine(sPath, 'Database');
  ForceDirectories(sPath);
  sPath := System.IOUtils.TPath.Combine(sPath, 'AbastecimentoDB.db');
  if not(FileExists(sPath)) then
  begin
    try
      System.AssignFile(oFile, sPath);
      System.Rewrite(oFile);
    finally
      System.CloseFile(oFile);
    end;
  end;
  Result := sPath;
end;

end.
