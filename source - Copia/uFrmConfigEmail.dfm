object FrmConfigEmail: TFrmConfigEmail
  Left = 238
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es para Envio de Email'
  ClientHeight = 416
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 375
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 30
      Height = 13
      Caption = 'SMTP'
      FocusControl = edtSMTP
    end
    object Label2: TLabel
      Left = 16
      Top = 49
      Width = 37
      Height = 13
      Caption = 'PORTA'
      FocusControl = edtPorta
    end
    object Label3: TLabel
      Left = 16
      Top = 89
      Width = 33
      Height = 13
      Caption = 'LOGIN'
      FocusControl = edtLogin
    end
    object Label5: TLabel
      Left = 16
      Top = 132
      Width = 32
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 16
      Top = 172
      Width = 52
      Height = 13
      Caption = 'ASSUNTO'
      FocusControl = DBEdit6
    end
    object Label4: TLabel
      Left = 16
      Top = 216
      Width = 62
      Height = 13
      Caption = 'MENSAGEM'
      FocusControl = DBMemo1
    end
    object edtSMTP: TDBEdit
      Left = 16
      Top = 25
      Width = 500
      Height = 21
      CharCase = ecLowerCase
      DataField = 'SMTP'
      DataSource = dsDados
      TabOrder = 0
    end
    object edtPorta: TDBEdit
      Left = 16
      Top = 65
      Width = 134
      Height = 21
      DataField = 'PORTA'
      DataSource = dsDados
      TabOrder = 1
    end
    object edtLogin: TDBEdit
      Left = 16
      Top = 105
      Width = 500
      Height = 21
      CharCase = ecLowerCase
      DataField = 'LOGIN'
      DataSource = dsDados
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 148
      Width = 500
      Height = 21
      DataField = 'NOME_DE'
      DataSource = dsDados
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 188
      Width = 500
      Height = 21
      DataField = 'ASSUNTO'
      DataSource = dsDados
      TabOrder = 4
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 232
      Width = 500
      Height = 89
      DataField = 'MENSAGEM'
      DataSource = dsDados
      TabOrder = 5
    end
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 328
      Width = 97
      Height = 17
      Caption = 'SSL'
      DataField = 'SSL'
      DataSource = dsDados
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 16
      Top = 352
      Width = 97
      Height = 17
      Caption = 'TSL'
      DataField = 'TSL'
      DataSource = dsDados
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 375
    Width = 543
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 353
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 441
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object dsDados: TDataSource
    DataSet = dmDados.cdsConfigEmail
    Left = 304
    Top = 56
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 72
  end
end
