unit uAbastecimento.View.uFrmRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.StdCtrls, Vcl.WinXPickers,
  Vcl.ExtCtrls, uAbastecimento.Model.Interfaces, Data.DB;

type
  TFrmRelatorio = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    dtInicio: TDatePicker;
    dtFim: TDatePicker;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel22: TRLLabel;
    RLLDtHora: TRLLabel;
    RLSysData: TRLSystemInfo;
    RLLabel39: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel8: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLLabel16: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel15: TRLLabel;
    RLBand4: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel17: TRLLabel;
    totalLitros: TRLLabel;
    totalValor: TRLLabel;
    Totalmposto: TRLLabel;
    procedure Button1Click(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FoModal: IEntidadeAbastecimento;
    FnTotalLitros: Extended;
    FnTotalValor: Extended;
    FnTotalImposto: Extended;
    procedure ExecutarRelatorio;
    procedure DefinirCaptionFiltro;
    { Private declarations }
  public
    class procedure New;
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

uses
  uAbastecimento.Model.Entidades.Abastecimento;

{$R *.dfm}

procedure TFrmRelatorio.Button1Click(Sender: TObject);
begin
  ExecutarRelatorio;
end;

class procedure TFrmRelatorio.New;
begin
  if (not Assigned(FrmRelatorio)) then
    Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  FrmRelatorio.FoModal := TModelEntidadesAbastecimento.New;
  FrmRelatorio.Show;
end;

procedure TFrmRelatorio.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FnTotalLitros  := FnTotalLitros +  DataSource1.DataSet.FieldByName('QTDELT').AsExtended;
  FnTotalValor   := FnTotalValor +  DataSource1.DataSet.FieldByName('VALORTOTAL').AsExtended;
  FnTotalImposto := FnTotalImposto +  DataSource1.DataSet.FieldByName('VALORIMPOSTO').AsExtended;
end;

procedure TFrmRelatorio.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  totalLitros.Caption := FormatFloat('0.00 L', FnTotalLitros);
  totalValor.Caption  := FormatFloat('R$ ,0.00', FnTotalValor);
  Totalmposto.Caption := FormatFloat('R$ ,0.00', FnTotalImposto);
end;

procedure TFrmRelatorio.ExecutarRelatorio;
begin
  FnTotalLitros  := 0;
  FnTotalValor   := 0;
  FnTotalImposto := 0;
  FoModal := TModelEntidadesAbastecimento.New;
  FoModal.ListarRelatorio(DataSource1, dtInicio.Date, dtFim.Date);
  DefinirCaptionFiltro;
  RLReport1.Preview();
end;

procedure TFrmRelatorio.DefinirCaptionFiltro;
begin
  RLLabel1.Caption := 'DE ' + FormatDateTime('dd/MM/yyyy', dtInicio.Date)
                       + ' ATÉ ' + FormatDateTime('dd/MM/yyyy', dtFim.Date);
end;

end.
