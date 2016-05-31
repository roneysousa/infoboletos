unit untDMDados;

interface

uses
  SysUtils, Classes, ZConnection, Forms, DB, DBClient, Windows,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, gbCobranca, RpBase,
  RpSystem, RpDefine, RpRave, RpCon, RpConDS, RpRender, RpRenderPDF,
  Dialogs, FileCtrl, Provider, ACBrBase, ACBrBoleto, ACBrUtil,
  RVClass, RVProj, RVCsStd, StdCtrls, MidasLib;

type
  TTypeLocalizar = (fsInteger, fsString);
  TdmDados = class(TDataModule)
    ZConexao: TZConnection;
    cdsConexao: TClientDataSet;
    cdsConfigHost: TStringField;
    cdsConfigDataBase: TStringField;
    cdsConfigUser: TStringField;
    cdsConfigPass: TStringField;
    cdsConfigPort: TIntegerField;
    cdsConfigProtocolo: TStringField;
    ZQryCReceber: TZQuery;
    ZQryCReceberid: TIntegerField;
    ZQryCReceberdata_movimento: TDateField;
    ZQryCReceberdata_vencimento: TDateField;
    ZQryCRecebervalor: TFloatField;
    ZQryCRecebervalor_juros: TFloatField;
    ZQryCRecebervalor_multa: TFloatField;
    ZQryCRecebervalor_desconto: TFloatField;
    ZQryCReceberdata_pagamento: TDateField;
    ZQryCRecebersituacao: TStringField;
    RvBoleto: TRvProject;
    RvSystem1: TRvSystem;
    gbCobranca1: TgbCobranca;
    gbTitulo1: TgbTitulo;
    ZQryBoleto: TZQuery;
    ZQryBoletoid: TIntegerField;
    ZQryBoletodata_movimento: TDateField;
    ZQryBoletodata_vencimento: TDateField;
    ZQryBoletovalor: TFloatField;
    ZQryBoletovalor_juros: TFloatField;
    ZQryBoletovalor_multa: TFloatField;
    ZQryBoletovalor_desconto: TFloatField;
    ZQryBoletodata_pagamento: TDateField;
    ZQryBoletosituacao: TStringField;
    ZQryBoletofatura_id: TIntegerField;
    ZQryCliente: TZQuery;
    ZQryContaBancaria: TZQuery;
    ZQryContaBancariaid: TIntegerField;
    ZQryContaBancariabanco_id: TIntegerField;
    ZQryContaBancariaagencia: TStringField;
    ZQryContaBancarianumero_conta: TStringField;
    ZQryContaBancariadescricao: TStringField;
    ZQryContaBancarianome: TStringField;
    ZQryVeiculo: TZQuery;
    ZQryClienteid: TIntegerField;
    ZQryClientetipo_pessoa: TStringField;
    ZQryClientecpf_cnpj: TStringField;
    ZQryClientenome: TStringField;
    ZQryClientelogradouro: TStringField;
    ZQryClientenumero: TStringField;
    ZQryClientecomplemento: TStringField;
    ZQryClientereferencia: TStringField;
    ZQryClientecep: TStringField;
    ZQryClientecidade_id: TIntegerField;
    ZQryClientebairro_id: TIntegerField;
    ZQryClientenome_pai: TStringField;
    ZQryClientenome_mae: TStringField;
    ZQryClienteidentidade: TStringField;
    ZQryClienteemissor: TStringField;
    ZQryClienteuf_emissor: TStringField;
    ZQryClienteestado_civil: TStringField;
    ZQryClientefone_residencial: TStringField;
    ZQryClientefone_comercial: TStringField;
    ZQryClientecelular1: TStringField;
    ZQryClientecelular2: TStringField;
    ZQryClientenome_referencia1: TStringField;
    ZQryClientefone_referencia1: TStringField;
    ZQryClientenome_referencia2: TStringField;
    ZQryClientefone_referencia2: TStringField;
    ZQryClientecreated_at: TDateTimeField;
    ZQryClienteupdated_at: TDateTimeField;
    ZQryClientecorretor_id: TIntegerField;
    ZQryClienteemail: TStringField;
    ZQryClienteemail_alternativo: TStringField;
    ZQryClientesite: TStringField;
    ZQryClienteapelido: TStringField;
    ZQryClientedata_nascimento: TDateField;
    rvdsBoleto: TRvDataSetConnection;
    rvdsBanco: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    ZQryCRecebernome: TStringField;
    ZQryCRecebercpf_cnpj: TStringField;
    ZQryCRecebertipo_pessoa: TStringField;
    ZQryCReceberCPFCNPJ: TStringField;
    SaveDialog1: TSaveDialog;
    RvEtiqueta: TRvProject;
    rvdCliente: TRvDataSetConnection;
    RvSystem2: TRvSystem;
    ZQryClienteCLI_NMCIDA: TStringField;
    ZQryClienteCLI_NMBAIRR: TStringField;
    ZQryClienteCLI_NUMCEP: TStringField;
    ZQryConfig: TZQuery;
    ZQryConfigid: TIntegerField;
    ZQryConfigpercMulta: TFloatField;
    ZQryConfigpercJuros: TFloatField;
    cdsListaClientes: TClientDataSet;
    cdsListaClientesCDS_CODIGO: TIntegerField;
    cdsListaClientesCDS_NOME: TStringField;
    cdsListaClientesCDS_NRPLACA: TStringField;
    cdsListaClientesCDS_LOGRADOURO: TStringField;
    cdsListaClientesCDS_NUMERO: TStringField;
    cdsListaClientesCDS_BAIRRO: TStringField;
    cdsListaClientesCDS_CIDADE: TStringField;
    cdsListaClientesCDS_UF: TStringField;
    cdsListaClientesCDS_CEP: TStringField;
    rvdListaClientes: TRvDataSetConnection;
    rvpListaClientes: TRvProject;
    cdsListaClientesCDS_COMPLEMENTO: TStringField;
    cdsListaClientesCDS_REFERENCIA: TStringField;
    ZQryMovTaxas: TZQuery;
    ZQryMovTaxasfatura_id: TIntegerField;
    ZQryMovTaxastaxa_id: TIntegerField;
    ZQryMovTaxasvalor: TFloatField;
    ZQryMovTaxasdescricao: TStringField;
    cdsConfig: TClientDataSet;
    cdsConfigCNPJ: TStringField;
    cdsConfigRAZAO: TStringField;
    cdsConfigFANTASIA: TStringField;
    cdsConfigENDERECO: TMemoField;
    cdsConfigMENSAGEM1: TStringField;
    cdsConfigMENSAGEM2: TStringField;
    cdsConfigLOGO: TGraphicField;
    cdsConfigID: TIntegerField;
    cdsConfigCARTEIRA: TStringField;
    cds2Boletos: TClientDataSet;
    cds2BoletosCDS_SEQUENCIA: TIntegerField;
    cds2BoletosCDS_CLIENTE: TIntegerField;
    cds2BoletosCDS_NMCLIENTE: TStringField;
    cds2BoletosCDS_CPF: TStringField;
    cds2BoletosCDS_ENDERECO: TStringField;
    cds2BoletosCDS_CIDADE: TStringField;
    cds2BoletosCDS_BAIRRO: TStringField;
    cds2BoletosCDS_DESCRICAO: TMemoField;
    cds2BoletosCDS_DOCUMENTO: TStringField;
    cds2BoletosCDS_NOSSONUMERO: TStringField;
    cds2BoletosCDS_DTDOCU: TDateField;
    cds2BoletosCDS_DTPROCESSAMENTO: TDateField;
    cds2BoletosCDS_DTVENCIMENTO: TDateField;
    cds2BoletosCDS_CARTEIRA: TStringField;
    cds2BoletosCDS_VALOR: TFloatField;
    cds2BoletosCDS_CEP: TStringField;
    cds2BoletosCDS_BOXMESA: TStringField;
    cds2BoletosCDS_LINHA_DIGITAVEL: TStringField;
    cds2BoletosCDS_CODIGO_BARRAS: TStringField;
    cds2BoletosCDS_AGENCIA: TStringField;
    cds2BoletosCDS_DIAGEN: TStringField;
    cds2BoletosCDS_CDCEDENTE: TStringField;
    cds2BoletosCDS_DG_NNUMERO: TStringField;
    rv2Boletos: TRvProject;
    RvSystem3: TRvSystem;
    rvdst2Boletos: TRvDataSetConnection;
    rvdstCedente: TRvDataSetConnection;
    cdsCedente: TClientDataSet;
    cdsCedenteCODIGO: TIntegerField;
    cdsCedenteCEDENTE_NOME: TStringField;
    cdsCedenteCEDENTE_CODIGO: TStringField;
    cdsCedenteCEDENTE_CODIGO_DIGITO: TStringField;
    cdsCedenteBANCO_CODIGO: TStringField;
    cdsCedenteBANCO_NOME: TStringField;
    cdsCedenteAGENCIA_CODIGO: TStringField;
    cdsCedenteAGENCIA_DIGITO: TStringField;
    cdsCedenteAGENCIA_NOME: TStringField;
    cdsCedenteCONTA_NUMERO: TStringField;
    cdsCedenteCONTA_NUMERO_DIGITO: TStringField;
    cdsCedentePROXIMO_NOSSO_NUMERO: TIntegerField;
    cdsCedenteTIPO_INSCRICAO: TStringField;
    cdsCedenteNUMERO_INSCRICAO: TStringField;
    cdsCedenteRUA: TStringField;
    cdsCedenteNUMERO: TIntegerField;
    cdsCedenteCOMPLEMENTO: TStringField;
    cdsCedenteBAIRRO: TStringField;
    cdsCedenteCIDADE: TStringField;
    cdsCedenteESTADO: TStringField;
    cdsCedenteCEP: TStringField;
    cdsCedenteEMAIL: TStringField;
    cdsCedenteLOGO_BANCO: TBlobField;
    cdsCedenteINICIO_NOSSO_NUMERO: TStringField;
    cdsCedenteNUMERO_CONVENIO: TStringField;
    cdsCedenteACEITE: TStringField;
    cdsCedenteTIPO_BOLETO: TIntegerField;
    cdsCedenteCARTEIRA: TStringField;
    cds2BoletosCDS_NRITEM: TIntegerField;
    cds2BoletosCDS_TOTREG: TIntegerField;
    ZQryVeiculomarca: TStringField;
    ZQryVeiculomodelo: TStringField;
    ZQryVeiculochassi: TStringField;
    ZQryVeiculosituacao: TStringField;
    ZQryVeiculocliente_id: TIntegerField;
    ZQryVeiculoobservacao: TMemoField;
    ZQryVeiculodata_cadastro: TDateField;
    ZQryVeiculodata_alteracao: TDateTimeField;
    ZQryVeiculoano_modelo: TIntegerField;
    ZQryVeiculoano_fabricacao: TIntegerField;
    ZQryVeiculocor: TStringField;
    ZQryVeiculobanco_financiado: TStringField;
    ZQryVeiculocombustivel: TStringField;
    ZQryVeiculogaragem: TStringField;
    ZQryBoletodata_baixa: TDateField;
    ZQryBoletodescricao: TMemoField;
    ZQryCReceberidveiculo: TIntegerField;
    ZQryCRecebercliente: TIntegerField;
    ZQryCReceberplaca: TStringField;
    ZQryVeiculoplaca: TStringField;
    ZQryVeiculoid: TIntegerField;
    ZQryVeiculocontrato_id: TIntegerField;
    ZQryVeiculorenavam: TLargeintField;
    ZQryMovTaxasveiculo_id: TIntegerField;
    ZQryBoletoveiculo_id: TIntegerField;
    cds2BoletosCDS_NRPLACA: TStringField;
    ZQryCReceberemail: TStringField;
    rv2BoletosRetratio: TRvProject;
    RvSystem4: TRvSystem;
    ZQryUsuario: TZQuery;
    ZQryUsuarioid: TIntegerField;
    ZQryUsuarionome: TStringField;
    ZQryUsuariosenha: TStringField;
    ZQryListaCancelados: TZQuery;
    dspListaCanc: TDataSetProvider;
    cdsListaCancelados: TClientDataSet;
    ZQryListaCanceladosveiculo_id: TIntegerField;
    ZQryListaCanceladossituacao: TStringField;
    ZQryListaCanceladosplaca: TStringField;
    ZQryListaCanceladossituacao_1: TStringField;
    ZQryListaCanceladoscodigo_cli: TIntegerField;
    ZQryListaCanceladosnome: TStringField;
    ZQryListaCanceladoslogradouro: TStringField;
    ZQryListaCanceladosnumero: TStringField;
    ZQryListaCanceladoscidade_id: TIntegerField;
    ZQryListaCanceladosbairro_id: TIntegerField;
    ZQryListaCanceladoscep: TStringField;
    ZQryListaCanceladoscomplemento: TStringField;
    ZQryListaCanceladosreferencia: TStringField;
    cdsListaCanceladosveiculo_id: TIntegerField;
    cdsListaCanceladossituacao: TStringField;
    cdsListaCanceladosplaca: TStringField;
    cdsListaCanceladossituacao_1: TStringField;
    cdsListaCanceladoscodigo_cli: TIntegerField;
    cdsListaCanceladosnome: TStringField;
    cdsListaCanceladoslogradouro: TStringField;
    cdsListaCanceladosnumero: TStringField;
    cdsListaCanceladoscidade_id: TIntegerField;
    cdsListaCanceladosbairro_id: TIntegerField;
    cdsListaCanceladoscep: TStringField;
    cdsListaCanceladoscomplemento: TStringField;
    cdsListaCanceladosreferencia: TStringField;
    ZQryFatura: TZQuery;
    ZQryFaturaid: TIntegerField;
    ZQryFaturamensagem_boleto: TMemoField;
    RvBoletoFreteVerso: TRvProject;
    rvAvisoCancelamento: TRvProject;
    RvSystem5: TRvSystem;
    rvdAvisoCancelamento: TRvDataSetConnection;
    ZQryListaCanceladosfone_residencial: TStringField;
    ZQryListaCanceladoscelular1: TStringField;
    cdsListaCanceladosfone_residencial: TStringField;
    cdsListaCanceladoscelular1: TStringField;
    cdsListaCanceladosNOME_CIDADE: TStringField;
    cdsListaCanceladosNOME_BAIRRO: TStringField;
    rvListaEntregaCanc: TRvProject;
    ZQryContaBancariaagencia_digito: TStringField;
    ZQryContaBancariaconvenio: TStringField;
    ZQryContaBancariadigito_conta: TIntegerField;
    ZQryContaBancariacodigo_cedente: TStringField;
    ZQryContaBancariacarteira: TStringField;
    ACBrBoleto: TACBrBoleto;
    cds2BoletosCDS_LOCAL_PAGAMENTO: TStringField;
    cds2BoletosCDS_LOGO_BANCO: TGraphicField;
    cds2BoletosCDS_CODIGO_BANCO: TStringField;
    ZQryClienteRemessa: TZQuery;
    ZQryClienteRemessaid: TIntegerField;
    ZQryClienteRemessaveiculo_id: TIntegerField;
    ZQryClienteRemessacliente_id: TIntegerField;
    ZQryClienteRemessatipo_pessoa: TStringField;
    ZQryClienteRemessacpf_cnpj: TStringField;
    ZQryClienteRemessanome: TStringField;
    ZQryClienteRemessalogradouro: TStringField;
    ZQryClienteRemessanumero: TStringField;
    ZQryClienteRemessacep: TStringField;
    ZQryClienteRemessanome_cidade: TStringField;
    ZQryClienteRemessanome_bairro: TStringField;
    ZQryClienteRemessauf_emissor: TStringField;
    ZQryCReceberplano_conta_id: TIntegerField;
    ZQryBoletoplano_conta_id: TIntegerField;
    cdsConfigMODELO_TEXTO_BOLETO: TStringField;
    RvSystemBoletoFreteVerso: TRvSystem;
    RvBoletoFreteVersoDetalhe: TRvProject;
    RvSysFreteVersoDetalhe: TRvSystem;
    RvSystemVerso: TRvSystem;
    RvBoletoVerso: TRvProject;
    rvdsConfig: TRvDataSetConnection;
    ZQryClienteEnderecoCompleto: TStringField;
    cdsListaEmails: TClientDataSet;
    cdsListaEmailsCDS_IDREGISTRO: TIntegerField;
    cdsListaEmailsCDS_EMAIL_CLIENTE: TStringField;
    cdsListaEmailsCDS_NOME_ARQUIVO: TStringField;
    cdsConfigEmail: TClientDataSet;
    cdsConfigEmailSMTP: TStringField;
    cdsConfigEmailPORTA: TIntegerField;
    cdsConfigEmailLOGIN: TStringField;
    cdsConfigEmailSENHA: TStringField;
    cdsConfigEmailNOME_DE: TStringField;
    cdsConfigEmailASSUNTO: TStringField;
    cdsConfigEmailMENSAGEM: TBlobField;
    cdsConfigEmailSSL: TBooleanField;
    cdsConfigEmailTSL: TBooleanField;
    ZQryGrupos: TZQuery;
    ZQryGruposid: TIntegerField;
    ZQryGruposdescricao: TStringField;
    cdsListaGrupos: TClientDataSet;
    cdsListaGruposgru_codigo: TIntegerField;
    cdsListaGruposgru_descricao: TStringField;
    cdsListaEmailsCDS_ENVIADO: TBooleanField;
    rvBoletoCarneIndividual: TRvProject;
    cdsListaEmailsCDS_MSG_ERRO: TStringField;
    procedure ZConexaoBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ZQryCReceberCalcFields(DataSet: TDataSet);
    procedure ZQryClienteCalcFields(DataSet: TDataSet);
    procedure cds2BoletosCalcFields(DataSet: TDataSet);
    procedure cdsListaCanceladosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    Function TestConnection(DataSet : TClientDataSet) : Boolean;
    Procedure AddEmailLista(aEmail, aArquivo : String);
  public
    { Public declarations }
    Procedure GetError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    Function ConsultaPeriodo(aDtInicio, aDtFinal : TDatetime; aSituacao, aNumPlaca : String;
          idContaBancaria : Integer; aCdsItensGrupos : TClientDataSet): Boolean;
    Function GerarBoleto(idContaReceber, idContaBancaria : Integer; aTipo, aMsg, aMsgMultaJuros, aEmail, aPrimeiraImp : String) : Boolean;
    Function ImprimirVerso(idRecebimento, aTipoImpressao : String) : Boolean;
    Function GerarBoletoFrenteVerso(idContaReceber, idContaBancaria : Integer; aTipo, aMsg, aMsgMultaJuros, aEmail, aPrimeiraImp : String) : Boolean;
    Function GerarBoletoFrenteVersoDetalhe(idContaReceber, idContaBancaria : Integer; aTipo, aMsg, aMsgMultaJuros, aEmail, aPrimeiraImp : String) : Boolean;
    Procedure FilterDataSet(aCds : TZQuery; aType : TTypeLocalizar ; aBusca : String);
    procedure PrepararTitulo(idContaBancaria : integer);
    procedure CONFIGURA_BOLETO(idContaBancaria, idNumDocumento : Integer; M_FLSEGU : String);
    Function GetNomeBairro(idCidade, idBairro : Integer): String;
    Function GetNomeCidade(idCidade : Integer): String;
    Function GetUFCidade(idCidade : Integer): String;
    Procedure ImprimirEtiquetaCliente(idCliente : Integer;aTipo : String);
    Procedure ImprimirEtiquetas(aCds : TDataSet);  // TClientDataSet
    Procedure ImprimirEtiquetasCancelados(aCds : TDataSet);  // TClientDataSet
    Function GetPlacaCpfCnpjCliente(iContaReceber : Integer): String;
    Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
    procedure RefreshCDS(aDateSet : TClientDataSet);
    Function AddBoletoCliente(iSEQUENCIA, iCLIENTE : Integer;
           aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO,
           aDOCUMENTO, aNOSSONUMERO, aCARTEIRA, aCEP, aBOXMESA,
           aLINHA_DIGITAVEL, aCODIGO_BARRAS, aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO : String;
           aDESCRICAO : TStrings; aDTDOCU, aDTPROCESSAMENTO, aDTVENCIMENTO : TDatetime; fVALOR: Double;
           aPlaca, aLocalPagamento, aArquivoLogo, aCodigoBanco : String) : Boolean;
    Function SetCodigoBarras(aNossoNumero: String; aDtVenc : TDatetime; fValor : Double): Boolean;
    Function GetPlacaVeiculo(idVeiculo : Integer): String;
    Procedure ExcluirArquivoLista();
    Procedure ApagarArquivoPDF();
    function ProcurarValor(aValor, aCampo, aTabela : String) : Boolean;
    Function AddBoletoLista(idContaBancaria, idNumDocumento : Integer; objBoleto : TACBrBoleto; aTipoBoletoArquivo : String): Boolean;
    Procedure ListadeBoletos();
    Function GeraRemessaBanco(aCDs : TDataset): Boolean;
    Procedure CarregaImagemRave(NomeProjeto: TRvProject;    NomeRelatorio, NomeImagem, PathImagem: String);
    Function GetIdContaBanco(idContaReceber : Integer) : Integer;
    Function GetIdContaBancariaRemessa(iCodBanco : Integer) : Integer;
    Function GetIdContrato(idContaReceber : Integer) : Integer;
    Procedure CarregarComboContasBancaria(aCmb : TComboBox);
    Function AbrirGrupos(): Boolean;
    Function AddGrupoLista(aCodigo, aDescricao : String): Boolean;
    // Function VerificaSomenteEmailCliente(idCliente : Integer): Boolean;
    Function VerificaSomenteEmailCliente(idContasReceber : Integer): Boolean;
  end;

