unit uAbastecimento.EnumTypes;

interface

type
  tTipoCombustivel= (tcbGasolina, tcbDiesel);

  TtTipoCombustivelHelper = record helper for tTipoCombustivel
    function ToInt : Integer;
    function ToString : String;
  end;

implementation

function TtTipoCombustivelHelper.ToInt: Integer;
begin
  Result := -1;
  case self of
    tcbGasolina: Result := 0;
    tcbDiesel:  Result := 1;
  end;
end;

function TtTipoCombustivelHelper.ToString: String;
begin
  case self of
    tcbGasolina: Result := 'Gasolina';
    tcbDiesel:  Result := 'Diesel';
  end;
end;

end.