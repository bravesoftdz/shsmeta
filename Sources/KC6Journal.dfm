object fKC6Journal: TfKC6Journal
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1050#1057'-6'
  ClientHeight = 400
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPage: TPageControl
    Left = 0
    Top = 57
    Width = 745
    Height = 343
    ActivePage = ts1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    OnChange = pgcPageChange
    object ts1: TTabSheet
      Caption = #1055#1086' '#1088#1072#1089#1094#1077#1085#1082#1072#1084
      object spl1: TSplitter
        Left = 0
        Top = 121
        Width = 717
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 214
      end
      object spl2: TSplitter
        Left = 0
        Top = 272
        Width = 717
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = -3
        ExplicitTop = 281
        ExplicitWidth = 591
      end
      object JvDBTreeView1: TJvDBTreeView
        Left = 0
        Top = 0
        Width = 717
        Height = 121
        DataSource = dsTreeData
        MasterField = 'SM_ID'
        DetailField = 'PARENT'
        ItemField = 'NAME'
        StartMasterValue = '0'
        UseFilter = True
        PersistentNode = True
        ReadOnly = True
        Indent = 19
        Align = alTop
        TabOrder = 0
        OnClick = JvDBTreeView1Click
        RowSelect = True
        Mirror = False
      end
      object dbgrd2: TDBGrid
        Left = 0
        Top = 275
        Width = 717
        Height = 60
        Align = alBottom
        DataSource = dsDetail
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = #8470#1087#1087
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = #1052#1077#1089#1103#1094
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Width = 168
            Visible = True
          end>
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 124
        Width = 717
        Height = 148
        Align = alClient
        DataSource = dsData
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object ts2: TTabSheet
      Caption = #1055#1086' '#1055#1058#1052
      ImageIndex = 1
      object dbgrd3: TDBGrid
        Left = 0
        Top = 0
        Width = 717
        Height = 335
        Align = alClient
        DataSource = dsPTM
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 57
    Align = alTop
    TabOrder = 1
    DesignSize = (
      745
      57)
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 39
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090
    end
    object lbl2: TLabel
      Left = 8
      Top = 32
      Width = 190
      Height = 13
      Caption = #1046#1091#1088#1085#1072#1083' 6-'#1050#1057' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089
    end
    object lbl3: TLabel
      Left = 337
      Top = 32
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object cbbMode: TComboBox
      Left = 658
      Top = 30
      Width = 83
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemIndex = 0
      TabOrder = 0
      TabStop = False
      Text = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
      OnChange = cbbFromMonthChange
      Items.Strings = (
        #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
        #1089#1090#1086#1080#1084#1086#1089#1090#1100)
    end
    object rbRates: TRadioButton
      Left = 494
      Top = 32
      Width = 87
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1087#1086' '#1088#1072#1089#1094#1077#1085#1082#1072#1084
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbRatesClick
    end
    object rbPTM: TRadioButton
      Left = 587
      Top = 32
      Width = 65
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1087#1086' '#1055#1058#1052
      TabOrder = 2
      OnClick = rbRatesClick
    end
    object cbbFromMonth: TComboBox
      Left = 204
      Top = 30
      Width = 75
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemIndex = 1
      TabOrder = 3
      Text = #1060#1077#1074#1088#1072#1083#1100
      OnChange = cbbFromMonthChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object cbbToMonth: TComboBox
      Left = 355
      Top = 30
      Width = 75
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemIndex = 1
      TabOrder = 4
      Text = #1060#1077#1074#1088#1072#1083#1100
      OnChange = cbbFromMonthChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object seFromYear: TSpinEdit
      Left = 282
      Top = 30
      Width = 49
      Height = 22
      MaxValue = 2100
      MinValue = 1900
      TabOrder = 5
      Value = 2014
      OnChange = cbbFromMonthChange
    end
    object seToYear: TSpinEdit
      Left = 433
      Top = 30
      Width = 49
      Height = 22
      MaxValue = 2100
      MinValue = 1900
      TabOrder = 6
      Value = 2014
      OnChange = cbbFromMonthChange
    end
    object dblkcbbNAME: TDBLookupComboBox
      Left = 53
      Top = 5
      Width = 688
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'OBJ_ID'
      ListField = 'NAME'
      ListSource = dsObject
      TabOrder = 7
    end
  end
  object qrTreeData: TFDQuery
    MasterSource = dsObject
    MasterFields = 'OBJ_ID'
    DetailFields = 'OBJ_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(SM_NUMBER, " ",  NAME) as ' +
        'NAME, DATE,'
      '       0 as PARENT  '
      'FROM smetasourcedata'
      'WHERE SM_TYPE=2 AND '
      '      OBJ_ID=:OBJ_ID'
      'UNION ALL'
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(SM_NUMBER, " ",  NAME) as ' +
        'NAME, DATE,'
      '       (PARENT_LOCAL_ID+PARENT_PTM_ID) as PARENT  '
      'FROM smetasourcedata'
      'WHERE SM_TYPE<>2 AND '
      '      OBJ_ID=:OBJ_ID'
      'ORDER BY NAME')
    Left = 25
    Top = 64
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 39
      end>
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 56
    Top = 64
  end
  object qrData: TFDQuery
    MasterSource = dsTreeData
    MasterFields = 'SM_ID'
    DetailFields = 'SM_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      '/* '#1056#1040#1057#1062#1045#1053#1050#1048' */'
      'SELECT '
      '  ID_ESTIMATE,'
      '  ID_TYPE_DATA,'
      '  RATE_CODE AS CODE, /* '#1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077'*/'
      '  RATE_CAPTION AS NAME, /* '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' */'
      '  RATE_UNIT AS UNIT, /* '#1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' */'
      '  COALESCE(RATE_COUNT, 0) AS CNT, /* '#1050#1086#1083'-'#1074#1086' */'
      
        '  COALESCE((SELECT SUM(RATE_COUNT) FROM card_rate_act where id=d' +
        'ata_estimate.ID_TABLES), 0) AS CntDone, /* '#1042#1099#1087#1086#1083#1085#1077#1085#1086' */'
      
        '  COALESCE((COALESCE(RATE_COUNT, 0) - COALESCE((SELECT SUM(RATE_' +
        'COUNT) FROM card_rate_act where id=data_estimate.ID_TABLES), 0))' +
        ', 0) AS CntOut /* '#1054#1089#1090#1072#1090#1086#1082' */'
      'FROM '
      '  data_estimate, card_rate'
      'WHERE '
      'data_estimate.ID_TYPE_DATA = 1 AND'
      'card_rate.ID = data_estimate.ID_TABLES AND'
      '((ID_ESTIMATE = :SM_ID) OR /* '#1054#1073#1098#1077#1082#1090#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' */'
      
        ' (ID_ESTIMATE IN (SELECT s1.SM_ID FROM smetasourcedata s1 WHERE ' +
        '(s1.PARENT_LOCAL_ID + s1.PARENT_PTM_ID) = :SM_ID)) OR /* '#1051#1086#1082#1072#1083#1100#1085 +
        #1099#1081' '#1091#1088#1086#1074#1077#1085#1100' */'
      
        ' (ID_ESTIMATE IN (SELECT s2.SM_ID FROM smetasourcedata s2 WHERE ' +
        '(s2.PARENT_LOCAL_ID + s2.PARENT_PTM_ID) IN '
      
        '   (SELECT s1.SM_ID FROM smetasourcedata s1 WHERE (s1.PARENT_LOC' +
        'AL_ID + s1.PARENT_PTM_ID) = :SM_ID))'
      ' ) /* '#1055#1058#1052' '#1091#1088#1086#1074#1077#1085#1100' */'
      ')'
      ''
      'UNION ALL'
      ''
      '/* '#1052#1040#1058#1045#1056#1048#1040#1051#1067' '#1042' '#1056#1040#1057#1062#1045#1053#1050#1045'*/'
      'SELECT '
      '  ID_ESTIMATE,'
      '  ID_TYPE_DATA,'
      '  CONCAT('#39'    '#39', MAT_CODE) AS CODE, /* '#1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077'*/'
      '  MAT_NAME AS NAME, /* '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' */'
      '  MAT_UNIT AS UNIT, /* '#1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' */'
      '  COALESCE(MAT_COUNT, 0) AS CNT, /* '#1050#1086#1083'-'#1074#1086' */'
      
        '  COALESCE((SELECT SUM(MAT_COUNT) FROM materialcard_act where id' +
        '=data_estimate.ID_TABLES), 0) AS CntDone, /* '#1042#1099#1087#1086#1083#1085#1077#1085#1086' */'
      
        '  COALESCE((COALESCE(MAT_COUNT, 0) - COALESCE((SELECT SUM(MAT_CO' +
        'UNT) FROM materialcard_act where id=data_estimate.ID_TABLES), 0)' +
        '), 0) AS CntOut /* '#1054#1089#1090#1072#1090#1086#1082' */'
      'FROM '
      '  data_estimate, card_rate, materialcard'
      'WHERE '
      'data_estimate.ID_TYPE_DATA = 1 AND'
      'card_rate.ID = data_estimate.ID_TABLES AND'
      'materialcard.ID_CARD_RATE = card_rate.ID AND'
      'materialcard.CONSIDERED = 0 AND'
      '((ID_ESTIMATE = :SM_ID) OR /* '#1054#1073#1098#1077#1082#1090#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' */'
      
        ' (ID_ESTIMATE IN (SELECT s1.SM_ID FROM smetasourcedata s1 WHERE ' +
        '(s1.PARENT_LOCAL_ID + s1.PARENT_PTM_ID) = :SM_ID)) OR /* '#1051#1086#1082#1072#1083#1100#1085 +
        #1099#1081' '#1091#1088#1086#1074#1077#1085#1100' */'
      
        ' (ID_ESTIMATE IN (SELECT s2.SM_ID FROM smetasourcedata s2 WHERE ' +
        '(s2.PARENT_LOCAL_ID + s2.PARENT_PTM_ID) IN '
      
        '   (SELECT s1.SM_ID FROM smetasourcedata s1 WHERE (s1.PARENT_LOC' +
        'AL_ID + s1.PARENT_PTM_ID) = :SM_ID))'
      ' ) /* '#1055#1058#1052' '#1091#1088#1086#1074#1077#1085#1100' */'
      ')'
      ''
      'UNION ALL'
      ''
      '/* '#1052#1040#1058#1045#1056#1048#1040#1051#1067'*/'
      'SELECT '
      '  ID_ESTIMATE,'
      '  ID_TYPE_DATA,'
      '  MAT_CODE AS CODE, /* '#1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077'*/'
      '  MAT_NAME AS NAME, /* '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' */'
      '  MAT_UNIT AS UNIT, /* '#1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' */'
      '  COALESCE(MAT_COUNT, 0) AS CNT, /* '#1050#1086#1083'-'#1074#1086' */'
      
        '  COALESCE((SELECT SUM(MAT_COUNT) FROM materialcard_act where id' +
        '=data_estimate.ID_TABLES), 0) AS CntDone, /* '#1042#1099#1087#1086#1083#1085#1077#1085#1086' */'
      
        '  COALESCE((COALESCE(MAT_COUNT, 0) - COALESCE((SELECT SUM(MAT_CO' +
        'UNT) FROM materialcard_act where id=data_estimate.ID_TABLES), 0)' +
        '), 0) AS CntOut /* '#1054#1089#1090#1072#1090#1086#1082' */'
      'FROM '
      '  data_estimate, materialcard'
      'WHERE '
      'data_estimate.ID_TYPE_DATA = 2 AND'
      'materialcard.ID = data_estimate.ID_TABLES AND'
      '((ID_ESTIMATE = :SM_ID) OR /* '#1054#1073#1098#1077#1082#1090#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' */'
      
        ' (ID_ESTIMATE IN (SELECT s1.SM_ID FROM smetasourcedata s1 WHERE ' +
        '(s1.PARENT_LOCAL_ID + s1.PARENT_PTM_ID) = :SM_ID)) OR /* '#1051#1086#1082#1072#1083#1100#1085 +
        #1099#1081' '#1091#1088#1086#1074#1077#1085#1100' */'
      
        ' (ID_ESTIMATE IN (SELECT s2.SM_ID FROM smetasourcedata s2 WHERE ' +
        '(s2.PARENT_LOCAL_ID + s2.PARENT_PTM_ID) IN '
      
        '   (SELECT s1.SM_ID FROM smetasourcedata s1 WHERE (s1.PARENT_LOC' +
        'AL_ID + s1.PARENT_PTM_ID) = :SM_ID))'
      ' ) /* '#1055#1058#1052' '#1091#1088#1086#1074#1077#1085#1100' */'
      ')'
      '/* '#1052#1045#1061#1040#1053#1048#1047#1052#1067' */'
      'ORDER BY 1,2'
      '')
    Left = 24
    Top = 184
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftLongWord
        ParamType = ptInput
        Size = 4
        Value = 298
      end>
  end
  object dsData: TDataSource
    DataSet = qrData
    Left = 56
    Top = 184
  end
  object qrDetail: TFDQuery
    MasterSource = dsData
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      
        'SELECT (OBJ_ID*-1) as SM_ID, 0 as SM_TYPE, OBJ_ID, FULL_NAME as ' +
        'NAME,0 as PARENT'
      'FROM objcards '
      'UNION ALL'
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(SM_NUMBER, " ",  NAME) as ' +
        'NAME, (CAST(OBJ_ID as SIGNED)*-1) as PARENT  '
      'FROM smetasourcedata'
      'WHERE SM_TYPE=2'
      'UNION ALL'
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(SM_NUMBER, " ",  NAME) as ' +
        'NAME, (PARENT_LOCAL_ID+PARENT_PTM_ID) as PARENT  '
      'FROM smetasourcedata'
      'WHERE SM_TYPE<>2'
      'ORDER BY NAME')
    Left = 25
    Top = 336
  end
  object dsDetail: TDataSource
    DataSet = qrDetail
    Left = 56
    Top = 336
  end
  object qrObject: TFDQuery
    AfterScroll = qrObjectAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      'SELECT OBJ_ID, FULL_NAME as NAME, BEG_STROJ as DATE'
      'FROM objcards '
      'ORDER BY NAME')
    Left = 25
  end
  object dsObject: TDataSource
    DataSet = qrObject
    Left = 56
    Top = 1
  end
  object qrPTM: TFDQuery
    MasterSource = dsObject
    MasterFields = 'OBJ_ID'
    DetailFields = 'OBJ_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    SQL.Strings = (
      'SELECT SM_ID, SM_TYPE, OBJ_ID, NAME as NAME, DATE, SM_NUMBER  '
      'FROM smetasourcedata'
      'WHERE SM_TYPE=2 AND '
      '      OBJ_ID=:OBJ_ID'
      'UNION ALL'
      
        'SELECT CONCAT((PARENT_LOCAL_ID+PARENT_PTM_ID), SM_ID) AS SM_ID, ' +
        'SM_TYPE, OBJ_ID, NAME as NAME, DATE, SM_NUMBER  '
      'FROM smetasourcedata'
      'WHERE SM_TYPE=1 AND '
      '      OBJ_ID=:OBJ_ID'
      'UNION ALL'
      'SELECT CONCAT('
      
        '(SELECT (s1.PARENT_LOCAL_ID+s1.PARENT_PTM_ID) FROM smetasourceda' +
        'ta s1 WHERE s1.SM_ID=(s2.PARENT_LOCAL_ID+s2.PARENT_PTM_ID)), '
      
        '(s2.PARENT_LOCAL_ID+s2.PARENT_PTM_ID), s2.SM_ID) AS SM_ID, s2.SM' +
        '_TYPE, s2.OBJ_ID, s2.NAME as NAME, s2.DATE, s2.SM_NUMBER  '
      'FROM smetasourcedata s2'
      'WHERE s2.SM_TYPE=3 AND '
      '      s2.OBJ_ID=:OBJ_ID'
      'ORDER BY 1')
    Left = 201
    Top = 136
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 36
      end>
  end
  object dsPTM: TDataSource
    DataSet = qrPTM
    Left = 232
    Top = 136
  end
end
