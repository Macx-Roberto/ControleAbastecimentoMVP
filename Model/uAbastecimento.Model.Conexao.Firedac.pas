unit uAbastecimento.Model.Conexao.Firedac;

interface

uses
  System.SysUtils, uAbastecimento.Model.Interfaces,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type

  TModelConexaoFiredac = class(TInterfacedObject, IConexao)
  private
    FoConexao: TFDConnection;
  public
    class function New: IConexao;
    constructor Create;
    function Connection: TCustomConnection;
    destructor Destroy; override;
  end;

implementation

uses
  uAbastecimento.Model.Utils;

const
  _driverNameSQLITE = 'SQLITE';

class function TModelConexaoFiredac.New: IConexao;
begin
  Result := Self.Create;
end;

constructor TModelConexaoFiredac.Create;
begin
  FoConexao := TFDConnection.Create(nil);
  FoConexao.DriverName        := _driverNameSQLITE;
  FoConexao.Params.DataBase   := TModelUtils.GetDatabasePath;
  FoConexao.Connected := True;
end;

function TModelConexaoFiredac.Connection: TCustomConnection;
begin
  Result := FoConexao;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  if System.Assigned(FoConexao) then
    System.SysUtils.FreeAndNil(FoConexao);

  inherited;
end;

end.
