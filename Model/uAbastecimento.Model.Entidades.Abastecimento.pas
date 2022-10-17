unit uAbastecimento.Model.Entidades.Abastecimento;

interface

uses
  uAbastecimento.Model.Interfaces, Data.DB, uAbastecimento.RecordTypes, System.SysUtils;

type

  TModelEntidadesAbastecimento = class(TInterfacedObject, IEntidadeAbastecimento)
  private
    FoQuery: IQuery;
    function ConsultarID: Integer;
    procedure Inserir(const ArAbastecimento: tAbastecimento);
    procedure Update(const ArAbastecimento: tAbastecimento);
    procedure ConsultarAbastecimento(AcWhere: String);
    procedure SetValuesToDataSet(const ArAbastecimento: tAbastecimento);
  public
    class function New: IEntidadeAbastecimento;
    constructor Create;
    
    function Listar(ADataSource: TDataSource): IEntidadeAbastecimento;
    function Salvar(ArAbastecimento: tAbastecimento): Integer;
    procedure Excluir(AnIdAbastecimento: Integer);
    function ListarRelatorio(ADataSource: TDataSource; AdtInicio: Tdate; AdtFim: Tdate): IEntidadeAbastecimento;
  end;

implementation

uses
  uAbastecimento.Controller.Factory.Query;

class function TModelEntidadesAbastecimento.New: IEntidadeAbastecimento;
begin
  Result := Create;
end;

constructor TModelEntidadesAbastecimento.Create;
begin
  FoQuery := TControllerFactoryQuery.New.GetQuery(nil);
end;


function TModelEntidadesAbastecimento.Listar(ADataSource: TDataSource): IEntidadeAbastecimento;
begin
  Result := Self;
  ConsultarAbastecimento('0=0');
  ADataSource.DataSet := FoQuery.DataSet;
end;

function TModelEntidadesAbastecimento.Salvar(ArAbastecimento: tAbastecimento): Integer;
begin
  if ArAbastecimento.Id <= 0 then
    Inserir(ArAbastecimento)
  else
    Update(ArAbastecimento);
  Result := ConsultarID;
end;

function TModelEntidadesAbastecimento.ConsultarID: Integer;
begin
  Result := FoQuery.SQL(
    'SELECT MAX(ID) AS ID FROM ABASTECIMENTO'
  ).DataSet.FieldByName('ID').AsInteger;  
end;

procedure TModelEntidadesAbastecimento.Inserir(const ArAbastecimento: tAbastecimento);
begin
  ConsultarAbastecimento('(0=1)');
  FoQuery.DataSet.Append;
  SetValuesToDataSet(ArAbastecimento);
  FoQuery.DataSet.Post;
end;

procedure TModelEntidadesAbastecimento.Update(const ArAbastecimento: tAbastecimento);
begin
  ConsultarAbastecimento('ID = ' + ArAbastecimento.Id.ToString);
  FoQuery.DataSet.Edit;
  SetValuesToDataSet(ArAbastecimento);
  FoQuery.DataSet.Post;
end;

procedure TModelEntidadesAbastecimento.ConsultarAbastecimento(AcWhere: String);
begin
  FoQuery.SQL('SELECT * FROM ABASTECIMENTO WHERE ' + AcWhere);
end;

procedure TModelEntidadesAbastecimento.SetValuesToDataSet(const ArAbastecimento: tAbastecimento);
begin
  if (ArAbastecimento.Id > 0) and (FoQuery.DataSet.FieldByName('ID').AsInteger <= 0) then
    FoQuery.DataSet.FieldByName('ID').AsInteger := ArAbastecimento.Id;

  FoQuery.DataSet.FieldByName('DATA').AsString           := FormatDateTime('yyyy-MM-dd', ArAbastecimento.Data);
  FoQuery.DataSet.FieldByName('ID_BOMBA').AsInteger      := ArAbastecimento.CodigoBomba;
  FoQuery.DataSet.FieldByName('QTDELT').AsExtended       := ArAbastecimento.Litros;
  FoQuery.DataSet.FieldByName('ValorTotal').AsExtended   := ArAbastecimento.ValorTotal;
  FoQuery.DataSet.FieldByName('ValorImposto').AsExtended := ArAbastecimento.ValorImposto;
end;

procedure TModelEntidadesAbastecimento.Excluir(AnIdAbastecimento: Integer);
begin
  FoQuery.Execute(Format('DELETE FROM ABASTECIMENTO WHERE ID = %d', [AnIdAbastecimento]));
end;

function TModelEntidadesAbastecimento.ListarRelatorio(ADataSource: TDataSource; AdtInicio: Tdate; AdtFim: Tdate): IEntidadeAbastecimento;
begin
  FoQuery.SQL('SELECT A.DATA, A.QTDELT, A.ValorTotal, A.ValorImposto, ' +
              ' B.DESCRICAO AS DESC_BOMBA, B.ID_TANQUE ' +
              ' FROM ABASTECIMENTO A ' +  
              ' INNER JOIN BOMBA B ON B.ID = A.ID_BOMBA ' +
              Format(' WHERE Date(A.DATA) >= %s and Date(A.DATA) <= %s ORDER BY A.DATA',
                     [QuotedStr(FormatDateTime('yyyy-MM-dd', AdtInicio)),
                      QuotedStr(FormatDateTime('yyyy-MM-dd', AdtFim))]));
  ADataSource.DataSet := FoQuery.DataSet;
end;

end.