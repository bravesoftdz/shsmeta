object FormOwnData: TFormOwnData
  Left = 0
  Top = 0
  ClientHeight = 436
  ClientWidth = 974
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PanelOwnData: TPanel
    Left = 0
    Top = 0
    Width = 974
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = True
    DoubleBuffered = True
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object SpeedButtonMaterials: TSpeedButton
      Left = 143
      Top = 1
      Width = 140
      Height = 25
      GroupIndex = 1
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      OnClick = SpeedButtonClick
    end
    object SpeedButtonMechanisms: TSpeedButton
      Left = 285
      Top = 1
      Width = 140
      Height = 25
      GroupIndex = 1
      Caption = #1052#1077#1093#1072#1085#1080#1079#1084#1099
      OnClick = SpeedButtonClick
    end
    object SpeedButtonEquipments: TSpeedButton
      Left = 427
      Top = 1
      Width = 140
      Height = 25
      GroupIndex = 1
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      OnClick = SpeedButtonClick
    end
    object SpeedButtonRates: TSpeedButton
      Left = 1
      Top = 1
      Width = 140
      Height = 25
      GroupIndex = 1
      Down = True
      Caption = #1056#1072#1089#1094#1077#1085#1082#1080
      OnClick = SpeedButtonClick
    end
  end
end
