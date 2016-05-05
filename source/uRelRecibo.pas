unit uRelRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB;

type
  TfrmRelRecibo = class(TForm)
    qrRecibo: TQuickRep;
    TitleBand1: TQRBand;
    txtRecebemos: TQRLabel;
    txtImportancia: TQRLabel;
    txtObs: TQRMemo;
    txtReferente: TQRMemo;
    txtRazao1: TQRLabel;
    txtCNPJ1: TQRLabel;
    txtNMRECIBO: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    txtValor: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    txtRazao2: TQRLabel;
    txtCNPJ2: TQRLabel;
    txtRecibo2: TQRLabel;
    QRLabel15: TQRLabel;
    txtVALOR2: TQRLabel;
    QRShape16: TQRShape;
    QRLabel17: TQRLabel;
    txtRecebemos2: TQRLabel;
    QRLabel19: TQRLabel;
    txtImportancia2: TQRLabel;
    QRLabel21: TQRLabel;
    txtReferentes2: TQRMemo;
    QRLabel22: TQRLabel;
    txtObs2: TQRMemo;
    QRShape17: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel27: TQRLabel;
    QRShape20: TQRShape;
    QRLabel29: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    DataSource1: TDataSource;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRImage3: TQRImage;
    QRImage1: TQRImage;
    rlblDatahora: TQRLabel;
    rlblDatahora2: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRecibo: TfrmRelRecibo;

implementation

uses untDMDados;

{$R *.dfm}

end.
