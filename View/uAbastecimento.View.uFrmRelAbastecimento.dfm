object FrmRelatorio: TFrmRelatorio
  Left = 0
  Top = 0
  Caption = 'FrmRelatorio'
  ClientHeight = 607
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 913
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 57
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 132
      Top = 6
      Width = 52
      Height = 13
      Caption = 'Data Final:'
    end
    object Button1: TButton
      Left = 248
      Top = 21
      Width = 87
      Height = 25
      Caption = 'Gerar Relatorio'
      TabOrder = 0
      OnClick = Button1Click
    end
    object dtInicio: TDatePicker
      Left = 16
      Top = 22
      Width = 102
      Height = 21
      Date = 44851.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
    end
    object dtFim: TDatePicker
      Left = 132
      Top = 22
      Width = 102
      Height = 21
      Date = 44851.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
    end
  end
  object RLReport1: TRLReport
    Left = 8
    Top = 63
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 64
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel7: TRLLabel
        Left = 5
        Top = 3
        Width = 81
        Height = 16
        Caption = 'RELAT'#211'RIO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 86
        Top = 3
        Width = 164
        Height = 16
        Caption = 'Controle de Abastecimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLDtHora: TRLLabel
        Left = 268
        Top = 3
        Width = 33
        Height = 13
        Caption = 'Data:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSysData: TRLSystemInfo
        Left = 306
        Top = 3
        Width = 34
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel39: TRLLabel
        Left = 596
        Top = 3
        Width = 41
        Height = 13
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 643
        Top = 3
        Width = 72
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 47
        Top = 23
        Width = 60
        Height = 16
        Caption = '..............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 5
        Top = 23
        Width = 41
        Height = 16
        Caption = 'Filtro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 8
        Top = 45
        Width = 33
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 99
        Top = 45
        Width = 52
        Height = 16
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 198
        Top = 45
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 325
        Top = 45
        Width = 39
        Height = 16
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 405
        Top = 45
        Width = 38
        Height = 16
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 546
        Top = 44
        Width = 54
        Height = 16
        Caption = 'Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 102
      Width = 718
      Height = 67
      DataFields = 'DATA'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 3
          Top = 6
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 405
          Top = 6
          Width = 88
          Height = 16
          DataField = 'VALORTOTAL'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00'
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 99
          Top = 3
          Width = 76
          Height = 16
          DataField = 'ID_TANQUE'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 546
          Top = 6
          Width = 107
          Height = 16
          DataField = 'VALORIMPOSTO'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00'
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 198
          Top = 6
          Width = 95
          Height = 16
          DataField = 'DESC_BOMBA'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 325
          Top = 6
          Width = 53
          Height = 16
          DataField = 'QTDELT'
          DataSource = DataSource1
          DisplayMask = '0.00 L'
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 32
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedTop = True
        Borders.FixedBottom = True
        object RLDBResult1: TRLDBResult
          Left = 447
          Top = 3
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'VALORTOTAL'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00'
          Info = riSum
          Text = ''
        end
        object RLLabel8: TRLLabel
          Left = 405
          Top = 3
          Width = 42
          Height = 16
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 19
          Caption = 'Totais Dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 546
          Top = 3
          Width = 58
          Height = 16
          Caption = 'Imposto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 604
          Top = 3
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'VALORIMPOSTO'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00'
          Info = riSum
          Text = ''
        end
        object RLLabel16: TRLLabel
          Left = 263
          Top = 3
          Width = 43
          Height = 16
          Caption = 'Litros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 306
          Top = 3
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'QTDELT'
          DataSource = DataSource1
          DisplayMask = '0.00 L'
          Info = riSum
          Text = ''
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 169
      Width = 718
      Height = 48
      BeforePrint = RLBand4BeforePrint
      object RLLabel11: TRLLabel
        Left = 3
        Top = 4
        Width = 51
        Height = 19
        Caption = 'Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 263
        Top = 3
        Width = 43
        Height = 16
        Caption = 'Litros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 405
        Top = 3
        Width = 42
        Height = 16
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 546
        Top = 3
        Width = 58
        Height = 16
        Caption = 'Imposto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object totalLitros: TRLLabel
        Left = 305
        Top = 3
        Width = 60
        Height = 16
        Caption = '..............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object totalValor: TRLLabel
        Left = 447
        Top = 3
        Width = 60
        Height = 16
        Caption = '..............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Totalmposto: TRLLabel
        Left = 604
        Top = 4
        Width = 60
        Height = 16
        Caption = '..............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object DataSource1: TDataSource
    Left = 472
    Top = 8
  end
end
