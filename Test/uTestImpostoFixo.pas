unit uTestImpostoFixo;

interface

uses
  TestFramework,
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestImpostoFixo= class(TTestCase)
  public
    [Test]
    [TestCase('TestA','100')]
    [TestCase('TestB','100.9')]
    procedure Test2(const AValue1: Extended);
  end;

implementation

uses
  uAbastecimento.Service.CalculoImpostoFixo;

procedure TTestImpostoFixo.Test2(const AValue1: Extended);
begin
  if AValue1 = 100 then
    CheckEquals(13,
      TImpostoFixo.New.CalcularImposto(AValue1),
      'Falha ao testar a função CalcularValorImposto!')
  else
    CheckEquals(13.117, TImpostoFixo.New.CalcularImposto(AValue1),
     'Falha ao testar a função CalcularValorImposto!');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestImpostoFixo);

end.
