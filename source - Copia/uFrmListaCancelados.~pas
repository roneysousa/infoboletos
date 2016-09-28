unit uFrmListaCancelados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons, DBCtrls;

type
  TFrmListaCanc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    dsLista: TDataSource;
    btnFechar: TBitBtn;
    lblRegistros: TLabel;
    btEtiqueta: TBitBtn;
    DBNavigator1: TDBNavigator;
    btnVisualizar: TBitBtn;
    btnProtocolo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dsListaDataChange(Sender: TObject; Field: TField);
    procedure btEtiquetaClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnProtocoloClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaCanc: TFrmListaCanc;

implementation

uses untDMDados, untMenu;

{$R *.dfm}

procedure TFrmListaCanc.FormShow(Sender: TObject);
begin
     dmDados.RefreshCDS(dmDados.cdsListaCancelados);
end;

procedure TFrmListaCanc.btnFecharClick(Sender: TObject);
begin
       Close;
end;

procedure TFrmListaCanc.dsListaDataChange(Sender: TObject; Field: TField);
begin
     if (dsLista.DataSet.Active) and not (dsLista.DataSet.IsEmpty) Then
      begin
          lblRegistros.Caption  := 'Registro(s): '+InttoStr(dsLista.DataSet.RecNo)+' :: ' +InttoStr(dsLista.DataSet.RecordCount);
          btEtiqueta.Enabled    := True;
          btnVisualizar.Enabled := True;
          btnProtocolo.Enabled := True;
      End
      Else
      begin
          btEtiqueta.Enabled    := False;
          btnVisualizar.Enabled := False;
          btnProtocolo.Enabled  := False;
      End;
end;

procedure TFrmListaCanc.btEtiquetaClick(Sender: TObject);
begin
     if (dsLista.DataSet.Active) and not (dsLista.DataSet.IsEmpty) Then
      begin
             btEtiqueta.Enabled := false;
             try
                dmDados.ImprimirEtiquetasCancelados(dmDados.cdsListaCancelados);

             Finally
                dmDados.cdsListaCancelados.First;
                btEtiqueta.Enabled := true;
             End;
      End;
end;

procedure TFrmListaCanc.btnVisualizarClick(Sender: TObject);
begin
     If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
       aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
     //
     btnVisualizar.Enabled := False;
     Try
         With dmDados.rvAvisoCancelamento do
          begin
               SetParam('pRazao',  dmDados.cdsConfigRAZAO.AsString);
               SetParam('pEndereco',dmDados.cdsConfigENDERECO.AsString);
               SetParam('pCidade', 'CIDADE: TERESINA   UF: PI');
               SetParam('pDataEmissao', 'DATA DE EMISSÃO: '+DatetoStr(Date()));
               //
               If FileExists(aArquivoLogoRel) Then
                  SetParam('pIMG', aArquivoLogoRel);
               //
               Execute;    
          End;
     Finally
           btnVisualizar.Enabled := true;
     End;
     //
     Application.ProcessMessages;
end;

procedure TFrmListaCanc.btnProtocoloClick(Sender: TObject);
begin
     If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
       aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
       
     btnProtocolo.Enabled := False;
     Try
           With dmDados.rvListaEntregaCanc do
          begin
               SetParam('pRazao',   dmDados.cdsConfigRAZAO.AsString);
               SetParam('pTitulo',  'PROTOCOLO DE ENVIO DE CORRESPONDÊNCIAS :: CANCELADOS');
               SetParam('pUsuario', 'EMITIDO POR: '+ untMenu.aNomeUsuario);
               SetParam('pData',    'DATA DE EMISSÃO: '+DatetoStr(Date()));
               //
               If FileExists(aArquivoLogoRel) Then
                  SetParam('pIMG', aArquivoLogoRel);
               //
               Execute;    
          End;
     Finally
         btnProtocolo.Enabled := True;
     End;
     Application.ProcessMessages;
end;

end.
