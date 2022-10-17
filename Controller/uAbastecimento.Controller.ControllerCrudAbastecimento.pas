unit uAbastecimento.Controller.ControllerCrudAbastecimento;

interface

uses
  uAbastecimento.RecordTypes, uAbastecimento.View.uFrmCrudAbastecimento,
  System.UITypes, System.SysUtils, uAbastecimento.Controller.Interfaces;

 type

  TControllerViewCrudAbastecimento = class(TInterfacedObject, IControllerViewCrudAbastecimento)
  private
    FFrmCrud: TfrmCrudAbastecimento;
  public
    class function New: IControllerViewCrudAbastecimento;
    constructor Create;
    destructor Destroy; override;

    function IncluirAbastecimento: tAbastecimento;
    function EditarAbastecimento(ArAbastecimento: tAbastecimento): tAbastecimento;
  end;

implementation

uses
  uAbastecimento.Model.Entidades.Bomba;

function TControllerViewCrudAbastecimento.IncluirAbastecimento: tAbastecimento;
begin
  FFrmCrud.IncluirAbastecimento;
  if FFrmCrud.ModalResult <> mrOK then
    Abort;
  Result := FFrmCrud.GetRecordAbastecimento;
end;

function TControllerViewCrudAbastecimento.EditarAbastecimento(ArAbastecimento: tAbastecimento): tAbastecimento;
begin
  FFrmCrud.EditarAbastecimento(ArAbastecimento);
  if FFrmCrud.ModalResult <> mrOK then
    Abort;
  Result := FFrmCrud.GetRecordAbastecimento;
end;

class function TControllerViewCrudAbastecimento.New: IControllerViewCrudAbastecimento;
begin
  Result := Self.Create;
end;

destructor TControllerViewCrudAbastecimento.Destroy;
begin
  inherited;
end;

constructor TControllerViewCrudAbastecimento.Create;
begin
  FFrmCrud := TfrmCrudAbastecimento.New(TModelEntidadesBomba.New.GetList);
end;


end.