var
  dmDados: TdmDados;
  aLocalHost : String;
  stPath : String;
  M_CODIGOBARRAS, M_DIGITOCODIGO : String;
  aArquivoLogoRel : String;
  NomeDoLista: string;
  M_CNPJ_INFOG2 : String;
  CodBarras, LinhaDigitavel, aDigitoNossoNumeroNew : String;
  aNomeArquivoRemessa : String;

implementation

uses uFuncoes, uCodBarras, untMenu;

{$R *.dfm}

function TdmDados.TestConnection(DataSet: TClientDataSet): Boolean;
begin
     Result := False;
     //
     if Assigned(DataSet) Then
      begin
          try
            with ZConexao do
            begin
                // Connected := False;
                User      := DataSet.FieldByName('User').AsString;
                Password  := DataSet.FieldByName('Pass').AsString;
                Protocol  := DataSet.FieldByName('Protocolo').AsString;
                Port      := DataSet.FieldByName('Port').AsInteger;
                HostName  := DataSet.FieldByName('Host').AsString;
                Database  := DataSet.FieldByName('DataBase').AsString;
                // DB codepage
                Properties.Values['codepage'] := 'ISO8859_1';
                // Client side encoding
                Properties.Values['client_encoding'] := 'ISO8859_1';
                // Connected := True;
                //
                Result := True;
            End;
          Except
             on e: exception do
             begin
                 Application.MessageBox(PChar('Erro na abertura do Sistema!!! Erro:'+#13
                        + E.Message),
                       'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                 ZConexao.Connected := False;
                 Result := False;
                 Application.Terminate;
             End;
          End;
      End;
end;

procedure TdmDados.ZConexaoBeforeConnect(Sender: TObject);
begin
     stPath := ExtractFilePath(Application.ExeName) + 'Connection.xml';
     cdsConexao.LoadFromFile(stPath);
     If TestConnection(cdsConexao) Then
          aLocalHost := ZConexao.HostName;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
Var
 I : Integer;
 stPathConfig, aRetorno : String;
begin
     stPath := ExtractFilePath(Application.ExeName) + 'Connection.xml';
     stPathConfig := ExtractFilePath(Application.ExeName) + 'Config.xml';
     //
     If not FileExists(stPath) Then
      begin
         try
           with ZConexao do
           begin
               Connected := False;
               User      := 'postgres';
               Password  := 'admg2';
               Protocol  := 'postgresql-7';
               Port      := 5432;
               HostName  := 'localhost';
               Database  := 'infoseguro';
               Connected := True;
               //
               aLocalHost := HostName;
           End;
           //

        Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro na abertura do Sistema!!! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              ZConexao.Connected := False;
              Application.Terminate;
          End;
        End;
      End
      Else
      begin

           try
               {  cdsConexao.LoadFromFile(stPath);
                 If TestConnection(cdsConexao) Then}

                ZConexao.Connected := true;
                aLocalHost := ZConexao.HostName;
                //
                If not FileExists(stPathConfig) Then
                begin
                     cdsConfig.SaveToFile('Config.xml');
                End
                Else
                begin
                     cdsConfig.LoadFromFile('Config.xml');
                End;
                //
                cdsConfig.Open;
           //
           Except
             on e: exception do
             begin
                 Application.MessageBox(PChar('Erro na abertura do Sistema!!! Erro:'+#13
                        + E.Message),
                       'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                 ZConexao.Connected := False;
                 Application.Terminate;
             End;
           End;
      End;
      //
      for I := 0 to Pred(ComponentCount) do
          if Components[i] is TClientDataSet  then
             begin
                 TClientDataSet(Components[i]).OnReconcileError := getError;
             end;
      //
      aRetorno := ExtractFilePath( Application.ExeName )+'Remessa';

      if not DirectoryExists(aRetorno) then
        ForceDirectories(aRetorno);

      //cds2Boletos.CreateDataSet;
      ACBrBoleto.DirArqRemessa := aRetorno;
      //
      NomeDoLista := ExtractFilePath( Application.ExeName )+'listaemail.txt';
      M_CNPJ_INFOG2 := '07042296000152';
end;

procedure TdmDados.DataModuleDestroy(Sender: TObject);
begin
     ZConexao.Connected := False;
end;

procedure TdmDados.GetError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
     Application.MessageBox(PChar('Ocorreu um erro ao tentar gravar o registro. '+#13+
                  'Mensagem Original : '+ E.Message), 'Atenção',MB_OK+MB_ICONSTOP);
end;

function TdmDados.ConsultaPeriodo(aDtInicio, aDtFinal: TDatetime;
  aSituacao, aNumPlaca : String; idContaBancaria : Integer; aCdsItensGrupos : TClientDataSet): Boolean;
Var
   aTextoSQL : String;
begin
     Result := false;
     //
     aTextoSQL := 'Select cr.id, cr.data_movimento, cr.data_vencimento, cr.valor, cr.valor_juros, cr.valor_multa, cr.valor_desconto, ';
     aTextoSQL := aTextoSQL + ' cr.data_pagamento, cr.situacao, cr.plano_conta_id, v.id as idveiculo, v.placa, cl.id as cliente, cl.nome, ';
     aTextoSQL := aTextoSQL + ' cl.cpf_cnpj, cl.tipo_pessoa, cl.email, co.id as Num_Contrato, co.grupo_id as Grupo from contas_receber cr ';
     aTextoSQL := aTextoSQL + ' inner join veiculos v on cr.veiculo_id = v.id ';
     //if (idContaBancaria > 0) Then
     aTextoSQL := aTextoSQL + ' inner join contratos co on v.contrato_id = co.id  ';
     aTextoSQL := aTextoSQL + ' inner join clientes cl on v.cliente_id = cl.id ';
     aTextoSQL := aTextoSQL + ' where (cr.data_vencimento >= :pDTINIC) and (cr.data_vencimento <= :pDTFINAL) ';
     aTextoSQL := aTextoSQL + ' and (cr.situacao = :pSituacao) ';
     // Grupos
     if not (aCdsItensGrupos.IsEmpty) Then
      begin
           With aCdsItensGrupos do
           begin
                First;
                aTextoSQL := aTextoSQL + ' and ( ';
                While not (Eof) do
                 begin
                      aTextoSQL := aTextoSQL + ' (co.grupo_id = '+ InttoStr(FieldByName('gru_codigo').AsInteger)+') ';
                      //
                      Next;
                      //
                      if not (Eof) then
                        aTextoSQL := aTextoSQL + ' or ';
                 End;
                 //
                 aTextoSQL := aTextoSQL + ') ';
           End; // aCdsItensGrupos
      End;
     //
     if (idContaBancaria > 0) Then
        aTextoSQL := aTextoSQL + 'and (co.banco = '+InttoStr(idContaBancaria)+') ';
     if not uFuncoes.Empty(aNumPlaca) Then
         aTextoSQL := aTextoSQL + ' and (v.placa = '+QuotedStr(aNumPlaca)+') ';
     aTextoSQL := aTextoSQL + 'order by cl.nome ';
     //
     With ZQryCReceber do
     begin
          DisableControls;
          SQL.Clear;
          Close;
          SQL.Add(aTextoSQL);
          Params.ParamByName('pDTINIC').AsDate  := aDtInicio;
          Params.ParamByName('pDTFINAL').AsDate := aDtFinal;
          Params.ParamByName('pSituacao').AsString := 'A';
          Open;
          EnableControls;
          //
          If not (IsEmpty) Then
            Result := true;
     End;
end;

function TdmDados.GerarBoleto(idContaReceber, idContaBancaria: Integer;
  aTipo, aMsg, aMsgMultaJuros, aEmail, aPrimeiraImp: String): Boolean;
Var
   idDocumento, M_IDCLIE, idFatura : Integer;
   M_IDVEIC, W_NRDOCU, X: String;
   M_VLMULT, M_PEJURO, M_VLJURO, M_VLDOCU, fTotalTaxa  : Double;
   W_DATA : TDatetime;
   aNomePasta, aNomeArquivo, aLinhaTaxa, aValorTaxa : String;
   aNomeTaxa, aPlacaCPF_CNPJ, aDataVenc, aNomeFantasia, sNrPlaca : String;
   iDigitoNossoNumero, aLogoBanco : String;
   aListaMensagem : TStringList ;
begin
     Result := False;
     //
     If uFuncoes.Empty(cdsConfigCARTEIRA.AsString) Then
     begin
          ShowMessage('Campo código carteira está vazio.');
          Exit;
     End;
     //
     try
         try
             ZQryConfig.close;
             ZQryConfig.Open;
             //
             With ZQryBoleto do
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
                        FilterDataSet(ZQryVeiculo, fsString, M_IDVEIC);
                        //
                        If not (ZQryVeiculo.IsEmpty) Then
                           M_IDCLIE := ZQryVeiculo.FieldByname('cliente_id').AsInteger;
                        // Abre dados do cliente
                        FilterDataSet(ZQryCliente, fsInteger, InttoStr(M_IDCLIE));
                        //
                        sNrPlaca := GetPlacaVeiculo(StrtoInt(M_IDVEIC));
                        //
                   End;
              end;
             //
             If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
                 aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
             //
             PrepararTitulo(idContaBancaria);
             //
             {idContaBancaria, idNumDocumento: Integer; M_FLSEGU: String}
             CONFIGURA_BOLETO(idContaBancaria, idDocumento , 'N');
             //
             W_NRDOCU := uFuncoes.StrZero(InttoStr(idDocumento),10);
             //
             //RPDev.Orientation := poPortrait;
             RVSystem1.SystemPrinter.Orientation   := poPortrait;
             {RPDev.SetPaperSize(DMPAPER_A4,0,0);
             RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);}
             if not uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                 aNomeFantasia := dmDados.cdsConfigFANTASIA.AsString
             Else
                 aNomeFantasia := 'COOPERSEGURO LTDA';
             //
             //objRelatorio := ;
             //RvBoleto := TRvProject.Create(nil);
             With RvBoleto do  //
             begin
                  M_VLMULT := uFuncoes.Gerapercentual(M_VLDOCU, ZQryConfigpercMulta.AsFloat);
                  M_PEJURO := ZQryConfigpercJuros.AsFloat;
                  // valorparcela, juros, multa, dias, parcelas
                  M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU + M_VLMULT, M_PEJURO)/30),2);
                  //uFuncoes.Arredondar((uFuncoes.Gerapercentual(dmRelatorios.cdsConsultaCotaREC_TOTAL_CALC.AsFloat + M_VLMULT, dmAdmDados.cdsConfigCFG_JUROS.AsFloat)/30),2);
                  {uFuncoes.CalcularJuros(dmRelatorios.cdsConsultaCotaREC_TOTAL_CALC.AsFloat,
                             dmAdmDados.cdsConfigCFG_JUROS.AsFloat,M_VLMULT);}
                  //
                  X := ZQryBoleto.FieldByName('data_vencimento').AsString;
                  W_DATA := uFuncoes.Acrescentar_Dias_Data(ZQryBoleto.FieldByName('data_vencimento').AsDateTime);
                  //uFuncoes.Datafinal(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime, 10);
                  //
                  If ( aMsg = 'N') Then
                  begin
                       If (aMsgMultaJuros = 'S') Then
                       begin
                            SetParam('INSTRUCOES1','MULTA DE R$:  '+FormatFloat('##0.#0', M_VLMULT) +' APOS : '+ZQryBoleto.FieldByName('data_vencimento').AsString+#13+
                                         'JUROS DE R$:  '+FormatFloat('##0.#0', M_VLJURO) +' AO DIA '+#13+#13+
                                         'NÃO RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);
                       End
                       Else
                       begin
                            SetParam('INSTRUCOES1',
                                         'NÃO RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);
                       End;
                  End
                  Else
                  begin
                        SetParam('INSTRUCOES1', 'ATENÇÃO: RECEBER SOMENTE ATÉ O VENCIMENTO. '+#13+#13+
                                                'APÓS VENCIMENTO PAGAVEL SOMENTE NA '+aNomeFantasia);
                  End;
                  {If (dmRelatorios.cdsConsultaCotaREC_NATUREZA.AsInteger = 1) Then
                  begin
                    If (dmAdmDados.GetExisteDiaPagamento(M_NRVEND)) Then
                        SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO')
                    Else
                        SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(W_DATA)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO');
                  End
                  Else
                     SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO');}

                  //
                  SetParam('INSTRUCOES2','');
                  if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                      SetParam('INSTRUCOES2','PAGAR PREFERÊNCIALMENTE NAS AGÊNCIAS DO BRADESCO')
                  Else
                      SetParam('INSTRUCOES2',dmDados.cdsConfigMENSAGEM1.AsString);
                  //
                  SetParam('ESPECIE','R$');
                  SetParam('ESPECIEDOC','DM');
                  SetParam('pACEITE','N');
                  //
                  SetParam('NUM_BANCO', uFuncoes.StrZero(ZQryContaBancariabanco_id.AsString,3)+ '-'+gbTitulo1.Cedente.ContaBancaria.Banco.Digito);
                  SetParam('NOME_BANCO', ZQryContaBancarianome.AsString);
                  //
                  if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                  begin
                      SetParam('LINDIG', LinhaDigitavel);
                      SetParam('CODIGO', CodBarras);
                      //
                  End
                  else
                  begin
                      SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                      SetParam('CODIGO', M_CODIGOBARRAS);
                  End;
                  //
                  SetParam('pLOGO_BANCO', '');
                  aLogoBanco := uFuncoes.Alltrim(ZQryContaBancariabanco_id.AsString+'.bmp');
                  {if not uFuncoes.FileExistsNew(aLogoBanco) Then
                    begin
                            ShowMessage('Logo do banco não encontrado.');
                            raise Exception.Create('Logo do banco não encontrado.');
                       End
                       Else}
                  SetParam('pLOGO_BANCO', aLogoBanco);

                  // SetParam('DTPROC', DatetoStr(Date())); Altera data
                  SetParam('DTPROC', ZQryBoleto.FieldByName('data_movimento').AsString);
                  {if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM2.AsString) Then
                      SetParam('LOCAL_PAG', 'Pagar Preferencialemente nas Casas Lotericas ate o valor limite')
                  Else
                      SetParam('LOCAL_PAG', dmDados.cdsConfigMENSAGEM2.AsString);}
                  if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                      SetParam('LOCAL_PAG','PAGAR PREFERÊNCIALMENTE NAS AGÊNCIAS DO BRADESCO')
                  Else
                  Begin
                      if (ZQryContaBancariabanco_id.AsInteger = 104) Then
                          SetParam('LOCAL_PAG', 'PREFERENCIALMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE')
                      Else
                          SetParam('LOCAL_PAG','PAGÁVEL EM QUALQUER AGÊNCIA BANCÁRIA ATÉ A DATA DE VENCIMENTO');
                  End;
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigRAZAO.AsString) Then
                      SetParam('NMCEDE', 'RAZÃO SOCIAL NÃO CADASTRADO    -    CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString))
                  Else
                      SetParam('NMCEDE', dmDados.cdsConfigRAZAO.AsString+ '    -    CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString));
                  //
                  SetParam('VLDOCU', FormatFloat('###,##0.#0', M_VLDOCU));
                  //
                  SetParam('VLDOCU1', FormatFloat('###,##0.#0',M_VLDOCU));
                  // Dados cliente
                  SetParam('NMSACA', ZQryClientenome.AsString);
                  //SetParam('pNomeSacado', ZQryClientenome.AsString);

                  SetParam('ENDCLIE', ZQryClientelogradouro.AsString+', Nº.'+ZQryClientenumero.AsString+' - '
                      +GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger) + ' - '+ ZQryClientecomplemento.AsString);
                  {SetParam('pSacadoEndereco', ZQryClientelogradouro.AsString+', Nº.'+ZQryClientenumero.AsString+' - '
                      +GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger) + ' - '+ ZQryClientecomplemento.AsString);}
                  SetParam('CEPCIDUF', uFuncoes.FormataCep(ZQryClientecep.AsString) + ' - '
                                      + GetNomeCidade(ZQryClientecidade_id.AsInteger) + ' - '
                                      + GetUFCidade(ZQryClientecidade_id.AsInteger));
                  {SetParam('pSacadoCepCidade',uFuncoes.FormataCep(ZQryClientecep.AsString) + ' - '
                                      + GetNomeCidade(ZQryClientecidade_id.AsInteger) + ' - '
                                      + GetUFCidade(ZQryClientecidade_id.AsInteger));}
                  // Numero da placar
                  SetParam('pNRPLACA', 'Nº.PLACA: '+sNrPlaca);
                  //
                  If (ZQryClientetipo_pessoa.AsString = 'F') Then
                      SetParam('CPFCNPJ', uFuncoes.FormataCPF(ZQryClientecpf_cnpj.AsString))
                  Else
                      SetParam('CPFCNPJ', uFuncoes.FormataCNPJ(ZQryClientecpf_cnpj.AsString));
                  //
                  {SetParam('CODBAIXA', '');
                  SetParam('GRUPO_COTA', 'TESTE' );}
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                      SetParam('COOPERCARRO','NÃO CADASTRADO')
                  Else
                      SetParam('COOPERCARRO', '');  // dmDados.cdsConfigFANTASIA.AsString
                  //
                  SetParam('pEND_NOVO', dmDados.cdsConfigENDERECO.AsString);   // texto
                  //SetParam('TEXTO_BOL', 'MENSAGEM DE TESTE');

                  //
                  With gbTitulo1 do
                  begin
                       // Aqui
                       //if (cdsConfigCARTEIRA.AsString = '3') Then
                       If (gbTitulo1.Carteira = 'SR') Then
                       begin
                           // cdsConfigCARTEIRA.AsString
                           {iDigitoNossoNumero := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString)
                                       +'0002' + '0004'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);   //}
                                       // uFuncoes.Alltrim(ZQryContaBancariaagencia.AsString)+ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString)
                           iDigitoNossoNumero := uCodBarras.Modulo11(
                                       '2400' + '0000'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);
                           SetParam('NOSSONUM', NossoNumero + '-'+iDigitoNossoNumero);
                       End
                       Else
                        begin
                            if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                             begin
                                  SetParam('NOSSONUM', ZQryContaBancariacarteira.AsString+'/'+NossoNumero + '-'+aDigitoNossoNumeroNew)
                                  // uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));
                             End
                             Else
                                 SetParam('NOSSONUM', NossoNumero + '-'+uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));
                        End;
                       //
                       SetParam('AGE_CEDENTE', Cedente.ContaBancaria.fCodigoAgencia
                                             +'/'+uFuncoes.StrZero(ZQryContaBancarianumero_conta.AsString,6)
                                             +'-'+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9));
                                {+uCodBarras.Modulo11(NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +gbTitulo1.Cedente.ContaBancaria.fNumeroConta));}
                       //
                       SetParam('Carteira', gbTitulo1.Carteira);
                       SetParam('NRDOCU', W_NRDOCU);  // NumeroDocumento
                       // 19/09/2014
                       // Endereço do cedente
                       SetParam('NMCEDE2', cdsConfigRAZAO.AsString);
                       SetParam('END_CEDENTE', cdsConfigENDERECO.AsString);
                       {SetParam('BAIRRO_CEDENTE',);
                       SetParam('CEP_CEDENTE',);
                       SetParam('CIDADE_CEDENTE',);}
                       // Mensagem
                       SetParam('pTextoFatura','');
                       SetParam('pTextoCliente','');
                       If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                       begin
                            if not uFuncoes.Empty(InttoStr(idFatura)) and (idFatura > 0)  Then
                            begin
                                With ZQryFatura do
                                begin
                                     Close;
                                     Params[0].AsInteger := idFatura;
                                     Open;
                                     //
                                     if not (IsEmpty) then
                                      begin
                                           SetParam('pTextoFatura', ZQryFatura.FieldByName('mensagem_boleto').AsString );
                                      End
                                      Else
                                           SetParam('pTextoFatura','');
                                 End;   // With ZQryFatura do
                            End
                            Else
                            begin
                                 If not uFuncoes.Empty(ZQryBoletodescricao.AsString) Then
                                    SetParam('pTextoFatura', 'Descrição'+#13+ ZQryBoletodescricao.AsString);
                            End;
                       End
                       Else     // If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                       begin
                          // Taxas
                          aListaMensagem :=  TStringList.Create;
                          Try
                            With ZQryMovTaxas do
                            begin
                                 Close;
                                 Params.ParamByName('pFatura').AsInteger := idFatura;
                                 Params.ParamByName('pPlacar').AsString  := M_IDVEIC;
                                 Open;
                                 If not (IsEmpty) Then
                                 begin
                                      aListaMensagem.Add('Taxas - Descrição                        Valor');
                                      aLinhaTaxa := '';
                                      aValorTaxa := '';
                                      fTotalTaxa := 0;
                                      First;
                                      While not (Eof) do
                                      begin
                                          Case ZQryMovTaxastaxa_id.AsInteger  of
                                            1 : aNomeTaxa := 'TAXA DE ADMINISTRAÇÃO';
                                            2 : aNomeTaxa := 'TAXA DE ADESÃO';
                                            3 : aNomeTaxa := 'RATEIO';
                                            4 : anomeTaxa := 'RESIDUO ANTERIOR';
                                          Else
                                              anomeTaxa := ZQryMovTaxasdescricao.AsString;
                                          End;
                                          //aNomeTaxa := ZQryMovTaxasdescricao.AsString;
                                          //
                                          if (ZQryMovTaxasvalor.AsFloat > 0) Then
                                          begin
                                              aValorTaxa := Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]);
                                              aLinhaTaxa := aLinhaTaxa +  Format('%-32s',[aNomeTaxa])+Format('%15s',[aValorTaxa+#13]);
                                              // aValorTaxa := aValorTaxa + Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]) +#13;
                                              fTotalTaxa := fTotalTaxa + ZQryMovTaxasvalor.AsFloat;
                                          End;
                                          //
                                          Next;
                                      End;
                                      //
                                      // aListaMensagem.Add(aLinhaTaxa);

                                      aValorTaxa := Format('%15.2f',[fTotalTaxa]);
                                      //aLinhaTaxa := aLinhaTaxa + Format('%-30s',['TOTAL: '])+Format('%10.2f',[fTotalTaxa]);
                                      aLinhaTaxa := aLinhaTaxa + Format('%-47s',[uFuncoes.Replicate('-', 47)])+#13;
                                      aLinhaTaxa := aLinhaTaxa + Format('%-31s',['TOTAL: '])+Format('%15s',[aValorTaxa]);
                                      //aValorTaxa := aValorTaxa + Format('%10.2f',[fTotalTaxa]) +#13;
                                      //
                                      aListaMensagem.Add(aLinhaTaxa);
                                      //
                                      if not uFuncoes.Empty(InttoStr(idFatura)) and (idFatura > 0)  Then
                                      begin
                                          With ZQryFatura do
                                          begin
                                               Close;
                                               Params[0].AsInteger := idFatura;
                                               Open;
                                               //
                                               if not (IsEmpty) then
                                                begin
                                                     // SetParam('pTextoCliente', ZQryFatura.FieldByName('mensagem_boleto').AsString );
                                                     SetParam('pTextoCliente','');
                                                End
                                                Else
                                                    SetParam('pTextoCliente','');
                                           End;   // With ZQryFatura do
                                      End;
                                 End
                                 Else
                                 begin
                                      aLinhaTaxa := '';
                                      aValorTaxa := '';
                                      fTotalTaxa := 0;
                                      aLinhaTaxa := Format('%-32s',[ZQryBoletodescricao.AsString]);
                                      //
                                      aListaMensagem.Add(Format('%-32s',['Descrição']));
                                      aListaMensagem.Add(aLinhaTaxa);
                                 End;
                            End;
                            //
                            SetParam('pTextoFatura', aListaMensagem.Text);
                            {if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM1.AsString) Then
                                SetParam('INSTRUCOES2','Pague somente na Rede Bancária ou na Administradora')
                            Else
                                SetParam('INSTRUCOES2',dmDados.cdsConfigMENSAGEM1.AsString);}
                         Finally
                                { Libera a instancia da lista da memória }
                                // FreeAndNil(aListaMensagem);
                         End;
                       End;
                       //
                       If FileExists(aArquivoLogoRel) Then
                          SetParam('pIMG', aArquivoLogoRel);
                       If FileExists(aArquivoLogoRel) Then
                          SetParam('pIMG2', aArquivoLogoRel);

                  End;
                  //
                  If (aTipo = 'V') Then
                  begin
                       RvSystem1.DefaultDest     := rdPreview;
                       RvSystem1.DoNativeOutput  := true;
                       RvBoleto.Execute;
                  End;
                  //
                  If (aTipo = 'I') Then
                   begin
                       RvSystem1.DefaultDest     := rdPrinter;
                       if (aPrimeiraImp = 'S') Then
                           RvSystem1.SystemSetups    := RvSystem1.SystemSetups + [ssAllowSetup]
                       Else
                           RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];

                       RvSystem1.DoNativeOutput  := true;
                       RvBoleto.Execute;
                   End;
                  //
                  If (aTipo = 'A') Then
                    begin
                      aNomePasta := ExtractFilePath( Application.ExeName )+'PDF';
                      if not DirectoryExists(aNomePasta) then
                         ForceDirectories(aNomePasta);
                      //
                      aPlacaCPF_CNPJ := GetPlacaCpfCnpjCliente(idDocumento);
                      aDataVenc := uFuncoes.RemoveChar(aDataVenc);
                      //
                      aNomeArquivo   := aPlacaCPF_CNPJ + '_'+uFuncoes.StrZero(IntToStr(idDocumento),9)+'_'+aDataVenc+'.PDF';
                      //
                      if not uFuncoes.Empty(aEmail) Then
                          AddEmailLista(LowerCase(aEmail), aNomeArquivo);
                      //
                      try
                         aNomePasta := aNomePasta+'\'+aNomeArquivo;
                         RvSystem1.DefaultDest     := rdFile;
                         RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];
                         RvSystem1.DoNativeOutput  := False;
                         RvSystem1.OutputFileName  := aNomePasta;
                         RvSystem1.RenderObject    := RvRenderPDF1;
                         //
                         {SaveDialog1.Filter       := 'Acrobat Reader|PDF';
                         SaveDialog1.DefaultExt   := 'PDF';
                         SaveDialog1.FileName     := aArquivo;
                         RvSystem2.OutputFileName := SaveDialog1.FileName;}
                         //
                         RvBoleto.Execute;
                      Except
                         Application.MessageBox(Pchar('Erro ao tentar exportar!'),
                            'Exportação',MB_OK + MB_ICONERROR);
                      End;
                   End;
             end;
         Except
             on e: exception do
              begin
                  Application.MessageBox(PChar('Erro ao tentar gerar boleto!!! Erro:'+#13
                         + E.Message),   'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              End;
         End;
     Finally
          If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 2) Then
              if Assigned(aListaMensagem) Then
                 FreeAndNil(aListaMensagem);
     End;
