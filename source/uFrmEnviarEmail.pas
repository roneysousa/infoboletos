unit uFrmEnviarEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ACBrMail, types, ACBrBase, StdCtrls, ComCtrls, ExtCtrls,
  Buttons, DB, Grids, DBGrids;

type
  TFrmEnviarEmail = class(TForm)
    MainMenu1: TMainMenu;
    Opes1: TMenuItem;
    Configuraes1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlMensagem: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtSMTP: TEdit;
    edtPorta: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    cbkSSL: TCheckBox;
    cbkTSL: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    edtDE: TEdit;
    edtAssunto: TEdit;
    Label7: TLabel;
    mmoEmail: TMemo;
    ProgressBar1: TProgressBar;
    btnEnviar: TBitBtn;
    btnCancelar: TBitBtn;
    lblMensagem: TLabel;
    DBGrid1: TDBGrid;
    dsListaEmails: TDataSource;
    procedure Fechar1Click(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    // procedure ACBrMail1MailProcess(const aStatus: TMailStatus);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
    procedure Configuraes1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure CarregarDados();
    function ValidarEMail(aStr: string): Boolean;
    Procedure EnviarEmail();
  public
    { Public declarations }
  end;

var
  FrmEnviarEmail: TFrmEnviarEmail;
  bCancelar : Boolean;

implementation

uses untDMDados, uFrmConfigEmail, uFuncoes;

{$R *.dfm}

procedure TFrmEnviarEmail.Fechar1Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmEnviarEmail.btnEnviarClick(Sender: TObject);
begin
     if ufuncoes.Empty(edtSMTP.Text) then
     begin
         Application.MessageBox('Digite endereço do servidor SMTP.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
         edtSMTP.SetFocus;
         Exit;
     end;

     if ufuncoes.Empty(edtPorta.Text) then
     begin
         Application.MessageBox('Digite número da porta do servidor SMTP.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
         edtPorta.SetFocus;
         Exit;
     end;

     if ufuncoes.Empty(edtLogin.Text) then
     begin
         Application.MessageBox('Digite login do seu email.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
         edtLogin.SetFocus;
         Exit;
     end;
     //
     if ufuncoes.Empty(edtSenha.Text) then
     begin
         Application.MessageBox('Digite sua senha de e-mail.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
         edtSenha.SetFocus;
         Exit;
     end;
     //
     if ufuncoes.Empty(edtAssunto.Text) then
     begin
         Application.MessageBox('Digite o assunto do email.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
         edtAssunto.SetFocus;
         Exit;
     end;
     //
     if not (dsListaEmails.DataSet.IsEmpty) Then
     begin
          With dsListaEmails.DataSet do
          begin
               First;
               While not (Eof) do
               begin
                    if not uFuncoes.Empty(FieldByName('CDS_EMAIL_CLIENTE').AsString) and not (FieldByName('CDS_ENVIADO').AsBoolean) Then
                    begin
                       if (ValidarEMail(FieldByName('CDS_EMAIL_CLIENTE').AsString)) Then
                        begin
                            EnviarEmail();
                            //
                            Edit;
                            FieldByName('CDS_ENVIADO').AsBoolean := True;
                            //
                            Sleep(10);
                       End;
                    End;   
                    lblMensagem.Caption := 'Aguarde...';
                    Application.ProcessMessages;
                    //
                    lblMensagem.Caption := 'Aguarde...'+Inttostr(RecNo)+'/'+Inttostr(RecordCount);
                    // Próximo
                    dsListaEmails.DataSet.Next;
               End;  // While not (Eof) do
               //
               Application.ProcessMessages;
               Application.MessageBox('Email(s) enviado(s) com sucesso.',
                 'Concluído', MB_OK + MB_ICONINFORMATION+ MB_APPLMODAL );
          End;  // With dsListaEmails.DataSet do
          //
          Close;
     End;   // if not (dsListaEmails.DataSet.IsEmpty) Then
{
  ProgressBar1.Position := 1;
  Sleep(500);
  ACBrMail1.From := 'seu_email';
  ACBrMail1.FromName := 'seu_nome_opcional';
  ACBrMail1.Host := 'smtp.gmail.com'; // troque pelo seu servidor smtp
  ACBrMail1.Username := 'seu_usuario';
  ACBrMail1.Password := 'sua_senha';
  ACBrMail1.Port := '465'; // troque pela porta do seu servidor smtp
  ACBrMail1.AddAddress('um_email','um_nome_opcional');
  ACBrMail1.AddCC('um_email'); // opcional
  ACBrMail1.AddReplyTo('um_email'); // opcional
  ACBrMail1.AddBCC('um_email'); // opcional
  ACBrMail1.Subject := 'Teste de Envio'; // assunto
  ACBrMail1.IsHTML := False; // define que a mensagem é texto puro
  // mensagem principal do e-mail. pode ser html ou texto puro
  ACBrMail1.ReadingConfirmation := True; // solicita confirmação de leitura
  ACBrMail1.Body.Text := 'Mensagem em texto puro.';
  ACBrMail1.Send;
}
end;

procedure TFrmEnviarEmail.ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
begin
  ProgressBar1.Position := Integer( aStatus );

  case aStatus of
    pmsStartProcess:
    begin
      lblMensagem.Caption := 'Iniciando processo de envio.';
      ProgressBar1.Position := 10;
    end;
    pmsConfigHeaders:
     begin
         lblMensagem.Caption := 'Configurando o cabeçalho do e-mail.';
         ProgressBar1.Position := 20;
     End;
    pmsLoginSMTP:
      begin
          lblMensagem.Caption := 'Logando no servidor de e-mail.';
          ProgressBar1.Position := 30;
      End;
    pmsStartSends:
     begin
        ProgressBar1.Position := 50;
        lblMensagem.Caption := 'Iniciando os envios...'+ dsListaEmails.DataSet.FieldByName('CDS_EMAIL_CLIENTE').AsString;
     End;
    pmsSendTo:
      begin
           ProgressBar1.Position := 55;
           lblMensagem.Caption := 'Processando lista de destinatários.';
      End;
    pmsSendCC:
      lblMensagem.Caption := 'Processando lista CC.';
    pmsSendBCC:
      lblMensagem.Caption := 'Processando lista BCC.';
    pmsSendReplyTo:
      lblMensagem.Caption := 'Processando lista ReplyTo.';
    pmsSendData:
     begin
        ProgressBar1.Position := 60;
        lblMensagem.Caption := 'Enviando dados.';
     End;
    pmsLogoutSMTP:
      begin
         ProgressBar1.Position := 99;
         lblMensagem.Caption := 'Fazendo Logout no servidor de e-mail.';
      End;
    pmsDone:
    begin
      lblMensagem.Caption := 'Terminando e limpando.';
      ProgressBar1.Position := ProgressBar1.Max;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TFrmEnviarEmail.Configuraes1Click(Sender: TObject);
begin
      Application.CreateForm(TFrmConfigEmail, FrmConfigEmail);
      Try
            FrmConfigEmail.ShowModal;
      Finally
            FrmConfigEmail.Free;
      End;
      CarregarDados;
end;

procedure TFrmEnviarEmail.CarregarDados;
begin
     edtSMTP.Text  := dmDados.cdsConfigEmailSMTP.AsString;
     edtPorta.Text := dmDados.cdsConfigEmailPORTA.AsString;
     edtLogin.Text := dmDados.cdsConfigEmailLOGIN.AsString;
     edtDe.Text    := dmDados.cdsConfigEmailNOME_DE.AsString;
     edtAssunto.Text := dmDados.cdsConfigEmailASSUNTO.AsString;
     //
     cbkSSL.Checked := dmDados.cdsConfigEmailSSL.AsBoolean;
     cbkTSL.Checked := dmDados.cdsConfigEmailTSL.AsBoolean;
     //
     mmoEmail.Text := dmDados.cdsConfigEmailMENSAGEM.AsString;
end;

function TFrmEnviarEmail.ValidarEMail(aStr: string): Boolean;
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

procedure TFrmEnviarEmail.btnCancelarClick(Sender: TObject);
begin
    bCancelar := True;
end;

procedure TFrmEnviarEmail.FormShow(Sender: TObject);
begin
     //
     btnCancelar.Visible := false;
     //
     CarregarDados;
end;

procedure TFrmEnviarEmail.EnviarEmail;
Var
    ACBrMail1 : TACBrMail;
    aPastaAnexo, aArquivoAnexo : String;
begin
     aPastaAnexo   := ExtractFilePath(Application.ExeName)+'PDF\';
     aArquivoAnexo := aPastaAnexo+dsListaEmails.DataSet.FieldByName('CDS_NOME_ARQUIVO').AsString;
     ProgressBar1.Position := 1;
     Sleep(500);
     ACBrMail1 := TACBrMail.Create(nil);
     btnEnviar.Enabled := False;
     Application.ProcessMessages;
     Try
        ACBrMail1.OnMailProcess := ACBrMail1MailProcess;
        ACBrMail1.From     := dmDados.cdsConfigEmailLOGIN.AsString;    // 'one.supersonic2@gmail.com';
        ACBrMail1.FromName := dmDados.cdsConfigEmailNOME_DE.AsString;  // 'one.supersonic2@gmail.com';
        ACBrMail1.Host     := dmDados.cdsConfigEmailSMTP.AsString;     // 'smtp.gmail.com'; // troque pelo seu servidor smtp
        ACBrMail1.Username := dmDados.cdsConfigEmailLOGIN.AsString;    // 'one.supersonic2@gmail.com';
        ACBrMail1.Password := edtSenha.Text;    // edtSenha.Text;
        ACBrMail1.Port     := dmDados.cdsConfigEmailPORTA.AsString;   // troque pela porta do seu servidor smtp
        If (cbkSSL.Checked) Then
            ACBrMail1.SetSSL   := True
        Else
            ACBrMail1.SetSSL   := False;
        If (cbkTSL.Checked) Then
            ACBrMail1.SetTLS   := True
        Else
            ACBrMail1.SetTLS   := False;
        //
        ACBrMail1.AddAddress(UpperCase(dsListaEmails.DataSet.FieldByName('CDS_EMAIL_CLIENTE').AsString),dsListaEmails.DataSet.FieldByName('CDS_EMAIL_CLIENTE').AsString);
        //ACBrMail1.AddCC('roneynte@bol.com.br'); // opcional
        // ACBrMail1.AddReplyTo('um_email'); // opcional
        // ACBrMail1.AddBCC('um_email'); // opcional
        ACBrMail1.Subject := edtAssunto.Text;  // assunto
        ACBrMail1.IsHTML  := False; // define que a mensagem é html
        // mensagem principal do e-mail. pode ser html ou texto puro
        ACBrMail1.Body.Text  := mmoEmail.Lines.Text;
        if FileExists(aArquivoAnexo) Then
            ACBrMail1.AddAttachment(aArquivoAnexo,'');
        //
        ACBrMail1.Send;
        //
     Finally
          ACBrMail1.Free;
          btnEnviar.Enabled := True;
     End;
     Application.ProcessMessages;   
end;

end.
