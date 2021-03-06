object fFileStorage: TfFileStorage
  Left = 0
  Top = 0
  Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 394
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 220
    Top = 0
    Height = 356
    ExplicitLeft = 320
    ExplicitTop = 112
    ExplicitHeight = 100
  end
  object tvDocuments: TJvDBTreeView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 214
    Height = 350
    DataSource = dsTreeData
    MasterField = 'doc_id'
    DetailField = 'parent_id'
    IconField = 'doc_type'
    ItemField = 'doc_name'
    StartMasterValue = '0'
    UseFilter = True
    PersistentNode = True
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 0
    ParentFont = False
    Images = il1
    RowSelect = True
    Mirror = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 356
    Width = 631
    Height = 38
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      631
      38)
    object btnAdd: TSpeedButton
      Left = 8
      Top = 6
      Width = 30
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF000000
        000000FFFFFFFFFFFFFFFFFFFFFFFF6666666666666666666666666666666666
        66666666666666FF00FFFFFFFF000000000000000000FFFFFF000000FFFFFF0C
        72A50C72A5076DA0056B9E056B9E01679A01679A666666666666FFFFFFFFFFFF
        000000000000000000000000FFFFFF6ED4FF6ED4FF6ED4FF6ED4FF6ED4FF3AA0
        D399FFFF01679A666666FFFFFFFFFFFFFFFFFF000000000000000000FFFFFF80
        E6FF80E6FF80E6FF80E6FF80E6FF43A9DC99FFFF01679A666666FFFFFFFFFFFF
        000000000000000000000000FFFFFF85EBFF85EBFF85EBFF85EBFF85EBFF4DB3
        E699FFFF056B9E666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91
        F7FF91F7FF91F7FF91F7FF91F7FF56BCEF99FFFF056B9E6666662C92C56ED4FF
        3399CC99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF5FC5
        F899FFFF076DA06666662C92C580E6FF2C92C5FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF80E6FFFFFFFF0C72A56666663298CB85EBFF
        80E6FF2C92C52C92C52C92C52C92C52C92C52C92C5278DC0248ABD1F85B81C82
        B51C82B51C82B5FF00FF3399CC91F7FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF157BAE666666FF00FFFF00FF3399CCFFFFFF
        99FFFF99FFFF99FFFF99FFFFFFFFFF248ABD2187BA1C82B51C82B51C82B5177D
        B0FF00FFFF00FFFF00FFFF00FF3399CCFFFFFFFFFFFFFFFFFFFFFFFF298FC2FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        3399CC3399CC3298CB2C92C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btnAddClick
    end
    object btnDelete: TSpeedButton
      Left = 72
      Top = 6
      Width = 30
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083'/'#1082#1072#1090#1072#1083#1086#1075
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF0000C0C0C0
        C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C0FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF
        808080808080C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
        FFFFFFFF808080808080C0C0C0FFFFFF808080808080C0C0C0FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF808080808080FFFFFFFFFFFF
        0000FF000000808080C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000FFFF
        FF0000FF000000C0C0C0FFFFFFFFFFFF4C4C4C000000808080C0C0C0FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF4C4C4C000000C0C0C0FFFFFF0000FF
        0000FF0000FF000000808080C0C0C0FF0000FF0000FF0000FF0000FFFFFFFFFF
        FFFFFFFF808080C0C0C0FFFFFF4C4C4C4C4C4C4C4C4C000000808080C0C0C0FF
        0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF808080C0C0C0FFFFFF0000FF
        0000FF0000FF0000FF000000808080C0C0C0FF0000FF0000FFFFFFFFFFFF0000
        FF000000C0C0C0FF0000FFFFFF4C4C4C4C4C4C4C4C4C4C4C4C000000808080C0
        C0C0FF0000FF0000FFFFFFFFFFFF4C4C4C000000C0C0C0FF0000FFFFFFFFFFFF
        0000FF0000FF0000FF000000808080C0C0C0FF0000FFFFFFFFFFFF0000FF0000
        00808080C0C0C0FF0000FFFFFFFFFFFF4C4C4C4C4C4C4C4C4C000000808080C0
        C0C0FF0000FFFFFFFFFFFF4C4C4C000000808080C0C0C0FF0000FF0000FFFFFF
        FFFFFF0000FF0000FF0000FF000000808080C0C0C0FFFFFF0000FF0000FF0000
        00C0C0C0FF0000FF0000FF0000FFFFFFFFFFFF4C4C4C4C4C4C4C4C4C00000080
        8080C0C0C0FFFFFF4C4C4C4C4C4C000000C0C0C0FF0000FF0000FF0000FF0000
        FFFFFFFFFFFF0000FF0000FF0000FF0000008080800000FF0000FF000000C0C0
        C0C0C0C0FF0000FF0000FF0000FF0000FFFFFFFFFFFF4C4C4C4C4C4C4C4C4C00
        00008080804C4C4C4C4C4C000000C0C0C0C0C0C0FF0000FF0000FF0000FF0000
        FF0000FFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF000000C0C0C0C0C0
        C0FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF4C4C4C4C4C4C4C
        4C4C4C4C4C4C4C4C000000C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFFFFFFFF0000FF0000FF0000FF000000808080C0C0C0FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF4C4C4C4C
        4C4C4C4C4C000000808080C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF000000808080C0C0
        C0FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF4C4C4C4C4C4C4C
        4C4C4C4C4C4C4C4C000000808080C0C0C0FF0000FF0000FF0000FF0000FFFFFF
        FFFFFFFFFFFF0000FF0000FF0000FF000000FFFFFF0000FF0000FF0000008080
        80C0C0C0FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF4C4C4C4C4C4C4C4C4C00
        0000FFFFFF4C4C4C4C4C4C000000808080C0C0C0FF0000FF0000FFFFFFFFFFFF
        0000FF0000FF0000FF0000FF000000C0C0C0FFFFFFFFFFFF0000FF0000FF0000
        00808080C0C0C0FF0000FFFFFFFFFFFF4C4C4C4C4C4C4C4C4C4C4C4C000000C0
        C0C0FFFFFFFFFFFF4C4C4C4C4C4C000000808080C0C0C0FF0000FFFFFF0000FF
        0000FF0000FF0000FF000000C0C0C0C0C0C0FF0000FFFFFFFFFFFF0000FF0000
        FF000000808080C0C0C0FFFFFF4C4C4C4C4C4C4C4C4C4C4C4C000000C0C0C0C0
        C0C0FF0000FFFFFFFFFFFF4C4C4C4C4C4C000000808080C0C0C0FFFFFF0000FF
        0000FF0000FF000000C0C0C0C0C0C0FF0000FF0000FF0000FFFFFFFFFFFFFFFF
        FF0000FF000000FFFFFFFFFFFF4C4C4C4C4C4C4C4C4C000000C0C0C0C0C0C0FF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFF4C4C4C000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC0C0C0FF0000FF0000FF0000FF0000FF0000FF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      OnClick = btnDeleteClick
    end
    object btn2: TSpeedButton
      Left = 40
      Top = 6
      Width = 30
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFC0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFF00FFFF000000000000000000000000000000C0C0C0FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFE1E1E100000000
        0000000000000000000000C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFF00FFFF618B0A5F880A5B8308557B07000000C0C0C0FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFE1E1E15F5F5F5D
        5D5D595959535353000000C0C0C0FF0000FF0000FF0000FF0000FF0000FFFFFF
        FFFFFFFFFFFFFFFFFF00FFFF6D9C0E6B990D66920C608A0A000000C0C0C0C0C0
        C0C0C0C0C0C0C0FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFE1E1E16C6C6C69
        69696464645E5E5E000000C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF0000FFFFFF
        00FFFF0000000000000000007AAD1277A91171A20F6A980D0000000000000000
        00000000C0C0C0FF0000FF0000FFFFFFE1E1E100000000000000000078787875
        7575707070696969000000000000000000000000C0C0C0FF0000FF0000FFFFFF
        00FFFF7FB51385BC1587BF1686BE1582B8147CB01274A5106A980D608A0A557B
        07000000C0C0C0FF0000FF0000FFFFFFE1E1E17E7E7E83838386868685858580
        80807A7A7A7272726969695E5E5E535353000000C0C0C0FF0000FF0000FFFFFF
        00FFFF8AC31790CC1993D01A93CF198DC81885BD157CB01271A20F66920C5B83
        08000000C0C0C0FF0000FF0000FFFFFFE1E1E18989898F8F8F9292929191918C
        8C8C8484847A7A7A707070646464595959000000C0C0C0FF0000FF0000FFFFFF
        00FFFF93CF199BDA1CA0E11D9EDF1D97D51B8DC81882B81477A9116B990D5F88
        0A000000C0C0C0FF0000FF0000FFFFFFE1E1E19191919A9A9A9F9F9F9D9D9D96
        96968C8C8C8080807575756969695D5D5D000000C0C0C0FF0000FF0000FFFFFF
        00FFFF98D61BA4E61EB6FF24A9ED209EDF1D93CF1986BE157AAD126D9C0E618B
        0A000000C0C0C0FF0000FF0000FFFFFFE1E1E1979797A2A2A2B5B5B5A7A7A79D
        9D9D9191918585857878786C6C6C5F5F5F000000C0C0C0FF0000FF0000FFFFFF
        00FFFF00FFFF00FFFF00FFFFB6FF24A0E11D93D01A87BF1600000000FFFF00FF
        FF00FFFFC0C0C0FF0000FF0000FFFFFFE1E1E1E1E1E1E1E1E1E1E1E1B5B5B59F
        9F9F929292868686000000E1E1E1E1E1E1E1E1E1C0C0C0FF0000FF0000FFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFA4E61E9BDA1C90CC1985BC15000000C0C0C0C0C0
        C0C0C0C0C0C0C0FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFE1E1E1A2A2A29A
        9A9A8F8F8F838383000000C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF0000FF0000
        FF0000FF0000FFFFFF00FFFF98D61B93CF198AC3177FB513000000C0C0C0FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFE1E1E197979791
        91918989897E7E7E000000C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFC0C0C0FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFE1E1E1E1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1C0C0C0FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000}
      NumGlyphs = 2
      OnClick = btn2Click
    end
    object btn1: TBitBtn
      Left = 550
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn1Click
    end
    object btnSelect: TBitBtn
      Left = 469
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = btnSelectClick
    end
  end
  object pnl2: TPanel
    AlignWithMargins = True
    Left = 226
    Top = 3
    Width = 402
    Height = 350
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      402
      350)
    object lbl1: TLabel
      Left = 4
      Top = 50
      Width = 182
      Height = 13
      Align = alCustom
      Caption = #1055#1091#1090#1100' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' / '#1082#1072#1090#1072#1083#1086#1075#1091' / URL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 394
      Height = 13
      Align = alTop
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'/'#1082#1072#1090#1072#1083#1086#1075#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 161
    end
    object btn4: TSpeedButton
      Left = 375
      Top = 69
      Width = 23
      Height = 21
      Hint = #1059#1082#1072#1079#1072#1090#1100' '#1092#1072#1081#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Anchors = [akTop, akRight]
      Caption = '...'
      OnClick = btn4Click
    end
    object dbedtdoc_name: TDBEdit
      AlignWithMargins = True
      Left = 4
      Top = 23
      Width = 394
      Height = 21
      Align = alTop
      DataField = 'doc_name'
      DataSource = dsTreeData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbedtdoc_path: TDBEdit
      Left = 4
      Top = 69
      Width = 365
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      DataField = 'doc_path'
      DataSource = dsTreeData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btn3: TBitBtn
      Left = 4
      Top = 96
      Width = 75
      Height = 25
      Caption = #1058#1077#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btn3Click
    end
    object dbchkdoc_use_owner_path: TDBCheckBox
      Left = 193
      Top = 48
      Width = 205
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1082#1072#1090#1072#1083#1086#1075
      DataField = 'doc_use_owner_path'
      DataSource = dsTreeData
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object qrTreeData: TFDQuery
    AfterScroll = qrTreeDataAfterScroll
    OnNewRecord = qrTreeDataNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * '
      'FROM '
      '  `doc` '
      'ORDER BY doc_type, doc_name')
    Left = 41
    Top = 38
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 40
    Top = 86
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpSize, fpLocation]
    StoredProps.Strings = (
      'tvDocuments.Width')
    StoredValues = <>
    Left = 96
    Top = 176
  end
  object il1: TImageList
    Left = 136
    Top = 176
    Bitmap = {
      494C010103000800480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DADADA005F5F
      5F00565656005656560056565600565656005656560056565600565656005656
      560061616100DDDDDD00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007979790080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800072727200C4C4C400FFFFFF00FFFFFF00FFFFFF005B5B5B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0061616100FFFFFF00FFFFFF005D625F004A5751004D5A54004D5B
      54004D5B54004E5B54004E5B54004E5B54004E5C54004B5951005D625F00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002E2E2E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CCCCCC0063636300FFFFFF00FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF004A5C540023865A00228358001C87
      58001D8D5A00238B58002587530027865300278A5600268B55004B595100FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFFFF0052525200FFFF
      FF00CFCFCF00525252005252520052525200525252005252520052525200D2D2
      D200FFFFFF0056565600FFFFFF00FFFFFF0055605A0055947400448F6D003B93
      6C0034966E0027835F0020704F00236E4D002175500024865A004C565100FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000043434300D0D0D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0064646400FFFFFF00FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF0062655F0083887A00676767007F86
      76008EAD87005E76670067676700506A5B0051695B0067676700676767006767
      67007C7C7C00676767007C7C7C00FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000051515100B2B2B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0082828200D8D8D800FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00AAAAAA00AAAAAA00AAAAAA00AAAAAA00AAAAAA00AAAAAA00FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF006B69630067676700FFFFFF006767
      67006767670067676700FFFFFF006767670067676700FFFFFF00FFFFFF00FFFF
      FF0067676700FFFFFF0067676700FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5F0094949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A1A1A100BABABA00FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF006C69630067676700FFFFFF00FFFF
      FF00FFFFFF0067676700FFFFFF0067676700FFFFFF0067676700676767006767
      670067676700FFFFFF0067676700FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6E0076767600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BFBFBF009C9C9C00FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF006B68600067676700FFFFFF006767
      6700FFFFFF0067676700FFFFFF0067676700FFFFFF0067676700676767006767
      670067676700FFFFFF00676767007C7C7C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A7A7A0060606000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDDDDD007E7E7E00FFFFFF00FFFFFF0052525200FFFF
      FF00D0D0D000565656005656560056565600565656005656560056565600D3D3
      D300FFFFFF0056565600FFFFFF00FFFFFF006B675D0067676700FFFFFF00FFFF
      FF00FFFFFF0067676700FFFFFF006767670067676700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00676767000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A7A7A007C7C7C00DDDDDD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0060606000FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF006C685F009D927E00676767006767
      6700676767009D927D00676767009D9077009D90770067676700676767006767
      67006767670067676700676767007C7C7C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A7A7A00C1C1C100B1B1B100CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00B0B0B00075757500FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0056565600FFFFFF00FFFFFF006D6A6500F3E3C600F2E1C200F2E2
      C400F3E3C600F3E2C400F3E1C000F3E1BF00F2E0BD00EFD8AE0076706500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A7A7A00FFFFFF009D9D9D008D8D
      8D008D8D8D008D8D8D008D8D8D008D8D8D008D8D8D008D8D8D008D8D8D008D8D
      8D008D8D8D008D8D8D0047474700C4C4C400FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AAAAAA00AAAA
      AA00AAAAAA0056565600FFFFFF00FFFFFF00565665001A12B1001810A0001710
      9C0017109C0017109C0017109C0017109C0017109C0017109C0053526800FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1
      C100C1C1C100C1C1C10081818100FFFFFF00FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6A6006E6E6E00A4A4
      A40027272700AFAFAF00FFFFFF00FFFFFF00606561006D69A5003B33CB001C13
      BC001B12B4001A12B2001A12B2001A12B2001A12B2001A12AE004E4D6400FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077777700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008686860099999900999999009999990099999900999999009999
      99009999990099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF0052525200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6A600A8A8A8006565
      6500ACACAC00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF5F6461007F7CAF00807B
      DD00655FD6005B55D3005B55D3005B55D3005B55D3003B33CB0054536500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB006B6B6B006B6B6B006B6B
      6B0083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005B5B5B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6A60029292900ACAC
      AC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFF5D625F005B5A
      64005E5D67005D5D67005D5D67005D5D67005E5D6800585764005D616000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8D8005B5B
      5B00525252005252520052525200525252005252520052525200AFAFAF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object dlgOpen1: TOpenDialog
    Left = 450
    Top = 163
  end
end
