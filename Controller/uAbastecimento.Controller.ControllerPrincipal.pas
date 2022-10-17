unit uAbastecimento.Controller.ControllerPrincipal;

interface

uses  
  Data.DB, uAbastecimento.Model.Interfaces, uAbastecimento.RecordTypes,
  uAbastecimento.Controller.ControllerCrudAbastecimento,
  uAbastecimento.Controller.Interfaces;

type

  TControllerPrincipal = class(TInterfacedObject, IControllerPrincipal)
  private
    FoModelAbastecimento: IEntidadeAbastecimento;
    FdsTela: TDataSource;
    function GetRecordAbastecimento: tAbastecimento;

  public
    class function New: IControllerPrincipal;
    constructor Create;
    procedure SetDataSouceGrid(ADataSource: TDataSource);
    procedure ListarAbastecimentos;
    procedure IncluirAbastecimento;
    procedure EditarAbastecimento;
    procedure ExcluirAbastecimento;
  end;

implementation

uses
  uAbastecimento.Model.Entidades.Abastecimento;

class function TControllerPrincipal.New: IControllerPrincipal;
begin
  Result := Create;  
end;

constructor TControllerPrincipal.Create;
begin
  FoModelAbastecimento := TModelEntidadesAbastecimento.New;
end;

procedure TControllerPrincipal.SetDataSouceGrid(ADataSource: TDataSource);
begin
  FdsTela := ADataSource;
end;

procedure TControllerPrincipal.ListarAbastecimentos;
begin
  FoModelAbastecimento.Listar(FdsTela);
end;

procedure TControllerPrincipal.IncluirAbastecimento;
begin
  FoModelAbastecimento.Salvar(
    TControllerViewCrudAbastecimento.New.IncluirAbastecimento
  );
  FoModelAbastecimento.Listar(FdsTela);
end;

procedure TControllerPrincipal.EditarAbastecimento;
begin
  FoModelAbastecimento.Salvar(
    TControllerViewCrudAbastecimento.New
      .EditarAbastecimento(
        GetRecordAbastecimento
      )
  );
  FoModelAbastecimento.Listar(FdsTela);
end;

function TControllerPrincipal.GetRecordAbastecimento: tAbastecimento;
begin
  Result.Id           := FdsTela.DataSet.FieldByName('ID').AsInteger;
  Result.Data         := FdsTela.DataSet.FieldByName('DATA').AsDateTime;
  Result.CodigoBomba  := FdsTela.DataSet.FieldByName('ID_BOMBA').AsInteger;
  Result.Litros       := FdsTela.DataSet.FieldByName('QTDELT').AsExtended;
  Result.ValorTotal   := FdsTela.DataSet.FieldByName('ValorTotal').AsExtended;
  Result.ValorImposto := FdsTela.DataSet.FieldByName('ValorImposto').AsExtended;
end;

procedure TControllerPrincipal.ExcluirAbastecimento;
begin
  if (FdsTela.DataSet.IsEmpty) then
    Exit;

  FoModelAbastecimento.Excluir(FdsTela.DataSet.FieldByName('ID').AsInteger);
  FoModelAbastecimento.Listar(FdsTela);
end;

end.