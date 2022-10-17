unit uAbastecimento.Service.CalculoImpostoFixo;

interface

uses
  uAbastecimento.Service.Interfaces;

type

  TImpostoFixo= class(TInterfacedObject, ICalculoImposto)
  private
  public
    function CalcularImposto(AnValor: Extended): Extended;
    class function New: ICalculoImposto;
  end;

implementation

const
  _PercentualFixo = 0.13; // 13%

{ TImpostoFixo }

function TImpostoFixo.CalcularImposto(AnValor: Extended): Extended;
begin
  Result := AnValor * _PercentualFixo;
end;

class function TImpostoFixo.New: ICalculoImposto;
begin
  Result :=  Self.Create;
end;

end.
