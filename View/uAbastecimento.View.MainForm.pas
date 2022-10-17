unit uAbastecimento.View.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.NumberBox,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons,
  uAbastecimento.Controller.Interfaces, uAbastecimento.Controller.ControllerPrincipal;

type
  TFrmPrincipalAB = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnAtualizar: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    DsGrid: TDataSource;
    Editar: TSpeedButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FoController: IControllerPrincipal;
    procedure CriarController;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipalAB: TFrmPrincipalAB;


  {
    Requisitos funcionais:

1.	Preciso controlar os abastecimentos feitos durante cada dia,
  identificando a bomba utilizada, a quantidade de litros e o valor abastecido;

2.	Em cada abastecimento incide um imposto de 13% do valor abastecido,
e essa informa��o deve ser registrada;

3.	Cada bomba est� ligada a um tanque.
  No posto ABC existem dois tanques, um de gasolina e um de �leo diesel.
  Para cada tanque duas bombas de combust�vel;

4.	Tamb�m gostaria de um relat�rio em que os abastecimentos fossem agrupados,
exibindo o dia, o tanque, a bomba e o valor. E ao final do relat�rio a soma total do per�odo.

Requisitos n�o funcionais:
1.	A aplica��o deve ser simples (Minimum Viable Product);
2.	Utilize boas pr�ticas e conhecimentos que voc� julga interessantes;
3.	Caso sinta necessidade crie testes unit�rios/funcionais;
4.	A vers�o do Delphi fica a seu crit�rio, mas utilize apenas componentes/recursos nativos;
5.	Para constru��o do relat�rio utilize o Fortes Report;
6.	Utilizar banco de dados firebird ou sqlite  (enviar junto com o projeto o script de cria��o do banco) .

Requisitos n�o funcionais que ser�o bem pontuados:
1.	Tempo de Entrega.
2.	Usar github para publica��o do projeto
3.	Usar Delphi XE6
4.	Orienta��o a Objetos
5.	Rtti, Helpers
6.	Firedac
  }

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
