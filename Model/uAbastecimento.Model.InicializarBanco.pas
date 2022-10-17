unit uAbastecimento.Model.InicializarBanco;

interface

type
  TInicializarBanco = class
    class procedure InicializarDB;
  end;

implementation

uses
  uAbastecimento.Model.Entidades.Tanque, uAbastecimento.Model.Interfaces, uAbastecimento.Model.Entidades.Bomba,
  uAbastecimento.RecordTypes, uAbastecimento.EnumTypes, uAbastecimento.Model.Query.Firedac,
  uAbastecimento.Model.Conexao.Firedac, Data.DB;

class procedure TInicializarBanco.InicializarDB;
var
  oQuery: IQuery;

  function TestarPossuiTabelas: Boolean;
  begin
    oQuery.SQL('select name from sqlite_master where type="table"');
    Result := (not oQuery.DataSet.IsEmpty) and (oQuery.DataSet.RecordCount = 3);
  end;

  procedure InicializarTanques;
  var
    oModelTanque: IEntidadeTanque;
  begin
    oQuery.Execute('CREATE TABLE TANQUE (ID INTEGER PRIMARY KEY, TPCOMBUSTIVEL INTEGER NOT NULL)');
    oModelTanque := TModelEntidadesTanque.New();
    oModelTanque.Inserir(tcbGasolina);
    oModelTanque.Inserir(tcbGasolina);
    oModelTanque.Inserir(tcbDiesel);
    oModelTanque.Inserir(tcbDiesel);
  end;

  procedure InicializarBombas;
  var
    rBomba: tBomba;
    oModelBomba: IEntidadeBomba;
  begin
    oQuery.Execute('CREATE TABLE BOMBA (ID INTEGER PRIMARY KEY,	ID_TANQUE INTEGER, DESCRICAO TEXT(100),' +
                   ' FOREIGN KEY (ID_TANQUE) REFERENCES TANQUE (ID))');
    oModelBomba := TModelEntidadesBomba.New();
    
    rBomba.CodigoTanque := 1;
    rBomba.Descricao    := 'Gasolina A';
    oModelBomba.Inserir(rBomba);

    rBomba.Descricao    := 'Gasolina B';
    oModelBomba.Inserir(rBomba);

    rBomba.CodigoTanque := 2;
    rBomba.Descricao    := 'Diesel A';
    oModelBomba.Inserir(rBomba);
    
    rBomba.Descricao    := 'Diesel B';
    oModelBomba.Inserir(rBomba);
  end;

  procedure InicializarAbastecimento;
  begin
    oQuery.Execute('CREATE TABLE ABASTECIMENTO (ID INTEGER PRIMARY KEY, DATA TEXT(20) NOT NULL,	ID_BOMBA INTEGER, ' +
  	               'QTDELT REAL NOT NULL, ValorTotal REAL NOT NULL, 	ValorImposto REAL NOT NULL,' +
                   ' FOREIGN KEY (ID_BOMBA) REFERENCES BOMBA (ID))');
  end;


begin
  oQuery := TModelQueryFiredac.New(TModelConexaoFiredac.New()); 
  if TestarPossuiTabelas then
    Exit;

  InicializarTanques;
  InicializarBombas;
  InicializarAbastecimento;
end;


end.

