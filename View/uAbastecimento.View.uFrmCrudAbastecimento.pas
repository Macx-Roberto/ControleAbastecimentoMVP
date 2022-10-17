unit uAbastecimento.View.uFrmCrudAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.StdCtrls,
  Vcl.NumberBox, Vcl.Buttons, uAbastecimento.RecordTypes, System.Generics.Collections,
  uAbastecimento.Service.Interfaces;

type
  TfrmCrudAbastecimento = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbBomba: TComboBox;
    edt_Litros: TNumberBox;
    edt_Valor: TNumberBox;
    edt_ValorImposto: TNumberBox;
    edt_Data: TDatePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btSalvar: TButton;
    btCancelar: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure edt_ValorChangeValue(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FrAbastecimento: tAbastecimento;
    FListBombas: TList<tBomba>;
    FoCalculoImposto: ICalculoImposto;
    procedure SetDadosComponentes;
    function GetDadosComponentes: tAbastecimento;
    function GetCodigoBomba: Integer;
    procedure SetItemsComboBomba(ABombas: TList<tBomba>);
    procedure SetIndexcbBomba(const AnCodigoBomba: Integer);
    procedure SetListBombas(ABombas: TList<tBomba>);
  public
    procedure IncluirAbastecimento;
    procedure EditarAbastecimento(const ArAbastecimento: tAbastecimento);
    function GetRecordAbastecimento: tAbastecimento;

   class function New(ABombas: TList<tBomba>; oCalculoImposto: ICalculoImposto): TfrmCrudAbastecimento;
    { Public declarations }
  end;

var
  frmCrudAbastecimento: TfrmCrudAbastecimento;

implementation

{$R *.dfm}

procedure TfrmCrudAbastecimento.IncluirAbastecimento;
begin
  cbBomba.ItemIndex := 0;
  FrAbastecimento.Id  := -1;
  FrAbastecimento.Data         := Now;
  FrAbastecimento.CodigoBomba  := GetCodigoBomba;
  FrAbastecimento.Litros       := 0;
  FrAbastecimento.ValorTotal   := 0;
  FrAbastecimento.ValorImposto := 0;
  SetDadosComponentes;
  ShowModal;
end;

procedure TfrmCrudAbastecimento.btCancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TfrmCrudAbastecimento.btSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCrudAbastecimento.EditarAbastecimento(const ArAbastecimento: tAbastecimento);
begin
  FrAbastecimento := ArAbastecimento;
  SetDadosComponentes;
  ShowModal;
end;

procedure TfrmCrudAbastecimento.edt_ValorChangeValue(Sender: TObject);
begin
  edt_ValorImposto.Value := FoCalculoImposto.CalcularImposto(edt_Valor.Value);
end;

procedure TfrmCrudAbastecimento.FormDestroy(Sender: TObject);
begin
  If Assigned(FListBombas) then
    FreeAndNil(FListBombas);
end;

function TfrmCrudAbastecimento.GetRecordAbastecimento: tAbastecimento;
begin
  FrAbastecimento := GetDadosComponentes;
  Result := FrAbastecimento;
end;

procedure TfrmCrudAbastecimento.SetDadosComponentes;
begin
  edt_Data.Date          := FrAbastecimento.Data;
  edt_Litros.Value       := FrAbastecimento.Litros;
  edt_Valor.Value        := FrAbastecimento.ValorTotal;
  edt_ValorImposto.Value := FrAbastecimento.ValorImposto;
  SetIndexcbBomba(FrAbastecimento.CodigoBomba);
end;

function TfrmCrudAbastecimento.GetDadosComponentes: tAbastecimento;
begin
  Result.Id           := FrAbastecimento.Id;
  Result.Data         := edt_Data.Date;
  Result.CodigoBomba  := GetCodigoBomba;
  Result.Litros       := edt_Litros.Value;
  Result.ValorTotal   := edt_Valor.Value;
  Result.ValorImposto := edt_ValorImposto.Value;
end;

function TfrmCrudAbastecimento.GetCodigoBomba: Integer;
begin
  Result := Integer(cbBomba.Items.Objects[cbBomba.ItemIndex]);
end;

class function TfrmCrudAbastecimento.New(ABombas: TList<tBomba>; oCalculoImposto: ICalculoImposto): TfrmCrudAbastecimento;
begin
  if (not Assigned(frmCrudAbastecimento)) then
    Application.CreateForm(TfrmCrudAbastecimento, frmCrudAbastecimento);
  frmCrudAbastecimento.SetListBombas(ABombas);
  frmCrudAbastecimento.FoCalculoImposto := oCalculoImposto;
  Result := frmCrudAbastecimento;
end;

procedure TfrmCrudAbastecimento.SetListBombas(ABombas: TList<tBomba>);
begin
  if Assigned(FListBombas) then
    FreeAndNil(FListBombas);
  FListBombas := ABombas;
  SetItemsComboBomba(FListBombas);
end;

procedure TfrmCrudAbastecimento.SetItemsComboBomba(ABombas: TList<tBomba>);
var
  bomba: tBomba;
begin
  cbBomba.Items.Clear;
  for bomba in ABombas do
    cbBomba.AddItem(bomba.ToString, TObject(bomba.Id));
end;

procedure TfrmCrudAbastecimento.SetIndexcbBomba(const AnCodigoBomba: Integer);
var
  i: Integer;
begin
  for i := 0 to Pred(cbBomba.GetCount) do
  begin
    cbBomba.ItemIndex := i;
    if GetCodigoBomba = AnCodigoBomba then
      Break;
  end;
end;

end.
