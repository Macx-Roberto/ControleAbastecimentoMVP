unit uAbastecimento.Controller.Interfaces;

interface

uses
  uAbastecimento.Model.Interfaces, Data.DB, uAbastecimento.RecordTypes;

type

  IFactoryQuery = interface
  ['{7C3F1761-350A-486C-A7A4-48E96A60B1D9}']
    function GetQuery(Connection: IConexao): IQuery;
  end;

  IControllerPrincipal= interface
  ['{F5DDF719-5527-44C6-A5D8-C83C3D344974}']
    procedure SetDataSouceGrid(ADataSource: TDataSource);
    procedure ListarAbastecimentos;
    procedure IncluirAbastecimento;
    procedure EditarAbastecimento;
    procedure ExcluirAbastecimento;
  end;

  IControllerViewCrudAbastecimento= interface
  ['{12EA69B6-428E-495C-92AA-A7B9C87CAB6C}']
    function IncluirAbastecimento: tAbastecimento;
    function EditarAbastecimento(ArAbastecimento :tAbastecimento): tAbastecimento;
  end;

implementation

end.
