object frmCrudAbastecimento: TfrmCrudAbastecimento
  Left = 0
  Top = 0
  Caption = 'Abastecimento'
  ClientHeight = 151
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 336
    Height = 151
    Align = alClient
    Caption = 'Lan'#231'ar Abastecimento'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitWidth = 713
    ExplicitHeight = 418
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object Label2: TLabel
      Left = 123
      Top = 15
      Width = 36
      Height = 13
      Caption = 'Bomba:'
    end
    object Label3: TLabel
      Left = 14
      Top = 59
      Width = 31
      Height = 13
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 114
      Top = 60
      Width = 31
      Height = 13
      Caption = 'Label3'
    end
    object Label5: TLabel
      Left = 210
      Top = 59
      Width = 31
      Height = 13
      Caption = 'Label3'
    end
    object cbBomba: TComboBox
      Left = 123
      Top = 31
      Width = 173
      Height = 21
      TabOrder = 0
      Text = 'cbBomba'
    end
    object edt_Litros: TNumberBox
      Left = 14
      Top = 75
      Width = 90
      Height = 21
      CurrencyString = 'Lt'
      Mode = nbmCurrency
      MaxLength = 4
      TabOrder = 1
    end
    object edt_Valor: TNumberBox
      Left = 110
      Top = 75
      Width = 90
      Height = 21
      Mode = nbmCurrency
      MaxLength = 4
      TabOrder = 2
    end
    object edt_ValorImposto: TNumberBox
      Left = 206
      Top = 75
      Width = 90
      Height = 21
      Mode = nbmCurrency
      MaxLength = 4
      ReadOnly = True
      TabOrder = 3
    end
    object btSalvar: TButton
      Left = 14
      Top = 102
      Width = 75
      Height = 32
      Caption = 'Salvar'
      TabOrder = 4
    end
    object DatePicker1: TDatePicker
      Left = 11
      Top = 31
      Width = 97
      Height = 21
      Date = 44849.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
    end
    object BitBtn1: TBitBtn
      Left = 95
      Top = 102
      Width = 74
      Height = 32
      Caption = 'Cancelar'
      TabOrder = 6
    end
  end
end
