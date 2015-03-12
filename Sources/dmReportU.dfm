object dmReportF: TdmReportF
  OldCreateOrder = False
  Height = 689
  Width = 1069
  object frxZP_OBJ: TfrxDBDataset
    UserName = 'frxZP_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'OBJECT_NAME=OBJECT_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'PTM_NAME=PTM_NAME'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_UNIT=RATE_UNIT'
      'RATE_COUNT=RATE_COUNT'
      'TRUD_ED=TRUD_ED'
      'TRUD=TRUD'
      'NORMA=NORMA'
      'COEF=COEF'
      'K_TRUD=K_TRUD'
      'K_ZP=K_ZP'
      'ZP_ED=ZP_ED'
      'ZP=ZP')
    DataSet = qrZP_OBJ
    BCDToCurrency = False
    Left = 16
    Top = 56
  end
  object frxReport: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42048.002529965300000000
    ReportOptions.LastChange = 42068.032230567130000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 16
    Top = 8
  end
  object qrZP_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'select CONCAT(`ssd`.`SM_NUMBER`, " ", `ssd`.`NAME`) as `OBJECT_N' +
        'AME`,'
      
        '       CONCAT(`ssd1`.`SM_NUMBER`, " ", `ssd1`.`NAME`) as `LOCAL_' +
        'NAME`,'
      
        '       CONCAT(`ssd2`.`SM_NUMBER`, " ", `ssd2`.`NAME`) as `PTM_NA' +
        'ME`,'
      '       `cr`.`RATE_CODE`,'
      '       UCASE(`cr`.`RATE_CAPTION`) `RATE_CAPTION`,'
      '       `cr`.`RATE_UNIT`,'
      '       `cr`.`RATE_COUNT`,'
      
        '       `de`.`TRUD` / IF(IFNULL(`cr`.`RATE_COUNT`, 1) = 0, 1, IFN' +
        'ULL(`cr`.`RATE_COUNT`, 1)) `TRUD_ED`,'
      '       `de`.`TRUD`,'
      '       `nw`.`NORMA`,'
      
        '       IF(IFNULL(`c`.`COEF`, 0) = 0, "F", TRIM(TRAILING "0" FROM' +
        ' CONVERT(`c`.`COEF`, CHAR(8)))) `COEF`,'
      '       `de`.`K_TRUD`,'
      '       `de`.`K_ZP`,'
      
        '       `de`.`ZP` / IF(IFNULL(`cr`.`RATE_COUNT`, 1) = 0, 1, IFNUL' +
        'L(`cr`.`RATE_COUNT`, 1)) `ZP_ED`,'
      '       `de`.`ZP`'#9'   '
      'from `smetasourcedata` `ssd`'
      
        'inner join `smetasourcedata` `ssd1` on `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   and `ssd1`.`SM_TYPE` = 1'
      
        'inner join `smetasourcedata` `ssd2` on `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   and `ssd2`.`SM_TYPE` = 3'
      
        'inner join `data_estimate` `de` on `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID`'
      '                               and `de`.`ID_TYPE_DATA` = 1'
      'inner join `card_rate` `cr` on `cr`.`ID` = `de`.`ID_TABLES`'
      
        'left join `normativwork` `nw` on `nw`.`NORMATIV_ID` = `cr`.`RATE' +
        '_ID`'
      '                             and `nw`.`WORK_ID` = 1'
      'left join `category` `c` on `c`.`VALUE` * 10 = `nw`.`NORMA` * 10'
      
        '                        and `c`.`DATE_BEG` <= CONVERT(CONCAT(:YE' +
        'AR, '#39'-'#39', :MONTH, '#39'-01'#39'), DATE)'
      'where `ssd`.`SM_ID` = :SM_ID'
      '  and `ssd`.`SM_TYPE` = 2  '
      'order by `OBJECT_NAME`, `LOCAL_NAME`, `PTM_NAME`, `RATE_CODE`')
    Left = 16
    Top = 112
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2014'
      end
      item
        Name = 'MONTH'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end
      item
        Name = 'SM_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '344'
      end>
  end
  object trReportRead: TFDTransaction
    Options.ReadOnly = True
    Options.StopOptions = [xoIfCmdsInactive, xoIfAutoStarted, xoFinishRetaining]
    Connection = DM.Connect
    Left = 920
    Top = 16
  end
  object trReportWrite: TFDTransaction
    Options.ReadOnly = True
    Options.StopOptions = [xoIfCmdsInactive, xoIfAutoStarted, xoFinishRetaining]
    Connection = DM.Connect
    Left = 992
    Top = 16
  end
  object qrTMP: TFDQuery
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 992
    Top = 72
  end
  object frxZP_OBJ_ACT: TfrxDBDataset
    UserName = 'frxZP_OBJ_ACT'
    CloseDataSource = True
    FieldAliases.Strings = (
      'RATE_ID=RATE_ID'
      'OBJ_NAME=OBJ_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'PTM_NAME=PTM_NAME'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_UNIT=RATE_UNIT'
      'RATE_COUNT=RATE_COUNT'
      'K_TRUD=K_TRUD'
      'TRUD=TRUD'
      'ZP=ZP'
      'K_ZP=K_ZP'
      'NORMA=NORMA'
      'COEF=COEF'
      'TRUD_ED=TRUD_ED'
      'ZP_ED=ZP_ED')
    DataSet = qrZP_OBJ_ACT
    BCDToCurrency = False
    Left = 88
    Top = 56
  end
  object qrZP_OBJ_ACT: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      'select `cra`.`RATE_ID`, '
      
        '       CONCAT(`ssd0`.`SM_NUMBER`, " ", `ssd0`.`NAME`) `OBJ_NAME`' +
        ', '
      
        '       CONCAT(`ssd1`.`SM_NUMBER`, " ", `ssd1`.`NAME`) `LOCAL_NAM' +
        'E`, '
      
        '       CONCAT(`ssd2`.`SM_NUMBER`, " ", `ssd2`.`NAME`) `PTM_NAME`' +
        ', '
      '       `cra`.`RATE_CODE`, '
      '       UCASE(`cra`.`RATE_CAPTION`) `RATE_CAPTION`, '
      '       `cra`.`RATE_UNIT`, '
      '       `cra`.`RATE_COUNT`, '
      '       `da`.`K_TRUD`, '
      '       IFNULL(`da`.`TRUD`, 0) `TRUD`, '
      '       `da`.`ZP`, '
      '       `da`.`K_ZP`, '
      '       `nw`.`NORMA`,'
      
        '       IF(IFNULL(`c`.`COEF`, 0) = 0, "F", TRIM(TRAILING "0" FROM' +
        ' CONVERT(`c`.`COEF`, CHAR(8)))) `COEF`,'
      
        '      `da`.`TRUD` / IF(IFNULL(`cra`.`RATE_COUNT`, 1) = 0, 1, IFN' +
        'ULL(`cra`.`RATE_COUNT`, 1)) `TRUD_ED`, '
      
        '      `da`.`ZP` / IF(IFNULL(`cra`.`RATE_COUNT`, 1) = 0, 1, IFNUL' +
        'L(`cra`.`RATE_COUNT`, 1)) `ZP_ED`'
      #9'   '
      'from `data_act` `da`'
      
        'inner join `card_rate_act` `cra` on `cra`.`ID` = `da`.`ID_TABLES' +
        '` '
      '                               and `cra`.`ID_ACT` = :ID_ACT'
      
        'inner join `smetasourcedata` `ssd2` on `ssd2`.`SM_ID` = `da`.`ID' +
        '_ESTIMATE`'
      '                                   and `ssd2`.`SM_TYPE` = 3'
      
        'inner join `smetasourcedata` `ssd1` on `ssd1`.`SM_ID` = `ssd2`.`' +
        'PARENT_ID`'
      '                                   and `ssd1`.`SM_TYPE` = 1'
      
        'inner join `smetasourcedata` `ssd0` on `ssd0`.`SM_ID` = `ssd1`.`' +
        'PARENT_ID`'
      '                                   and `ssd0`.`SM_TYPE` = 2'
      
        'left join `normativwork` `nw` on `nw`.`NORMATIV_ID` = `cra`.`RAT' +
        'E_ID`'
      '                 '#9#9'     and `nw`.`WORK_ID` = 1 '
      
        'left join `category` `c` on `c`.`VALUE` * 10 = `nw`.`NORMA` * 10' +
        ' '
      
        '                        and IFNULL(`c`.`DATE_BEG`, CONVERT('#39'1900' +
        '-01-01'#39', DATE)) <= CONVERT(CONCAT(:YEAR,'#39'-'#39',:MONTH,'#39'-01'#39'), DATE)' +
        '    '
      ''
      'where `da`.`ID_ACT` = :ID_ACT '
      '  and `da`.`ID_TYPE_DATA` = 1'
      'order by `OBJ_NAME`, `LOCAL_NAME`, `PTM_NAME`, `RATE_CODE`')
    Left = 88
    Top = 112
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2014'
      end
      item
        Name = 'MONTH'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end>
  end
  object qrRASX_MAT: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'select mca.`MAT_CODE`, UCASE(mca.`MAT_NAME`) as MAT_NAME, mca.`M' +
        'AT_UNIT`, mca.`MAT_NORMA`,'
      
        #9'   cra.`RATE_CODE`, UCASE(cra.`RATE_CAPTION`) as RATE_CAPTION, ' +
        'cra.`RATE_UNIT`, cra.`RATE_COUNT`,'
      
        #9'   cra.`COEF_ORDERS`, IFNULL(mca.`MAT_NORMA`, 0) * IFNULL(cra.`' +
        'RATE_COUNT`, 0) as VAL, '
      #9'   CONCAT(ssd.`SM_NUMBER`, " ", ssd.`NAME`) as PTM_NAME,'
      #9'   CONCAT(ssd1.`SM_NUMBER`, " ", ssd1.`NAME`) as LOCAL_NAME,'
      ' '#9'   CONCAT(ssd2.`SM_NUMBER`, " ", ssd2.`NAME`) as OBJECT_NAME, '
      '           1 as TAB'
      'from `materialcard_act` mca'
      ''
      'left join `card_rate_act` cra on cra.`ID_ACT` = mca.`ID_ACT`'
      'left join `data_estimate` da on da.`ID_TABLES` = cra.`ID`'
      
        'left join `smetasourcedata` ssd on ssd.`SM_ID` = da.`ID_ESTIMATE' +
        '`'
      
        'left join `smetasourcedata` ssd1 on ssd1.`SM_ID` = ssd.`PARENT_P' +
        'TM_ID`'
      
        'left join `smetasourcedata` ssd2 on ssd2.`SM_ID` = ssd1.`PARENT_' +
        'LOCAL_ID`'
      ''
      'where mca.`ID_ACT` = :ID_ACT'
      '  and mca.`CONSIDERED` = 1'
      'ORDER BY LOCAL_NAME, RATE_CODE, MAT_CODE')
    Left = 176
    Top = 112
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end>
  end
  object frxRASX_MAT: TfrxDBDataset
    UserName = 'frxRASX_MAT'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MAT_CODE=MAT_CODE'
      'MAT_NAME=MAT_NAME'
      'MAT_UNIT=MAT_UNIT'
      'MAT_NORMA=MAT_NORMA'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_UNIT=RATE_UNIT'
      'RATE_COUNT=RATE_COUNT'
      'COEF_ORDERS=COEF_ORDERS'
      'VAL=VAL'
      'PTM_NAME=PTM_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'OBJECT_NAME=OBJECT_NAME'
      'TAB=TAB')
    DataSet = qrRASX_MAT
    BCDToCurrency = False
    Left = 176
    Top = 56
  end
  object qrRASX_MAT2: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'select mca.`MAT_CODE`, UCASE(mca.`MAT_NAME`) as MAT_NAME, mca.`M' +
        'AT_UNIT`, mca.`MAT_NORMA`,'
      #9'   cra.`RATE_COUNT`,'
      
        #9'   cra.`COEF_ORDERS`, IFNULL(mca.`MAT_NORMA`, 0) * IFNULL(cra.`' +
        'RATE_COUNT`, 0) as VAL,'
      #9'   mca.`COAST_NDS`, 2 as TAB'
      'from `materialcard_act` mca'
      'left join `card_rate_act` cra on cra.`ID_ACT` = mca.`ID_ACT`'
      'where mca.`ID_ACT` = :ID_ACT'
      '  and mca.`CONSIDERED` = 0'
      'order by MAT_CODE')
    Left = 248
    Top = 112
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end>
  end
  object frxRASX_MAT2: TfrxDBDataset
    UserName = 'frxRASX_MAT2'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MAT_CODE=MAT_CODE'
      'MAT_NAME=MAT_NAME'
      'MAT_UNIT=MAT_UNIT'
      'MAT_NORMA=MAT_NORMA'
      'RATE_COUNT=RATE_COUNT'
      'COEF_ORDERS=COEF_ORDERS'
      'VAL=VAL'
      'COAST_NDS=COAST_NDS'
      'TAB=TAB')
    DataSet = qrRASX_MAT2
    BCDToCurrency = False
    Left = 248
    Top = 56
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = True
    PrintScaling = False
    Left = 984
    Top = 384
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 984
    Top = 272
  end
  object frxRTFExport1: TfrxRTFExport
    FileName = 'test.rtf'
    UseFileCache = True
    DefaultPath = '..\Doc\'
    ShowProgress = True
    OverwritePrompt = True
    DataOnly = False
    PictureType = gpPNG
    ExportPageBreaks = False
    ExportPictures = False
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = True
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 984
    Top = 328
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    DeleteEmptyColumns = True
    Left = 984
    Top = 216
  end
  object frxWRS_OBJ: TfrxDBDataset
    UserName = 'frxWRS_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'zp_rab=zp_rab'
      'ZP_MASH=ZP_MASH'
      'KZP=KZP'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_COUNT=RATE_COUNT'
      'RATE_UNIT=RATE_UNIT'
      'NAME1=NAME1'
      'v_rab=v_rab'
      'v_mash=v_mash')
    DataSet = qWRS_OBJ
    BCDToCurrency = False
    Left = 24
    Top = 240
  end
  object qWRS_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '')
    Left = 24
    Top = 288
  end
  object frxRSMO_OBJ: TfrxDBDataset
    UserName = 'frxRSMO_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'mat_code=mat_code'
      'mat_name=mat_name'
      'mat_unit=mat_unit'
      'mat_count=mat_count'
      'coast_no_nds=coast_no_nds'
      'mat_sum_no_nds=mat_sum_no_nds'
      'proc_transp=proc_transp'
      'coast_transp=coast_transp'
      'nds=nds'
      'nds_rub=nds_rub'
      'transp_nds=transp_nds'
      'mat_sum_nds=mat_sum_nds')
    DataSet = qRSMO_OBJ
    BCDToCurrency = False
    Left = 104
    Top = 240
  end
  object qRSMO_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 104
    Top = 288
  end
  object qRSMEH_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 200
    Top = 288
  end
  object frxRSMEH_OBJ: TfrxDBDataset
    UserName = 'frxRSMEH_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'mech_code=mech_code'
      'mech_name=mech_name'
      'mech_unit=mech_unit'
      'mech_count=mech_count'
      'coast_no_nds=coast_no_nds'
      'sum_no_nds=sum_no_nds'
      'zp_sum_no_nds=zp_sum_no_nds'
      'nds=nds'
      'zp_mach_no_nds=zp_mach_no_nds'
      'nds_rub=nds_rub'
      'sum_nds=sum_nds')
    DataSet = qRSMEH_OBJ
    BCDToCurrency = False
    Left = 200
    Top = 240
  end
  object qVED_OANDPWV1: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 296
    Top = 288
  end
  object frxqVED_OANDPWV1: TfrxDBDataset
    UserName = 'frxqVED_OANDPWV1'
    CloseDataSource = True
    FieldAliases.Strings = (
      'sm_number=sm_number'
      'name=name'
      'name_o=name_o'
      'name_l=name_l'
      'sm_vid=sm_vid'
      's_trud=s_trud'
      's_zp=s_zp'
      's_trud_mash=s_trud_mash'
      's_emim=s_emim'
      's_zp_mash=s_zp_mash'
      's_mr=s_mr'
      's_transp=s_transp'
      's_st_ohropr=s_st_ohropr'
      's_plan_prib=s_plan_prib'
      's_stoim=s_stoim'
      'parent_id=parent_id'
      'S_OHROPR=S_OHROPR')
    DataSet = qVED_OANDPWV1
    BCDToCurrency = False
    Left = 296
    Top = 240
  end
  object qVED_OBRAB_RASHRES_SMET: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 440
    Top = 288
  end
  object frxVED_OBRAB_RASHRES_SMET: TfrxDBDataset
    UserName = 'frxVED_OBRAB_RASHRES_SMET'
    CloseDataSource = True
    FieldAliases.Strings = (
      'name_s=name_s'
      'name_o=name_o'
      'name_l=name_l'
      'mat_code=mat_code'
      'mat_name=mat_name'
      'mat_unit=mat_unit'
      'mat_count=mat_count'
      'sm_number=sm_number'
      'sm_number1=sm_number1'
      'sm_number2=sm_number2')
    DataSet = qVED_OBRAB_RASHRES_SMET
    BCDToCurrency = False
    Left = 440
    Top = 240
  end
  object frxReport1: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42075.395386493100000000
    ReportOptions.LastChange = 42075.904860208330000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 560
    Top = 480
    Datasets = <
      item
        DataSet = frxVED_OBRAB_RASHRES_SMET
        DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'times New Roman'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        DataSet = frxVED_OBRAB_RASHRES_SMET
        DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
        RowCount = 0
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 26.456710000000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'mat_code'
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxVED_OBRAB_RASHRES_SMET."mat_code"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 102.047261180000000000
          Width = 812.598425200000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'mat_name'
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[frxVED_OBRAB_RASHRES_SMET."mat_name"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 914.645686380000000000
          Width = 66.141732280000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'mat_unit'
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxVED_OBRAB_RASHRES_SMET."mat_unit"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 980.787418660000000000
          Width = 66.141732280000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'mat_count'
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxVED_OBRAB_RASHRES_SMET."mat_count"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 328.819110000000000000
        Width = 1046.929810000000000000
        Condition = 'frxVED_OBRAB_RASHRES_SMET."name_l"'
        object SysMemo2: TfrxSysMemoView
          Align = baLeft
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object frxVED_OBRAB_RASHRES_SMETsm_number: TfrxMemoView
          Align = baLeft
          Left = 26.456710000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxVED_OBRAB_RASHRES_SMET."sm_number2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxVED_OBRAB_RASHRES_SMETname_l: TfrxMemoView
          Left = 102.047310000000000000
          Width = 944.882500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'name_l'
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxVED_OBRAB_RASHRES_SMET."name_l"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 105.826840000000000000
        Top = 434.645950000000000000
        Width = 1046.929810000000000000
        object Memo36: TfrxMemoView
          Top = 11.338590000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1057#1086#1089#1090#1072#1074#1080#1083' ')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Top = 49.133890000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1055#1088#1086#1074#1077#1088#1080#1083)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 64.252010000000000000
          Top = 30.236240000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '('#1076#1086#1083#1078#1085#1086#1089#1090#1100')')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 205.008040000000000000
          Top = 30.236240000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '('#1087#1086#1076#1087#1080#1089#1100')')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 347.055350000000000000
          Top = 30.236240000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '('#1080#1085#1080#1094#1080#1072#1083#1099', '#1092#1072#1084#1080#1083#1080#1103')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 64.252010000000000000
          Top = 68.031540000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '('#1076#1086#1083#1078#1085#1086#1089#1090#1100')')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 205.008040000000000000
          Top = 68.031540000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '('#1087#1086#1076#1087#1080#1089#1100')')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 347.055350000000000000
          Top = 68.031540000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '('#1080#1085#1080#1094#1080#1072#1083#1099', '#1092#1072#1084#1080#1083#1080#1103')')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Top = 411.968770000000000000
        Width = 1046.929810000000000000
      end
      object PageHeader1: TfrxPageHeader
        Height = 226.771800000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #1050#1086#1076' '#1086#1073#1098#1077#1082#1090#1072' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Top = 37.795300000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1079#1076#1072#1085#1080#1103', '#1089#1086#1086#1088#1091#1078#1077#1085#1080#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 56.692950000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #1064#1080#1092#1088' '#1079#1076#1072#1085#1080#1103', '#1089#1086#1086#1088#1091#1078#1077#1085#1080#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Top = 75.590600000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #1050#1086#1084#1087#1083#1077#1082#1090' '#1095#1077#1088#1090#1077#1078#1077#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 185.196970000000000000
          Width = 861.732840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 185.196970000000000000
          Top = 18.897650000000000000
          Width = 861.732840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 185.196970000000000000
          Top = 37.795300000000000000
          Width = 861.732840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 185.196970000000000000
          Top = 56.692950000000000000
          Width = 861.732840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 185.196970000000000000
          Top = 75.590600000000000000
          Width = 861.732840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baCenter
          Left = 294.803340000000000000
          Top = 109.606370000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1086#1073#1098#1077#1084#1086#1074' '#1088#1072#1073#1086#1090' '#1080' '#1088#1072#1089#1093#1086#1076#1072' '#1088#1077#1089#1091#1088#1089#1086#1074' '#1087#1086' '#1089#1084#1077#1090#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Top = 170.078850000000000000
          Width = 26.456692910000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #8470' '#1087#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Left = 26.456692910000000000
          Top = 170.078850000000000000
          Width = 75.590551180000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Left = 102.047244090000000000
          Top = 170.078850000000000000
          Width = 812.598425200000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1086#1074' '#1088#1072#1073#1086#1090
            #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1089#1091#1088#1089#1086#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          Left = 914.645669290000000000
          Top = 170.078850000000000000
          Width = 66.141732280000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Left = 980.787401570000000000
          Top = 170.078850000000000000
          Width = 66.141732280000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Top = 207.874150000000000000
          Width = 26.456692910000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Left = 26.456692910000000000
          Top = 207.874150000000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 102.047244090000000000
          Top = 207.874150000000000000
          Width = 812.598425200000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          Left = 914.645669290000000000
          Top = 207.874150000000000000
          Width = 66.141732280000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 980.787401570000000000
          Top = 207.874150000000000000
          Width = 66.141732280000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxVED_OBRAB_RASHRES_SMETname_o: TfrxMemoView
          Align = baCenter
          Left = 162.519790000000000000
          Top = 128.504020000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxVED_OBRAB_RASHRES_SMET
          DataSetName = 'frxVED_OBRAB_RASHRES_SMET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '['#39#1085#1072' '#39'][frxVED_OBRAB_RASHRES_SMET."sm_number1"]['#39' '#39'][frxVED_OBRA' +
              'B_RASHRES_SMET."name_o"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        Condition = 'frxVED_OBRAB_RASHRES_SMET."name_o"'
      end
    end
  end
end
