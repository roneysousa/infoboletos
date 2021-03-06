unit uFrmConfigEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls, Mask, DBClient;

type
  TFrmConfigEmail = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsDados: TDataSource;
    Label1: TLabel;
    edtSMTP: TDBEdit;
    Label2: TLabel;
    edtPorta: TDBEdit;
    Label3: TLabel;
    edtLogin: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    ClientDataSet1: TClientDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigEmail: TFrmConfigEmail;

implementation

uses untDMDados, uFuncoes;

{$R *.dfm}

procedure TFrmConfigEmail.BitBtn2Click(Sender: TObject);
begin
     dmDados.cdsConfigEmail.Cancel;
end;

procedure TFrmConfigEmail.FormShow(Sender: TObject);
begin
     if (dmDados.cdsConfigEmail.RecordCount = 0) then
        dmDados.cdsConfigEmail.Append
     Else
        dmDados.cdsConfigEmail.Edit;
end;

procedure TFrmConfigEmail.BitBtn1Click(Sender: TObject);
begin
    if ufuncoes.Empty(edtSMTP.Text) then
     begin
          Application.MessageBox('Digite o servidor SMTP do email.',
            'Aten��o', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
          edtSMTP.SetFocus;
          Exit;
     end;
     //
     if  uFuncoes.Empty(edtPorta.Text) then
     begin
          Application.MessageBox('Digite a porta do servidor de email.',
            'Aten��o', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
          edtPorta.SetFocus;
          Exit;
     end;
     //
     if uFuncoes.Empty(edtLogin.Text) then
     begin
          Application.MessageBox('Digite o login do email.',
            'Aten��o', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
          edtLogin.SetFocus;
          Exit;
     end;
     //
     if (dmDados.cdsConfigEmail.State in [dsInsert, dsEdit]) then
     begin
        try
            With dmDados.cdsConfigEmail do
            begin
                Post;
                SaveToFile('ConfigEmail.xml', dfXML);
            end;
            //
            ModalResult := mrOk;
        Except
            on e: exception do
            begin
                raise Exception.Create('Erro ao tentar gravar dados! Erro:'+#13
                       + E.Message);
            End;
        end;
     end;
end;

end.
