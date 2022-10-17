unit uAbastecimento.View.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.NumberBox,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons,
  uAbastecimento.Controller.Interfaces, uAbastecimento.Controller.ControllerPrincipal;

type
  TFrmPrincipalAB = class(TForm)
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnAtualizar: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    DsGrid: TDataSource;
    Editar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FoController: IControllerPrincipal;
    procedure CriarController;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipalAB: TFrmPrincipalAB;
implementation

{$R *.dfm}

procedure TFrmPrincipalAB.btnAtualizarClick(Sender: TObject);
begin
  FoController.ListarAbastecimentos;
end;

procedure TFrmPrincipalAB.btnExcluirClick(Sender: TObject);
begin
  FoController.ExcluirAbastecimento;
end;

procedure TFrmPrincipalAB.btnIncluirClick(Sender: TObject);
begin
  FoController.IncluirAbastecimento;
end;

procedure TFrmPrincipalAB.FormCreate(Sender: TObject);
begin
  CriarController;
  FoController.ListarAbastecimentos;
end;

procedure TFrmPrincipalAB.SpeedButton1Click(Sender: TObject);
begin
  FoController.ExibirFormRelatorio;
end;

procedure TFrmPrincipalAB.CriarController;
begin
  FoController := TControllerPrincipal.New;
  FoController.SetDataSouceGrid(DsGrid);
end;

procedure TFrmPrincipalAB.EditarClick(Sender: TObject);
begin
  FoController.EditarAbastecimento;
end;

end.
