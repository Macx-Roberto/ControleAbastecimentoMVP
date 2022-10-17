program Abastecimento;

uses
  Vcl.Forms,
  uAbastecimento.Model.Conexao.Firedac in 'Model\uAbastecimento.Model.Conexao.Firedac.pas',
  uAbastecimento.Model.Entidades.Abastecimento in 'Model\uAbastecimento.Model.Entidades.Abastecimento.pas',
  uAbastecimento.Model.Entidades.Bomba in 'Model\uAbastecimento.Model.Entidades.Bomba.pas',
  uAbastecimento.Model.Entidades.Tanque in 'Model\uAbastecimento.Model.Entidades.Tanque.pas',
  uAbastecimento.Model.InicializarBanco in 'Model\uAbastecimento.Model.InicializarBanco.pas',
  uAbastecimento.Model.Interfaces in 'Model\uAbastecimento.Model.Interfaces.pas',
  uAbastecimento.Model.Query.Firedac in 'Model\uAbastecimento.Model.Query.Firedac.pas',
  uAbastecimento.Model.Utils in 'Model\uAbastecimento.Model.Utils.pas',
  uAbastecimento.View.MainForm in 'View\uAbastecimento.View.MainForm.pas' {FrmPrincipalAB},
  uAbastecimento.View.uFrmCrudAbastecimento in 'View\uAbastecimento.View.uFrmCrudAbastecimento.pas' {frmCrudAbastecimento},
  uAbastecimento.RecordTypes in 'Records\uAbastecimento.RecordTypes.pas',
  uAbastecimento.EnumTypes in 'Enum\uAbastecimento.EnumTypes.pas',
  uAbastecimento.Controller.ControllerCrudAbastecimento in 'Controller\uAbastecimento.Controller.ControllerCrudAbastecimento.pas',
  uAbastecimento.Controller.ControllerPrincipal in 'Controller\uAbastecimento.Controller.ControllerPrincipal.pas',
  uAbastecimento.Controller.Factory.Interfaces in 'Controller\uAbastecimento.Controller.Factory.Interfaces.pas',
  uAbastecimento.Controller.Factory.Query in 'Controller\uAbastecimento.Controller.Factory.Query.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TInicializarBanco.InicializarDB;
  Application.CreateForm(TFrmPrincipalAB, FrmPrincipalAB);
  Application.CreateForm(TfrmCrudAbastecimento, frmCrudAbastecimento);
  Application.Run;
end.
