unit untMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, Mask,
  ToolEdit, DB, Buttons, ActnList, ImgList, RpBase, RpSystem, RpDefine,
  RpRave, DBCtrls, Shellapi, Wcrypt2, RXCtrls ;

type
  TFrmMainBoletos = class(TForm)
    StatusBar1: TStatusBar;
    mmPrincipal: TMainMenu;
    mnuArquivo: TMenuItem;
    mnuSairItem: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridDados: TDBGrid;
    edtDTINIC: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    dsConsulta: TDataSource;
    btnConsulta: TBitBtn;
    lblRegistro: TLabel;
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    ActionList1: TActionList;
    actVisualizar: TAction;
    actImprimir: TAction;
    actConsulta: TAction;
    actFechar: TAction;
    ImageList1: TImageList;
    mnuVisualizarItem: TMenuItem;
    N1: TMenuItem;
    mnuImprimirItem: TMenuItem;
    actSobre: TAction;
    mnuAjuda: TMenuItem;
    Sobre1: TMenuItem;
    btnGeraPDF: TBitBtn;
    mnuLocalizar: TMenuItem;
    mnuClienteItem: TMenuItem;
    actLocCliente: TAction;
    btEtiqueta: TBitBtn;
    N2: TMenuItem;
    actConfig: TAction;
    Configuraes1: TMenuItem;
    edtNumPlaca: TMaskEdit;
    Label3: TLabel;
    btnCarne: TBitBtn;
    Memo1: TMemo;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    GroupBox1: TGroupBox;
    chkMultaJuros: TCheckBox;
    ckbMsg: TCheckBox;
    DBNavigator1: TDBNavigator;
    actEnviarEmail: TAction;
    N3: TMenuItem;
    mnuEnviarEmailItem: TMenuItem;
    rgTipoCarne: TRadioGroup;
    N4: TMenuItem;
    mnuReciboItem: TMenuItem;
    actListaCanc: TAction;
    ListadeCancelados1: TMenuItem;
    actGeraRemessa: TAction;
    N5: TMenuItem;
    GeraRemessa1: TMenuItem;
    cmbContaBancaria: TComboBox;
    Label4: TLabel;
    mnoListaMensagem: TMemo;
    cbkRegistro: TCheckBox;
    actEmailNew: TAction;
    mnuEnviarEmailClienteSelecionadoItem: TMenuItem;
    mnuEnviarTodosItem: TMenuItem;
    RxCheckListBoxGrupos: TRxCheckListBox;
    Label5: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridDadosDblClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINALKeyPress(Sender: TObject; var Key: Char);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actConsultaExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure edtDTINICChange(Sender: TObject);
    procedure DBGridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure btnGeraPDFClick(Sender: TObject);
    procedure actLocClienteExecute(Sender: TObject);
    procedure btEtiquetaClick(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure edtNumPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINALEnter(Sender: TObject);
    procedure edtDTINICEnter(Sender: TObject);
    procedure btnCarneClick(Sender: TObject);
    procedure actEnviarEmailExecute(Sender: TObject);
    procedure mnuReciboItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actListaCancExecute(Sender: TObject);
    procedure actGeraRemessaExecute(Sender: TObject);
    procedure cmbContaBancariaChange(Sender: TObject);
    procedure cmbContaBancariaClick(Sender: TObject);
    procedure actEmailNewExecute(Sender: TObject);
    procedure RxCheckListBoxGruposClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
    procedure Habilita_Botoes(aStatus : Boolean);
    procedure ExecutePrograma(Nome, Parametros: String);
  public
    { Public declarations }
    Procedure AbreForm(aClasseForm: TComponentClass; aForm : TForm);
    function MD5(const Input: string): string;
  end;

var
  FrmMainBoletos: TFrmMainBoletos;
  M_CODIGOBARRAS, M_DIGITOCODIGO : String;
  aArquivoLogoBanco : String;
  aCodUsuario, aNomeUsuario : String;

implementation

uses uFuncoes, untDMDados, untSobre, ZDataset, uFrmConfig, uCodBarras,
  uRecibo, uFrmLogin, uFrmListaCancelados, uFrmEnviarEmail;

{$R *.dfm}

procedure TFrmMainBoletos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := False;
     If Application.MessageBox('Sair do Programa?',
         'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
          CanClose := True;
          Application.Terminate;
     End;
end;

procedure TFrmMainBoletos.DBGridDadosDblClick(Sender: TObject);
Var
     aMsg, aMsgMultaJuro : String;
begin
    If (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty) then
    begin
         actVisualizarExecute(Self);
         {aMsg := 'N';
         aMsgMultaJuro := 'S';
         If (ckbMsg.Checked) Then
             aMsg := 'S';
         If not (chkMultaJuros.Checked) Then
            aMsgMultaJuro := 'N';
         dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                             1, 'V',  aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString);}
                             
    End;
end;

procedure TFrmMainBoletos.edtDTINICExit(Sender: TObject);
begin
     if not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
     begin
          try
              edtDTINIC.Date := StrToDate(edtDTINIC.Text);
          except
            on EConvertError do
            begin
                ShowMessage ('Data Inv�lida!');
                edtDTINIC.SetFocus;
            End;
          end;
     End;
end;

procedure TFrmMainBoletos.edtDTFINALExit(Sender: TObject);
begin
     if not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
     begin
          try
              edtDTFINAL.Date := StrToDate(edtDTFINAL.Text);
              //
              if (edtDTFINAL.Date < edtDTINIC.Date) Then
                  edtDTFINAL.Date := edtDTINIC.Date;
          except
            on EConvertError do
            begin
                ShowMessage ('Data Inv�lida!');
                edtDTFINAL.SetFocus;
            End;
          end;
     End;
end;

procedure TFrmMainBoletos.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
      begin
          key := #0;
          edtDTFINAL.SetFocus;
      End;
end;

procedure TFrmMainBoletos.edtDTFINALKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
      begin
          key := #0;
          btnConsulta.SetFocus;
      End;
end;

procedure TFrmMainBoletos.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
     if (dsConsulta.DataSet.Active) Then
      begin
         lblRegistro.Caption := 'Registro: '+ InttoStr(dsConsulta.DataSet.RecNo)+ '/'+ InttoStr(dsConsulta.DataSet.RecordCount);
         //
         actVisualizar.Enabled := not (dsConsulta.DataSet.IsEmpty);
         actImprimir.Enabled   := actVisualizar.Enabled;
         btnVisualizar.Enabled := not (dsConsulta.DataSet.IsEmpty);
         btnImprimir.Enabled   := btnVisualizar.Enabled;
         btnGeraPDF.Enabled    := btnVisualizar.Enabled;
         btEtiqueta.Enabled    := not (dsConsulta.DataSet.IsEmpty);
         btnCarne.Enabled      := not (dsConsulta.DataSet.IsEmpty);
         actEnviarEmail.Enabled := not (dsConsulta.DataSet.IsEmpty);
         actEmailNew.Enabled   := not (dsConsulta.DataSet.IsEmpty);
      End
     Else
         lblRegistro.Caption := 'Registro:';
end;

procedure TFrmMainBoletos.FormShow(Sender: TObject);
begin
     SetJustify(mmPrincipal,mnuAjuda,1);
     actVisualizar.Enabled := false;
     actImprimir.Enabled   := false;
     actEmailNew.Enabled   := false;
     actEnviarEmail.Enabled :=  false;
     //
     btnVisualizar.Enabled := false;
     btnImprimir.Enabled   := false;
     btnGeraPDF.Enabled    := false;
     btEtiqueta.Enabled    := false;
     btnCarne.Enabled      := false;
     // Grupos
     if (dmDados.AbrirGrupos()) Then
     begin
          With dmDados.ZQryGrupos do
          begin
               First;
               While not (Eof) do
               begin
                    RxCheckListBoxGrupos.Items.Add(uFuncoes.StrZero(FieldByName('id').AsString,2) +'-'+FieldByName('descricao').AsString);
                    //
                    Next;
               End;
          End;
     End;
     //
     If (fileexists(ExtractFilePath( Application.ExeName )+'msg.txt')) Then
     begin
          chkMultaJuros.Checked := false;
     End;
     //
     dmDados.CarregarComboContasBancaria(cmbContaBancaria);
end;

procedure TFrmMainBoletos.actFecharExecute(Sender: TObject);
begin
     If Application.MessageBox('Sair do Programa?',
          'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
         Application.Terminate;
end;

procedure TFrmMainBoletos.actVisualizarExecute(Sender: TObject);
Var
    aMsg, aMsgMultaJuro, M_IDVEIC : String;
    iContaBancaria : Integer;
begin
 If (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty) then
    begin
       Habilita_Botoes(false);
       try
         aMsg := 'N';
         If (ckbMsg.Checked) Then
             aMsg := 'S';
         aMsgMultaJuro := 'S';
         If not (chkMultaJuros.Checked) Then
            aMsgMultaJuro := 'N';
         //
         iContaBancaria := dmDados.GetIdContaBanco(dsConsulta.DataSet.FieldByName('id').AsInteger);
         if (iContaBancaria = 0) Then
              Raise Exception.Create('N�o h� contrato definido nesse registro de conta a receber!!!');
         //
         {dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                             iContaBancaria, 'V', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString);}
        { If Application.MessageBox('Visualizar com verso do boleto?',
            'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then   }
              dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                             iContaBancaria, 'V', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N')
        { Else
         begin
              dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                             iContaBancaria, 'V', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N');    }
             { Sleep(5);
              dmDados.ImprimirVerso(dsConsulta.DataSet.FieldByName('id').AsString, 'V');}
             {If ( dmDados.cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                 dmDados.GerarBoletoFrenteVerso(dsConsulta.DataSet.FieldByName('id').AsInteger,
                            iContaBancaria, 'V', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N')
             Else
                 dmDados.GerarBoletoFrenteVersoDetalhe(dsConsulta.DataSet.FieldByName('id').AsInteger,
                            iContaBancaria, 'V', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N');}
         //End;
       Finally
            Sleep(100);
            Habilita_Botoes(true);
       End;
       Application.ProcessMessages;
    End;
end;

procedure TFrmMainBoletos.actImprimirExecute(Sender: TObject);
Var
   aMsg, aMsgMultaJuro, aFlVerso, aPrimImp : String;
   iCont, iContaBancaria : Integer;
   bSomenteEmail : Boolean;
begin
//
   if (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty) Then
     If Application.MessageBox('Deseja imprimir todos os boletos ?',
          'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
          Habilita_Botoes(false);
          try
             aFlVerso := 'N';
             //
             {If Application.MessageBox('Imprimir verso do boleto?',
                'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then    }
                   aFlVerso := 'S';
            //
            With dsConsulta.DataSet do
            begin
                 DisableControls;
                 If not (cbkRegistro.Checked) Then
                     First;
                 //
                 aMsg := 'N';
                 If (ckbMsg.Checked) Then
                   aMsg := 'S';
                 aMsgMultaJuro := 'S';
                 If not (chkMultaJuros.Checked) Then
                    aMsgMultaJuro := 'N';
                 //
                 iCont := 1;
                 While not (Eof) do
                 begin
                     bSomenteEmail := false;
                     // Verifica se o cliente � s� por email o recebimento do boleto
                     bSomenteEmail :=  dmDados.VerificaSomenteEmailCliente(dsConsulta.DataSet.FieldByName('id').AsInteger);

                     if not (bSomenteEmail) Then
                     begin
                          iContaBancaria := dmDados.GetIdContaBanco(dsConsulta.DataSet.FieldByName('id').AsInteger);
                          //
                          if (iContaBancaria <> 0) Then
                          begin
                              //Raise Exception.Create('N�o h� contrato definido nesse registro de conta a receber!!!');
                           //
                           {If (aFlVerso = 'S') then
                           begin    }
                                if (iCont = 1) Then
                                    aPrimImp := 'S'
                                Else
                                    aPrimImp := 'N';
                                //
                                dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                                     iContaBancaria, 'I', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, aPrimImp);

                               { Sleep(5);
                                dmDados.ImprimirVerso(dsConsulta.DataSet.FieldByName('id').AsString, 'I');}
                                //
                                {If ( dmDados.cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                                       dmDados.GerarBoletoFrenteVerso(dsConsulta.DataSet.FieldByName('id').AsInteger,
                                           iContaBancaria, 'I', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, aPrimImp)
                                 Else
                                       dmDados.GerarBoletoFrenteVersoDetalhe(dsConsulta.DataSet.FieldByName('id').AsInteger,
                                           iContaBancaria, 'I', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, aPrimImp)}
                           //
                          { End
                           Else
                                dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                                iContaBancaria, 'I', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N'); }
                           //

                           iCont := iCont + 1;
                           Sleep(500);
                          End;     //  if (iContaBancaria <> 0) Then
                     End;        //  if not (bSomenteEmail) Then
                     //
                     Application.ProcessMessages;
                      Next;
                 End;
                 First;
                 EnableControls;
            End;
          Finally
              Habilita_Botoes(true);
          End;
          Application.ProcessMessages;
       End;
end;

procedure TFrmMainBoletos.actConsultaExecute(Sender: TObject);
Var
  aNumPlaca : String;
  idConta, i : Integer;
begin
    if uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
     begin
          edtDTINIC.SetFocus;
          Exit;
     End;
     //
     if uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
     begin
          edtDTFINAL.SetFocus;
          Exit;
     End;
     // Grupos
     dmDados.RefreshCDS(dmDados.cdsListaGrupos);
     dmDados.cdsListaGrupos.EmptyDataSet;
     //
     if (RxCheckListBoxGrupos.Items.Count > 0) Then
     begin
         for i := 0 to RxCheckListBoxGrupos.Items.Count - 1 do
         begin
              if (RxCheckListBoxGrupos.Checked[i]) Then
                   dmDados.AddGrupoLista(Copy(RxCheckListBoxGrupos.Items.Strings[i],1,2),
                                      Copy(RxCheckListBoxGrupos.Items.Strings[i],4,22));

                                    //Copy(RxCheckListBoxGrupos.Items.Text,3,22));
              End; // fim-do-para
     End;
     //
     aNumPlaca := '';
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtNumPlaca.Text)) Then
          aNumPlaca := edtNumPlaca.Text;
     //
     if not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text))
          and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
        begin
             idConta := 0;
             if not uFuncoes.Empty(cmbContaBancaria.Text) then
                 idConta := StrtoInt(Copy(cmbContaBancaria.Text, 1,2));
             //
             If not (dmDados.ConsultaPeriodo(edtDTINIC.Date, edtDTFINAL.Date, 'A',
                  aNumPlaca, idConta, dmDados.cdsListaGrupos)) Then
             begin
                   Application.MessageBox('N�o h� movimento no per�odo indicado!!!',
                      'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
             End;
        End;
end;

procedure TFrmMainBoletos.actSobreExecute(Sender: TObject);
begin
    //
    AbreForm(TfrmSobre, frmSobre);
end;

procedure TFrmMainBoletos.AbreForm(aClasseForm: TComponentClass;
  aForm: TForm);
begin
     Application.CreateForm(aClasseForm, aForm);
      try
          aForm.ShowModal;
      Finally
          aForm.Free;
      End;
end;

procedure TFrmMainBoletos.SetJustify(Menu: TMenu; MenuItem: TMenuItem;
  Justify: Byte);
var
    ItemInfo: TMenuItemInfo;
    Buffer: array[0..80] of Char;
begin
     ItemInfo.cbSize := SizeOf(TMenuItemInfo);
     ItemInfo.fMask := MIIM_TYPE;
     ItemInfo.dwTypeData := Buffer;
     ItemInfo.cch := SizeOf(Buffer);
     //
     GetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
     if Justify = 1 then
        ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
     SetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
end;

procedure TFrmMainBoletos.edtDTINICChange(Sender: TObject);
begin
    if uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text))
       and uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
        begin
            dmDados.ZQryCReceber.Close;
            btnVisualizar.Enabled := false;
            btnImprimir.Enabled   := false;
            btnGeraPDF.Enabled    := FALSE;
            lblRegistro.Caption   := 'Registro(s):';
        End;
end;

procedure TFrmMainBoletos.DBGridDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) and not (dsConsulta.DataSet.IsEmpty) Then
      begin
           key := #0;
           DBGridDadosDblClick(Sender);
      End;
end;

procedure TFrmMainBoletos.btnGeraPDFClick(Sender: TObject);
Var
   aNomePasta, aMsg,  aMsgMultaJuro: String;
   iContaBancaria :Integer;
begin
   if (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty) Then
     If Application.MessageBox('Deseja boletos em arquivo PDF ?',
          'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
            //
          Habilita_Botoes(false);
          dmDados.ExcluirArquivoLista();
          try
            StatusBar1.Panels[2].Text := '';
            With dsConsulta.DataSet do
            begin
                 DisableControls;
                 First;
                  aMsg := 'N';
                 If (ckbMsg.Checked) Then
                   aMsg := 'S';
                 aMsgMultaJuro := 'S';
                 If not (chkMultaJuros.Checked) Then
                    aMsgMultaJuro := 'N';
                   //
                 While not (Eof) do
                 begin
                      iContaBancaria := dmDados.GetIdContaBanco(dsConsulta.DataSet.FieldByName('id').AsInteger);
                      if (iContaBancaria = 0) Then
                         Raise Exception.Create('N�o h� contrato definido nesse registro de conta a receber!!!');
                      //
                      dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                             iContaBancaria, 'A', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N');
                      //
                      Sleep(50);
                      StatusBar1.Panels[2].Text := 'Aguarde... Registro: '+InttoStr(dsConsulta.DataSet.RecNo)+'::'+InttoStr(dsConsulta.DataSet.RecordCount);
                      Application.ProcessMessages;
                      Next;
                 End;
                 First;
                 EnableControls;
            End;
            //
            aNomePasta := ExtractFilePath( Application.ExeName )+'PDF';
            //
            Application.MessageBox(PChar('Arquivos gerados com sucesso na pasta: '+#13+aNomePasta),
                    'Conclu�do',  MB_OK+MB_ICONINFORMATION);
          Finally
              Habilita_Botoes(true);
              dsConsulta.DataSet.EnableControls;
              StatusBar1.Panels[2].Text := '';
          End;
          Application.ProcessMessages;
       End;
end;

procedure TFrmMainBoletos.Habilita_Botoes(aStatus: Boolean);
begin
     btnVisualizar.Enabled := aStatus;
     btnImprimir.Enabled   := aStatus;
     btnGeraPDF.Enabled    := aStatus;
     btEtiqueta.Enabled    := aStatus;
     btnCarne.Enabled      := aStatus;
end;

procedure TFrmMainBoletos.actLocClienteExecute(Sender: TObject);
var
  aNome : string;
begin
    If (dsConsulta.DataSet.Active)
      and not (dsConsulta.DataSet.IsEmpty) Then
    begin
         aNome := inputbox('Localiza Cliente','Digite o nome do cliente:','');
         if not ufuncoes.Empty(aNome) then
         begin
              if dsConsulta.DataSet.Locate('nome', UpperCase(aNome), [loPartialKey]) Then
                 DBGridDados.SetFocus;
         end;
    End;
end;

procedure TFrmMainBoletos.btEtiquetaClick(Sender: TObject);
begin
    //                  dmDados.ImprimirEtiquetaCliente(dsConsulta.DataSet.FieldByName('id_2').AsInteger, 'V');
    If (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty) Then
      begin
           //
           If Application.MessageBox(PChar('Confirma impress�o de etiqueta?'),
                 'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
           begin
             btEtiqueta.Enabled := false;
             try
                dmDados.ImprimirEtiquetas(dmDados.ZQryCReceber);
                {With dmDados.ZQryCReceber do
                begin
                     DisableControls;
                     First;
                     While not (Eof) do
                     begin
                          dmDados.ImprimirEtiquetaCliente(dsConsulta.DataSet.FieldByName('id_2').AsInteger, 'I');
                          //
                          Next;
                     End;
                     First;
                     EnableControls;
                End;}
             Finally
                btEtiqueta.Enabled := true;
             End;
           End;
      End;
end;

procedure TFrmMainBoletos.actConfigExecute(Sender: TObject);
begin
     AbreForm(TFrmConfig, FrmConfig);
end;

procedure TFrmMainBoletos.edtNumPlacaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key = #13) then
    begin
         key := #0;
         if (btnConsulta.Enabled) Then
            btnConsulta.SetFocus;
    End;
end;

procedure TFrmMainBoletos.edtDTFINALEnter(Sender: TObject);
begin
      edtNumPlaca.Clear;
end;

procedure TFrmMainBoletos.edtDTINICEnter(Sender: TObject);
begin
    edtNumPlaca.Clear;
end;

procedure TFrmMainBoletos.btnCarneClick(Sender: TObject);
Var
   M_CDCLIE, M_NMCLIE : String;
   M_NRDOCU, M_NRAGEN, M_DIAGEN, M_CDCEDE, M_DGNNUME, M_NRCONV, M_NRCART : String;
   M_LINHA, M_CDBARRA, M_DINOSSONUM : String;
   M_PEJURO, M_PEMULT, M_PEDESC, M_VLMULT, M_VLDESC, M_VLJURO : Double;
   M_MENSAGEM, M_NMCIDA, M_NMBAIR : String;
   M_FLIMPR : Boolean;
   M_CDCEDENTE : INTEGER;
   iUsuario, idContaReceber, idDocumento, idFatura, M_IDCLIE, idContaBancaria : Integer;
   X, aEnderecoCondominio : String;
   M_VLDOCU : Double;
   aDataVenc, M_IDVEIC, aNomeFantasia, aPlacaVeiculo, aNossoNumero : String;
   aMsgBanco, aPastaArquivoLogo, aCodBanco : String;
begin
 btnCarne.Enabled := false;
 try
   M_FLIMPR := False;
   aEnderecoCondominio := '';
   dmDados.RefreshCDS(dmDados.cdsConfig);
   dmDados.ZQryConfig.close;
   dmDados.ZQryConfig.open;
   //
   M_PEMULT := dmDados.ZQryConfigpercMulta.AsFloat;
   M_PEJURO := dmDados.ZQryConfigpercJuros.AsFloat;
   //
   If (dmDados.ZQryCReceber.Active) Then
   begin
           //
           dmDados.cds2Boletos.close;
           dmDados.cds2Boletos.Open;
           dmDados.cds2Boletos.EmptyDataSet;
           //
           With dmDados.ZQryCReceber do
            begin
                  DisableControls;
                  First;
                  While not (Eof) do
                    begin
                         aMsgBanco := 'PAG�VEL EM QUALQUER AG�NCIA BANC�RIA AT� A DATA DE VENCIMENTO';
                         idContaReceber := FieldByName('id').AsInteger;
                         untDMDados.CodBarras      := '';
                         untDMDados.LinhaDigitavel := '';
                         //
                         //
                         idContaBancaria := dmDados.GetIdContaBanco(idContaReceber);
                         //
                         dmDados.FilterDataSet(dmDados.ZQryContaBancaria, fsInteger, InttoStr(idContaBancaria));
                         //
                         If not (dmDados.ZQryContaBancaria.IsEmpty) Then
                          begin
                               M_NRAGEN := dmDados.ZQryContaBancariaagencia.AsString;
                               M_DIAGEN := uCodBarras.Modulo11(dmDados.ZQryContaBancarianumero_conta.AsString,9);
                               M_CDCEDE := dmDados.ZQryContaBancarianumero_conta.AsString+'-'+M_DIAGEN;
                               M_NRCONV := dmDados.ZQryContaBancarianumero_conta.AsString;
                               M_NRCART := dmDados.ZQryContaBancariacarteira.AsString;
                               // dmDados.cdsConfigCARTEIRA.AsString;
                               //
                               if not uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                                   aNomeFantasia := dmDados.cdsConfigFANTASIA.AsString;
                               //
                               If (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                                 aMsgBanco := 'PAGAR PREFER�NCIALMENTE NAS AG�NCIAS DO BRADESCO';
                               //
                               aPastaArquivoLogo := uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3)+'.bmp';
                          End
                          Else
                             raise Exception.Create('Erro ao tentar abrir configura��es do cedente.'
                                                   +#13+'Conta a Receber id: '+InttoStr(idContaReceber));
                         //
                         If (FieldByName('situacao').AsString = 'A')  Then
                          begin
                               //
                               With dmDados.ZQryBoleto do
                               begin
                                    Active := False;
                                    Params[0].AsInteger := idContaReceber;
                                    Active := True;
                                    //
                                    if not (IsEmpty) Then
                                    begin
                                         idDocumento := FieldByName('id').AsInteger;
                                         M_VLDOCU    := FieldByName('valor').AsFloat;
                                         idFatura    := FieldByName('fatura_id').AsInteger;
                                         aDataVenc   := FieldByName('data_vencimento').AsString;
                                         //
                                         M_IDVEIC := FieldByName('veiculo_id').AsString;
                                         // Abre Dados do veiculo
                                         dmDados.FilterDataSet(dmdados.ZQryVeiculo, fsString, M_IDVEIC);

                                         aPlacaVeiculo := dmDados.GetPlacaVeiculo(StrtoInt(M_IDVEIC));
                                         //
                                         If not (dmdados.ZQryVeiculo.IsEmpty) Then
                                            M_IDCLIE := dmdados.ZQryVeiculo.FieldByname('cliente_id').AsInteger;
                                         // Abre dados do cliente
                                         dmdados.FilterDataSet(dmdados.ZQryCliente, fsInteger, InttoStr(M_IDCLIE));
                                         //
                                         If (dmdados.ZQryCliente.IsEmpty) then
                                           ShowMessage('Cliente vazio.');
                                    End;
                               end;
                               //
                               M_DINOSSONUM := '';
                               //
                               M_CDCLIE := dmdados.ZQryVeiculo.FieldByname('cliente_id').AsString;
                               // 99/99/9999
                               //M_NRDOCU := uFuncoes.StrZero(FieldByName('id').AsString,10);
                               {Copy(FieldByName('REC_DATAEMISSAO').AsString,4,2)+'.'+
                                           Copy(FieldByName('REC_DATAEMISSAO').AsString,7,4);}
                               If uFuncoes.Empty(M_NRDOCU) Then
                                   M_NRDOCU := InttoStr(idDocumento);
                               //
                               dmDados.PrepararTitulo(idContaBancaria);
                               //
                               {idContaBancaria, idNumDocumento: Integer; M_FLSEGU: String}
                               dmDados.CONFIGURA_BOLETO(idContaBancaria, idDocumento , 'N');
                               //
                               M_NRDOCU := dmDados.gbTitulo1.NossoNumero;
                               //'24/'+dmDados.gbTitulo1.NossoNumero + '-'+uCodBarras.Modulo11('24'+dmDados.gbTitulo1.NossoNumero,9);
                                //
                                {+uCodBarras.Modulo11(NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +gbTitulo1.Cedente.ContaBancaria.fNumeroConta));}
                               //
                               {SetParam('Carteira', gbTitulo1.Carteira);
                               SetParam('NRDOCU', W_NRDOCU);  // NumeroDocumento}
                               //
                               // if (dmDados.cdsConfigCARTEIRA.AsString = '3') Then
                               if (dmDados.gbTitulo1.Carteira = 'SR') Then
                                   M_DGNNUME := uCodBarras.Modulo11('24000000'+uFuncoes.StrZero(dmDados.ZQryBoleto.FieldByName('id').AsString,9) ,9)
                                   { M_DGNNUME := uCodBarras.Modulo11(dmDados.ZQryContaBancariaagencia.AsString+dmDados.ZQryContaBancarianumero_conta.AsString+dmDados.cdsConfigCARTEIRA.AsString
                                                   +'0002' + '0004'+uFuncoes.StrZero(dmDados.ZQryBoleto.FieldByName('id').AsString,9) ,9)}
                               Else
                                begin
                                     if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                                     begin
                                         // SetParam('NOSSONUM', ZQryContaBancariacarteira.AsString+'/'+NossoNumero + '-'+aDigitoNossoNumeroNew)
                                         M_DGNNUME := untDMDados.aDigitoNossoNumeroNew;
                                         //uCodBarras.Modulo11(dmDados.ZQryContaBancariacarteira.AsString+dmDados.gbTitulo1.NossoNumero,7);
                                     End
                                     Else
                                         M_DGNNUME := uCodBarras.Modulo11('24'+dmDados.gbTitulo1.NossoNumero,9);
                                End;
                               {If (dmDados.cdsConfigCARTEIRA.AsInteger = 3) Then
                                   M_DGNNUME := uCodBarras.Modulo11(dmDados.gbTitulo1.NossoNumero,9);}
                               //
                               if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                                begin
                                     M_CDBARRA := untDMDados.CodBarras;
                                     M_LINHA   := untDMDados.LinhaDigitavel;
                                End
                                Else
                                begin
                                     M_CDBARRA := untDMDados.M_CODIGOBARRAS;
                                     M_LINHA   := uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CDBARRA);
                                End;
                               //
                               M_VLMULT := uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByName('valor').AsFloat, M_PEMULT),2);
                               M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(FieldByName('valor').AsFloat, M_PEJURO)/30),2);
                               //
                               M_NMCIDA := dmDados.GetNomeCidade(dmdados.ZQryClientecidade_id.AsInteger)+' - '+ dmDados.GetUFCidade(dmdados.ZQryClientecidade_id.AsInteger);
                               M_NMBAIR := dmDados.GetNomeBairro(dmdados.ZQryClientecidade_id.AsInteger, dmdados.ZQryClientebairro_id.AsInteger);
                               //
                               M_MENSAGEM := '';
                               Memo1.Lines.Clear;
                               {If (M_PEMULT > 0) Then
                                  Memo1.Lines.Add('MULTA DE '+FormatFloat('###,##0.#0',M_VLMULT)+' APOS: '+DatetoStr(FieldByName('data_vencimento').AsDateTime));
                               If (M_PEJURO > 0) Then
                                  Memo1.Lines.Add('JUROS DE '+FormatFloat('###,##0.#0',M_VLJURO)+' AO DIA');}
                               //
                               If (chkMultaJuros.Checked) Then
                               begin
                                    M_MENSAGEM := 'MULTA DE R$:  '+FormatFloat('##0.#0', M_VLMULT) +' APOS : '+FieldByName('data_vencimento').AsString+#13+
                                         'JUROS DE R$:  '+FormatFloat('##0.#0', M_VLJURO) +' AO DIA '+#13+#13+
                                         'N�O RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia;
                               End
                               Else
                               begin
                                    M_MENSAGEM := 'N�O RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia;
                               End;
                               //
                               If not uFuncoes.Empty(M_MENSAGEM) Then
                                  Memo1.Lines.Add(M_MENSAGEM);
                               //
                               {iSEQUENCIA, iCLIENTE: Integer;
                               aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO, aDOCUMENTO, aNOSSONUMERO,
                               aCARTEIRA, aCEP, aBOXMESA, aLINHA_DIGITAVEL, aCODIGO_BARRAS,
                               aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO: String;
                               aDESCRICAO: TStrings; aDTDOCU, aDTPROCESSAMENTO,
                               aDTVENCIMENTO: TDatetime; fVALOR}
                               aNossoNumero := '24/9'+uFuncoes.StrZero(FieldByName('id').AsString,14);
                               //If (dmDados.cdsConfigCARTEIRA.AsInteger = 3) Then
                               If (dmDados.gbTitulo1.Carteira = 'SR') Then
                                  aNossoNumero := '24'+uFuncoes.StrZero(FieldByName('id').AsString,15)
                               Else
                                begin
                                     if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                                         aNossoNumero := dmDados.ZQryContaBancariacarteira.AsString+'/'+uFuncoes.StrZero(FieldByName('id').AsString,11);
                                End;
                                //
                                Case dmDados.ZQryContaBancariabanco_id.AsInteger of
                                   104 : aCodBanco := '104-0';
                                   237 : aCodBanco := '237-2';
                                End;
                               //
                               dmDados.AddBoletoCliente(
                                  FieldByName('id').AsInteger, M_IDCLIE,
                                  dmdados.ZQryClientenome.AsString, dmdados.ZQryClientecpf_cnpj.AsString,
                                  dmdados.ZQryClientelogradouro.AsString+', '+dmdados.ZQryClientenumero.AsString,
                                  M_NMCIDA, M_NMBAIR, M_NRDOCU, aNossoNumero,
                                  M_NRCART, dmdados.ZQryClientecep.AsString,   // M_NRCONV+
                                  dmdados.ZQryClientecomplemento.AsString,
                                  M_LINHA, M_CDBARRA,
                                  M_NRAGEN, M_DIAGEN, M_CDCEDE, M_DGNNUME,
                                  Memo1.Lines, FieldByName('data_movimento').AsDatetime,
                                  FieldByName('data_movimento').AsDatetime, FieldByName('data_vencimento').AsDatetime,
                                  FieldByName('valor').AsFloat, aPlacaVeiculo, aMsgBanco, aPastaArquivoLogo, aCodBanco);
                          End;
                         //
                         Next;
                    End;
                  //
                  EnableControls;
            End;
            //
            If (rgTipoCarne.ItemIndex = 0) Then
            begin
                With dmDados.rv2Boletos do
                begin
                   {if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                       SetParam('CDBANC', dmDados.ZQryContaBancariabanco_id.AsString+'-2')
                   Else
                       SetParam('CDBANC', uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3));}
                   // SetParam('LOCAL_PAGAMENTO', dmDados.cdsConfigMENSAGEM2.AsString);
                   SetParam('CEDENTE_NOME', dmDados.cdsConfigRAZAO.AsString+ '  -  CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString));
                   //if (dmDados.cdsConfigCARTEIRA.AsString = '3') Then
                   If (dmDados.ZQryContaBancariacarteira.AsString = '02') Then
                       SetParam('Carteira', 'SR')
                   Else
                       SetParam('Carteira', uFuncoes.StrZero(dmDados.ZQryContaBancariacarteira.AsString,2));
                       // SetParam('Carteira', uFuncoes.StrZero(dmDados.cdsConfigCARTEIRA.AsString,2));

                   if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                      SetParam('Carteira', dmDados.ZQryContaBancariacarteira.AsString);

                   SetParam('ESPECIEDOC', 'DM');
                   //
                   SetParam('pFANTASIA',dmDados.cdsConfigFANTASIA.AsString);
                   SetParam('pEND_NOVO', dmDados.cdsConfigENDERECO.AsString);
                   //
                   SetParam('AGE_CEDENTE', M_NRAGEN+'/'+M_CDCEDE);
                   aArquivoLogoBanco := uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3)+'.bmp';   // 'logo_banco.bmp';
                   if not SysUtils.FileExists(aArquivoLogoBanco) Then
                     begin
                         ShowMessage('Logo do banco n�o encontrado.');
                         raise Exception.Create('Logo do banco n�o encontrado.');
                     End
                     Else
                         SetParam('pIMG', aArquivoLogoBanco);
                   {If FileExists(aArquivoLogoBanco) Then
                      SetParam('pIMG', aArquivoLogoBanco);}
                   //
                   {If Application.MessageBox('Clique em Sim - Impressora ou N�o - Visualizar?',
                         'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                    begin}
                        dmDados.RvSystem3.DefaultDest := rdPreview;
                        //
                    {End
                   Else
                    begin
                        dmDados.RvSystem3.DefaultDest := rdPrinter;
                        //
                    End;}
                   //
                   Execute;
              End;
          End;
          //
          If (rgTipoCarne.ItemIndex = 1) Then
          begin
                With dmDados.rv2BoletosRetratio do
                begin
                   {if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                       SetParam('CDBANC', dmDados.ZQryContaBancariabanco_id.AsString+'-2')
                   Else
                       SetParam('CDBANC', uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3));
                   SetParam('LOCAL_PAGAMENTO', dmDados.cdsConfigMENSAGEM2.AsString);}
                   SetParam('CEDENTE_NOME', dmDados.cdsConfigRAZAO.AsString+ '  -  CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString));
                   //if (dmDados.cdsConfigCARTEIRA.AsString = '3') Then
                   If (dmDados.ZQryContaBancariacarteira.AsString = '02') Then
                       SetParam('Carteira', 'SR')
                   Else
                       SetParam('Carteira', uFuncoes.StrZero(dmDados.ZQryContaBancariacarteira.AsString,2));
                       // dmDados.cdsConfigCARTEIRA.AsString
                   //
                   if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                       SetParam('Carteira', dmDados.ZQryContaBancariacarteira.AsString);

                   SetParam('ESPECIEDOC', 'DM');
                   //
                   SetParam('pFANTASIA',dmDados.cdsConfigFANTASIA.AsString);
                   SetParam('pEND_NOVO', dmDados.cdsConfigENDERECO.AsString);
                   //
                   SetParam('AGE_CEDENTE', M_NRAGEN+'/'+M_CDCEDE);
                   aArquivoLogoBanco := uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3)+'.bmp';   // 'logo_banco.bmp';
                   if not SysUtils.FileExists(aArquivoLogoBanco) Then
                     begin
                         ShowMessage('Logo do banco n�o encontrado.');
                         raise Exception.Create('Logo do banco n�o encontrado.');
                     End
                     Else
                         SetParam('pIMG', aArquivoLogoBanco);

                   {aArquivoLogoBanco := 'logo_banco.bmp';
                   If FileExists(aArquivoLogoBanco) Then
                      SetParam('pIMG', aArquivoLogoBanco);}
                   //
                   dmDados.RvSystem4.DefaultDest := rdPreview;
                   //
                   Execute;
              End;
          End;
          //
          If (rgTipoCarne.ItemIndex = 2) Then
           begin
                With dmDados.rvBoletoCarneIndividual do
                begin
                   {if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                       SetParam('CDBANC', dmDados.ZQryContaBancariabanco_id.AsString+'-2')
                   Else
                       SetParam('CDBANC', uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3));
                   SetParam('LOCAL_PAGAMENTO', dmDados.cdsConfigMENSAGEM2.AsString);}
                   SetParam('CEDENTE_NOME', dmDados.cdsConfigRAZAO.AsString+ '  -  CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString));
                   //if (dmDados.cdsConfigCARTEIRA.AsString = '3') Then
                   If (dmDados.ZQryContaBancariacarteira.AsString = '02') Then
                       SetParam('Carteira', 'SR')
                   Else
                       SetParam('Carteira', uFuncoes.StrZero(dmDados.ZQryContaBancariacarteira.AsString,2));
                       // dmDados.cdsConfigCARTEIRA.AsString
                   //
                   if (dmDados.ZQryContaBancariabanco_id.AsInteger = 237) Then
                       SetParam('Carteira', dmDados.ZQryContaBancariacarteira.AsString);

                   SetParam('ESPECIEDOC', 'DM');
                   //
                   SetParam('pFANTASIA',dmDados.cdsConfigFANTASIA.AsString);
                   SetParam('pEND_NOVO', dmDados.cdsConfigENDERECO.AsString);
                   //
                   SetParam('AGE_CEDENTE', M_NRAGEN+'/'+M_CDCEDE);
                   aArquivoLogoBanco := uFuncoes.StrZero(dmDados.ZQryContaBancariabanco_id.AsString,3)+'.bmp';   // 'logo_banco.bmp';
                   if not SysUtils.FileExists(aArquivoLogoBanco) Then
                     begin
                         ShowMessage('Logo do banco n�o encontrado.');
                         raise Exception.Create('Logo do banco n�o encontrado.');
                     End
                     Else
                         SetParam('pIMG', aArquivoLogoBanco);

                   {aArquivoLogoBanco := 'logo_banco.bmp';
                   If FileExists(aArquivoLogoBanco) Then
                      SetParam('pIMG', aArquivoLogoBanco);}
                   //
                   dmDados.RvSystem4.DefaultDest := rdPreview;
                   //
                   Execute;
              End;
           End;
   End;

  finally
       btnCarne.Enabled := true;
       dmDados.ZQryCReceber.EnableControls;
  End;
end;

procedure TFrmMainBoletos.actEnviarEmailExecute(Sender: TObject);
Var
    aMsg, aMsgMultaJuro : String;
    iContaBancaria : integer;
begin
   if not FileExists('ConfigEmail.xml') then
     begin
           Application.MessageBox('Arquivo de configura��o n�o encontrado.',
            'Aten��o', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
           Exit;
     end
     Else
     begin
          dmDados.cdsConfigEmail.Close;
          dmDados.cdsConfigEmail.LoadFromFile('ConfigEmail.xml');
          dmDados.cdsConfigEmail.open;
     end;
     //
     if not (dsConsulta.DataSet.IsEmpty) then
      begin
           // Limpa pasta
           dmDados.ExcluirArquivoLista();
           // Cria arquivo PDF
           aMsg := 'N';
           If (ckbMsg.Checked) Then
               aMsg := 'S';
           aMsgMultaJuro := 'S';
           If not (chkMultaJuros.Checked) Then
               aMsgMultaJuro := 'N';
           //
           If not (cbkRegistro.Checked) Then
             dsConsulta.DataSet.First;
           StatusBar1.Panels[2].Text := '';
           //
           While not (dsConsulta.DataSet.Eof) do
           begin
               iContaBancaria := dmDados.GetIdContaBanco(dsConsulta.DataSet.FieldByName('id').AsInteger);
               if (iContaBancaria <> 0) Then
                begin
                     if not Empty(dsConsulta.DataSet.FieldByName('email').AsString) Then
                      begin
                          dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                               iContaBancaria, 'A', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N');
                          //
                          Sleep(80);
                          StatusBar1.Panels[2].Text := 'Registro: '+ InttoStr(dsConsulta.DataSet.RecNo)+'::'+InttoStr(dsConsulta.DataSet.RecordCount);
                          Application.ProcessMessages;
                      End;
                End;
                //

                dsConsulta.DataSet.Next;
           End;
           //
           Application.CreateForm(TFrmEnviarEmail, FrmEnviarEmail);
           Try
                FrmEnviarEmail.ShowModal;
           Finally
                FrmEnviarEmail.Free;
           End;
           StatusBar1.Panels[2].Text := '';
           Application.ProcessMessages;
      End;
end;

procedure TFrmMainBoletos.ExecutePrograma(Nome, Parametros: String);
Var
 Comando: Array[0..1024] of Char;
 Parms: Array[0..1024] of Char;
begin
  StrPCopy (Comando, Nome);
  StrPCopy (Parms, Parametros);
  ShellExecute (0, Nil, Comando, Parms, Nil, SW_SHOWNORMAL);
end;

procedure TFrmMainBoletos.mnuReciboItemClick(Sender: TObject);
begin
      AbreForm(TfrmRecibo, frmRecibo);
end;

function TFrmMainBoletos.MD5(const Input: string): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashLen: DWORD;
  pbContent: PByte;
  i: Integer;
begin
  dwHashLen := 16;
  pbContent := Pointer(PChar(Input));
  Result := '';

  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result); 
end;

procedure TFrmMainBoletos.FormCreate(Sender: TObject);
begin
     FrmLogin := TFrmLogin.Create(Self);
     Try
         if FrmLogin.ShowModal <> mrOK then
         begin
              Messagedlg('Voc� n�o se logou corretamente. A aplica��o ser� encerrado!!', mtInformation, [mbOK],0);
              Application.Terminate;
         end;
     Finally
         FreeandNil(FrmLogin);
     End;
     //
     if not uFuncoes.Empty(aCodUsuario) and not uFuncoes.Empty(aNomeUsuario) Then
        StatusBar1.Panels[0].Text := aCodUsuario+' :: '+aNomeUsuario;
     //
     {if FileExists('EnvioEmail.exe') Then
         actEnviarEmail.Visible := true
     Else
         actEnviarEmail.Visible := false;}
end;

procedure TFrmMainBoletos.actListaCancExecute(Sender: TObject);
begin
     AbreForm(TFrmListaCanc, FrmListaCanc);
end;

procedure TFrmMainBoletos.actGeraRemessaExecute(Sender: TObject);
begin
      If not (dsConsulta.DataSet.IsEmpty) Then
      begin
           if (dmDados.GeraRemessaBanco(dsConsulta.DataSet)) Then
              Application.MessageBox(PChar('Arquivo '+untDMDados.aNomeArquivoRemessa+' gerado com sucesso.'),
                    'Conclu�do',  MB_OK+MB_ICONINFORMATION);
      End;
end;

procedure TFrmMainBoletos.cmbContaBancariaChange(Sender: TObject);
begin
     if not (dsConsulta.DataSet.IsEmpty) then
         dsConsulta.DataSet.Close;
end;

procedure TFrmMainBoletos.cmbContaBancariaClick(Sender: TObject);
begin
     if not (dsConsulta.DataSet.IsEmpty) then
         dsConsulta.DataSet.Close;
end;

procedure TFrmMainBoletos.actEmailNewExecute(Sender: TObject);
Var
    aMsg, aMsgMultaJuro : String;
    iContaBancaria : integer;
begin
   if not FileExists('ConfigEmail.xml') then
     begin
           Application.MessageBox('Arquivo de configura��o n�o encontrado.',
            'Aten��o', MB_OK + MB_ICONEXCLAMATION+ MB_APPLMODAL );
           Exit;
     end
     Else
     begin
          dmDados.cdsConfigEmail.Close;
          dmDados.cdsConfigEmail.LoadFromFile('ConfigEmail.xml');
          dmDados.cdsConfigEmail.open;
     end;
     //
     if not (dsConsulta.DataSet.IsEmpty) then
      begin
           // Limpa pasta
           dmDados.ExcluirArquivoLista();
           // Cria arquivo PDF
           aMsg := 'N';
           If (ckbMsg.Checked) Then
               aMsg := 'S';
           aMsgMultaJuro := 'S';
           If not (chkMultaJuros.Checked) Then
               aMsgMultaJuro := 'N';
           //
           iContaBancaria := dmDados.GetIdContaBanco(dsConsulta.DataSet.FieldByName('id').AsInteger);
           if (iContaBancaria = 0) Then
                 Raise Exception.Create('N�o h� contrato definido nesse registro de conta a receber!!!');
           //
           dmDados.GerarBoleto(dsConsulta.DataSet.FieldByName('id').AsInteger,
                     iContaBancaria, 'A', aMsg, aMsgMultaJuro, dsConsulta.DataSet.FieldByName('email').AsString, 'N');
           //
           Application.CreateForm(TFrmEnviarEmail, FrmEnviarEmail);
           Try
                FrmEnviarEmail.ShowModal;
           Finally
                FrmEnviarEmail.Free;
           End;
           Application.ProcessMessages;
      End;
end;

procedure TFrmMainBoletos.RxCheckListBoxGruposClick(Sender: TObject);
begin
     dsConsulta.DataSet.Close;
end;

end.

