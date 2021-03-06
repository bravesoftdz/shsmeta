object SprLoaderForm: TSprLoaderForm
  Left = 0
  Top = 0
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074' '#1041#1044
  ClientHeight = 463
  ClientWidth = 753
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 753
    Height = 463
    ActivePage = tsSverka
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tsMaterial: TTabSheet
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1046#1041#1048
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object pnlUpdMat: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          741
          46)
        object lbUpdMatTitle: TLabel
          Left = 8
          Top = 1
          Width = 171
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1085#1086#1074#1099#1093' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnUpdMat: TButton
          Left = 555
          Top = 16
          Width = 93
          Height = 25
          Action = actUpdMat
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUpdMat: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object cbMonthMat: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearMat: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
      object pnlUpdMatPrice: TPanel
        Left = 0
        Top = 100
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          741
          46)
        object lbUpdMatPriceTitle: TLabel
          Left = 8
          Top = 1
          Width = 155
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1094#1077#1085' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtUpdMatPrice: TButtonedEdit
          Left = 8
          Top = 20
          Width = 363
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = edtRightButtonClick
        end
        object btnUpdMatPrice: TButton
          Left = 555
          Top = 17
          Width = 93
          Height = 25
          Action = actUpdMatPrice
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object cbMonthMatPrice: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearMatPrice: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
      object pnlUpdMatNoTrans: TPanel
        Left = 0
        Top = 150
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          741
          46)
        object lbUpdMatNoTransTitle: TLabel
          Left = 8
          Top = 1
          Width = 225
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1073#1077#1079' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtUpdMatNoTrans: TButtonedEdit
          Left = 6
          Top = 20
          Width = 546
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = edtRightButtonClick
        end
        object btnUpdMatNoTrans: TButton
          Left = 555
          Top = 17
          Width = 93
          Height = 25
          Action = actUpdMatNoTrans
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
      object pnlUpdJBI: TPanel
        Left = 0
        Top = 200
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          741
          46)
        object lbUpdJBITitle: TLabel
          Left = 6
          Top = 1
          Width = 128
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1094#1077#1085' '#1085#1072' '#1046#1041#1048':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtUpdJBI: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = edtRightButtonClick
        end
        object btnUpdJBI: TButton
          Left = 555
          Top = 18
          Width = 93
          Height = 25
          Action = actUpdJBI
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object cbMonthJBI: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearJBI: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
        object cboxUpdJBIName: TCheckBox
          Left = 375
          Top = 0
          Width = 202
          Height = 17
          Anchors = [akTop, akRight]
          Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1046#1041#1048
          TabOrder = 4
        end
      end
      object pnlUpdMatNoPrice: TPanel
        Left = 0
        Top = 50
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 4
        DesignSize = (
          741
          46)
        object lbUpdMatNoPriceTitle: TLabel
          Left = 8
          Top = 1
          Width = 178
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1073#1077#1079' '#1094#1077#1085':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtUpdMatNoPrice: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = edtRightButtonClick
        end
        object btnUpdMatNoPrice: TButton
          Left = 555
          Top = 17
          Width = 93
          Height = 25
          Action = actUpdMatNoPrice
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object cbMonthMatNoPrice: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearMatNoPrice: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
        object cboxUpdMatName: TCheckBox
          Left = 375
          Top = 0
          Width = 202
          Height = 17
          Anchors = [akTop, akRight]
          Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
          TabOrder = 4
        end
      end
    end
    object tsMechanism: TTabSheet
      Caption = #1069#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1103' '#1084#1072#1096#1080#1085
      ImageIndex = 1
      object pnlUpdMech: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 78
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          741
          74)
        object lbUpdMechTitle: TLabel
          Left = 8
          Top = 1
          Width = 168
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1094#1077#1085' '#1085#1072' '#1084#1077#1093#1072#1085#1080#1079#1084#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtUpdMech: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = edtRightButtonClick
        end
        object btnUpdMech: TButton
          Left = 555
          Top = 16
          Width = 93
          Height = 25
          Action = actUpdMech
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object cbMonthMech: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearMech: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
        object cboxUpdMechName: TCheckBox
          Left = 375
          Top = 0
          Width = 186
          Height = 17
          Anchors = [akTop, akRight]
          Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074
          TabOrder = 4
        end
        object btnClearMechPrice: TButton
          Left = 375
          Top = 46
          Width = 177
          Height = 25
          Action = actClearMechPrice
          Anchors = [akTop, akRight]
          TabOrder = 5
        end
      end
    end
    object tsTransp: TTabSheet
      Caption = #1054#1090#1093#1086#1076#1099' '#1080' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
      ImageIndex = 2
      object pnlUpdCargoBoard: TPanel
        Left = 0
        Top = 50
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          741
          46)
        object lbpnlUpdCargoBoardTitle: TLabel
          Left = 8
          Top = 1
          Width = 388
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1072#1088#1080#1092#1086#1074' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091' '#1075#1088#1091#1079#1086#1074' '#1073#1086#1088#1090#1086#1074#1099#1084#1080' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnUpdCargoBoard: TButton
          Left = 555
          Top = 16
          Width = 93
          Height = 25
          Action = actUpdCargoBoard
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUpdCargoBoard: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object cbMonthCargoBoard: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearCargoBoard: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
      object pnlUpdTransKoef: TPanel
        Left = 0
        Top = 100
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          741
          46)
        object lbUpdTransKoefTitle: TLabel
          Left = 8
          Top = 1
          Width = 416
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1082' '#1090#1072#1088#1080#1092#1072#1084' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091' '#1073#1086#1088#1090#1086#1074#1099#1084#1080' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnUpdTransKoef: TButton
          Left = 555
          Top = 16
          Width = 93
          Height = 25
          Action = actUpdTransKoef
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUpdTransKoef: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object cbMonthTransKoef: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearTransKoef: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
      object pnlUpdDump: TPanel
        Left = 0
        Top = 200
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          741
          46)
        object lbUpdDumpTitle: TLabel
          Left = 8
          Top = 1
          Width = 303
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1072#1088#1080#1092#1086#1074' '#1085#1072' '#1087#1088#1080#1077#1084' '#1080' '#1079#1072#1093#1086#1088#1072#1085#1077#1085#1080#1077' '#1086#1090#1093#1086#1076#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnUpdDump: TButton
          Left = 555
          Top = 16
          Width = 93
          Height = 25
          Action = actUpdDump
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUpdDump: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object cbMonthDump: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearDump: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
      object pnlUpdCargo: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        DesignSize = (
          741
          46)
        object lbUpdCargoTitle: TLabel
          Left = 8
          Top = 1
          Width = 400
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1072#1088#1080#1092#1086#1074' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091' '#1075#1088#1091#1079#1086#1074' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084#1080'-'#1089#1072#1084#1086#1089#1074#1072#1083#1072#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnUpdCargo: TButton
          Left = 555
          Top = 17
          Width = 93
          Height = 25
          Action = actUpdCargo
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUpdCargo: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object cbMonthCargo: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearCargo: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
      object pnlUpdTarif: TPanel
        Left = 0
        Top = 150
        Width = 745
        Height = 50
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        DesignSize = (
          741
          46)
        object lbUpdTarifTitle: TLabel
          Left = 8
          Top = 1
          Width = 349
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1072#1088#1080#1092#1086#1074' '#1085#1072' '#1087#1086#1075#1088#1091#1079#1086#1095#1085#1099#1077' '#1080' '#1088#1072#1079#1075#1088#1091#1079#1086#1095#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnUpdTarif: TButton
          Left = 555
          Top = 16
          Width = 93
          Height = 25
          Action = actUpdTarif
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUpdTarif: TButtonedEdit
          Left = 6
          Top = 20
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object cbMonthTarif: TComboBox
          Left = 375
          Top = 20
          Width = 100
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edtYearTarif: TSpinEdit
          Left = 479
          Top = 19
          Width = 73
          Height = 22
          Anchors = [akTop, akRight]
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 3
          Value = 2000
        end
      end
    end
    object tsRates: TTabSheet
      Caption = #1056#1072#1089#1094#1077#1085#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object pnlUpdRates: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 241
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          741
          237)
        object lbUpdRatesTitle: TLabel
          Left = 8
          Top = 1
          Width = 184
          Height = 13
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081' '#1088#1072#1089#1094#1077#1085#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 45
          Width = 98
          Height = 13
          Caption = #1054#1090#1095#1077#1090' '#1086#1090' '#1086#1096#1080#1073#1082#1072#1093':'
        end
        object btnUpdRates: TButton
          Left = 558
          Top = 17
          Width = 93
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnUpdRatesClick
        end
        object edtUpdRates: TButtonedEdit
          Left = 6
          Top = 20
          Width = 546
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object memUpdRateRes: TMemo
          Left = 2
          Top = 60
          Width = 550
          Height = 170
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
    end
    object tsSverka: TTabSheet
      Caption = #1057#1074#1077#1088#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
      ImageIndex = 4
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 241
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          741
          237)
        object lbDBFPath: TLabel
          Left = 8
          Top = 1
          Width = 129
          Height = 13
          Caption = #1055#1091#1089#1090#1100' '#1082' DBF '#1090#1072#1073#1083#1080#1094#1072#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblError: TLabel
          Left = 216
          Top = 47
          Width = 132
          Height = 13
          Caption = #1054#1096#1080#1073#1082#1080' '#1089#1074#1077#1088#1082#1080' '#1088#1072#1089#1094#1077#1085#1086#1082':'
        end
        object btnSverkaMat: TButton
          Left = 2
          Top = 47
          Width = 195
          Height = 25
          Caption = #1057#1074#1077#1088#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnSverkaMatClick
        end
        object edtDBFPath: TButtonedEdit
          Left = 6
          Top = 20
          Width = 691
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = ImageList
          RightButton.Enabled = False
          RightButton.ImageIndex = 0
          TabOrder = 1
          OnRightButtonClick = edtRightButtonClick
        end
        object btnSverkaMech: TButton
          Left = 2
          Top = 78
          Width = 195
          Height = 25
          Caption = #1057#1074#1077#1088#1082#1072' '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnSverkaMechClick
        end
        object btnSverkaDev: TButton
          Left = 2
          Top = 109
          Width = 195
          Height = 25
          Caption = #1057#1074#1077#1088#1082#1072' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnSverkaDevClick
        end
        object btnSverkaRate: TButton
          Left = 2
          Top = 140
          Width = 195
          Height = 25
          Caption = #1057#1074#1077#1088#1082#1072' '#1088#1072#1089#1094#1077#1085#1086#1082
          TabOrder = 4
          OnClick = btnSverkaRateClick
        end
        object memError: TMemo
          Left = 216
          Top = 64
          Width = 481
          Height = 153
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 5
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 464
    Top = 312
    object pmFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object pmExit: TMenuItem
        Action = actClose
      end
    end
  end
  object ActionList: TActionList
    Left = 528
    Top = 312
    object actClose: TAction
      Category = #1060#1072#1081#1083
      Caption = #1042#1099#1093#1086#1076
      OnExecute = actCloseExecute
    end
    object actUpdMat: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdMatExecute
    end
    object actUpdJBI: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdJBIExecute
    end
    object actUpdMatNoPrice: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdMatNoPriceExecute
    end
    object actUpdMatPrice: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdMatPriceExecute
    end
    object actUpdMatNoTrans: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdMatNoTransExecute
    end
    object actUpdMech: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdMechExecute
    end
    object actUpdCargo: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdCargoExecute
    end
    object actUpdCargoBoard: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdCargoBoardExecute
    end
    object actClearMechPrice: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1094#1077#1085#1099' '#1079#1072' '#1084#1077#1089#1103#1094
      OnExecute = actClearMechPriceExecute
    end
    object actUpdTransKoef: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdTransKoefExecute
    end
    object actUpdDump: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdDumpExecute
    end
    object actUpdTarif: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = actUpdTarifExecute
    end
  end
  object ImageList: TImageList
    Left = 396
    Top = 312
    Bitmap = {
      494C010101000800780010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F9F9F900F6F6F600F2F2F200F0F0F000EEEEEE00EEEEEE00F0F0F000F2F2
      F200F6F6F600F9F9F900FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F900F0F0
      F000E4E4E400D7D7D700CACACA00BFBFBF00B6B6B600B6B6B600BFBFBF00A5B3
      BD009EADB800E5E5E500F0F0F000F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F900F0F0
      F000E4E4E400D7D7D700CACACA00BFBFBF00B6B6B600B6B6B60094A8B7003F88
      BD00497B9C0094A6B300F0F0F000F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F9F9F900F6F6F600F2F2F200F0F0F000EEEEEE00BED0DD00418BBF009CD1
      F5004B95CD00B3C9D800FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2E2ED00478EC2009CD1F5005099
      D2009EC1DB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005C95BF0091C9EE00539CD40096BC
      D800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00BDBE
      BE00A6A8A900B0B1B100A8AAAA00A6A7A800737A84004B89B8008FB7D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009FA1A100D2CC
      C100DCC29500DEC39200ECDABB00E7E1D9008E8F910000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8D9D900B6B5B500CEAE
      7700CEAB7000D9BB8600E3CB9E00EAD8B600CAC7C300D3D4D400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4B5B500DACFBF00D1B4
      8300CFAC7400D2B17700D9BB8600DDC39300EADECA00B1B3B300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B8B800DCD3C500DECB
      AA00D7BD9300D2B37F00CFAE7400D1B07700E5D9C300B5B6B600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E3E300BABBBA00E0CE
      B000E6D7BE00DBC5A000D2B58500D0B17D00C6C5C200DDDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B6B600D5D3
      CE00E5D6BE00DECBAB00E0CDAE00DAD6CE00ADAFAF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8C9
      C900AFB0B000ADAFAF00B0B1B100BDBEBE00FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000E001000000000000
      C000000000000000C000000000000000E001000000000000FF07000000000000
      FF0F000000000000C01F000000000000C07F000000000000803F000000000000
      803F000000000000803F000000000000803F000000000000C07F000000000000
      E07F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    Filter = 'EXCEL|*.xls;*.xlsx'
    Left = 316
    Top = 312
  end
  object q1: TQuery
    Left = 596
    Top = 312
  end
end