end;

procedure TdmDados.FilterDataSet(aCds: TZQuery; aType: TTypeLocalizar;
  aBusca: String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
end;

procedure TdmDados.PrepararTitulo(idContaBancaria: integer);
{
   Objetivo:
      Preencher as propriedades do componente gbTitulo1 com os dados da conta selecionada.
      Servirá de apoio para diveras outras rotinas
}
Var
    M_CDCLIE, M_COMPLE, aDigito : String;
    M_ININSN : String;
    M_BANC_PADRAO : integer;
begin
      M_BANC_PADRAO := idContaBancaria;
      FilterDataSet(ZQryContaBancaria, fsInteger, InttoStr(M_BANC_PADRAO));
      //
      M_ININSN := '24';
      {Dados do titulo}
      with gbTitulo1 do
       begin
            //
            SeuNumero   := uFuncoes.StrZero(ZQryBoletoid.AsString,10);
            Carteira    := '02';
            //
            If (M_ININSN = '82') Then
            Begin
                 NossoNumero    := '82'+Copy(uFuncoes.StrZero(ZQryBoletoid.AsString,8),3,8);
                 Carteira := 'SR';
            End;
            //
            If (M_ININSN = '24') and (Carteira = '02') Then
             begin
                 // Aqui2
                gbTitulo1.NossoNumero    := '9'+
                   uFuncoes.StrZero(ZQryBoletoid.AsString,14);
                //if (dmDados.cdsConfigCARTEIRA.AsString = '3') Then
                If (ZQryContaBancariacarteira.AsString = '02') Then
                begin
                    NossoNumero  := '24'+uFuncoes.StrZero(ZQryBoletoid.AsString,15);
                    Carteira     := 'SR';
                End
                Else
                    Carteira := '02';
             End;
             //
             If (M_ININSN = '24') and (Carteira = '02') Then
             begin
                    NossoNumero  := '24'+uFuncoes.StrZero(ZQryBoletoid.AsString,15);
                    Carteira     := 'SR';
             End;
             //
             If (M_ININSN = '9') and (Carteira = '18') Then
             Begin
                  gbTitulo1.Carteira       := '18';
                  //
                  gbTitulo1.NossoNumero    := ZQryBoletoid.AsString;
                  //dmAdmDados.cdsbancosBAN_CONVENIO.AsString
              End;
            //
            If (Carteira = 'CNR') Then
             begin
                  gbTitulo1.NossoNumero    := ZQryBoletoid.AsString;
             End;
             //
            If (Carteira = '57') Then
              Begin
                   gbTitulo1.NossoNumero := ZQryBoletoid.AsString;
              End;
           //
           if (ZQryContaBancariabanco_id.AsInteger = 237) Then
            begin
                 gbTitulo1.Carteira       := ZQryContaBancariacarteira.AsString;
                 gbTitulo1.NossoNumero    := uFuncoes.StrZero(ZQryBoletoid.AsString,11);
            End;
            //
           if (ZQryContaBancariabanco_id.AsInteger <> 237) Then
               aDigito := uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
               
           DataDocumento  := Date();
           DataVencimento := ZQryBoletodata_vencimento.AsDateTime;
           ValorDocumento := ZQryBoletovalor.AsFloat;
           //
           {Dados do cedente}
           with Cedente do
           begin
              TipoInscricao := tiPessoaJuridica; //CNPJ
              If (Carteira = 'SR') Then
              Begin
                   CodigoCedente := ZQryContaBancarianumero_conta.AsString;
                   DigitoCodigoCedente := '';
              End;
              //
              //If (Carteira = 'CR') or (Carteira = '02') Then
              If (Carteira = '02') Then
              Begin
                  CodigoCedente       := uFuncoes.StrZero(ZQryContaBancarianumero_conta.AsString,6);
                  DigitoCodigoCedente := '1';
              End;
              //
              If (Carteira = '18') Then
              Begin
                  CodigoCedente       := uFuncoes.StrZero( ZQryContaBancarianumero_conta.AsString,6);
                  DigitoCodigoCedente := '';
              End;
              //
              If (Carteira = '57') Then
              Begin
                  CodigoCedente       := uFuncoes.StrZero( ZQryContaBancarianumero_conta.AsString,7);
                  DigitoCodigoCedente := '';
              End;
              {Endereço do cedente}
              //
              with Endereco do
              begin
                 Rua := 'ENDEREÇO';
                 Endereco.Numero := '0000';
                 Complemento := 'Complemento';
                 Bairro := 'BAIRRO';
                 Cidade := 'TERESINA';
                 Estado := 'PI';
                 CEP    := '64000000';
                 //
              end; {with Endereco}
              {Dados bancários do cedente}
              with ContaBancaria do
              begin
                   Banco.Codigo  := ZQryContaBancariabanco_id.AsString;
                   CodigoAgencia := ZQryContaBancariaagencia.AsString;
                   DigitoAgencia := '';
                   NumeroConta    := ZQryContaBancarianumero_conta.AsString;
                  //
                  If (Banco.Codigo = '000') Then
                      Banco.Codigo := '104';
              end; {with Banco}
           end; {with Cedente}

          //Dados do sacado do título
           with Sacado do
           begin
              If (ZQryClientetipo_pessoa.AsString = 'F') Then
                 NumeroCPFCGC := uFuncoes.FormataCPF(ZQryClientecpf_cnpj.AsString)
              Else
                 NumeroCPFCGC := uFuncoes.FormataCNPJ(ZQryClientecpf_cnpj.AsString);
              //
              Nome := ZQryClienteNOME.AsString;
              //Endereço do sacado do título
              with Endereco do
              begin
                 Rua         := ZQryClientelogradouro.AsString;
                 Complemento := '';
                 Bairro      := ZQryClientebairro_id.AsString;
                 Cidade      := ZQryClientecidade_id.AsString;
                 Estado      := ZQryClienteuf_emissor.AsString;
              end; //with Endereco
           end; //with Sacado
           //
      end; //with Titulo
end;

procedure TdmDados.CONFIGURA_BOLETO(idContaBancaria,
  idNumDocumento: Integer; M_FLSEGU: String);
Var
     M_NOSNUM, M_CPFCNPJ, M_NRCONV, M_CARTEIRA, W_DTVENC : String;
     W_CDBANC, W_DVBANC, W_NRAGEN, W_CDCEDE, x , M_DTVCJU: String;
     M_NRCEP, M_CDCEDE : String;
     M_TPBOLE, M_BANC_PADRAO : Integer;
     M_DTVENC : TDateTime;
     M_VLDOCU : DOuble;
     M_CEDENTE_NOSSO_NUMERO, M_DIG_VER_CAMPO_LIVRE, M_DIG_CEDENTE : String;
     M_NSPRIM, M_NSSEGU, M_CDCARTEIRA : String;
begin
      //
      If (idContaBancaria = 0) Then
          M_BANC_PADRAO := 1
      Else
          M_BANC_PADRAO := idContaBancaria;
      //
      FilterDataSet(ZQryContaBancaria, fsInteger, InttoStr(idContaBancaria));
      //
      if not (ZQryBoleto.IsEmpty) Then
      begin
            if not uFuncoes.Empty(ZQryContaBancariacarteira.AsString) Then
             begin
                M_CDCARTEIRA := ZQryContaBancariacarteira.AsString;
                if (ZQryContaBancariabanco_id.AsInteger = 237) Then  // Bradesco
                 begin
                      ACBrBoleto.Banco.TipoCobranca    := cobBradesco;
                      ACBrBoleto.Cedente.Nome          := cdsConfigRAZAO.AsString;
                      ACBrBoleto.Cedente.Agencia       := uFuncoes.StrZero(ZQryContaBancariaagencia.AsString,4);
                      ACBrBoleto.Cedente.AgenciaDigito := ZQryContaBancariaagencia_digito.AsString;
                      ACBrBoleto.Cedente.CNPJCPF       := cdsConfigCNPJ.AsString;
                      ACBrBoleto.Cedente.CodigoCedente := ZQryContaBancariacodigo_cedente.AsString;
                      ACBrBoleto.Cedente.Conta         := ZQryContaBancarianumero_conta.AsString;
                      ACBrBoleto.Cedente.ContaDigito   := ZQryContaBancariadigito_conta.AsString;
                      //
                      W_CDBANC := ZQryContaBancariabanco_id.AsString;
                      W_DVBANC := ACBrBoleto.Cedente.AgenciaDigito;
                      W_NRAGEN := ACBrBoleto.Cedente.Agencia;
                      W_CDCEDE := ACBrBoleto.Cedente.CodigoCedente;
                      M_CARTEIRA := ZQryContaBancariacarteira.AsString;
                 End
                 Else
                 begin
                      M_CDCARTEIRA := ZQryContaBancariacarteira.AsString;
                      // cdsConfigCARTEIRA.AsString;
                      M_CARTEIRA := gbTitulo1.Carteira;
                      //
                      W_CDBANC := uFuncoes.StrZero(ZQryContaBancariabanco_id.AsString,3);
                      W_DVBANC := '';
                      W_NRAGEN := gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+'-'+gbTitulo1.Cedente.ContaBancaria.fDigitoAgencia;
                      W_CDCEDE := gbTitulo1.Cedente.CodigoCedente+'-'+gbTitulo1.Cedente.DigitoCodigoCedente;
                      M_NRCONV := '';
                 End;
             End
            Else
             begin
                M_CDCARTEIRA := ZQryContaBancariacarteira.AsString;
                // cdsConfigCARTEIRA.AsString;
                M_CARTEIRA := gbTitulo1.Carteira;
                //
                W_CDBANC := uFuncoes.StrZero(ZQryContaBancariabanco_id.AsString,3);
                W_DVBANC := '';
                W_NRAGEN := gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+'-'+gbTitulo1.Cedente.ContaBancaria.fDigitoAgencia;
                W_CDCEDE := gbTitulo1.Cedente.CodigoCedente+'-'+gbTitulo1.Cedente.DigitoCodigoCedente;
                M_NRCONV := '';
                //M_CARTEIRA := '02';
             End; 
            //
            M_VLDOCU := ZQryBoletovalor.AsFloat;
            M_DTVENC := ZQryBoletodata_vencimento.AsDateTime;
            W_DTVENC := ZQryBoletodata_vencimento.AsString;
            //
            If (M_CARTEIRA = '02') Then
            begin
                M_NSPRIM := '9002';
                //if (dmDados.cdsConfigCARTEIRA.AsString = '3') Then
                if (ZQryContaBancariacarteira.AsString = '02') then
                    M_NSPRIM := '2402';
                M_NSSEGU := '0004';
                //
                M_DIG_CEDENTE := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9);

                M_DIG_VER_CAMPO_LIVRE := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString+M_DIG_CEDENTE
                                         +M_NSPRIM + M_NSSEGU+uFuncoes.StrZero(ZQryBoletoid.AsString, 9),9);

                // codigo de barras
                M_CODIGOBARRAS := '1049'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +ZQryContaBancarianumero_conta.AsString+M_CDCARTEIRA
                          +M_NSPRIM + M_NSSEGU+uFuncoes.StrZero(ZQryBoletoid.AsString, 9)+M_DIG_VER_CAMPO_LIVRE;
                          //gbTitulo1.NossoNumero
                          // +'1'+StrZero(Copy(M_NRCONV,1,5),5)
                // digito do codigo
                //M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
                {M_CEDENTE_NOSSO_NUMERO := ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9)
                                         +'00010004'+uFuncoes.StrZero(ZQryBoletoid.AsString, 9);}
                M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
                //M_DIGITOCODIGO := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9);
                If M_DIGITOCODIGO = '0' then
                    M_DIGITOCODIGO := '1';
                //
                M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                                +M_DIGITOCODIGO
                                +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);

             End;
             // 21/04/2013
            If (M_CARTEIRA = 'SR') Then
            begin
                M_NSPRIM := '0002';
                M_NSSEGU := '0004';
                //
                M_DIG_CEDENTE := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9);
                M_DIG_VER_CAMPO_LIVRE := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString+M_DIG_CEDENTE
                                        +M_NSPRIM + M_NSSEGU+uFuncoes.StrZero(ZQryBoletoid.AsString, 9),9);
                                    // uCodBarras.Modulo11(M_NSPRIM + M_NSSEGU+uFuncoes.StrZero(ZQryBoletoid.AsString, 9),9);           //
                                           {uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString +M_DIG_CEDENTE
                                         +M_NSPRIM + M_NSSEGU+uFuncoes.StrZero(ZQryBoletoid.AsString, 9),9);}
                {If M_DIG_VER_CAMPO_LIVRE = '0' then
                    M_DIG_VER_CAMPO_LIVRE := '1';}
                // codigo de barras
                M_CODIGOBARRAS := '1049'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +ZQryContaBancarianumero_conta.AsString+M_DIG_CEDENTE
                          +M_NSPRIM+ M_NSSEGU+uFuncoes.StrZero(ZQryBoletoid.AsString, 9)+M_DIG_VER_CAMPO_LIVRE;

                M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
                //M_DIGITOCODIGO := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9);
                If M_DIGITOCODIGO = '0' then
                    M_DIGITOCODIGO := '1';
                //
                M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                                +M_DIGITOCODIGO
                                +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);

             End;
             //
             if (W_CDBANC = '237') Then    // Bradesco
             begin
                   ListadeBoletos();
                   AddBoletoLista(idContaBancaria, idNumDocumento,  ACBrBoleto, 'B');
             End;
      End;
