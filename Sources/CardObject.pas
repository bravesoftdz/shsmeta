unit CardObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, System.DateUtils, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, Tools,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Menus, Vcl.DBCtrls, System.UITypes, Vcl.Buttons, Vcl.Samples.Spin,
  JvExMask, JvToolEdit, JvDBControls, JvSpin, JvDBSpinEdit;

type
  TfCardObject = class(TSmForm)

    DataSourceSF: TDataSource;
    DataSourceCO: TDataSource;
    dsR: TDataSource;
    dsZP: TDataSource;
    GroupBoxObject: TGroupBox;
    GroupBoxContract: TGroupBox;
    GroupBoxShortDescription: TGroupBox;
    GroupBoxFullDescription: TGroupBox;
    GroupBoxDateBuilding: TGroupBox;
    GroupBoxClient: TGroupBox;
    GroupBoxContractor: TGroupBox;
    GroupBoxCategoryObject: TGroupBox;
    GroupBoxVAT: TGroupBox;
    GroupBoxRegion: TGroupBox;

    GroupBoxBasePrices: TGroupBox;
    GroupBoxTypeOXR: TGroupBox;
    GroupBoxZonePrices: TGroupBox;
    EditNumberObject: TEdit;
    EditNumberContract: TEdit;

    LabelNumberContract: TLabel;
    Label2: TLabel;
    LabelStartBuilding: TLabel;

    DateTimePickerDataCreateContract: TDateTimePicker;
    dblkcbbCategoryObject: TDBLookupComboBox;
    dblkcbbZonePrices: TDBLookupComboBox;
    dblkcbbTypeOXR: TDBLookupComboBox;
    DBLookupComboBoxBasePrices: TDBLookupComboBox;
    dblkcbbRegion: TDBLookupComboBox;

    ButtonListAgreements: TButton;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    ComboBoxVAT: TComboBox;
    DataSourceBP: TDataSource;
    dsTO: TDataSource;
    DataSourceDifferent: TDataSource;
    LabelNumberObject: TLabel;
    LabelCodeObject: TLabel;
    EditCodeObject: TEdit;
    Bevel1: TBevel;
    CheckBoxCalculationEconom: TCheckBox;
    ADOQueryDifferent: TFDQuery;
    ADOQuerySF: TFDQuery;
    ADOQueryCO: TFDQuery;
    qrBP: TFDQuery;
    qrTO: TFDQuery;
    qrR: TFDQuery;
    qrZP: TFDQuery;
    qrMAIS: TFDQuery;
    dsMAIS: TDataSource;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    grp2: TGroupBox;
    dblkcbbMAIS: TDBLookupComboBox;
    dblkcbbCUST_ID: TDBLookupComboBox;
    dblkcbbGENERAL: TDBLookupComboBox;
    dsClients: TDataSource;
    qrClients: TFDQuery;
    btn1: TBitBtn;
    btn2: TBitBtn;
    cbbFromMonth: TComboBox;
    seYear: TSpinEdit;
    lbl3: TLabel;
    dblkcbbSourseFinance: TDBLookupComboBox;
    btnCardObjectAdditional: TBitBtn;
    lblCountMonth: TLabel;
    grp3: TGroupBox;
    cbbMonthBeginStroj: TComboBox;
    seYearBeginStroj: TSpinEdit;
    lbl4: TLabel;
    dbmmoFULL_NAME: TDBMemo;
    dbedtname: TDBEdit;
    jvdbspndtSROK_STROJ: TJvDBSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);

    procedure SetColorDefaultToFields;
    procedure ClearAllFields;

    procedure GetValueDBLookupComboBoxTypeOXR(Sender: TObject);
    procedure dblkcbbRegionCloseUp(Sender: TObject);
    procedure DateTimePickerStartBuildingChange(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure ButtonListAgreementsClick(Sender: TObject);
    procedure btnCardObjectAdditionalClick(Sender: TObject);
    procedure qrMainNewRecord(DataSet: TDataSet);
    procedure cbbMonthBeginStrojChange(Sender: TObject);

  private
    FEditing: Boolean; // ��� ������������ ������ ���������� ��� �������������� ������
    FIdObject: Integer; // ID ���������� ������ � �������
    FStrQuery: String;

    // ��� ��������� �������� � ���������� ������� ��� �������������� ������
    FSourceFinance: Integer;
    FCategoryObject: Integer;
    FRegion: Integer;
    FVAT: Integer;
    FBasePrice: Integer;
    FTypeOXR: Integer;
    FMAIS: Integer;

    procedure SetIdObject(AValue: Integer);
  public
    property IdObject: Integer read FIdObject write SetIdObject;
  end;

implementation

uses
  Main,
  DataModule,
  CardObjectContractorServices,
  OrganizationsEx,
  SuppAgreement,
  GlobsAndConst,
  CalculationEstimate,
  CardObjectAdditional;

{$R *.dfm}

procedure TfCardObject.FormCreate(Sender: TObject);
begin
  inherited;
  with Constraints do
  begin
    MinHeight := Height;
    MaxHeight := Height;
    MinWidth := Width;
    MaxWidth := Width;
  end;
end;

procedure TfCardObject.FormShow(Sender: TObject);
var
  e: TNotifyEvent;
begin
  qrZP.Filtered := False;

  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  qrMain.ParamByName('OBJ_ID').AsInteger := FIdObject;
  CloseOpen(qrMain);
  CloseOpen(qrClients);

  if FIdObject > 0 then
  begin
    // ������� �������� � ���� ��������������
    EditNumberObject.Text := qrMain.FieldByName('num').AsVariant;
    EditCodeObject.Text := qrMain.FieldByName('encrypt').AsVariant;
    EditNumberContract.Text := qrMain.FieldByName('num_dog').AsString;
    DateTimePickerDataCreateContract.Date := qrMain.FieldByName('date_dog').AsVariant;

    e := cbbFromMonth.OnChange;
    try
      cbbFromMonth.OnChange := nil;
      seYear.OnChange := nil;
      cbbFromMonth.ItemIndex := MonthOf(qrMain.FieldByName('beg_stroj').AsDateTime) - 1;
      seYear.Value := YearOf(qrMain.FieldByName('beg_stroj').AsDateTime);
    finally
      cbbFromMonth.OnChange := e;
      seYear.OnChange := e;
    end;

    e := cbbMonthBeginStroj.OnChange;
    try
      cbbMonthBeginStroj.OnChange := nil;
      seYearBeginStroj.OnChange := nil;
      cbbMonthBeginStroj.ItemIndex := MonthOf(qrMain.FieldByName('BEG_STROJ2').AsDateTime) - 1;
      seYearBeginStroj.Value := YearOf(qrMain.FieldByName('BEG_STROJ2').AsDateTime);
    finally
      cbbMonthBeginStroj.OnChange := e;
      seYearBeginStroj.OnChange := e;
    end;

    CheckBoxCalculationEconom.Checked := qrMain.FieldByName('calc_econom').AsVariant;
    // ��� ���������� �������
    if qrMain.FieldByName('fin_id').AsVariant <> Null then
      FSourceFinance := qrMain.FieldByName('fin_id').AsVariant;

    FCategoryObject := qrMain.FieldByName('cat_id').AsVariant;
    FRegion := qrMain.FieldByName('region_id').AsVariant;
    FVAT := qrMain.FieldByName('state_nds').AsVariant;
    FBasePrice := qrMain.FieldByName('base_norm_id').AsVariant;
    FTypeOXR := qrMain.FieldByName('stroj_id').AsVariant;
    FMAIS := qrMain.FieldByName('mais_id').AsVariant;
  end;

  // ������������� �����
  if EditCodeObject.Focused then
    EditCodeObject.SetFocus;

  ButtonSave.Tag := 0;

  SetColorDefaultToFields; // ������������� ��������� ���� ����� ��������������

  // ������� ����� �����
  if not FEditing then
  begin
    ClearAllFields;
    // ���������� % ��������� ������ � ����������, ������ �������������
    DateTimePickerStartBuildingChange(Sender);
  end;

  if not FEditing then
    try
      with ADOQueryDifferent do
      begin

        Active := False;
        SQL.Clear;

        FStrQuery := 'SELECT max(num) as "MaxNumber", count(*) as "CountObject" FROM objcards;';

        SQL.Add(FStrQuery);
        Active := True;

        if FieldByName('CountObject').AsVariant > 0 then
          EditNumberObject.Text := IntToStr(FieldByName('MaxNumber').AsVariant + 1)
        else
          EditNumberObject.Text := '1';
      end;
    except
      on e: Exception do
        MessageBox(0, PChar('��� ������������ ������ ������� �������� ������:' + sLineBreak + e.Message),
          PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
    end;;

  // �������� ��������������

  try
    with ADOQuerySF do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM istfin;');
      Active := True;
    end;

    with dblkcbbSourseFinance do
    begin
      ListSource := DataSourceSF;
      ListField := 'name';
      KeyField := 'fin_id';
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ ��������� �������������� �������� ������:' + sLineBreak +
        e.Message), PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // ��������� �������

  try
    with ADOQueryCO do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM objcategory;');
      Active := True;
    end;

    with dblkcbbCategoryObject do
    begin
      ListSource := DataSourceCO;
      ListField := 'cat_name';
      KeyField := 'cat_id';
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ ��������� ������� �������� ������:' + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // ������

  try
    with qrR do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM regions;');
      Active := True;
    end;

    with dblkcbbRegion do
    begin
      ListSource := dsR;
      ListField := 'region_name';
      KeyField := 'region_id';
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ �������� �������� ������:' + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // ���� ��������

  try
    with qrBP do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM baseprices;');
      Active := True;
    end;

    with DBLookupComboBoxBasePrices do
    begin
      ListSource := DataSourceBP;
      ListField := 'base_name';
      KeyField := 'base_id';
      // �������������� ����������� ���� �������� � ����� ������
      if not qrBP.IsEmpty and not FEditing then
        KeyValue := qrBP.FieldByName('base_id').AsInteger;
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ ��� �������� �������� ������:' + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // ���� ��������

  try
    with qrZP do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM objregion;');
      Active := True;
    end;

    with dblkcbbZonePrices do
    begin
      ListSource := dsZP;
      ListField := 'region';
      KeyField := 'obj_region_id';
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ ��� �������� �������� ������:' + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  try
    with qrMAIS do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT MAIS_ID, CONCAT(`mais`.`NAME`, " �� ", DATE_FORMAT(`mais`.`onDate`, "%d.%m.%y"), " ��������� � ", DATE_FORMAT(`mais`.`Start_Date`, "%d.%m.%y")) AS NAME, onDate FROM mais ORDER BY onDate DESC;');
      Active := True;
    end;

    with dblkcbbMAIS do
    begin
      ListSource := dsMAIS;
      ListField := 'NAME';
      KeyField := 'MAIS_ID';
    end;

    // �������������� ����� ���������� ����
    if not FEditing then
    begin
      while not(qrMAIS.Eof) and (seYear.Value <= YearOf(qrMAIS.FieldByName('onDate').AsDateTime)) do
        qrMAIS.Next;
      dblkcbbMAIS.KeyValue := qrMAIS.FieldByName('MAIS_ID').AsInteger;
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ ������ �������� ������:' + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  if not FEditing then
  begin
    // ������ �������������
    { DM.qrDifferent.SQL.Text := 'SELECT SUM(FN_getParamValue(code, :month, :year)) AS VALUE'#13 +
      'FROM unidictparam WHERE id_unidicttype=7';
      DM.qrDifferent.ParamByName('month').AsInteger := cbbFromMonth.ItemIndex + 1;
      DM.qrDifferent.ParamByName('year').AsInteger := seYear.Value;
      DM.qrDifferent.Active := True; }
    qrMain.FieldByName('PER_CONTRACTOR').Value := 0 { DM.qrDifferent.FieldByName('VALUE').Value };
    { DM.qrDifferent.Active := False; }
  end;

  // ���������� ��������� �������� � ���������� �������
  if FEditing then
  begin
    dblkcbbSourseFinance.KeyValue := FSourceFinance;
    dblkcbbCategoryObject.KeyValue := FCategoryObject;
    dblkcbbRegion.KeyValue := FRegion;
    ComboBoxVAT.ItemIndex := qrMain.FieldByName('state_nds').AsInteger;
    DBLookupComboBoxBasePrices.KeyValue := FBasePrice;
    dblkcbbMAIS.KeyValue := FMAIS;

    try
      with ADOQueryDifferent do
      begin
        Active := False;
        SQL.Clear;
        SQL.Add('SELECT obj_region FROM objstroj WHERE stroj_id = ' + IntToStr(FTypeOXR) + ';');
        Active := True;
      end;

      dblkcbbZonePrices.KeyValue := DataSourceDifferent.DataSet.FieldByName('obj_region').AsVariant;
    except
      on e: Exception do
        MessageBox(0, PChar('��� ��������� �������� � ���� �������� �������� ������:' + sLineBreak +
          e.Message), PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
    end;

    GetValueDBLookupComboBoxTypeOXR(nil);

    dblkcbbTypeOXR.KeyValue := FTypeOXR;
  end;
end;

procedure TfCardObject.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ButtonSave.Tag = 0 then
    if MessageBox(0, PChar('������� ���� ��� ����������?'), PChar(Caption),
      MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
      CanClose := True
    else
      CanClose := False;
end;

procedure TfCardObject.ButtonSaveClick(Sender: TObject);
var
  NumberObject, v2, v3, v4, v7, v9, v12, v15, v16, v17, v18, v19: string;
  CountField: Integer;
  NEW_ID: Integer;
begin
  ButtonSave.SetFocus; // �������� ��� ��������
  CountField := 0;
  // �������� ����� �� ���� ������ ��������

  SetColorDefaultToFields;

  NumberObject := EditNumberObject.Text;

  if qrMain.FieldByName('BEG_STROJ').AsDateTime > qrMain.FieldByName('BEG_STROJ2').AsDateTime then
  begin
    ActiveControl := cbbMonthBeginStroj;
    MessageDlg
      ('���� ������ ������������� ������ ���� ������ ��� ����� ���� ����������� ������� ������������!',
      mtError, [mbOK], 0);
    Exit;
  end;

  // ���� �������
  if EditCodeObject.Text <> '' then
    v17 := EditCodeObject.Text
  else
  begin
    v17 := '';
    // EditCodeObject.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // ����� ��������
  if EditNumberContract.Text <> '' then
    v2 := EditNumberContract.Text
  else
  begin
    v2 := '';
    // EditNumberContract.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // ���� ���������� ��������
  DateTimeToString(v3, 'yyyy-mm-dd', DateTimePickerDataCreateContract.Date);

  // ������ �������������� ����������
  v4 := '0'; // ???????????????????????

  // ���� ������ �������������
  DateTimeToString(v7, 'yyyy-mm-dd', StrToDate('01.' + IntToStr(cbbFromMonth.ItemIndex + 1) + '.' +
    IntToStr(seYear.Value)));
  DM.qrDifferent.SQL.Text := 'SELECT stavka_id FROM stavka WHERE year = :year and monat = :month';
  DM.qrDifferent.ParamByName('month').AsInteger := cbbFromMonth.ItemIndex + 1;
  DM.qrDifferent.ParamByName('year').AsInteger := seYear.Value;
  DM.qrDifferent.Active := True;
  if DM.qrDifferent.IsEmpty then
  begin
    MessageDlg('��� ��������� ���� ����������� ����� �������� ������ �����������.'#13 +
      '��������� ������ ��� ������� ������ ���� ����������� �����.', mtError, [mbOK], 0);
    cbbFromMonth.SetFocus;
    Exit;
  end;

  // �������� ��������������
  if dblkcbbSourseFinance.KeyValue <> Null then
    v9 := dblkcbbSourseFinance.KeyValue
  else
  begin
    v9 := 'Null';
    // DBLookupComboBoxSourseFinance.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // ��������� �������
  if dblkcbbCategoryObject.KeyValue <> Null then
    v12 := dblkcbbCategoryObject.KeyValue
  else
  begin
    dblkcbbCategoryObject.Color := ColorWarningField;
    Inc(CountField);
  end;

  // ������
  if dblkcbbRegion.KeyValue = Null then
  begin
    dblkcbbRegion.Color := ColorWarningField;
    Inc(CountField);
  end;

  // ���� ��������
  with DBLookupComboBoxBasePrices do
    if KeyValue <> Null then
      v15 := KeyValue
    else
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  // ���� ��������
  with dblkcbbZonePrices do
    if KeyValue = Null then
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  // ��� ��� � ��� � ���� �������
  with dblkcbbTypeOXR do
    if KeyValue <> Null then
      v16 := KeyValue
    else
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  with dblkcbbMAIS do
    if KeyValue <> Null then
      v19 := KeyValue
    else
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  // ������ ���. ��������
  if CheckBoxCalculationEconom.Checked then
    v18 := '1'
  else
    v18 := '0';

  if CountField > 0 then
  begin
    MessageBox(0, PChar('�� ��������� �� ��� ����!' + sLineBreak +
      '���� ���������� ������� �� ��������� ��� ��������� �����������.'), PChar(Caption),
      MB_ICONWARNING + MB_OK + mb_TaskModal);
    Exit;
  end;

  try
    with DM.qrDifferent do
    begin
      Active := False;
      SQL.Clear;
      if FEditing then
      begin
        SQL.Add('UPDATE objcards SET num = "' + NumberObject + '", num_dog = "' + v2 + '", date_dog = "' + v3
          + '", agr_list = "' + v4 + '", full_name = :full_name, name = :name, beg_stroj = "' + v7 +
          '", srok_stroj = :srok_stroj, ' + ' fin_id = ' + v9 +
          ', cust_id = :cust_id, general_id = :general_id, cat_id = "' + v12 +
          '", state_nds = :snds, region_id = :region_id, base_norm_id = "' + v15 + '", stroj_id = "' + v16 +
          '", encrypt = "' + v17 + '", calc_econom = "' + v18 + '", MAIS_ID = "' + v19 +
          '", PER_TEMP_BUILD=:PER_TEMP_BUILD, PER_CONTRACTOR=:PER_CONTRACTOR, '#13 +
          'FL_CALC_TRAVEL=:FL_CALC_TRAVEL, FL_CALC_TRAVEL_WORK=:FL_CALC_TRAVEL_WORK,'#13 +
          'FL_CALC_WORKER_DEPARTMENT=:FL_CALC_WORKER_DEPARTMENT, FL_CALC_ZEM_NAL=:FL_CALC_ZEM_NAL,'#13 +
          'FL_CALC_VEDOMS_NAL=:FL_CALC_VEDOMS_NAL, FL_APPLY_WINTERPRICE=:FL_APPLY_WINTERPRICE,'#13 +
          'Fl_NAL_USN=:Fl_NAL_USN, NAL_USN=:NAL_USN, Fl_SPEC_SCH=:Fl_SPEC_SCH, SPEC_SCH=:SPEC_SCH,'#13 +
          'WINTERPRICE_TYPE=:WINTERPRICE_TYPE, BEG_STROJ2=:BEG_STROJ2,'#13 +
          'PER_TEMP_BUILD_BACK=:PER_TEMP_BUILD_BACK, CONTRACTOR_SERV=:CONTRACTOR_SERV,'#13 +
          'PER_NPZ=:PER_NPZ, K_ZP=:K_ZP, K_OHR=:K_OHR, K_PP=:K_PP,'#13 +
          'PER_WINTERPRICE=:PER_WINTERPRICE, FL_DIFF_MAT=:FL_DIFF_MAT, FL_DIFF_TRANSP=:FL_DIFF_TRANSP,'#13 +
          'FL_DIFF_EMIM=:FL_DIFF_EMIM, FL_DIFF_OTHER=:FL_DIFF_OTHER, FL_DIFF_NAL=:FL_DIFF_NAL,'#13 +
          'FL_DIFF_MAT_ZAK=:FL_DIFF_MAT_ZAK, FL_DIFF_NAL_USN=:FL_DIFF_NAL_USN, FL_DIFF_NDS=:FL_DIFF_NDS,'#13 +
          'FL_DIFF_DEVICE_PODR_WITH_NAL=:FL_DIFF_DEVICE_PODR_WITH_NAL'#13 + 'WHERE obj_id = "' +
          IntToStr(FIdObject) + '";');
        // ���� ���������� ������ ����������
        if (qrMain.FieldByName('FL_APPLY_WINTERPRICE').Value <> qrMain.FieldByName('FL_APPLY_WINTERPRICE')
          .OldValue) OR (qrMain.FieldByName('WINTERPRICE_TYPE').Value <>
          qrMain.FieldByName('WINTERPRICE_TYPE').OldValue) then
        begin
          // ��������� ��� ����� �������
          FastExecSQL
            ('UPDATE smetasourcedata SET APPLY_WINTERPRISE_FLAG=:0, WINTERPRICE_TYPE=:1 WHERE OBJ_ID=:2',
            VarArrayOf([qrMain.FieldByName('FL_APPLY_WINTERPRICE').Value,
            qrMain.FieldByName('WINTERPRICE_TYPE').Value, FIdObject]));
          Application.MessageBox('��������! ���� �������� ��������� ������� ����������.' + #13#10 +
            '��� ���������� ��������� ���������� ������� ����� � ��������� ����������.', '��������� �������',
            MB_OK + MB_ICONWARNING + MB_TOPMOST);

        end;

        // ��������� ���� �� ���� ��������� ������/�����
        if qrMain.FieldByName('MAIS_ID').OldValue <> qrMain.FieldByName('MAIS_ID').Value then
          FastExecSQL('UPDATE smetasourcedata SET MAIS_ID=:0 WHERE OBJ_ID=:1',
            VarArrayOf([qrMain.FieldByName('MAIS_ID').Value, FIdObject]));
      end
      else
      begin
        NEW_ID := FastSelectSQLOne('SELECT GetNewID(:IDType)', VarArrayOf([C_ID_OBJ]));
        SQL.Add('INSERT INTO objcards (obj_id, num, num_dog, date_dog, agr_list, full_name, name, beg_stroj, srok_stroj, '
          + ' fin_id, cust_id, general_id, cat_id, state_nds, region_id, base_norm_id, stroj_id, encrypt,' +
          ' calc_econom, MAIS_ID, PER_TEMP_BUILD, PER_CONTRACTOR, PER_TEMP_BUILD_BACK, CONTRACTOR_SERV, USER_ID,'#13
          + 'FL_CALC_TRAVEL, FL_CALC_TRAVEL_WORK, FL_CALC_WORKER_DEPARTMENT, FL_CALC_ZEM_NAL,'#13 +
          'FL_CALC_VEDOMS_NAL, FL_APPLY_WINTERPRICE, WINTERPRICE_TYPE,BEG_STROJ2,'#13 +
          'Fl_NAL_USN, NAL_USN, Fl_SPEC_SCH, SPEC_SCH, PER_NPZ, K_ZP, K_OHR, K_PP,'#13 +
          'PER_WINTERPRICE, FL_DIFF_MAT, FL_DIFF_TRANSP, FL_DIFF_EMIM, FL_DIFF_OTHER, FL_DIFF_NAL,'#13 +
          'FL_DIFF_MAT_ZAK, FL_DIFF_NAL_USN, FL_DIFF_NDS, FL_DIFF_DEVICE_PODR_WITH_NAL)'#13 +
          'VALUE (:NEW_ID, "' + NumberObject + '", "' + v2 + '", "' + v3 + '", "' + v4 +
          '", :full_name, :name, "' + v7 + '", :srok_stroj, ' + v9 + ', :cust_id, :general_id, "' + v12 +
          '", :snds, :region_id, "' + v15 + '", "' + v16 + '", "' + v17 + '", "' + v18 + '", "' + v19 +
          '", :PER_TEMP_BUILD, :PER_CONTRACTOR, :PER_TEMP_BUILD_BACK, :CONTRACTOR_SERV, :USER_ID,'#13 +
          ':FL_CALC_TRAVEL, :FL_CALC_TRAVEL_WORK, :FL_CALC_WORKER_DEPARTMENT, :FL_CALC_ZEM_NAL, :FL_CALC_VEDOMS_NAL, :FL_APPLY_WINTERPRICE, :WINTERPRICE_TYPE,'#13
          + ':BEG_STROJ2,:Fl_NAL_USN, :NAL_USN, :Fl_SPEC_SCH, :SPEC_SCH, :PER_NPZ, :K_ZP, :K_OHR,'#13 +
          ':K_PP, :PER_WINTERPRICE, :FL_DIFF_MAT, :FL_DIFF_TRANSP, :FL_DIFF_EMIM, :FL_DIFF_OTHER,'#13 +
          ':FL_DIFF_NAL, :FL_DIFF_MAT_ZAK, :FL_DIFF_NAL_USN, :FL_DIFF_NDS, :FL_DIFF_DEVICE_PODR_WITH_NAL);');
        ParamByName('NEW_ID').Value := NEW_ID;
        ParamByName('USER_ID').Value := G_USER_ID;
        FIdObject := NEW_ID;
      end;
      ParamByName('PER_TEMP_BUILD').Value := qrMain.FieldByName('PER_TEMP_BUILD').Value;
      ParamByName('PER_CONTRACTOR').Value := qrMain.FieldByName('PER_CONTRACTOR').Value;
      ParamByName('PER_TEMP_BUILD_BACK').Value := qrMain.FieldByName('PER_TEMP_BUILD_BACK').Value;
      ParamByName('CONTRACTOR_SERV').Value := qrMain.FieldByName('CONTRACTOR_SERV').AsInteger;
      ParamByName('cust_id').Value := qrMain.FieldByName('cust_id').AsInteger;
      ParamByName('general_id').Value := qrMain.FieldByName('general_id').AsInteger;
      ParamByName('snds').Value := ComboBoxVAT.ItemIndex;

      ParamByName('FL_CALC_TRAVEL').Value := qrMain.FieldByName('FL_CALC_TRAVEL').Value;
      ParamByName('FL_CALC_TRAVEL_WORK').Value := qrMain.FieldByName('FL_CALC_TRAVEL_WORK').Value;
      ParamByName('FL_CALC_WORKER_DEPARTMENT').Value := qrMain.FieldByName('FL_CALC_WORKER_DEPARTMENT').Value;
      ParamByName('FL_CALC_ZEM_NAL').Value := qrMain.FieldByName('FL_CALC_ZEM_NAL').Value;
      ParamByName('FL_CALC_VEDOMS_NAL').Value := qrMain.FieldByName('FL_CALC_VEDOMS_NAL').Value;
      ParamByName('FL_APPLY_WINTERPRICE').Value := qrMain.FieldByName('FL_APPLY_WINTERPRICE').Value;
      ParamByName('WINTERPRICE_TYPE').Value := qrMain.FieldByName('WINTERPRICE_TYPE').Value;
      ParamByName('BEG_STROJ2').Value := StrToDate('01.' + IntToStr(cbbMonthBeginStroj.ItemIndex + 1) + '.' +
        IntToStr(seYearBeginStroj.Value));
      // BEG_STROJ2 ��������� ����� ����, ������ ���� � �������� qrMain.FieldByName('BEG_STROJ2').Value;
      ParamByName('Fl_NAL_USN').Value := qrMain.FieldByName('Fl_NAL_USN').Value;
      ParamByName('NAL_USN').Value := qrMain.FieldByName('NAL_USN').Value;
      ParamByName('Fl_SPEC_SCH').Value := qrMain.FieldByName('Fl_SPEC_SCH').Value;
      ParamByName('SPEC_SCH').Value := qrMain.FieldByName('SPEC_SCH').Value;
      ParamByName('srok_stroj').Value := qrMain.FieldByName('srok_stroj').Value;
      ParamByName('region_id').Value := qrMain.FieldByName('region_id').Value;
      ParamByName('PER_NPZ').Value := qrMain.FieldByName('PER_NPZ').Value;
      ParamByName('K_ZP').Value := qrMain.FieldByName('K_ZP').Value;
      ParamByName('K_OHR').Value := qrMain.FieldByName('K_OHR').Value;
      ParamByName('K_PP').Value := qrMain.FieldByName('K_PP').Value;
      ParamByName('PER_WINTERPRICE').Value := qrMain.FieldByName('PER_WINTERPRICE').Value;
      ParamByName('FL_DIFF_MAT').Value := qrMain.FieldByName('FL_DIFF_MAT').Value;
      ParamByName('FL_DIFF_TRANSP').Value := qrMain.FieldByName('FL_DIFF_TRANSP').Value;
      ParamByName('FL_DIFF_EMIM').Value := qrMain.FieldByName('FL_DIFF_EMIM').Value;
      ParamByName('FL_DIFF_OTHER').Value := qrMain.FieldByName('FL_DIFF_OTHER').Value;
      ParamByName('FL_DIFF_NAL').Value := qrMain.FieldByName('FL_DIFF_NAL').Value;
      ParamByName('FL_DIFF_MAT_ZAK').Value := qrMain.FieldByName('FL_DIFF_MAT_ZAK').Value;
      ParamByName('FL_DIFF_NAL_USN').Value := qrMain.FieldByName('FL_DIFF_NAL_USN').Value;
      ParamByName('FL_DIFF_NDS').Value := qrMain.FieldByName('FL_DIFF_NDS').Value;
      ParamByName('FL_DIFF_DEVICE_PODR_WITH_NAL').Value :=
        qrMain.FieldByName('FL_DIFF_DEVICE_PODR_WITH_NAL').Value;
      ParamByName('full_name').Value := qrMain.FieldByName('full_name').Value;
      ExecSQL;
    end;

    ButtonSave.Tag := 1;
    qrMain.Close;

    // ���� ������� ����� ��� ���, �� �������� ����������
    if Assigned(FormCalculationEstimate) then
    begin
      FormCalculationEstimate.RecalcEstimate;
      FormCalculationEstimate.FillObjectInfo;
    end;
    ModalResult := mrOk;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ���������� ������ �������� ������:' + sLineBreak + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TfCardObject.cbbMonthBeginStrojChange(Sender: TObject);
begin
  qrMain.FieldByName('BEG_STROJ2').Value := StrToDate('01.' + IntToStr(cbbMonthBeginStroj.ItemIndex + 1) + '.'
    + IntToStr(seYearBeginStroj.Value));
end;

procedure TfCardObject.btn1Click(Sender: TObject);
var
  res: Variant;
begin
  res := SelectOrganization(dblkcbbGENERAL.KeyValue);
  if not VarIsNull(res) then
  begin
    CloseOpen(qrClients);
    dblkcbbGENERAL.KeyValue := res;
    qrMain.Edit;
    qrMain.FieldByName('general_id').Value := res;
  end;
end;

procedure TfCardObject.btn2Click(Sender: TObject);
var
  res: Variant;
begin
  res := SelectOrganization(dblkcbbCUST_ID.KeyValue);
  if not VarIsNull(res) then
  begin
    CloseOpen(qrClients);
    dblkcbbCUST_ID.KeyValue := res;
    qrMain.Edit;
    qrMain.FieldByName('cust_id').Value := res;
  end;
end;

procedure TfCardObject.btnCardObjectAdditionalClick(Sender: TObject);
var
  fCardObjectAdditional: TfCardObjectAdditional;
begin
  fCardObjectAdditional := TfCardObjectAdditional.Create(Self);
  try
    fCardObjectAdditional.fCardObject := Self;
    fCardObjectAdditional.ShowModal;
    if fCardObjectAdditional.dbchkFL_CALC_VEDOMS_NAL2.Checked and
      (VarIsNull(qrMain.FieldByName('SPEC_SCH').Value) or (qrMain.FieldByName('SPEC_SCH').Value = 0)) then
      qrMain.FieldByName('SPEC_SCH').Value := 0 { 1.5 };
  finally
    FreeAndNil(fCardObjectAdditional);
  end;
end;

procedure TfCardObject.ButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfCardObject.ButtonListAgreementsClick(Sender: TObject);
begin
  ShowSuppAgreement(FIdObject);
end;

procedure TfCardObject.SetColorDefaultToFields;
begin
  EditCodeObject.Color := clWindow;
  EditNumberContract.Color := clWindow;
  dbedtname.Color := clWindow;
  dbmmoFULL_NAME.Color := clWindow;
  dblkcbbSourseFinance.Color := clWindow;
  dblkcbbCategoryObject.Color := clWindow;
  dblkcbbRegion.Color := clWindow;
  dblkcbbZonePrices.Color := clWindow;
  DBLookupComboBoxBasePrices.Color := clWindow;
  dblkcbbTypeOXR.Color := clWindow;
  dblkcbbMAIS.Color := clWindow;
end;

procedure TfCardObject.SetIdObject(AValue: Integer);
begin
  FIdObject := AValue;
  if FIdObject > 0 then
    FEditing := True;
end;

procedure TfCardObject.ClearAllFields;
begin
  EditCodeObject.Text := '';
  EditNumberContract.Text := '';
  CheckBoxCalculationEconom.Checked := False;
  DateTimePickerDataCreateContract.Date := Now;
  cbbFromMonth.ItemIndex := MonthOf(Now) - 1;
  seYear.Value := YearOf(Now);
  cbbMonthBeginStroj.ItemIndex := cbbFromMonth.ItemIndex;
  seYearBeginStroj.Value := seYear.Value;
  dblkcbbSourseFinance.KeyValue := Null;
  dblkcbbCategoryObject.KeyValue := Null;
  dblkcbbRegion.KeyValue := Null;
  dblkcbbZonePrices.KeyValue := Null;
  DBLookupComboBoxBasePrices.KeyValue := Null;
  dblkcbbTypeOXR.KeyValue := Null;
  dblkcbbMAIS.KeyValue := Null;
end;

procedure TfCardObject.DateTimePickerStartBuildingChange(Sender: TObject);
begin
  // �������������� ���������� %� �������
  // if not Editing then // ������ ��� ����� �������
  begin
    qrMain.Edit;
    qrMain.FieldByName('PER_TEMP_BUILD').Value := GetUniDictParamValue('PER_TEMP_BUILD',
      cbbFromMonth.ItemIndex + 1, seYear.Value);
    qrMain.FieldByName('PER_TEMP_BUILD_BACK').Value := GetUniDictParamValue('PER_TEMP_BUILD_BACK',
      cbbFromMonth.ItemIndex + 1, seYear.Value);
    // ��������������� ����
    if CheckQrActiveEmpty(qrMAIS) then
    begin
      qrMAIS.First;
      while not(qrMAIS.Eof) and (seYear.Value <= YearOf(qrMAIS.FieldByName('onDate').AsDateTime)) do
        qrMAIS.Next;
      dblkcbbMAIS.KeyValue := qrMAIS.FieldByName('MAIS_ID').AsInteger;
    end;
  end;
  // ���� ���� ������ ������������� ��� ��������� ��������� ������, �� ������������� �� ���� ����������� �����
  if (cbbMonthBeginStroj.ItemIndex + seYearBeginStroj.Value * 12) <
    (cbbFromMonth.ItemIndex + seYear.Value * 12) then
  begin
    cbbMonthBeginStroj.ItemIndex := cbbFromMonth.ItemIndex;
    seYearBeginStroj.Value := seYear.Value;
    cbbMonthBeginStrojChange(nil);
  end;
end;

procedure TfCardObject.dblkcbbRegionCloseUp(Sender: TObject);
begin
  if qrZP.IsEmpty then
    Exit;
  // �������������� ����������� ���� �������� "�����" ��� ������ ������� "�����"
  if dblkcbbRegion.KeyValue = 7 then
  begin
    qrZP.Filter := 'OBJ_REGION_ID = 3';
    qrZP.Filtered := True;
    dblkcbbZonePrices.KeyValue := 3;
    GetValueDBLookupComboBoxTypeOXR(Sender);
  end
  else if not VarIsNull(dblkcbbRegion.KeyValue) then
  begin
    qrZP.Filter := 'OBJ_REGION_ID <> 3';
    qrZP.Filtered := True;
    qrZP.First;
    dblkcbbZonePrices.KeyValue := 1;
    GetValueDBLookupComboBoxTypeOXR(Sender);
  end;
end;

procedure TfCardObject.GetValueDBLookupComboBoxTypeOXR(Sender: TObject);
var
  IdRegion: Integer;
  IdCategory: Integer;
begin
  if (dblkcbbCategoryObject.KeyValue = Null) or (dblkcbbZonePrices.KeyValue = Null) then
    Exit;

  // ��� ��� � ��� � ���� �������

  IdRegion := dblkcbbZonePrices.KeyValue;
  IdCategory := dblkcbbCategoryObject.KeyValue;

  try
    with qrTO do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM objstroj WHERE obj_region = ' + IntToStr(IdRegion) + ' and obj_category_id = ' +
        IntToStr(IdCategory) + ';');
      Active := True;
    end;

    with dblkcbbTypeOXR do
    begin
      ListSource := dsTO;
      ListField := 'name';
      KeyField := 'stroj_id';
    end;
    dblkcbbTypeOXR.KeyValue := (IdRegion - 1) * 4 + IdCategory;
  except
    on e: Exception do
      MessageBox(0, PChar('��� ������� ������ ��� � ��� �������� ������:' + sLineBreak + e.Message),
        PChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TfCardObject.qrMainNewRecord(DataSet: TDataSet);
begin
  // ������������� ��������� ��������
  qrMain.FieldByName('FL_CALC_TRAVEL').Value := 0;
  qrMain.FieldByName('FL_CALC_WORKER_DEPARTMENT').Value := 0;
  qrMain.FieldByName('FL_CALC_TRAVEL_WORK').Value := 0;
  qrMain.FieldByName('FL_CALC_ZEM_NAL').Value := 0;
  qrMain.FieldByName('FL_CALC_VEDOMS_NAL').Value := 0;
  qrMain.FieldByName('FL_APPLY_WINTERPRICE').Value := 0;
  qrMain.FieldByName('WINTERPRICE_TYPE').Value := 0;

  qrMain.FieldByName('Fl_NAL_USN').Value := 0;
  qrMain.FieldByName('NAL_USN').Value := 0;
  qrMain.FieldByName('Fl_SPEC_SCH').Value := 0;
  qrMain.FieldByName('SPEC_SCH').Value := 0;

  qrMain.FieldByName('K_ZP').Value := 1;
  qrMain.FieldByName('K_OHR').Value := 1;
  qrMain.FieldByName('K_PP').Value := 1;

  qrMain.FieldByName('PER_WINTERPRICE').Value := 0;
  qrMain.FieldByName('FL_DIFF_MAT').Value := 0;
  qrMain.FieldByName('FL_DIFF_TRANSP').Value := 0;
  qrMain.FieldByName('FL_DIFF_EMIM').Value := 0;
  qrMain.FieldByName('FL_DIFF_OTHER').Value := 0;
  qrMain.FieldByName('FL_DIFF_NAL').Value := 0;
  qrMain.FieldByName('FL_DIFF_MAT_ZAK').Value := 0;
  qrMain.FieldByName('FL_DIFF_NAL_USN').Value := 0;
  qrMain.FieldByName('FL_DIFF_NDS').Value := 0;
  qrMain.FieldByName('FL_DIFF_DEVICE_PODR_WITH_NAL').Value := 0;
  qrMain.FieldByName('PER_DONE').Value := 100;
  qrMain.FieldByName('PER_NPZ').Value := 0;
  qrMain.FieldByName('SROK_STROJ').Value := 1;
end;

end.
