object FrmPrincipalAB: TFrmPrincipalAB
  Left = 0
  Top = 0
  Caption = 'Controle Abastecimentos'
  ClientHeight = 436
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 573
    Height = 33
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 573
    Height = 403
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 571
      Height = 401
      Align = alClient
      Caption = 'Abastecimentos'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 567
        Height = 343
        Align = alClient
        DataSource = DsGrid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_BOMBA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDELT'
            Title.Caption = 'Litros'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorTotal'
            Title.Caption = 'Valor Abastecimento'
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorImposto'
            Title.Caption = 'Imposto'
            Width = 97
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 2
        Top = 358
        Width = 567
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btnAtualizar: TSpeedButton
          Left = 292
          Top = 6
          Width = 89
          Height = 25
          Caption = 'Atualizar'
          OnClick = btnAtualizarClick
        end
        object btnIncluir: TSpeedButton
          Left = 7
          Top = 6
          Width = 89
          Height = 25
          Caption = 'Incluir'
          OnClick = btnIncluirClick
        end
        object btnExcluir: TSpeedButton
          Left = 197
          Top = 6
          Width = 89
          Height = 25
          Caption = 'Excluir'
          OnClick = btnExcluirClick
        end
        object Editar: TSpeedButton
          Left = 102
          Top = 6
          Width = 89
          Height = 25
          Caption = 'Editar'
          OnClick = EditarClick
        end
      end
    end
  end
  object DsGrid: TDataSource
    Left = 449
    Top = 298
  end
end
