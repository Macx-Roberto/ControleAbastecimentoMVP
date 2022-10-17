unit uAbastecimento.RecordTypes;

interface

uses
  System.SysUtils, uAbastecimento.EnumTypes;

type

  tBomba = record
    Id: Integer;
    CodigoTanque: Integer;
    Descricao: String;
    function ToString: String; 
  end;

  tAbastecimento = record
    Id: Integer;
    Data: TDate;
    CodigoBomba: Integer;
    Litros: Extended;
    ValorTotal: Extended;
    ValorImposto: Extended;
  end;

implementation

function tBomba.ToString: String;
begin
  Result := System.SysUtils.Format('%d - %s', [Self.Id, Self.Descricao]);
end;

end.