end;

procedure TdmDados.ZQryCReceberCalcFields(DataSet: TDataSet);
begin
    If not uFuncoes.Empty(ZQryCRecebercpf_cnpj.AsString) Then
       If (ZQryCRecebertipo_pessoa.AsString = 'F') Then
           ZQryCReceberCPFCNPJ.AsString := uFuncoes.FormataCPF(ZQryCRecebercpf_cnpj.AsString)
       Else
           ZQryCReceberCPFCNPJ.AsString := uFuncoes.FormataCNPJ(ZQryCRecebercpf_cnpj.AsString);
end;

function TdmDados.GetNomeBairro(idCidade, idBairro: Integer): String;
var qraux : TZquery;
    texto : string;
begin
  //Result := 'Não-Encontrado';
  Result := '.';
  texto  := 'Select id, nome, cidade_id from bairros where (id = :pid) and (cidade_id = :pCidade) ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger     := idBairro;
       Params.ParamByName('pCidade').AsInteger := idCidade;
       Open;
       //
       If not (IsEmpty) Then
          Result := FieldByname('nome').AsString;
   finally
      free;
   end;
end;

function TdmDados.GetNomeCidade(idCidade: Integer): String;
var qraux : TZquery;
    texto : string;
begin
  //Result := 'Não-Encontrado';
  Result := '.';
  texto  := 'Select id, nome from cidades where (id = :pid) ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger := idCidade;
       Open;
       //
       If not (IsEmpty) Then
          Result := FieldByname('nome').AsString;
   finally
      free;
   end;
end;

procedure TdmDados.ZQryClienteCalcFields(DataSet: TDataSet);
begin
     if not uFuncoes.Empty(ZQryClientecidade_id.AsString) Then
         ZQryClienteCLI_NMCIDA.AsString := GetNomeCidade(ZQryClientecidade_id.AsInteger)+ '-'+ GetUFCidade(ZQryClientecidade_id.AsInteger);
         //ZQryClienteuf_emissor.AsString;
     //
     if not uFuncoes.Empty(ZQryClientebairro_id.AsString) Then
         ZQryClienteCLI_NMBAIRR.AsString := GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger);
     //
     if not uFuncoes.Empty(ZQryClientecep.AsString) Then
         ZQryClienteCLI_NUMCEP.AsString :=
             Copy(ZQryClientecep.AsString,1,5)+'-'+Copy(ZQryClientecep.AsString,6,3);
     //
     ZQryClienteEnderecoCompleto.AsString := ZQryClientelogradouro.AsString+', Nº.: '+
                                             ZQryClientenumero.AsString+' - '+ZQryClienteCLI_NMBAIRR.AsString;
                                             //+GetNomeBairro(ZQryClientebairro_id.AsInteger, ZQryClientecidade_id.AsInteger);
end;

procedure TdmDados.ImprimirEtiquetaCliente(idCliente: Integer; aTipo : String);
begin
     With ZQryCliente do
      begin
           Close;
           Params.ParamByName('pID').AsInteger := idCliente;
           //
           Open;
           //
           If not (IsEmpty) Then
             begin
                  With RvEtiqueta do
                   Begin
                        if (aTipo = 'V') Then
                           RvSystem2.DefaultDest := rdPreview
                        Else
                           RvSystem2.DefaultDest := rdPrinter;
                        //
                        Execute;
                   End;
             End;
      End;
end;

procedure TdmDados.ImprimirEtiquetas(aCds: TDataSet);
Var
   iCliente : Integer;
begin
     cdsListaClientes.Close;
     cdsListaClientes.Open;
     cdsListaClientes.EmptyDataSet;
     //
     With aCds do
     begin
          DisableControls;
          First;
          While not (Eof) do
          begin
               cdsListaClientes.Append;
               iCliente := FieldByName('cliente').AsInteger;
               cdsListaClientesCDS_CODIGO.AsInteger := iCliente;
               cdsListaClientesCDS_NOME.AsString    := FieldByName('nome').AsString;
               cdsListaClientesCDS_NRPLACA.AsString := aCds.FieldByName('placa').AsString;
               //
               With ZQryCliente do
               begin
                    Close;
                    Params[0].AsInteger := iCliente;
                    Open;
                    //
                    If not (IsEmpty) Then
                    begin
                         cdsListaClientesCDS_LOGRADOURO.AsString := ZQryClientelogradouro.AsString;
                         cdsListaClientesCDS_NUMERO.AsString  := ZQryClientenumero.AsString;
                         cdsListaClientesCDS_BAIRRO.AsString  := GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger);
                         cdsListaClientesCDS_CIDADE.AsString  := GetNomeCidade(ZQryClientecidade_id.AsInteger)+' - '+ GetUFCidade(ZQryClientecidade_id.AsInteger);
                         cdsListaClientesCDS_CEP.AsString     := uFuncoes.FormataCep(ZQryClientecep.AsString);
                         cdsListaClientesCDS_COMPLEMENTO.AsString := ZQryClientecomplemento.AsString;
                         cdsListaClientesCDS_REFERENCIA.AsString  := ZQryClientereferencia.AsString;
                   End;
               End;
               cdsListaClientes.Post;
               //
               Next;
          End;
          //
          If not (cdsListaClientes.IsEmpty) Then
             rvpListaClientes.Execute;
          //
          EnableControls;
     End;
end;

function TdmDados.GetUFCidade(idCidade: Integer): String;
var qraux : TZquery;
    texto : string;
begin
  //Result := 'Não-Encontrado';
  Result := '.';
  texto  := 'Select id, nome, uf from cidades where (id = :pid) ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger := idCidade;
       Open;
       //
       If not (IsEmpty) Then
          Result := FieldByname('uf').AsString;
   finally
      free;
   end;
end;

function TdmDados.GetPlacaCpfCnpjCliente(iContaReceber: Integer): String;
var qraux : TZquery;
    texto : string;
begin
  texto  := 'Select cr.id, cr.veiculo_id, v.cliente_id, cl.cpf_cnpj, cl.tipo_pessoa, cl.nome from contas_receber cr ';
  texto  := texto + 'inner join veiculos v on cr.veiculo_id = v.id ';
  texto  := texto + 'inner join clientes cl on v.cliente_id = cl.id ';
  texto  := texto + 'where (cr.id = :pid) ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger := iContaReceber;
       Open;
       //
       If not (IsEmpty) Then
          Result := FieldByname('tipo_pessoa').AsString + FieldByname('cpf_cnpj').AsString+'_'+FieldByname('veiculo_id').AsString;
   finally
      free;
   end;
end;

