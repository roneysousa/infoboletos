program InfoBoletos;

uses
  Forms,
  untMenu in 'untMenu.pas' {FrmMainBoletos},
  untDMDados in 'untDMDados.pas' {dmDados: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uCodBarras in 'uCodBarras.pas',
  untSobre in 'untSobre.pas' {frmSobre},
  uFrmConfig in 'uFrmConfig.pas' {FrmConfig},
  uRecibo in 'uRecibo.pas' {frmRecibo},
  uRelRecibo in 'uRelRecibo.pas' {frmRelRecibo},
  uFrmLogin in 'uFrmLogin.pas' {frmLogin},
  wcrypt2 in 'wcrypt2.pas',
  uFrmListaCancelados in 'uFrmListaCancelados.pas' {FrmListaCanc},
  uFrmEnviarEmail in 'uFrmEnviarEmail.pas' {FrmEnviarEmail},
  uFrmConfigEmail in 'uFrmConfigEmail.pas' {FrmConfigEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TFrmMainBoletos, FrmMainBoletos);
  Application.Run;
end.
