unit uAbastecimento.Controller.Factory.Query;

interface

uses
  uAbastecimento.Controller.Interfaces,
  uAbastecimento.Model.Interfaces;

type

  TControllerFactoryQuery = class(TInterfacedObject, IFactoryQuery)
  public
    function GetQuery(Connection: IConexao): IQuery;
    class function New: IFactoryQuery;
    destructor Destroy; override;
  end;

implementation

uses
  uAbastecimento.Model.Query.Firedac;

class function TControllerFactoryQuery.New: IFactoryQuery;
begin
  Result := Self.Create;
end;

function TControllerFactoryQuery.GetQuery(Connection: IConexao): IQuery;
begin
  Result := TModelQueryFiredac.New(Connection);
end;

destructor TControllerFactoryQuery.Destroy;
begin
  inherited;
end;

end.