procedure TdmDados.FilterCDS(aCds: TClientDataSet; aType: TTypeLocalizar;
  aBusca: String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
end;

procedure TdmDados.RefreshCDS(aDateSet: TClientDataSet);
begin
     aDateSet.Close;
     aDateSet.Open;
end;

function TdmDados.AddBoletoCliente(iSEQUENCIA, iCLIENTE: Integer;
  aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO, aDOCUMENTO, aNOSSONUMERO,
  aCARTEIRA, aCEP, aBOXMESA, aLINHA_DIGITAVEL, aCODIGO_BARRAS, aAGENCIA,
  aDIAGEN, aCDCEDENTE, aDG_NNUMERO: String; aDESCRICAO: TStrings; aDTDOCU,
  aDTPROCESSAMENTO, aDTVENCIMENTO: TDatetime; fVALOR: Double;
  aPlaca, aLocalPagamento, aArquivoLogo, aCodigoBanco : String): Boolean;
Var
   M_NRDOCU : String;
begin
     result := false;
      //
      With cds2Boletos do
        begin
             Append;
             FieldByName('CDS_SEQUENCIA').AsInteger := iSEQUENCIA;
             FieldByName('CDS_CLIENTE').AsInteger   := iCLIENTE;
             FieldByName('CDS_NMCLIENTE').AsString  := aNMCLIENTE;
             FieldByName('CDS_CPF').AsString        := uFuncoes.FormataCPF(aCPF);
             If not uFuncoes.Empty(aENDERECO) Then
                 FieldByName('CDS_ENDERECO').AsString   := aENDERECO
             Else
                 FieldByName('CDS_ENDERECO').AsString   := '...';
             FieldByName('CDS_CIDADE').AsString     := aCIDADE;
             FieldByName('CDS_BAIRRO').AsString     := aBAIRRO;
             FieldByName('CDS_DESCRICAO').Assign(aDESCRICAO);
              M_NRDOCU := copy(aDOCUMENTO, 6, 12);
             FieldByName('CDS_DOCUMENTO').AsString  := M_NRDOCU;
             // copy(aDOCUMENTO, 6, 10);
             //
             FieldByName('CDS_NOSSONUMERO').AsString := aNOSSONUMERO;
             FieldByName('CDS_DTDOCU').AsDateTime   := aDTDOCU;
             FieldByName('CDS_DTPROCESSAMENTO').AsDateTime := aDTPROCESSAMENTO;
             FieldByName('CDS_DTVENCIMENTO').AsDateTime := aDTVENCIMENTO;
             FieldByName('CDS_CARTEIRA').AsString   := aCARTEIRA;
             FieldByName('CDS_VALOR').AsFloat       := fVALOR;
             If not uFuncoes.Empty(aCEP) Then
                FieldByName('CDS_CEP').AsString      := uFuncoes.FormataCep(aCEP)
             Else
                FieldByName('CDS_CEP').AsString      := '64000-000';
             FieldByName('CDS_NRPLACA').AsString    := aPlaca;
             FieldByName('CDS_BOXMESA').AsString    := aBOXMESA;
             FieldByName('CDS_AGENCIA').AsString    := aAGENCIA;
             FieldByName('CDS_DIAGEN').AsString     := aDIAGEN;
             FieldByName('CDS_CDCEDENTE').AsString  := aCDCEDENTE;
             FieldByName('CDS_DG_NNUMERO').AsString := aDG_NNUMERO;
             FieldByName('CDS_LINHA_DIGITAVEL').AsString := aLINHA_DIGITAVEL;
             FieldByName('CDS_CODIGO_BARRAS').AsString   := aCODIGO_BARRAS;
             //
             if not uFuncoes.Empty(aLocalPagamento) Then
               FieldByName('CDS_LOCAL_PAGAMENTO').AsString := aLocalPagamento;
             //
             if not uFuncoes.Empty(aArquivoLogo) Then
               cds2BoletosCDS_LOGO_BANCO.LoadFromFile(aArquivoLogo);
             //
             FieldByName('CDS_CODIGO_BANCO').AsString := aCodigoBanco;
             //
             Post;
        End;
      //
      Result := true;
end;

function TdmDados.SetCodigoBarras(aNossoNumero: String; aDtVenc: TDatetime;
  fValor: Double): Boolean;
Var
     M_NOSNUM, M_CPFCNPJ, M_NRCONV, M_CARTEIRA, W_DTVENC : String;
     W_CDBANC, W_DVBANC, W_NRAGEN, W_CDCEDE, x , M_DTVCJU: String;
     M_NRCEP, M_CDCEDE : String;
     M_TPBOLE, M_BANC_PADRAO : Integer;
     M_DTVENC : TDateTime;
     M_VLDOCU : DOuble;
begin
      //
      W_CDBANC := uFuncoes.StrZero(ZQryContaBancariabanco_id.AsString,3);
      W_DVBANC := '';
      W_NRAGEN := gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+'-'+gbTitulo1.Cedente.ContaBancaria.fDigitoAgencia;
      W_CDCEDE := gbTitulo1.Cedente.CodigoCedente+'-'+gbTitulo1.Cedente.DigitoCodigoCedente;
      M_NRCONV := ZQryContaBancarianumero_conta.AsString;
      M_CARTEIRA := ZQryContaBancariacarteira.AsString;
      //dmDados.cdsConfigCARTEIRA.AsString;
      //
      M_VLDOCU := fValor;
      M_DTVENC := aDtVenc;
      W_DTVENC := DatetoStr(aDtVenc);
      //
      M_NRCEP := uFuncoes.FormataCep('64000000');
      //
      If (M_TPBOLE = 1) Then
      begin
           M_CODIGOBARRAS := gbTitulo1.CodigoBarra.Codigo;
           M_NOSNUM       := gbTitulo1.NossoNumero;
           //
      End;
      //  alteração 11/09/2008
      If (M_TPBOLE = 2) and (M_CARTEIRA = 'CNR') Then
      begin
         // codigo de barras
         x := Copy(gbTitulo1.DigitoNossoNumero,13,3);
         M_DTVCJU := uFuncoes.StrZero(uFuncoes.Data_Juliana(M_DTVENC),3)+Copy(DatetoStr(M_DTVENC), 10,1) ;
         //uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
         M_CODIGOBARRAS := '3999'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +M_NRCONV
                          +uFuncoes.StrZero(gbTitulo1.NossoNumero,13) +M_DTVCJU+'2';
                          // +'1'+StrZero(Copy(M_NRCONV,1,5),5)
         // digito do codigo
         M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
         If M_DIGITOCODIGO = '0' then
             M_DIGITOCODIGO := '1';
         //
         M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
         //
      End;
      //
      If (M_TPBOLE = 3) and (M_CARTEIRA = '1') Then
      begin
         // codigo de barras
         M_CODIGOBARRAS := '1049'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +'1'+StrZero(Copy(M_NRCONV,1,5),6)
                          +gbTitulo1.NossoNumero;
                          // +'1'+StrZero(Copy(M_NRCONV,1,5),5)
         // digito do codigo
         M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
         If M_DIGITOCODIGO = '0' then
             M_DIGITOCODIGO := '1';
         //
         M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
      End;
      // 18/10/2008
      If (M_TPBOLE = 3) and (M_CARTEIRA = '18') Then
      begin
          //gbTitulo1.NossoNumero := aNossoNumero;
          gbTitulo1.NossoNumero := M_NRCONV+aNossoNumero;
          // W_NRCONV M_NRCONV
          //
          M_NOSNUM := uFuncoes.StrZero(gbTitulo1.NossoNumero,11) +
                '-' + uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
          // codigo de barras
          M_CODIGOBARRAS := W_CDBANC+'9'
                          +uCodBarras.CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          + '000000'
                          + gbTitulo1.NossoNumero+M_CARTEIRA;
                          //+gbTitulo1.NossoNumero+gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+gbTitulo1.Cedente.CodigoCedente+M_CARTEIRA;
          // digito do codigo
          M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
          If M_DIGITOCODIGO = '0' then
              M_DIGITOCODIGO := '1';
          //      Aqui
          M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                          +M_DIGITOCODIGO
                          +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
      End;
      //        REAL
      If (M_TPBOLE = 4) Then
        begin
             // codigo de barras
             M_CODIGOBARRAS := '3569'
                          +CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                          +uFuncoes.StrZero(M_NRCONV,7)
                          +uCodBarras.Modulo10(gbTitulo1.NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +uFuncoes.StrZero(M_NRCONV,7))
                          +gbTitulo1.NossoNumero;
             // digito do codigo
             M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
             If M_DIGITOCODIGO = '0' then
                 M_DIGITOCODIGO := '1';
             //
             M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
        End;
end;

procedure TdmDados.cds2BoletosCalcFields(DataSet: TDataSet);
begin
     cds2BoletosCDS_NRITEM.AsInteger := cds2Boletos.RecNo;
     cds2BoletosCDS_TOTREG.AsInteger := cds2Boletos.RecordCount;
end;

function TdmDados.GetPlacaVeiculo(idVeiculo: Integer): String;
var qraux : TZquery;
    texto : string;
begin
  //Result := 'Não-Encontrado';
  Result := '.';
  texto  := 'Select v.id, v.placa from veiculos v where (v.id = :pid) ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger := idVeiculo;
       Open;
       //
       If not (IsEmpty) Then
         if not uFuncoes.Empty(FieldByname('placa').AsString) Then
             Result := uFuncoes.FormataPlaca(FieldByname('placa').AsString);
   finally
      free;
   end;
end;

procedure TdmDados.AddEmailLista(aEmail, aArquivo: String);
var
  Arquivo: TextFile;
begin
  //ChangeFileExt('Admin_'+ufuncoes.RemoveChar(DatetoStr(Date)), '.log');
  AssignFile(Arquivo, NomeDoLista);
  if FileExists(NomeDoLista) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, aEmail+'::'+aArquivo);
    With cdsListaEmails do
    begin
         Append;
         FieldByName('CDS_IDREGISTRO').AsInteger   := ZQryCReceber.FieldByname('id').AsInteger;
         FieldByName('CDS_EMAIL_CLIENTE').AsString := aEmail;
         FieldByName('CDS_NOME_ARQUIVO').AsString  := aArquivo;
         FieldByName('CDS_ENVIADO').AsBoolean      := False;
         Post;
    End;
  finally
    CloseFile(arquivo)
  end;
end;

procedure TdmDados.ExcluirArquivoLista;
begin
     if FileExists(NomeDoLista) then
        DeleteFile(PChar(NomeDoLista));
     // Apagar Arquivos PDF da pasta
     ApagarArquivoPDF;
end;

procedure TdmDados.ApagarArquivoPDF;
var
SR: TSearchRec;
I: integer;
aPasta : String;
begin
    aPasta := ExtractFilePath( Application.ExeName )+'PDF\';
    I := FindFirst(aPasta + '*.PDF', faAnyFile, SR);
    while I = 0 do
    begin
        if (SR.Attr and faDirectory) <> faDirectory then
            if not DeleteFile(PChar(aPasta + SR.Name)) then
                ShowMessage('Não foi possível excluir '+aPasta+ SR.Name);
        I := FindNext(SR);
    end;
    //
    RefreshCDS(cdsListaEmails);
    cdsListaEmails.EmptyDataSet;
end;

function TdmDados.ProcurarValor(aValor, aCampo, aTabela: String): Boolean;
var qraux : TZquery;
    texto : string;
begin
  Result := False;
  texto  := 'Select '+aCampo +' from '+aTabela+ ' Where ('+aCampo+' = '+QuotedStr(aValor)+')';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Open;
       if not (IsEmpty) Then
          result := True;
   finally
      free;
   end;

end;

procedure TdmDados.ImprimirEtiquetasCancelados(aCds: TDataSet);
Var
   iCliente : Integer;
begin
     cdsListaClientes.Close;
     cdsListaClientes.Open;
     cdsListaClientes.EmptyDataSet;
     //
     With aCds do
     begin
          DisableControls;
          First;
          While not (Eof) do
          begin
               cdsListaClientes.Append;
               iCliente := FieldByName('codigo_cli').AsInteger;
               cdsListaClientesCDS_CODIGO.AsInteger := iCliente;
               cdsListaClientesCDS_NOME.AsString    := FieldByName('nome').AsString;
               cdsListaClientesCDS_NRPLACA.AsString := aCds.FieldByName('placa').AsString;
               //
                    If not (IsEmpty) Then
                    begin
                         cdsListaClientesCDS_LOGRADOURO.AsString := cdsListaCanceladoslogradouro.AsString;
                         cdsListaClientesCDS_NUMERO.AsString     := cdsListaCanceladosnumero.AsString;
                         cdsListaClientesCDS_BAIRRO.AsString     := GetNomeBairro(cdsListaCanceladoscidade_id.AsInteger, cdsListaCanceladosbairro_id.AsInteger);
                         cdsListaClientesCDS_CIDADE.AsString     := GetNomeCidade(cdsListaCanceladoscidade_id.AsInteger)+' - '+ GetUFCidade(cdsListaCanceladoscidade_id.AsInteger);
                         cdsListaClientesCDS_CEP.AsString        := uFuncoes.FormataCep(cdsListaCanceladoscep.AsString);
                         cdsListaClientesCDS_COMPLEMENTO.AsString := cdsListaCanceladoscomplemento.AsString;
                         cdsListaClientesCDS_REFERENCIA.AsString  := cdsListaCanceladosreferencia.AsString;
                   End;
               cdsListaClientes.Post;
               //
               Next;
          End;
          //
          If not (cdsListaClientes.IsEmpty) Then
             rvpListaClientes.Execute;
          //
          EnableControls;
     End;
end;

function TdmDados.GerarBoletoFrenteVerso(idContaReceber,
  idContaBancaria: Integer; aTipo, aMsg, aMsgMultaJuros,
  aEmail, aPrimeiraImp: String): Boolean;
Var
   idDocumento, M_IDCLIE, idFatura : Integer;
   M_IDVEIC, W_NRDOCU, X: String;
   M_VLMULT, M_PEJURO, M_VLJURO, M_VLDOCU, fTotalTaxa  : Double;
   W_DATA : TDatetime;
   aNomePasta, aNomeArquivo, aLinhaTaxa, aValorTaxa : String;
   aNomeTaxa, aPlacaCPF_CNPJ, aDataVenc, aNomeFantasia, sNrPlaca : String;
   iDigitoNossoNumero, aLogoBanco : String;
   aListaMensagem : TStringList ;
