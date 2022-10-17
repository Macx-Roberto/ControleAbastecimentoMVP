unit uAbastecimento.Model.Entidades.Bomba;

interface

uses
  uAbastecimento.Model.Interfaces, Data.DB, System.Generics.Collections, uAbastecimento.RecordTypes,
  System.SysUtils;

type
  TModelEntidadesBomba = class(TInterfacedObject, IEntidadeBomba)
  private
    FoQuery: IQuery;
    procedure SelectAll;
    function GetRecordBomba(AnId, AnCodigoTanque: Integer; Descricao: String): tBomba;
    function ConsultarID: Integer;
  public 
    function Listar(ADataSource: TDataSource): IEntidadeBomba;
    function GetList: TList<tBomba>;
    function Inserir(ArBomba: tBomba): Integer;

    class function New: IEntidadeBomba;
    constructor Create;
  end;

implementation

uses
  uAbastecimento.Controller.Factory.Query;

class function TModelEntidadesBomba.New: IEntidadeBomba;
begin
  Result := Self.Create;  
end;

constructor TModelEntidadesBomba.Create;
begin
  FoQuery := TControllerFactoryQuery.New.GetQuery(nil);
end;

function TModelEntidadesBomba.Listar(ADataSource: TDataSource): IEntidadeBomba;
begin
  Result := Self;
  SelectAll;
  ADataSource.DataSet := FoQuery.DataSet;
end;

function TModelEntidadesBomba.GetList: TList<tBomba>;
begin
  Result := TList<tBomba>.Create;
  SelectAll;
  if FoQuery.DataSet.IsEmpty then
    Exit;
  while (not FoQuery.DataSet.Eof) do
  begin
    Result.Add(GetRecordBomba(FoQuery.DataSet.FieldByName('ID').AsInteger,
                              FoQuery.DataSet.FieldByName('ID_TANQUE').AsInteger,
                              FoQuery.DataSet.FieldByName('DESCRICAO').AsString));

    FoQuery.DataSet.Next;
  end;
end;

procedure TModelEntidadesBomba.SelectAll;
begin
  FoQuery.SQL('SELECT * FROM BOMBA');
end;

function TModelEntidadesBomba.GetRecordBomba(AnId, AnCodigoTanque: Integer; Descricao: String): tBomba;
begin
  Result.Id           := AnId;
  Result.CodigoTanque := AnCodigoTanque;
  Result.Descricao    := Descricao;
end;

function TModelEntidadesBomba.Inserir(ArBomba: tBomba): Integer;
begin
  FoQuery.Execute(Format('INSERT INTO BOMBA (ID_TANQUE, DESCRICAO) VALUES (%d, %s)',
                  [ArBomba.CodigoTanque, QuotedStr(ArBomba.Descricao)]));
  Result := ConsultarID;
end;

function TModelEntidadesBomba.ConsultarID: Integer;
begin
  Result := FoQuery.SQL(
    'SELECT MAX(ID) AS ID FROM BOMBA'
  ).DataSet.FieldByName('ID').AsInteger;
end;

end.