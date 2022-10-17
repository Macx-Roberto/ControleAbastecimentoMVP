unit uAbastecimento.Model.Interfaces;

interface

uses
  System.Generics.Collections,
  Data.DB, uAbastecimento.EnumTypes,
  uAbastecimento.RecordTypes;

type

  IConexao = interface
    ['{7A16F3A1-0238-416C-8871-8829FB67AA77}']
    function Connection : TCustomConnection;
  end;

  IQuery = interface
    ['{AFEF6A40-7CEA-4E90-A42C-FCD437CDB241}']
    function SQL(Value: String): IQuery;
    function DataSet: TDataSet;
    function Execute(AcSql: String): IQuery;
    function ApplyUpdates: IQuery;
  end;

  IEntidadeTanque = interface
  ['{6F25A5C6-3C08-408C-8424-E439C5A100A4}']
    function Inserir(AenTpCombustivel: tTipoCombustivel): Integer;
  end;

  IEntidadeBomba = interface
  ['{DA682EC8-9D96-47BA-ADE0-8F45F16E3E12}']
    function Listar(ADataSource: TDataSource): IEntidadeBomba;
    function GetList(): TList<tBomba>;
    function Inserir(ArBomba: tBomba): Integer;
  end;

  IEntidadeAbastecimento = interface
  ['{BAE392AB-D0F4-45FF-B4B4-0DAE0244EF97}']
    function Listar(ADataSource: TDataSource): IEntidadeAbastecimento;
    function Salvar(ArAbastecimento: tAbastecimento): Integer;
    procedure Excluir(AnIdAbastecimento: Integer);
  end;

implementation

end.