begin
     Result := False;
     //
     If uFuncoes.Empty(cdsConfigCARTEIRA.AsString) Then
     begin
          ShowMessage('Campo código carteira está vazio.');
          Exit;
     End;
     //
     try
         try
             ZQryConfig.close;
             ZQryConfig.Open;
             //
             With ZQryBoleto do
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
                        FilterDataSet(ZQryVeiculo, fsString, M_IDVEIC);
                        //
                        If not (ZQryVeiculo.IsEmpty) Then
                           M_IDCLIE := ZQryVeiculo.FieldByname('cliente_id').AsInteger;
                        // Abre dados do cliente
                        FilterDataSet(ZQryCliente, fsInteger, InttoStr(M_IDCLIE));
                        //
                        sNrPlaca := GetPlacaVeiculo(StrtoInt(M_IDVEIC));
                        //
                   End;
              end;
             //
             If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
                 aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
             //
             PrepararTitulo(idContaBancaria);
             //
             {idContaBancaria, idNumDocumento: Integer; M_FLSEGU: String}
             CONFIGURA_BOLETO(idContaBancaria, idDocumento , 'N');
             //
             W_NRDOCU := uFuncoes.StrZero(InttoStr(idDocumento),10);
             //
             //RPDev.Orientation := poPortrait;
             RVSystem1.SystemPrinter.Orientation   := poPortrait;
             {RPDev.SetPaperSize(DMPAPER_A4,0,0);
             RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);}
             if not uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                 aNomeFantasia := dmDados.cdsConfigFANTASIA.AsString
             Else
                 aNomeFantasia := 'COOPERSEGURO LTDA';
             //
             //objRelatorio := ;
             //With RvBoletoFreteVersoDetalhe do  // RvBoleto
             With RvBoletoFreteVerso do
             begin
                  M_VLMULT := uFuncoes.Gerapercentual(M_VLDOCU, ZQryConfigpercMulta.AsFloat);
                  M_PEJURO := ZQryConfigpercJuros.AsFloat;
                  // valorparcela, juros, multa, dias, parcelas
                  M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU + M_VLMULT, M_PEJURO)/30),2);
                  //uFuncoes.Arredondar((uFuncoes.Gerapercentual(dmRelatorios.cdsConsultaCotaREC_TOTAL_CALC.AsFloat + M_VLMULT, dmAdmDados.cdsConfigCFG_JUROS.AsFloat)/30),2);
                  {uFuncoes.CalcularJuros(dmRelatorios.cdsConsultaCotaREC_TOTAL_CALC.AsFloat,
                             dmAdmDados.cdsConfigCFG_JUROS.AsFloat,M_VLMULT);}
                  //
                  X := ZQryBoleto.FieldByName('data_vencimento').AsString;
                  W_DATA := uFuncoes.Acrescentar_Dias_Data(ZQryBoleto.FieldByName('data_vencimento').AsDateTime);
                  //uFuncoes.Datafinal(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime, 10);
                  //
                  If ( aMsg = 'N') Then
                  begin
                       If (aMsgMultaJuros = 'S') Then
                       begin
                            SetParam('INSTRUCOES1','MULTA DE R$:  '+FormatFloat('##0.#0', M_VLMULT) +' APOS : '+ZQryBoleto.FieldByName('data_vencimento').AsString+#13+
                                         'JUROS DE R$:  '+FormatFloat('##0.#0', M_VLJURO) +' AO DIA '+#13+#13+
                                         'NÃO RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);
                       End
                       Else
                       begin
                            SetParam('INSTRUCOES1',
                                         'NÃO RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);
                       End;
                  End
                  Else
                  begin
                        SetParam('INSTRUCOES1', 'ATENÇÃO: RECEBER SOMENTE ATÉ O VENCIMENTO. '+#13+#13+
                                                'APÓS VENCIMENTO PAGAVEL SOMENTE NA '+aNomeFantasia);
                  End;
                  {If (dmRelatorios.cdsConsultaCotaREC_NATUREZA.AsInteger = 1) Then
                  begin
                    If (dmAdmDados.GetExisteDiaPagamento(M_NRVEND)) Then
                        SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO')
                    Else
                        SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(W_DATA)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO');
                  End
                  Else
                     SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO');}
                  // Taxas
                  {SetParam('aTexto', ' ');
                  SetParam('aTextoValor',' ');
                  SetParam('aTaxas', ' ');
                  SetParam('pValorTaxa', ' ');
                  //
                  With ZQryMovTaxas do
                  begin
                       Close;
                       Params.ParamByName('pFatura').AsInteger := idFatura;
                       Params.ParamByName('pPlacar').AsString  := M_IDVEIC;
                       Open;
                       If not (IsEmpty) Then
                       begin
                            SetParam('aTexto', 'Taxas - Descrição');
                            SetParam('aTextoValor', 'Valor');
                            aLinhaTaxa := '';
                            aValorTaxa := '';
                            fTotalTaxa := 0;
                            First;
                            While not (Eof) do
                            begin
                                Case ZQryMovTaxastaxa_id.AsInteger  of
                                  1 : aNomeTaxa := 'TAXA DE ADMINISTRAÇÃO';
                                  2 : aNomeTaxa := 'TAXA DE ADESÃO';
                                  3 : aNomeTaxa := 'RATEIO';
                                  4 : anomeTaxa := 'RESIDUO ANTERIOR';
                                Else
                                    anomeTaxa := ZQryMovTaxasdescricao.AsString;
                                End;
                                //aNomeTaxa := ZQryMovTaxasdescricao.AsString;
                                //
                                if (ZQryMovTaxasvalor.AsFloat > 0) Then
                                begin
                                    aLinhaTaxa := aLinhaTaxa + aNomeTaxa+#13 ;
                                    aValorTaxa := aValorTaxa + Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]) +#13;
                                    fTotalTaxa := fTotalTaxa + ZQryMovTaxasvalor.AsFloat;
                                End;
                                //
                                Next;
                            End;
                            //
                            aLinhaTaxa := aLinhaTaxa + #13;
                            aLinhaTaxa := aLinhaTaxa + 'TOTAL: '#13;
                            aValorTaxa := aValorTaxa + #13;
                            aValorTaxa := aValorTaxa + Format('%10.2f',[fTotalTaxa]) +#13;
                            //
                            SetParam('aTaxas', aLinhaTaxa);
                            SetParam('pValorTaxa', aValorTaxa);
                       End
                       Else
                       begin
                            SetParam('aTexto', 'Descrição');
                            SetParam('aTextoValor', ' ');
                            aLinhaTaxa := '';
                            aValorTaxa := '';
                            fTotalTaxa := 0;
                            aLinhaTaxa :=  ZQryBoletodescricao.AsString;
                            //
                            SetParam('aTaxas', aLinhaTaxa);
                            SetParam('pValorTaxa', aValorTaxa);
                       End;
                  End;  }
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM1.AsString) Then
                      SetParam('INSTRUCOES2','Pague somente na Rede Bancária ou na Administradora')
                  Else
                      SetParam('INSTRUCOES2',dmDados.cdsConfigMENSAGEM1.AsString);
                  //
                  SetParam('ESPECIE','R$');
                  SetParam('ESPECIEDOC','DM');
                  SetParam('pACEITE','N');
                  //
                  SetParam('NUM_BANCO', uFuncoes.StrZero(ZQryContaBancariabanco_id.AsString,3)+ '-'+gbTitulo1.Cedente.ContaBancaria.Banco.Digito);
                  SetParam('NOME_BANCO', ZQryContaBancarianome.AsString);
                  {SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                  SetParam('CODIGO', M_CODIGOBARRAS);}
                  if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                   begin
                           SetParam('LINDIG', LinhaDigitavel);
                           SetParam('CODIGO', CodBarras);
                           //
                   End
                   else
                   begin
                           SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                           SetParam('CODIGO', M_CODIGOBARRAS);
                   End;
                   //
                           SetParam('pLOGO_BANCO', '');
                           aLogoBanco := uFuncoes.Alltrim(ZQryContaBancariabanco_id.AsString+'.bmp');

                           {if not uFuncoes.FileExistsNew(aLogoBanco) Then
                            begin
                                 ShowMessage('Logo do banco não encontrado.');
                                 raise Exception.Create('Logo do banco não encontrado.');
                            End
                            Else}
                            SetParam('pLOGO_BANCO', aLogoBanco);
                  //
                  SetParam('DTPROC', DatetoStr(Date()));
                  {if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM2.AsString) Then
                      SetParam('LOCAL_PAG', 'Pagar Preferencialemente nas Casas Lotericas ate o valor limite')
                  Else
                      SetParam('LOCAL_PAG', dmDados.cdsConfigMENSAGEM2.AsString);}
                  //
                   if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                      SetParam('LOCAL_PAG','PAGAR PREFERÊNCIALMENTE NAS AGÊNCIAS DO BRADESCO')
                  Else
                  Begin
                      if (ZQryContaBancariabanco_id.AsInteger = 104) Then
                          SetParam('LOCAL_PAG', 'PREFERENCIALMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE')
                      Else
                          SetParam('LOCAL_PAG','PAGÁVEL EM QUALQUER AGÊNCIA BANCÁRIA ATÉ A DATA DE VENCIMENTO');
                  End;
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigRAZAO.AsString) Then
                      SetParam('NMCEDE', 'RAZÃO SOCIAL NÃO CADASTRADO    -    CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString))
                  Else
                      SetParam('NMCEDE', dmDados.cdsConfigRAZAO.AsString+ '    -    CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString));
                  //
                  SetParam('VLDOCU', FormatFloat('###,##0.#0', M_VLDOCU));
                  //
                  SetParam('VLDOCU1', FormatFloat('###,##0.#0',M_VLDOCU));
                  // Dados cliente
                  SetParam('NMSACA', ZQryClientenome.AsString);
                  SetParam('ENDCLIE', ZQryClientelogradouro.AsString+', Nº.'+ZQryClientenumero.AsString+' - '
                      +GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger) + ' - '+ ZQryClientecomplemento.AsString);
                  SetParam('CEPCIDUF', uFuncoes.FormataCep(ZQryClientecep.AsString) + ' - '
                                      + GetNomeCidade(ZQryClientecidade_id.AsInteger) + ' - '
                                      + GetUFCidade(ZQryClientecidade_id.AsInteger));
                  // Numero da placar
                  SetParam('pNRPLACA', 'Nº.PLACA: '+sNrPlaca);
                  //
                  If (ZQryClientetipo_pessoa.AsString = 'F') Then
                      SetParam('CPFCNPJ', uFuncoes.FormataCPF(ZQryClientecpf_cnpj.AsString))
                  Else
                      SetParam('CPFCNPJ', uFuncoes.FormataCNPJ(ZQryClientecpf_cnpj.AsString));
                  //
                  {SetParam('CODBAIXA', '');
                  SetParam('GRUPO_COTA', 'TESTE' );}
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                      SetParam('COOPERCARRO','NÃO CADASTRADO')
                  Else
                      SetParam('COOPERCARRO', dmDados.cdsConfigFANTASIA.AsString);
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigENDERECO.AsString) Then
                      SetParam('pEND_NOVO', 'AVENIDA , N° 726 '+
                                           'Teresina - Piauí - Cep.: 64.000-000'
                                           +'C.G.C. : 99.999.999/0001-99'+
                                           uFuncoes.FormataFONE('8699999999')+
                                           'www.naocadastrado.com.br')
                  Else
                      SetParam('pEND_NOVO', dmDados.cdsConfigENDERECO.AsString);   // texto
                  //SetParam('TEXTO_BOL', 'MENSAGEM DE TESTE');

                  //
                  With gbTitulo1 do
                  begin
                       // Aqui
                       {If (gbTitulo1.Carteira = 'SR') Then
                       begin
                           iDigitoNossoNumero := uCodBarras.Modulo11(
                                       '2400' + '0000'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);
                           SetParam('NOSSONUM', NossoNumero + '-'+iDigitoNossoNumero);
                       End
                       Else
                          SetParam('NOSSONUM', NossoNumero + '-'+uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));}
                       If (gbTitulo1.Carteira = 'SR') Then
                       begin
                           // cdsConfigCARTEIRA.AsString
                           {iDigitoNossoNumero := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString)
                                       +'0002' + '0004'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);   //}
                                       // uFuncoes.Alltrim(ZQryContaBancariaagencia.AsString)+ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString)
                           iDigitoNossoNumero := uCodBarras.Modulo11(
                                       '2400' + '0000'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);
                           SetParam('NOSSONUM', NossoNumero + '-'+iDigitoNossoNumero);
                       End
                       Else
                        begin
                            if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                             begin
                                  SetParam('NOSSONUM', ZQryContaBancariacarteira.AsString+'/'+NossoNumero + '-'+aDigitoNossoNumeroNew)
                                  // uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));
                             End
                             Else
                                 SetParam('NOSSONUM', NossoNumero + '-'+uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));
                        End;
                       //
                       SetParam('AGE_CEDENTE', Cedente.ContaBancaria.fCodigoAgencia
                                             +'/'+uFuncoes.StrZero(ZQryContaBancarianumero_conta.AsString,6)
                                             +'-'+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9));
                                {+uCodBarras.Modulo11(NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +gbTitulo1.Cedente.ContaBancaria.fNumeroConta));}
                       //
                       SetParam('Carteira', gbTitulo1.Carteira);
                       SetParam('NRDOCU', W_NRDOCU);  // NumeroDocumento
                       // 19/09/2014
                       // Endereço do cedente
                       SetParam('NMCEDE2', cdsConfigRAZAO.AsString);
                       SetParam('END_CEDENTE', cdsConfigENDERECO.AsString);
                       {SetParam('BAIRRO_CEDENTE',);
                       SetParam('CEP_CEDENTE',);
                       SetParam('CIDADE_CEDENTE',);}
                       // Mensagem
                       SetParam('pTextoFatura','');
                       If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                       begin
                           if not uFuncoes.Empty(InttoStr(idFatura)) and (idFatura > 0)  Then
                            begin
                                With ZQryFatura do
                                begin
                                     Close;
                                     Params[0].AsInteger := idFatura;
                                     Open;
                                     //
                                     if not (IsEmpty) then
                                      begin
                                           SetParam('pTextoFatura', ZQryFatura.FieldByName('mensagem_boleto').AsString );
                                      End
                                      Else
                                           SetParam('pTextoFatura','');
                                 End;   // With ZQryFatura do
                            End
                            Else
                            begin
                                 If not uFuncoes.Empty(ZQryBoletodescricao.AsString) Then
                                    SetParam('pTextoFatura', 'Descrição'+#13+ ZQryBoletodescricao.AsString);
                            End;
                       End
                       Else     // If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                       begin
                          // Taxas
                          aListaMensagem :=  TStringList.Create;
                          Try
                            With ZQryMovTaxas do
                            begin
                                 Close;
                                 Params.ParamByName('pFatura').AsInteger := idFatura;
                                 Params.ParamByName('pPlacar').AsString  := M_IDVEIC;
                                 Open;
                                 If not (IsEmpty) Then
                                 begin
                                      aListaMensagem.Add('Taxas - Descrição                        Valor');
                                      aLinhaTaxa := '';
                                      aValorTaxa := '';
                                      fTotalTaxa := 0;
                                      First;
                                      While not (Eof) do
                                      begin
                                          Case ZQryMovTaxastaxa_id.AsInteger  of
                                            1 : aNomeTaxa := 'TAXA DE ADMINISTRAÇÃO';
                                            2 : aNomeTaxa := 'TAXA DE ADESÃO';
                                            3 : aNomeTaxa := 'RATEIO';
                                            4 : anomeTaxa := 'RESIDUO ANTERIOR';
                                          Else
                                              anomeTaxa := ZQryMovTaxasdescricao.AsString;
                                          End;
                                          //aNomeTaxa := ZQryMovTaxasdescricao.AsString;
                                          //
                                          if (ZQryMovTaxasvalor.AsFloat > 0) Then
                                          begin
                                              aValorTaxa := Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]);
                                              aLinhaTaxa := aLinhaTaxa +  Format('%-32s',[aNomeTaxa])+Format('%15s',[aValorTaxa+#13]);
                                              // aValorTaxa := aValorTaxa + Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]) +#13;
                                              fTotalTaxa := fTotalTaxa + ZQryMovTaxasvalor.AsFloat;
                                          End;
                                          //
                                          Next;
                                      End;
                                      //
                                      // aListaMensagem.Add(aLinhaTaxa);

                                      aValorTaxa := Format('%15.2f',[fTotalTaxa]);
                                      //aLinhaTaxa := aLinhaTaxa + Format('%-30s',['TOTAL: '])+Format('%10.2f',[fTotalTaxa]);
                                      aLinhaTaxa := aLinhaTaxa + Format('%-47s',[uFuncoes.Replicate('-', 47)])+#13;
                                      aLinhaTaxa := aLinhaTaxa + Format('%-31s',['TOTAL: '])+Format('%15s',[aValorTaxa]);
                                      //aValorTaxa := aValorTaxa + Format('%10.2f',[fTotalTaxa]) +#13;
                                      //
                                      aListaMensagem.Add(aLinhaTaxa);
                                 End
                                 Else
                                 begin
                                      aLinhaTaxa := '';
                                      aValorTaxa := '';
                                      fTotalTaxa := 0;
                                      aLinhaTaxa := Format('%-32s',[ZQryBoletodescricao.AsString]);
                                      //
                                      aListaMensagem.Add(Format('%-32s',['Descrição']));
                                      aListaMensagem.Add(aLinhaTaxa);
                                 End;
                            End;
                            //
                            SetParam('pTextoFatura', aListaMensagem.Text);
                            {if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM1.AsString) Then
                                SetParam('INSTRUCOES2','Pague somente na Rede Bancária ou na Administradora')
                            Else
                                SetParam('INSTRUCOES2',dmDados.cdsConfigMENSAGEM1.AsString);}
                         Finally
                                { Libera a instancia da lista da memória }
                                if Assigned(aListaMensagem) Then
                                   aListaMensagem.Free;
                         End;
                       End;
                       //
                       If FileExists(aArquivoLogoRel) Then
                          SetParam('pIMG', aArquivoLogoRel);
                  End;
                  //
                  If (aTipo = 'V') Then
                  begin
                       RvSystemBoletoFreteVerso.DefaultDest     := rdPreview;
                       RvSystemBoletoFreteVerso.DoNativeOutput  := true;
                       //ExecuteReport('Report1');
                       Execute;
                  End;
                  //
                  If (aTipo = 'I') Then
                   begin
                       RvSystemBoletoFreteVerso.DefaultDest     := rdPrinter;
                       if (aPrimeiraImp = 'S') Then
                           RvSystemBoletoFreteVerso.SystemSetups    := RvSystemBoletoFreteVerso.SystemSetups + [ssAllowSetup]
                       Else
                           RvSystemBoletoFreteVerso.SystemSetups    := RvSystemBoletoFreteVerso.SystemSetups - [ssAllowSetup];
                       RvSystemBoletoFreteVerso.DoNativeOutput  := true;
                       Execute;
                   End;
                  //
                  If (aTipo = 'A') Then
                    begin
                      aNomePasta := ExtractFilePath( Application.ExeName )+'PDF';
                      if not DirectoryExists(aNomePasta) then
                         ForceDirectories(aNomePasta);
                      //
                      aPlacaCPF_CNPJ := GetPlacaCpfCnpjCliente(idDocumento);
                      aDataVenc := uFuncoes.RemoveChar(aDataVenc);
                      //
                      aNomeArquivo   := aPlacaCPF_CNPJ + '_'+uFuncoes.StrZero(IntToStr(idDocumento),9)+'_'+aDataVenc+'.PDF';
                      //
                      if not uFuncoes.Empty(aEmail) Then
                          AddEmailLista(LowerCase(aEmail), aNomeArquivo);
                      //
                      try
                         aNomePasta := aNomePasta+'\'+aNomeArquivo;
                         RvSystemBoletoFreteVerso.DefaultDest     := rdFile;
                         RvSystemBoletoFreteVerso.SystemSetups    := RvSystemBoletoFreteVerso.SystemSetups - [ssAllowSetup];
                         RvSystemBoletoFreteVerso.DoNativeOutput  := False;
                         RvSystemBoletoFreteVerso.OutputFileName  := aNomePasta;
                         RvSystemBoletoFreteVerso.RenderObject    := RvRenderPDF1;
                         //
                         {SaveDialog1.Filter       := 'Acrobat Reader|PDF';
                         SaveDialog1.DefaultExt   := 'PDF';
                         SaveDialog1.FileName     := aArquivo;
                         RvSystem2.OutputFileName := SaveDialog1.FileName;}
                         //
                         Execute;
                      Except
                         Application.MessageBox(Pchar('Erro ao tentar exportar!'),
                            'Exportação',MB_OK + MB_ICONERROR);
                      End;
                   End;
             end;
         Except
             on e: exception do
              begin
                  Application.MessageBox(PChar('Erro ao tentar gerar boleto!!! Erro:'+#13
                         + E.Message),   'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              End;
         End;
     Finally
          {if Assigned(objRelatorio) Then
             FreeAndNil(objRelatorio);}
     End;
end;

procedure TdmDados.cdsListaCanceladosCalcFields(DataSet: TDataSet);
begin
     If (cdsListaCancelados.State in [dsInternalCalc]) Then
      begin
           if not uFuncoes.Empty(cdsListaCanceladoscidade_id.AsString) then
             cdsListaCanceladosNOME_CIDADE.AsString := dmDados.GetNomeCidade(cdsListaCanceladoscidade_id.AsInteger)+'-'+GetUFCidade(cdsListaCanceladoscidade_id.AsInteger);
           //
           if not uFuncoes.Empty(cdsListaCanceladosbairro_id.AsString) then
             cdsListaCanceladosNOME_BAIRRO.AsString := dmDados.GetNomeBairro(cdsListaCanceladoscidade_id.AsInteger, cdsListaCanceladosbairro_id.AsInteger);
      End;
end;

function TdmDados.AddBoletoLista(idContaBancaria, idNumDocumento: Integer;
  objBoleto: TACBrBoleto; aTipoBoletoArquivo : String): Boolean;
var
  Titulo : TACBrTitulo;
begin
     Titulo := ACBrBoleto.CriarTituloNaLista;

     if (aTipoBoletoArquivo = 'A') Then
      begin
          With ZQryBoleto do
           begin
                Active := False;
                Params[0].AsInteger := idNumDocumento;
                Active := True;
           End;
      End;

     with Titulo do
     begin
        Vencimento        := ZQryBoletodata_vencimento.AsDateTime;
        DataDocumento     := ZQryBoletodata_movimento.AsDateTime;
        NumeroDocumento   := ufuncoes.StrZero(InttoStr(idNumDocumento),10);
        EspecieDoc        := 'R$';
        Aceite            := atNao;
        DataProcessamento := Now;
        NossoNumero       := ufuncoes.StrZero(InttoStr(idNumDocumento),11);
        Carteira          := uFuncoes.StrZero(ZQryContaBancariacarteira.AsString,2);
        ValorDocumento    := ZQryBoletovalor.AsFloat;
        //
        if (aTipoBoletoArquivo = 'A') Then
        begin
             Sacado.NomeSacado := ZQryClienteRemessanome.AsString;
             Sacado.CNPJCPF    := ZQryClienteRemessacpf_cnpj.AsString;
             Sacado.Logradouro := ZQryClienteRemessalogradouro.AsString;
             Sacado.Numero     := ZQryClienteRemessanumero.AsString;
             Sacado.Bairro     := ZQryClienteRemessanome_bairro.AsString;
             Sacado.Cidade     := ZQryClienteRemessanome_cidade.AsString;
             Sacado.UF         := ZQryClienteRemessauf_emissor.AsString;
             Sacado.CEP        := ZQryClienteRemessacep.AsString;
             // Tipo de pessoa
             if (ZQryClienteRemessatipo_pessoa.AsString = 'F') Then
                Sacado.Pessoa := pFisica
             Else
                Sacado.Pessoa := pJuridica;
        End
        Else
        begin
             Sacado.NomeSacado := ZQryClientenome.AsString;
             Sacado.CNPJCPF    := ZQryClientecpf_cnpj.AsString;
             Sacado.Logradouro := ZQryClientelogradouro.AsString;
             Sacado.Numero     := ZQryClientenumero.AsString;
             Sacado.Bairro     := ZQryClienteCLI_NMBAIRR.AsString;
             Sacado.Cidade     := ZQryClienteCLI_NMCIDA.AsString;
             Sacado.UF         := ZQryClienteuf_emissor.AsString;
             Sacado.CEP        := ZQryClientecep.AsString;
             // Tipo de pessoa
             if (ZQryClientetipo_pessoa.AsString = 'F') Then
                Sacado.Pessoa := pFisica
             Else
                Sacado.Pessoa := pJuridica;
        End;

        LocalPagamento    := cdsconfigMENSAGEM2.AsString;
        ValorMoraJuros    := 0;
        ValorDesconto     := ZQryBoletovalor_desconto.AsFloat;
        ValorAbatimento   := 0;
        //DataMoraJuros     :=
        PercentualMulta   := ZQryBoletovalor_multa.AsFloat;
        Mensagem.Text     := '';
        {01..Remessa
        02..Pedido de baixa
        04..Concessão de abatimento
        05..Cancelamento de abatimento concedido
        06..Alteração de vencimento
        07..Alteração do controle do participante
        08..Alteração de seu número
        09..Pedido de protesto
        18..Sustar protesto e baixar Título
        19..Sustar protesto e manter em carteira
        22..Transferência Cessão crédito ID. Prod. 10
        23..Transferência entre Carteiras
        24..Dev. Transferência entre Carteiras
        31..Alteração de outros dados
        35..Desagendamento do débito automático
        68..Acerto nos dados do rateio de Crédito
        69..Cancelamento do rateio de crédito.}
        OcorrenciaOriginal.Tipo := toRemessaRegistrar;
        Instrucao1        := '';
        Instrucao2        := '';
        EspecieDoc        := '01';
     end;
    //
    CodBarras      := ACBrBoleto.Banco.MontarCodigoBarras( Titulo );
    LinhaDigitavel := ACBrBoleto.Banco.MontarLinhaDigitavel( CodBarras, Titulo );
    aDigitoNossoNumeroNew := '';
    if (ZQryContaBancariabanco_id.AsInteger = 237) Then
       aDigitoNossoNumeroNew := Copy(ACBrBoleto.Banco.MontarCampoNossoNumero(Titulo), 16,1);
end;

procedure TdmDados.ListadeBoletos;
begin
     ACBrBoleto.ListadeBoletos.Clear;
end;

function TdmDados.GeraRemessaBanco(aCDs: TDataset): Boolean;
Var
   idBanco, idContrato : Integer;
begin
     Result := False;
     aNomeArquivoRemessa := '';
     ListadeBoletos;
     idBanco := GetIdContaBancariaRemessa(237);
     // Dados do banco
     FilterDataSet(ZQryContaBancaria, fsInteger, InttoStr(idBanco));
     if (ZQryContaBancariabanco_id.AsInteger = 237) Then  // Bradesco
       begin
            ACBrBoleto.Banco.TipoCobranca    := cobBradesco;
            ACBrBoleto.Cedente.Nome          := cdsConfigRAZAO.AsString;
            ACBrBoleto.Cedente.Agencia       := uFuncoes.StrZero(ZQryContaBancariaagencia.AsString,4);
            ACBrBoleto.Cedente.AgenciaDigito := ZQryContaBancariaagencia_digito.AsString;
            ACBrBoleto.Cedente.CNPJCPF       := cdsConfigCNPJ.AsString;
            ACBrBoleto.Cedente.CodigoCedente := ZQryContaBancariacodigo_cedente.AsString;
            ACBrBoleto.Cedente.Conta         := ZQryContaBancarianumero_conta.AsString;
            ACBrBoleto.Cedente.ContaDigito   := ZQryContaBancariadigito_conta.AsString;
            //
       End;
     //
     Try

       aCDs.DisableControls;
       Try
           With aCDs do
            begin
                 First;
                 While not (Eof) do
                  begin
                       if (GetIdContaBanco(FieldByName('id').AsInteger) = idBanco) Then
                        begin
                             idContrato := GetIdContrato(FieldByName('id').AsInteger);
                             With ZQryClienteRemessa do
                             begin
                                  Close;
                                  Params[0].AsInteger := idContrato; // Contrato
                                  Open;
                             End;
                             //
                             AddBoletoLista(idBanco, FieldByName('id').AsInteger,  ACBrBoleto, 'A');
                        End;
                       //
                       Next;
                  End;
            End;      //  with aCDs do
            //
            ACBrBoleto.GerarRemessa( 1 );
            //
            Result := true;
            aNomeArquivoRemessa := ACBrBoleto.NomeArqRemessa;
       Except
            on e: exception do
             begin
                 Application.MessageBox(PChar('Erro ao tentar gera arquivo de remessa!!! Erro:'+#13
                       + E.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
             End;
       End;
    finally
       aCDs.EnableControls;
    End;
end;

procedure TdmDados.CarregaImagemRave(NomeProjeto: TRvProject;
  NomeRelatorio, NomeImagem, PathImagem: String);
var
   MyPage : TRavePage;
   MyPicture : TRaveBitmap;  
 begin    
   NomeProjeto.Open;    
   with NomeProjeto.ProjMan do   
   begin      
     MyPage := FindRaveComponent(NomeRelatorio,nil) as TRavePage;      
     MyPicture := FindRaveComponent(NomeImagem,MyPage) as TRaveBitmap;
     MyPicture.Image.LoadFromFile(PathImagem);
    end;
end;

function TdmDados.GetIdContaBanco(idContaReceber: Integer): Integer;
var qraux : TZquery;
    texto : string;
begin
  Result := 0;
  texto  := 'SELECT cr.id, c.id as CONTRATO, cl.id as CLIENTE, cl.nome, v.id as Veiculo, c.banco, cb.banco_id, cb.descricao FROM contratos c ';
  texto  := texto + ' inner join veiculos v on c.veiculo_id = v.id ';
  texto  := texto + ' inner join clientes cl on v.cliente_id  = cl.id ';
  texto  := texto + ' inner join contas_receber cr on c.id = cr.contrato_id ';
  texto  := texto + ' inner join contas_bancaria cb on  c.banco = cb.id ';
  texto  := texto + ' WHERE (cr.id = :pID) group by cr.id, c.id, cl.id, cl.nome, v.id, c.banco, cb.banco_id, cb.descricao ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       ParamByName('pID').AsInteger := idContaReceber;
       Open;
       if not (IsEmpty) Then
           result := FieldByName('banco').AsInteger
       Else
           result := 1;
   finally
      free;
   end;
end;

function TdmDados.GetIdContaBancariaRemessa(iCodBanco: Integer): Integer;
var qraux : TZquery;
    texto : string;
begin
  Result := 1;
  texto  := 'Select id, banco_id from contas_bancaria Where (banco_id = :pbanco)';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pbanco').AsInteger := iCodBanco;
       Open;
       if not (IsEmpty) Then
          result := FieldByName('id').AsInteger;
   finally
      free;
   end;
end;

function TdmDados.GetIdContrato(idContaReceber: Integer): Integer;
var qraux : TZquery;
    texto : string;
begin
  Result := -1;
  texto  := 'Select id, contrato_id from contas_receber Where (id = :pid)';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger := idContaReceber;
       Open;
       if not (IsEmpty) Then
          result := FieldByName('contrato_id').AsInteger;
   finally
      free;
   end;
end;

procedure TdmDados.CarregarComboContasBancaria(aCmb: TComboBox);
var qraux : TZquery;
    texto : string;
begin
  aCmb.Clear;
  aCmb.Items.Add(' ');
  texto  := 'Select id, numero_conta, descricao from contas_bancaria order by id';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Open;
       if not (IsEmpty) Then
          begin
               First; 
               While not (eof) do
               begin
                    aCmb.Items.Add(uFuncoes.StrZero(FieldByName('id').AsString, 2)+' - '+FieldByName('descricao').AsString+' :: CONTA: '+FieldByName('numero_conta').AsString);
                    //
                    Next;
               End;
          End;
   finally
      free;
   end;
end;

function TdmDados.GerarBoletoFrenteVersoDetalhe(idContaReceber,
  idContaBancaria: Integer; aTipo, aMsg, aMsgMultaJuros, aEmail,
  aPrimeiraImp: String): Boolean;
Var
   idDocumento, M_IDCLIE, idFatura : Integer;
   M_IDVEIC, W_NRDOCU, X: String;
   M_VLMULT, M_PEJURO, M_VLJURO, M_VLDOCU, fTotalTaxa  : Double;
   W_DATA : TDatetime;
   aNomePasta, aNomeArquivo, aLinhaTaxa, aValorTaxa : String;
   aNomeTaxa, aPlacaCPF_CNPJ, aDataVenc, aNomeFantasia, sNrPlaca : String;
   iDigitoNossoNumero, aLogoBanco : String;
  // aListaMensagem : TStringList ;
begin
     Result := False;
     //
     If uFuncoes.Empty(cdsConfigCARTEIRA.AsString) Then
     begin
          ShowMessage('Campo código carteira está vazio.');
          Exit;
     End;
     //
     try
         try
             ZQryConfig.close;
             ZQryConfig.Open;
             //
             With ZQryBoleto do
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
                        FilterDataSet(ZQryVeiculo, fsString, M_IDVEIC);
                        //
                        If not (ZQryVeiculo.IsEmpty) Then
                           M_IDCLIE := ZQryVeiculo.FieldByname('cliente_id').AsInteger;
                        // Abre dados do cliente
                        FilterDataSet(ZQryCliente, fsInteger, InttoStr(M_IDCLIE));
                        //
                        sNrPlaca := GetPlacaVeiculo(StrtoInt(M_IDVEIC));
                        //
                   End;
              end;
             //
             If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
                 aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
             //
             PrepararTitulo(idContaBancaria);
             //
             {idContaBancaria, idNumDocumento: Integer; M_FLSEGU: String}
             CONFIGURA_BOLETO(idContaBancaria, idDocumento , 'N');
             //
             W_NRDOCU := uFuncoes.StrZero(InttoStr(idDocumento),10);
             //
             //RPDev.Orientation := poPortrait;
             RvSysFreteVersoDetalhe.SystemPrinter.Orientation   := poPortrait;
             {RPDev.SetPaperSize(DMPAPER_A4,0,0);
             RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);}
             if not uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                 aNomeFantasia := dmDados.cdsConfigFANTASIA.AsString
             Else
                 aNomeFantasia := 'COOPERSEGURO LTDA';
             //
             {RvSysFreteVersoDetalhe.DefaultDest     := rdPreview;
             RvSysFreteVersoDetalhe.DoNativeOutput  := true;}

             With RvBoletoFreteVersoDetalhe do
             begin
                  M_VLMULT := uFuncoes.Gerapercentual(M_VLDOCU, ZQryConfigpercMulta.AsFloat);
                  M_PEJURO := ZQryConfigpercJuros.AsFloat;
                  // valorparcela, juros, multa, dias, parcelas
                  M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU + M_VLMULT, M_PEJURO)/30),2);
                  //uFuncoes.Arredondar((uFuncoes.Gerapercentual(dmRelatorios.cdsConsultaCotaREC_TOTAL_CALC.AsFloat + M_VLMULT, dmAdmDados.cdsConfigCFG_JUROS.AsFloat)/30),2);
                  {uFuncoes.CalcularJuros(dmRelatorios.cdsConsultaCotaREC_TOTAL_CALC.AsFloat,
                             dmAdmDados.cdsConfigCFG_JUROS.AsFloat,M_VLMULT);}
                  //
                  X := ZQryBoleto.FieldByName('data_vencimento').AsString;
                  W_DATA := uFuncoes.Acrescentar_Dias_Data(ZQryBoleto.FieldByName('data_vencimento').AsDateTime);
                  //uFuncoes.Datafinal(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime, 10);
                  //
                  If ( aMsg = 'N') Then
                  begin
                       If (aMsgMultaJuros = 'S') Then
                       begin
                            SetParam('INSTRUCOES1','MULTA DE R$:  '+FormatFloat('##0.#0', M_VLMULT) +' APOS : '+ZQryBoleto.FieldByName('data_vencimento').AsString+#13+
                                         'JUROS DE R$:  '+FormatFloat('##0.#0', M_VLJURO) +' AO DIA '+#13+#13+
                                         'NÃO RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);
                       End
                       Else
                       begin
                            SetParam('INSTRUCOES1',
                                         'NÃO RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);
                       End;
                  End
                  Else
                  begin
                        SetParam('INSTRUCOES1', 'ATENÇÃO: RECEBER SOMENTE ATÉ O VENCIMENTO. '+#13+#13+
                                                'APÓS VENCIMENTO PAGAVEL SOMENTE NA '+aNomeFantasia);
                  End;
                  {If (dmRelatorios.cdsConsultaCotaREC_NATUREZA.AsInteger = 1) Then
                  begin
                    If (dmAdmDados.GetExisteDiaPagamento(M_NRVEND)) Then
                        SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO')
                    Else
                        SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(W_DATA)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO');
                  End
                  Else
                     SetParam('INSTRUCOES1','SOMENTE APÓS '+DatetoStr(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime)+' COBRAR MULTA DE '+FormatFloat('##0.#0',M_VLMULT)+'% E JUROS R$ '+FormatFloat('##0.#0',M_VLJURO)+' POR DIA DE ATRASO');}
                  // Taxas
                  {SetParam('aTexto', ' ');
                  SetParam('aTextoValor',' ');
                  SetParam('aTaxas', ' ');
                  SetParam('pValorTaxa', ' ');
                  //
                  With ZQryMovTaxas do
                  begin
                       Close;
                       Params.ParamByName('pFatura').AsInteger := idFatura;
                       Params.ParamByName('pPlacar').AsString  := M_IDVEIC;
                       Open;
                       If not (IsEmpty) Then
                       begin
                            SetParam('aTexto', 'Taxas - Descrição');
                            SetParam('aTextoValor', 'Valor');
                            aLinhaTaxa := '';
                            aValorTaxa := '';
                            fTotalTaxa := 0;
                            First;
                            While not (Eof) do
                            begin
                                Case ZQryMovTaxastaxa_id.AsInteger  of
                                  1 : aNomeTaxa := 'TAXA DE ADMINISTRAÇÃO';
                                  2 : aNomeTaxa := 'TAXA DE ADESÃO';
                                  3 : aNomeTaxa := 'RATEIO';
                                  4 : anomeTaxa := 'RESIDUO ANTERIOR';
                                Else
                                    anomeTaxa := ZQryMovTaxasdescricao.AsString;
                                End;
                                //aNomeTaxa := ZQryMovTaxasdescricao.AsString;
                                //
                                if (ZQryMovTaxasvalor.AsFloat > 0) Then
                                begin
                                    aLinhaTaxa := aLinhaTaxa + aNomeTaxa+#13 ;
                                    aValorTaxa := aValorTaxa + Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]) +#13;
                                    fTotalTaxa := fTotalTaxa + ZQryMovTaxasvalor.AsFloat;
                                End;
                                //
                                Next;
                            End;
                            //
                            aLinhaTaxa := aLinhaTaxa + #13;
                            aLinhaTaxa := aLinhaTaxa + 'TOTAL: '#13;
                            aValorTaxa := aValorTaxa + #13;
                            aValorTaxa := aValorTaxa + Format('%10.2f',[fTotalTaxa]) +#13;
                            //
                            SetParam('aTaxas', aLinhaTaxa);
                            SetParam('pValorTaxa', aValorTaxa);
                       End
                       Else
                       begin
                            SetParam('aTexto', 'Descrição');
                            SetParam('aTextoValor', ' ');
                            aLinhaTaxa := '';
                            aValorTaxa := '';
                            fTotalTaxa := 0;
                            aLinhaTaxa :=  ZQryBoletodescricao.AsString;
                            //
                            SetParam('aTaxas', aLinhaTaxa);
                            SetParam('pValorTaxa', aValorTaxa);
                       End;
                  End;  }
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM1.AsString) Then
                      SetParam('INSTRUCOES2','Pague somente na Rede Bancária ou na Administradora')
                  Else
                      SetParam('INSTRUCOES2',dmDados.cdsConfigMENSAGEM1.AsString);
                  //
                  SetParam('ESPECIE','R$');
                  SetParam('ESPECIEDOC','DM');
                  SetParam('pACEITE','N');
                  //
                  SetParam('NUM_BANCO', uFuncoes.StrZero(ZQryContaBancariabanco_id.AsString,3)+ '-'+gbTitulo1.Cedente.ContaBancaria.Banco.Digito);
                  SetParam('NOME_BANCO', ZQryContaBancarianome.AsString);
                  {SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                  SetParam('CODIGO', M_CODIGOBARRAS);}
                  if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                   begin
                           SetParam('LINDIG', LinhaDigitavel);
                           SetParam('CODIGO', CodBarras);
                           //
                   End
                   else
                   begin
                           SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                           SetParam('CODIGO', M_CODIGOBARRAS);
                   End;
                   //
                   SetParam('pLOGO_BANCO', '');
                   aLogoBanco := uFuncoes.Alltrim(ZQryContaBancariabanco_id.AsString+'.bmp');

                   {if not uFuncoes.FileExistsNew(aLogoBanco) Then
                     begin
                                 ShowMessage('Logo do banco não encontrado.');
                                 raise Exception.Create('Logo do banco não encontrado.');
                     End
                   Else}
                   SetParam('pLOGO_BANCO', aLogoBanco);
                   //
                   SetParam('DTPROC', DatetoStr(Date()));
                   {if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM2.AsString) Then
                      SetParam('LOCAL_PAG', 'Pagar Preferencialemente nas Casas Lotericas ate o valor limite')
                   Else
                       SetParam('LOCAL_PAG', dmDados.cdsConfigMENSAGEM2.AsString);}
                   //
                   if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                      SetParam('LOCAL_PAG','PAGAR PREFERÊNCIALMENTE NAS AGÊNCIAS DO BRADESCO')
                  Else
                  Begin
                      if (ZQryContaBancariabanco_id.AsInteger = 104) Then
                          SetParam('LOCAL_PAG', 'PREFERENCIALMENTE NAS CASAS LOTÉRICAS ATÉ O VALOR LIMITE')
                      Else
                          SetParam('LOCAL_PAG','PAGÁVEL EM QUALQUER AGÊNCIA BANCÁRIA ATÉ A DATA DE VENCIMENTO');
                  End;
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigRAZAO.AsString) Then
                      SetParam('NMCEDE', 'RAZÃO SOCIAL NÃO CADASTRADO    -    CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString))
                  Else
                      SetParam('NMCEDE', dmDados.cdsConfigRAZAO.AsString+ '    -    CNPJ: '+uFuncoes.FormataCNPJ(dmDados.cdsConfigCNPJ.AsString));
                  //
                  SetParam('VLDOCU', FormatFloat('###,##0.#0', M_VLDOCU));
                  //
                  SetParam('VLDOCU1', FormatFloat('###,##0.#0',M_VLDOCU));
                  // Dados cliente
                  SetParam('NMSACA', ZQryClientenome.AsString);
                  SetParam('ENDCLIE', ZQryClientelogradouro.AsString+', Nº.'+ZQryClientenumero.AsString+' - '
                      +GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger) + ' - '+ ZQryClientecomplemento.AsString);
                  SetParam('CEPCIDUF', uFuncoes.FormataCep(ZQryClientecep.AsString) + ' - '
                                      + GetNomeCidade(ZQryClientecidade_id.AsInteger) + ' - '
                                      + GetUFCidade(ZQryClientecidade_id.AsInteger));
                  // Numero da placar
                  SetParam('pNRPLACA', 'Nº.PLACA: '+sNrPlaca);
                  //
                  If (ZQryClientetipo_pessoa.AsString = 'F') Then
                      SetParam('CPFCNPJ', uFuncoes.FormataCPF(ZQryClientecpf_cnpj.AsString))
                  Else
                      SetParam('CPFCNPJ', uFuncoes.FormataCNPJ(ZQryClientecpf_cnpj.AsString));
                  //
                  {SetParam('CODBAIXA', '');
                  SetParam('GRUPO_COTA', 'TESTE' );}
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigFANTASIA.AsString) Then
                      SetParam('COOPERCARRO','NÃO CADASTRADO')
                  Else
                      SetParam('COOPERCARRO', dmDados.cdsConfigFANTASIA.AsString);
                  //
                  if uFuncoes.Empty(dmDados.cdsConfigENDERECO.AsString) Then
                      SetParam('pEND_NOVO', 'AVENIDA , N° 726 '+
                                           'Teresina - Piauí - Cep.: 64.000-000'
                                           +'C.G.C. : 99.999.999/0001-99'+
                                           uFuncoes.FormataFONE('8699999999')+
                                           'www.naocadastrado.com.br')
                  Else
                      SetParam('pEND_NOVO', dmDados.cdsConfigENDERECO.AsString);   // texto
                  //SetParam('TEXTO_BOL', 'MENSAGEM DE TESTE');

                  //
                  With gbTitulo1 do
                  begin
                       // Aqui
                       {If (gbTitulo1.Carteira = 'SR') Then
                       begin
                           iDigitoNossoNumero := uCodBarras.Modulo11(
                                       '2400' + '0000'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);
                           SetParam('NOSSONUM', NossoNumero + '-'+iDigitoNossoNumero);
                       End
                       Else
                          SetParam('NOSSONUM', NossoNumero + '-'+uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));}
                       If (gbTitulo1.Carteira = 'SR') Then
                       begin
                           // cdsConfigCARTEIRA.AsString
                           {iDigitoNossoNumero := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString)
                                       +'0002' + '0004'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);   //}
                                       // uFuncoes.Alltrim(ZQryContaBancariaagencia.AsString)+ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString)
                           iDigitoNossoNumero := uCodBarras.Modulo11(
                                       '2400' + '0000'+uFuncoes.StrZero(ZQryBoleto.FieldByName('id').AsString,9),9);
                           SetParam('NOSSONUM', NossoNumero + '-'+iDigitoNossoNumero);
                       End
                       Else
                        begin
                            if (ZQryContaBancariabanco_id.AsInteger = 237) Then
                             begin
                                  SetParam('NOSSONUM', ZQryContaBancariacarteira.AsString+'/'+NossoNumero + '-'+aDigitoNossoNumeroNew)
                                  // uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));
                             End
                             Else
                                 SetParam('NOSSONUM', NossoNumero + '-'+uCodBarras.Modulo11('24'+gbTitulo1.NossoNumero,9));
                        End;
                       //
                       SetParam('AGE_CEDENTE', Cedente.ContaBancaria.fCodigoAgencia
                                             +'/'+uFuncoes.StrZero(ZQryContaBancarianumero_conta.AsString,6)
                                             +'-'+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9));
                                {+uCodBarras.Modulo11(NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +gbTitulo1.Cedente.ContaBancaria.fNumeroConta));}
                       //
                       SetParam('Carteira', gbTitulo1.Carteira);
                       SetParam('NRDOCU', W_NRDOCU);  // NumeroDocumento
                       // 19/09/2014
                       // Endereço do cedente
                       SetParam('NMCEDE2', cdsConfigRAZAO.AsString);
                       SetParam('END_CEDENTE', cdsConfigENDERECO.AsString);
                       {SetParam('BAIRRO_CEDENTE',);
                       SetParam('CEP_CEDENTE',);
                       SetParam('CIDADE_CEDENTE',);}
                       // Mensagem
                       SetParam('pTextoFatura','');
                       If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                       begin
                           if not uFuncoes.Empty(InttoStr(idFatura)) and (idFatura > 0)  Then
                            begin
                                With ZQryFatura do
                                begin
                                     Close;
                                     Params[0].AsInteger := idFatura;
                                     Open;
                                     //
                                     if not (IsEmpty) then
                                      begin
                                           SetParam('pTextoFatura', ZQryFatura.FieldByName('mensagem_boleto').AsString );
                                      End
                                      Else
                                           SetParam('pTextoFatura','');
                                 End;   // With ZQryFatura do
                            End
                            Else
                            begin
                                 If not uFuncoes.Empty(ZQryBoletodescricao.AsString) Then
                                    SetParam('pTextoFatura', 'Descrição'+#13+ ZQryBoletodescricao.AsString);
                            End;
                       End
                       Else     // If (cdsConfigMODELO_TEXTO_BOLETO.AsInteger = 1) Then
                       begin
                          // Taxas
                          // aListaMensagem :=  TStringList.Create;
                          FrmMainBoletos.mnoListaMensagem.Lines.Clear;
                          Try
                            With ZQryMovTaxas do
                            begin
                                 Close;
                                 Params.ParamByName('pFatura').AsInteger := idFatura;
                                 Params.ParamByName('pPlacar').AsString  := M_IDVEIC;
                                 Open;
                                 If not (IsEmpty) Then
                                 begin
                                      //aListaMensagem.Add('Taxas - Descrição                        Valor');
                                      FrmMainBoletos.mnoListaMensagem.Lines.Add('Taxas - Descrição                        Valor');
                                      aLinhaTaxa := '';
                                      aValorTaxa := '';
                                      fTotalTaxa := 0;
                                      First;
                                      While not (Eof) do
                                      begin
                                          Case ZQryMovTaxastaxa_id.AsInteger  of
                                            1 : aNomeTaxa := 'TAXA DE ADMINISTRAÇÃO';
                                            2 : aNomeTaxa := 'TAXA DE ADESÃO';
                                            3 : aNomeTaxa := 'RATEIO';
                                            4 : anomeTaxa := 'RESIDUO ANTERIOR';
                                          Else
                                              anomeTaxa := ZQryMovTaxasdescricao.AsString;
                                          End;
                                          //aNomeTaxa := ZQryMovTaxasdescricao.AsString;
                                          //
                                          if (ZQryMovTaxasvalor.AsFloat > 0) Then
                                          begin
                                              aValorTaxa := Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]);
                                              aLinhaTaxa := aLinhaTaxa +  Format('%-32s',[aNomeTaxa])+Format('%15s',[aValorTaxa+#13]);
                                              // aValorTaxa := aValorTaxa + Format('%10.2f',[ZQryMovTaxasvalor.AsFloat]) +#13;
                                              fTotalTaxa := fTotalTaxa + ZQryMovTaxasvalor.AsFloat;
                                          End;
                                          //
                                          Next;
                                      End;
                                      //
                                      // aListaMensagem.Add(aLinhaTaxa);

                                      aValorTaxa := Format('%15.2f',[fTotalTaxa]);
                                      //aLinhaTaxa := aLinhaTaxa + Format('%-30s',['TOTAL: '])+Format('%10.2f',[fTotalTaxa]);
                                      aLinhaTaxa := aLinhaTaxa + Format('%-47s',[uFuncoes.Replicate('-', 47)])+#13;
                                      aLinhaTaxa := aLinhaTaxa + Format('%-31s',['TOTAL: '])+Format('%15s',[aValorTaxa]);
                                      //aValorTaxa := aValorTaxa + Format('%10.2f',[fTotalTaxa]) +#13;
                                      //
                                      // aListaMensagem.Add(aLinhaTaxa);
                                      FrmMainBoletos.mnoListaMensagem.Lines.Add(aLinhaTaxa);
                                 End
                                 Else
                                 begin
                                      aLinhaTaxa := '';
                                      aValorTaxa := '';
                                      fTotalTaxa := 0;
                                      aLinhaTaxa := Format('%-32s',[uFuncoes.Alltrim(ZQryBoletodescricao.AsString)]);
                                      //
                                      {aListaMensagem.Add(Format('%-32s',['Descrição']));
                                      aListaMensagem.Add(aLinhaTaxa);}
                                      FrmMainBoletos.mnoListaMensagem.Lines.Add('Descrição');
                                      FrmMainBoletos.mnoListaMensagem.Lines.Add(aLinhaTaxa);
                                 End;
                            End;
                            //
                            //SetParam('pTextoFatura', aListaMensagem.Text);
                            if not uFuncoes.Empty(FrmMainBoletos.mnoListaMensagem.Text) Then
                                SetParam('pTextoFatura', uFuncoes.Alltrim(FrmMainBoletos.mnoListaMensagem.Text))
                            Else
                               SetParam('pTextoFatura', '');
                            {if uFuncoes.Empty(dmDados.cdsConfigMENSAGEM1.AsString) Then
                                SetParam('INSTRUCOES2','Pague somente na Rede Bancária ou na Administradora')
                            Else
                                SetParam('INSTRUCOES2',dmDados.cdsConfigMENSAGEM1.AsString);}
                         Finally
                                { Libera a instancia da lista da memória }
                               { if Assigned(aListaMensagem) Then
                                   aListaMensagem.Free;    }
                         End;
                       End;
                       //
                       If FileExists(aArquivoLogoRel) Then
                          SetParam('pIMG', aArquivoLogoRel);
                  End;
                  //
                  If (aTipo = 'V') Then
                  begin
                       RvSysFreteVersoDetalhe.DefaultDest     := rdPreview;
                       RvSysFreteVersoDetalhe.DoNativeOutput  := true;
                       //ExecuteReport('Report1');
                       Execute;
                  End;
                  //
                  If (aTipo = 'I') Then
                   begin
                       RvSysFreteVersoDetalhe.DefaultDest     := rdPrinter;
                       if (aPrimeiraImp = 'S') Then
                           RvSysFreteVersoDetalhe.SystemSetups    := RvSysFreteVersoDetalhe.SystemSetups + [ssAllowSetup]
                       Else
                           RvSysFreteVersoDetalhe.SystemSetups    := RvSysFreteVersoDetalhe.SystemSetups - [ssAllowSetup];
                       RvSysFreteVersoDetalhe.DoNativeOutput  := true;
                       Execute;
                   End;
                  //
                  If (aTipo = 'A') Then
                    begin
                      aNomePasta := ExtractFilePath( Application.ExeName )+'PDF';
                      if not DirectoryExists(aNomePasta) then
                         ForceDirectories(aNomePasta);
                      //
                      aPlacaCPF_CNPJ := GetPlacaCpfCnpjCliente(idDocumento);
                      aDataVenc := uFuncoes.RemoveChar(aDataVenc);
                      //
                      aNomeArquivo   := aPlacaCPF_CNPJ + '_'+uFuncoes.StrZero(IntToStr(idDocumento),9)+'_'+aDataVenc+'.PDF';
                      //
                      if not uFuncoes.Empty(aEmail) Then
                          AddEmailLista(LowerCase(aEmail), aNomeArquivo);
                      //
                      try
                         aNomePasta := aNomePasta+'\'+aNomeArquivo;
                         RvSysFreteVersoDetalhe.DefaultDest     := rdFile;
                         RvSysFreteVersoDetalhe.SystemSetups    := RvSysFreteVersoDetalhe.SystemSetups - [ssAllowSetup];
                         RvSysFreteVersoDetalhe.DoNativeOutput  := False;
                         RvSysFreteVersoDetalhe.OutputFileName  := aNomePasta;
                         RvSysFreteVersoDetalhe.RenderObject    := RvRenderPDF1;
                         //
                         {SaveDialog1.Filter       := 'Acrobat Reader|PDF';
                         SaveDialog1.DefaultExt   := 'PDF';
                         SaveDialog1.FileName     := aArquivo;
                         RvSystem2.OutputFileName := SaveDialog1.FileName;}
                         //
                         Execute;
                      Except
                         Application.MessageBox(Pchar('Erro ao tentar exportar!'),
                            'Exportação',MB_OK + MB_ICONERROR);
                      End;
                   End;
             end;
         Except
             on e: exception do
              begin
                  Application.MessageBox(PChar('Erro ao tentar gerar boleto!!! Erro:'+#13
                         + E.Message),   'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              End;
         End;
     Finally
          {if Assigned(objRelatorio) Then
             FreeAndNil(objRelatorio);}
           {  if Assigned(aListaMensagem) Then
                 aListaMensagem.Free;}
     End;
end;

function TdmDados.ImprimirVerso(idRecebimento, aTipoImpressao: String): Boolean;
Var
   M_IDCLIE : Integer;
   M_IDVEIC : String;
begin
      With ZQryBoleto do
      begin
           Active := False;
           Params[0].AsInteger := StrtoInt(idRecebimento);
           Active := True;
           //
           if not (IsEmpty) Then
             begin
                  //
                  M_IDVEIC := FieldByName('veiculo_id').AsString;
             End;
      End;
     FilterDataSet(ZQryVeiculo, fsString, M_IDVEIC);
     //
     If not (ZQryVeiculo.IsEmpty) Then
         M_IDCLIE := ZQryVeiculo.FieldByname('cliente_id').AsInteger;
     // Abre dados do cliente
     FilterDataSet(ZQryCliente, fsInteger, InttoStr(M_IDCLIE));
     //
     With RvBoletoVerso do
     begin
             SetParam('pRemetente',cdsConfigRAZAO.AsString);
             SetParam('pRemetenteEndereco',cdsConfigENDERECO.AsString);

             // Clientes
             SetParam('NMSACA', ZQryClientenome.AsString );
             SetParam('ENDSACA', ZQryClientelogradouro.AsString+', Nº.'+ZQryClientenumero.AsString+' - '
                      +GetNomeBairro(ZQryClientecidade_id.AsInteger, ZQryClientebairro_id.AsInteger) + ' - '+ ZQryClientecomplemento.AsString);
             SetParam('pCEPCIDUF', uFuncoes.FormataCep(ZQryClientecep.AsString) + ' - '
                                      + GetNomeCidade(ZQryClientecidade_id.AsInteger) + ' - '
                                      + GetUFCidade(ZQryClientecidade_id.AsInteger));

             If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
                 aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';

             If FileExists(aArquivoLogoRel) Then
               SetParam('pLOGO', aArquivoLogoRel);

           If (aTipoImpressao = 'V') Then
             begin
                   RvSystemVerso.DefaultDest     := rdPreview;
                   RvSystemVerso.DoNativeOutput  := true;
             End;
             //
           If (aTipoImpressao = 'I') Then
             begin
                  RvSystemVerso.DefaultDest     := rdPrinter;
                  RvSystemVerso.SystemSetups    := RvSystemVerso.SystemSetups - [ssAllowSetup];
                  RvSystemVerso.DoNativeOutput  := true;
             End;

          Execute;
     End;
end;

function TdmDados.AbrirGrupos: Boolean;
begin
     result := False;
     With ZQryGrupos do
      begin
           Close;
           Open;
           //
           if not (IsEmpty) Then
             Result := True;
      End;
end;

function TdmDados.AddGrupoLista(aCodigo, aDescricao: String): Boolean;
begin
     result := False;
     With cdsListaGrupos do
     begin
          Append;
          FieldByName('gru_codigo').AsString    := aCodigo;
          FieldByName('gru_descricao').AsString := aDescricao;
          Post;
          //
          Result := True;
     End;
end;

function TdmDados.VerificaSomenteEmailCliente(idContasReceber: Integer): Boolean;
var qraux : TZquery;
    texto : string;
begin
  Result := False;
  //texto  := 'select id, email, somente_email from clientes where id = :pid ';
  texto  := 'Select cr.id, cr.veiculo_id, v.cliente_id, cl.somente_email from contas_receber cr ';
  texto  := texto + 'inner join veiculos v on cr.veiculo_id = v.id ';
  texto  := texto + 'inner join clientes cl on v.cliente_id = cl.id ';
  texto  := texto + 'where (cr.id = :pid)  ';
  //
  QrAux := TZquery.Create(nil);
  with QrAux do
   try
       Connection := ZConexao;
       sql.Add(texto);
       Params.ParamByName('pid').AsInteger := idContasReceber;
       Open;
       //
       If not (IsEmpty) Then
         if (FieldByname('somente_email').AsBoolean) Then
             Result := True;
   finally
      free;
   end;
end;

end.
