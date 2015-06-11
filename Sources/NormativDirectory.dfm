object fNormativDirectory: TfNormativDirectory
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1089#1073#1086#1088#1085#1080#1082#1086#1074
  ClientHeight = 489
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 365
    Width = 646
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 398
    ExplicitWidth = 554
  end
  object tvMain: TJvDBTreeView
    Left = 0
    Top = 27
    Width = 646
    Height = 338
    DataSource = dsMain
    MasterField = 'normativ_directory_id'
    DetailField = 'parent_id'
    ItemField = 'FULL_NAME'
    StartMasterValue = '0'
    UseFilter = True
    PersistentNode = True
    ReadOnly = True
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    OnChange = tvMainChange
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 1
    OnDblClick = tvMainDblClick
    PopupMenu = pm1
    ParentFont = False
    RowSelect = True
    Mirror = False
    ExplicitTop = 30
    ExplicitWidth = 554
    ExplicitHeight = 362
  end
  object grSostav: TJvDBGrid
    Left = 0
    Top = 368
    Width = 646
    Height = 121
    Align = alBottom
    DataSource = dsDetail
    Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AutoAppend = False
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 16
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Expanded = False
        FieldName = 'FULL_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1089#1090#1072#1074' '#1088#1072#1073#1086#1090
        Width = 642
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 646
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 554
    DesignSize = (
      646
      27)
    object lbl1: TLabel
      Left = 8
      Top = 6
      Width = 34
      Height = 13
      Caption = #1055#1086#1080#1089#1082':'
    end
    object edtSearch: TEdit
      Left = 48
      Top = 3
      Width = 546
      Height = 21
      Hint = #1074#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      TextHint = #1074#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
      OnKeyPress = edtSearchKeyPress
      ExplicitWidth = 454
    end
    object btnSearchUp: TButton
      Left = 599
      Top = 2
      Width = 20
      Height = 23
      Hint = #1053#1072#1081#1090#1080' '#1088#1072#1085#1077#1077' ('#1074#1074#1077#1088#1093')'
      Anchors = [akTop, akRight]
      Caption = #171
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSearchUpClick
      ExplicitLeft = 507
    end
    object btnSearchDown: TButton
      Left = 622
      Top = 2
      Width = 20
      Height = 23
      Hint = #1053#1072#1081#1090#1080' '#1076#1072#1083#1077#1077' ('#1074#1085#1080#1079')'
      Anchors = [akTop, akRight]
      Caption = #187
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnSearchDownClick
      ExplicitLeft = 530
    end
  end
  object qrMain: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT CONCAT(IFNULL(FIRST_NAME, ""), IF(SECOND_NAME IS NULL, ""' +
        ', " - "), IFNULL(SECOND_NAME, "")) AS FULL_NAME, '
      
        'IFNULL(parent_id, 0) AS parent_id, normativ_directory_id, tree_d' +
        'ata'
      'FROM normativ_directory'
      'WHERE type_directory <> 6'
      
        'ORDER BY parent_id, CONCAT(LEFT("000000000000000000000000000000"' +
        ', 30-LENGTH(FIRST_NAME)), FIRST_NAME), SECOND_NAME')
    Left = 25
    Top = 344
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 24
    Top = 392
  end
  object qrDetail: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftBCD
    SQL.Strings = (
      'SELECT FIRST_NAME AS FULL_NAME, normativ_directory_id'
      'FROM normativ_directory'
      'WHERE type_directory = 6 AND parent_id=:normativ_directory_id'
      'ORDER BY FIRST_NAME')
    Left = 89
    Top = 368
    ParamData = <
      item
        Name = 'NORMATIV_DIRECTORY_ID'
        ParamType = ptInput
      end>
  end
  object dsDetail: TDataSource
    DataSet = qrDetail
    Left = 88
    Top = 416
  end
  object pm1: TPopupMenu
    Left = 304
    Top = 96
    object mN1: TMenuItem
      Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1077
      OnClick = mN1Click
    end
    object mN2: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
      OnClick = mN2Click
    end
  end
end
