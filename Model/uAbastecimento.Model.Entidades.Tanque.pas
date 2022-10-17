unit uAbastecimento.Model.Entidades.Tanque;

interface

uses
  uAbastecimento.Model.Interfaces, Data.DB, System.SysUtils, uAbastecimento.EnumTypes, 
  uAbastecimento.RecordTypes;

type

  TModelEntidadesTanque = class(TInterfacedObject, IEntidadeTanque)
  private
    FoQuery: IQuery;
    function ConsultarID: Integer;
  public
    class function New: IEntidadeTanque;
    constructor Create;
    destructor Destroy; override;

    function Inserir(AenTpCombustivel: tTipoCombustivel): Integer;
  end;

implementation

uses
  uAbastecimento.Controller.Factory.Query;

class function TModelEntidadesTanque.New: IEntidadeTanque;
begin
  Result := Create;
end;

constructor TModelEntidadesTanque.Create;
begin
  FoQuery := TControllerFactoryQuery.New.GetQuery(nil);
end;

function TModelEntidadesTanque.Inserir(AenTpCombustivel: tTipoCombustivel): Integer;
begin
  FoQuery.Execute(Format('INSERT INTO TANQUE (TPCOMBUSTIVEL) VALUES (%d)',
                  [AenTpCombustivel.ToInt]));
  Result := ConsultarID;
end;

function TModelEntidadesTanque.ConsultarID: Integer;
begin
  Result := FoQuery.SQL(
    'SELECT MAX(ID) AS ID FROM TANQUE'
  ).DataSet.FieldByName('ID').AsInteger;
end;

destructor TModelEntidadesTanque.Destroy;
begin
  inherited;
end;

end.
