object FrmEnviarEmail: TFrmEnviarEmail
  Left = 275
  Top = 137
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enviar Email'
  ClientHeight = 517
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 30
      Height = 13
      Caption = 'SMTP'
      Transparent = True
    end
    object Label2: TLabel
      Left = 330
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Porta'
      Transparent = True
    end
    object Label3: TLabel
      Left = 431
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Login'
      Transparent = True
    end
    object Label4: TLabel
      Left = 733
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Senha'
      Transparent = True
    end
    object edtSMTP: TEdit
      Left = 13
      Top = 24
      Width = 305
      Height = 21
      CharCase = ecLowerCase
      ReadOnly = True
      TabOrder = 0
    end
    object edtPorta: TEdit
      Left = 330
      Top = 24
      Width = 89
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtLogin: TEdit
      Left = 431
      Top = 24
      Width = 289
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 733
      Top = 24
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object cbkSSL: TCheckBox
      Left = 13
      Top = 56
      Width = 97
      Height = 17
      Caption = 'SSL'
      TabOrder = 4
    end
    object cbkTSL: TCheckBox
      Left = 125
      Top = 56
      Width = 97
      Height = 17
      Caption = 'TSL'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 920
    Height = 93
    Align = alTop
    TabOrder = 1
    object Label5: TLabel
      Left = 13
      Top = 8
      Width = 17
      Height = 13
      Caption = 'De:'
      Transparent = True
    end
    object Label6: TLabel
      Left = 13
      Top = 46
      Width = 41
      Height = 13
      Caption = 'Assunto:'
      Transparent = True
    end
    object edtDE: TEdit
      Left = 13
      Top = 24
      Width = 449
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtAssunto: TEdit
      Left = 13
      Top = 61
      Width = 449
      Height = 21
      TabOrder = 1
    end
  end
  object pnlMensagem: TPanel
    Left = 0
    Top = 174
    Width = 920
    Height = 242
    Align = alClient
    TabOrder = 2
    object Label7: TLabel
      Left = 13
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Mensagem'
      Transparent = True
    end
    object mmoEmail: TMemo
      Left = 13
      Top = 24
      Width = 716
      Height = 185
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 736
      Top = 24
      Width = 320
      Height = 201
      DataSource = dsListaEmails
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CDS_ENVIADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_EMAIL_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_NOME_ARQUIVO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_IDREGISTRO'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 416
    Width = 920
    Height = 82
    Align = alBottom
    TabOrder = 3
    object lblMensagem: TLabel
      Left = 16
      Top = 63
      Width = 65
      Height = 13
      Caption = 'Mensagem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 40
      Width = 617
      Height = 17
      TabOrder = 0
    end
    object btnEnviar: TBitBtn
      Left = 16
      Top = 8
      Width = 209
      Height = 25
      Hint = 'Clique aqui para enviar os emails'
      Caption = 'Enviar email'
      TabOrder = 1
      OnClick = btnEnviarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
        77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
        FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
        FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
        FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
        FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
        00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
        00333333337FFFFF773333333300000003333333337777777333}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 640
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 498
    Width = 920
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 64
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object Configuraes1: TMenuItem
        Caption = '&Configura'#231#245'es...'
        OnClick = Configuraes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = '&Fechar'
        OnClick = Fechar1Click
      end
    end
  end
  object dsListaEmails: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsListaEmails
    Left = 584
    Top = 150
  end
end
