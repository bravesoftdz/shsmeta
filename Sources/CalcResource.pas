unit CalcResource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.Samples.Spin, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.Mask, JvDBGridFooter,
  JvComponentBase, JvFormPlacement, System.UITypes, Vcl.Buttons, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script, Tools, Vcl.OleCtnrs, Vcl.OleServer, ExcelXP, JvExGrids, JvStringGrid, ActiveX, ComObj,
  SmReportPreview;

type
  TfCalcResource = class(TSmForm)
    pnlTop: TPanel;
    lbl1: TLabel;
    pgc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    ts5: TTabSheet;
    pnlMatTop: TPanel;
    edtMatCodeFilter: TEdit;
    edtMatNameFilter: TEdit;
    pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    mDetete: TMenuItem;
    N4: TMenuItem;
    mRestore: TMenuItem;
    pnlMatClient: TPanel;
    grMaterial: TJvDBGrid;
    pnlMatBott: TPanel;
    grMaterialBott: TJvDBGrid;
    dbmmoNAME: TDBMemo;
    spl1: TSplitter;
    spl2: TSplitter;
    qrMaterialData: TFDQuery;
    dsMaterialData: TDataSource;
    pnlMechClient: TPanel;
    grMech: TJvDBGrid;
    pnlMechBott: TPanel;
    spl3: TSplitter;
    grMechBott: TJvDBGrid;
    dbmmoNAME1: TDBMemo;
    spl4: TSplitter;
    pnlMechTop: TPanel;
    edtMechCodeFilter: TEdit;
    edtMechNameFilter: TEdit;
    qrMechData: TFDQuery;
    dsMechData: TDataSource;
    spl5: TSplitter;
    pnlDevTop: TPanel;
    edt1: TEdit;
    edt2: TEdit;
    pnlDevClient: TPanel;
    grDev: TJvDBGrid;
    pnlDevBott: TPanel;
    spl6: TSplitter;
    grDevBott: TJvDBGrid;
    dbmmoNAME2: TDBMemo;
    qrDevices: TFDQuery;
    dsDevices: TDataSource;
    pnlRatesClient: TPanel;
    grRates: TJvDBGrid;
    qrRates: TFDQuery;
    dsRates: TDataSource;
    JvDBGridFooter1: TJvDBGridFooter;
    JvDBGridFooter2: TJvDBGridFooter;
    JvDBGridFooter3: TJvDBGridFooter;
    JvDBGridFooter4: TJvDBGridFooter;
    edtEstimateName: TEdit;
    FormStorage: TJvFormStorage;
    mShowDeleted: TMenuItem;
    mN7: TMenuItem;
    qrMaterialDetail: TFDQuery;
    dsMaterialDetail: TDataSource;
    mReplace: TMenuItem;
    lbl6: TLabel;
    cbbFromMonth: TComboBox;
    seFromYear: TSpinEdit;
    cbbNDS: TComboBox;
    qrEstimate: TFDQuery;
    qrMechDetail: TFDQuery;
    dsMechDetail: TDataSource;
    qrDevicesDetail: TFDQuery;
    dsDevicesDetail: TDataSource;
    dbmmoNAME3: TDBMemo;
    strngfldMaterialDataCODE: TStringField;
    strngfldMaterialDataNAME: TStringField;
    strngfldMaterialDataUNIT: TStringField;
    qrMaterialDataCNT: TFMTBCDField;
    qrMaterialDataDOC_DATE: TDateField;
    strngfldMaterialDataDOC_NUM: TStringField;
    qrMaterialDataPROC_TRANSP: TFMTBCDField;
    qrMaterialDataCOAST: TFMTBCDField;
    qrMaterialDataPRICE: TFMTBCDField;
    qrMaterialDataTRANSP: TFMTBCDField;
    qrMaterialDataDELETED: TByteField;
    qrMaterialDataMAT_PROC_ZAC: TWordField;
    qrMaterialDataMAT_PROC_PODR: TWordField;
    qrMaterialDataTRANSP_PROC_ZAC: TWordField;
    qrMaterialDataTRANSP_PROC_PODR: TWordField;
    qrMaterialDataMAT_ID: TLongWordField;
    strngfldMechDataCODE: TStringField;
    strngfldMechDataNAME: TStringField;
    strngfldMechDataUNIT: TStringField;
    qrMechDataCNT: TFMTBCDField;
    qrMechDataCOAST: TFMTBCDField;
    qrMechDataPRICE: TFMTBCDField;
    qrMechDataZP_1: TFMTBCDField;
    qrMechDataZP_2: TFMTBCDField;
    qrMechDataDELETED: TByteField;
    qrMechDataPROC_ZAC: TWordField;
    qrMechDataPROC_PODR: TWordField;
    qrMechDataMECH_ID: TLongWordField;
    strngfldDevicesCODE: TStringField;
    strngfldDevicesNAME: TStringField;
    strngfldDevicesUNIT: TStringField;
    qrDevicesCNT: TFMTBCDField;
    qrDevicesDOC_DATE: TDateField;
    strngfldDevicesDOC_NUM: TStringField;
    qrDevicesCOAST: TFMTBCDField;
    qrDevicesPRICE: TFMTBCDField;
    qrDevicesTRANSP: TFMTBCDField;
    qrDevicesPROC_ZAC: TWordField;
    qrDevicesPROC_PODR: TWordField;
    qrDevicesTRANSP_PROC_ZAC: TWordField;
    qrDevicesTRANSP_PROC_PODR: TWordField;
    qrDevicesDELETED: TLargeintField;
    qrDevicesDEVICE_ID: TLongWordField;
    qrMaterialDataFCOAST: TIntegerField;
    qrMaterialDataREPLACED: TIntegerField;
    qrMechDataREPLACED: TIntegerField;
    qrMaterialDataFREPLACED: TIntegerField;
    qrMechDataFREPLACED: TIntegerField;
    pnlCalculationYesNo: TPanel;
    qrMaterialDataNUMPP: TIntegerField;
    mPROC_TRANSP: TMenuItem;
    mN4: TMenuItem;
    mN5: TMenuItem;
    mN6: TMenuItem;
    mN8: TMenuItem;
    mN9: TMenuItem;
    mN11: TMenuItem;
    mRestoreValues: TMenuItem;
    mN10: TMenuItem;
    mN12: TMenuItem;
    N5305335341: TMenuItem;
    mN13: TMenuItem;
    mN14: TMenuItem;
    fdScript: TFDScript;
    qrMechDataNUMPP: TIntegerField;
    qrDevicesNUMPP: TIntegerField;
    mEdit: TMenuItem;
    mtRS: TFDMemTable;
    dsRS: TDataSource;
    qrmtf1: TStringField;
    qrmtf2: TStringField;
    qrmtf3: TStringField;
    qrmtf4: TStringField;
    qrmtf5: TStringField;
    qrmtf6: TStringField;
    pgcRS: TPageControl;
    ts6: TTabSheet;
    tsTravel: TTabSheet;
    tsTravelWork: TTabSheet;
    ts9: TTabSheet;
    grRS: TJvDBGrid;
    grTravel: TJvDBGrid;
    grTravelWork: TJvDBGrid;
    grWorkerDepartment: TJvDBGrid;
    mtTravel: TFDMemTable;
    qr1: TStringField;
    qr2: TStringField;
    qr3: TStringField;
    qr4: TStringField;
    dsTravel: TDataSource;
    mtTravelWork: TFDMemTable;
    qr7: TStringField;
    qr8: TStringField;
    qr9: TStringField;
    qr10: TStringField;
    dsTravelWork: TDataSource;
    mtWorkerDepartment: TFDMemTable;
    qr13: TStringField;
    qr14: TStringField;
    qr15: TStringField;
    qr16: TStringField;
    dsWorkerDepartment: TDataSource;
    ts10: TTabSheet;
    grVars: TJvDBGrid;
    mtVars: TFDMemTable;
    qr5: TStringField;
    qr6: TStringField;
    dsVars: TDataSource;
    qrVarsf3: TStringField;
    pnlTop2: TPanel;
    btnShowTemplate: TBitBtn;
    btnCalcSetup: TBitBtn;
    btnCalcSetupIndex: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtMatCodeFilterChange(Sender: TObject);
    procedure edtMatCodeFilterClick(Sender: TObject);
    procedure edtMechCodeFilterChange(Sender: TObject);
    procedure qrMaterialDataAfterOpen(DataSet: TDataSet);
    procedure JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
      var CalcValue: Variant);
    procedure qrMaterialDataBeforeOpen(DataSet: TDataSet);
    procedure pmPopup(Sender: TObject);
    procedure mReplaceClick(Sender: TObject);
    procedure grMaterialCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
    procedure qrMaterialDataBeforePost(DataSet: TDataSet);
    procedure mDeteteClick(Sender: TObject);
    procedure mRestoreClick(Sender: TObject);
    procedure grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure grMechDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMechDataBeforePost(DataSet: TDataSet);
    procedure qrDevicesBeforePost(DataSet: TDataSet);
    procedure grDevDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grRatesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMaterialDataMAT_PROC_ZACChange(Sender: TField);
    procedure qrMaterialDataMAT_PROC_PODRChange(Sender: TField);
    procedure qrMaterialDataTRANSP_PROC_ZACChange(Sender: TField);
    procedure qrMaterialDataTRANSP_PROC_PODRChange(Sender: TField);
    procedure grMaterialBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure grMechBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMechDataPROC_ZACChange(Sender: TField);
    procedure qrMechDataPROC_PODRChange(Sender: TField);
    procedure qrDevicesPROC_ZACChange(Sender: TField);
    procedure qrDevicesPROC_PODRChange(Sender: TField);
    procedure qrDevicesTRANSP_PROC_ZACChange(Sender: TField);
    procedure qrDevicesTRANSP_PROC_PODRChange(Sender: TField);
    procedure qrMaterialDetailBeforePost(DataSet: TDataSet);
    procedure qrMechDetailBeforePost(DataSet: TDataSet);
    procedure qrDevicesDetailBeforePost(DataSet: TDataSet);
    procedure pnlCalculationYesNoClick(Sender: TObject);
    procedure qrMaterialDataCalcFields(DataSet: TDataSet);
    procedure qrMaterialDataCOASTChange(Sender: TField);
    procedure qrMechDataCOASTChange(Sender: TField);
    procedure qrDevicesCOASTChange(Sender: TField);
    procedure grMaterialExit(Sender: TObject);
    procedure grMaterialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grDevBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PMTrPerc0Click(Sender: TObject);
    procedure mRestoreValuesClick(Sender: TObject);
    procedure grDevColExit(Sender: TObject);
    procedure mN12Click(Sender: TObject);
    procedure qrMechDataCalcFields(DataSet: TDataSet);
    procedure qrDevicesCalcFields(DataSet: TDataSet);
    procedure mEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowTemplateClick(Sender: TObject);
    procedure btnCalcSetupClick(Sender: TObject);
    procedure btnCalcSetupIndexClick(Sender: TObject);
    procedure pgcRSChange(Sender: TObject);
  private
    Footer: Variant;
    IDEstimate, OBJ_ID: Integer;
    flLoaded: Boolean;
    Editable: Boolean;
    ShowFullObject: Boolean;
    ExcelApp: OLEVariant;
    FOldGridProc: TWndMethod;
    fRS: TfSmReportPreview;
    FOwnPointer: Pointer;

    procedure GridProc(var Message: TMessage);
    procedure GetRSReport;

    function CanEditField(Field: TField): Boolean;
  public
    property OwnPointer: Pointer read FOwnPointer write FOwnPointer;
  end;

var
  fCalcResource: TfCalcResource;

procedure ShowCalcResourceEx(var ACalcResource: TfCalcResource;
  const ID_ESTIMATE: Variant; const APage: Integer = 0;
  AOwner: TWinControl = nil; AEditable: Boolean = True;
  AShowFullObject: Boolean = True; AShowTabs: Boolean = False);

procedure ShowCalcResource(const ID_ESTIMATE: Variant; const APage: Integer = 0; AOwner: TWinControl = nil;
  AEditable: Boolean = True; AShowFullObject: Boolean = True; AShowTabs: Boolean = False);

implementation

{$R *.dfm}

uses Main, ReplacementMatAndMech, CalculationEstimate, DataModule, CalcSetup, CalcSetupIndex,
  GlobsAndConst, TranspPersSelect, CalcResourceEdit, Waiting, SmReportData, SmReportEdit, CalcTravel,
  CalcTravelWork, CalcWorkerDepartment;

procedure ShowCalcResource(const ID_ESTIMATE: Variant; const APage: Integer = 0; AOwner: TWinControl = nil;
  AEditable: Boolean = True; AShowFullObject: Boolean = True; AShowTabs: Boolean = False);
begin
  ShowCalcResourceEx(fCalcResource, ID_ESTIMATE, APage, AOwner, AEditable,
    AShowFullObject, AShowTabs);
end;

procedure ShowCalcResourceEx(var ACalcResource: TfCalcResource;
  const ID_ESTIMATE: Variant; const APage: Integer = 0;
  AOwner: TWinControl = nil; AEditable: Boolean = True;
  AShowFullObject: Boolean = True; AShowTabs: Boolean = False);
var
  pageID: Integer;
  fl: Boolean;
begin
  fl := False;
  if VarIsNull(ID_ESTIMATE) then
    Exit;
  if (not Assigned(ACalcResource)) then
  begin
    ACalcResource := TfCalcResource.Create(AOwner);
    ACalcResource.OwnPointer := @ACalcResource;
    fl := True;
  end;

  if AOwner <> nil then
  begin
    ACalcResource.Parent := AOwner;
    ACalcResource.Align := alClient;
    ACalcResource.BorderStyle := bsNone;
  end
  else
    // ������ ������ �� ����� ���� (�� ������� ����� �����)
    FormMain.CreateButtonOpenWindow('������ ��������� ��������', '������ ��������� ��������',
      ACalcResource, 1);

  ACalcResource.flLoaded := False;
  ACalcResource.IDEstimate := ID_ESTIMATE;
  ACalcResource.OBJ_ID := FastSelectSQLOne('SELECT OBJ_ID FROM smetasourcedata WHERE SM_ID=:0',
    VarArrayOf([ID_ESTIMATE]));
  ACalcResource.Editable := AEditable;
  ACalcResource.ShowFullObject := AShowFullObject;
  ACalcResource.qrEstimate.ParamByName('SM_ID').Value := ID_ESTIMATE;
  ACalcResource.qrEstimate.Active := True;
  ACalcResource.cbbFromMonth.ItemIndex := ACalcResource.qrEstimate.FieldByName('MONTH').AsInteger - 1;
  ACalcResource.edtEstimateName.Text := ACalcResource.qrEstimate.FieldByName('NAME').AsString;
  ACalcResource.seFromYear.Value := ACalcResource.qrEstimate.FieldByName('YEAR').AsInteger;
  ACalcResource.cbbNDS.ItemIndex := ACalcResource.qrEstimate.FieldByName('NDS').AsInteger;

  // ���� ������� � ��� ���������� (�� ��� ��������) , �� �������� ��� �������
  for pageID := 0 to ACalcResource.pgc.PageCount - 1 do
    ACalcResource.pgc.Pages[pageID].TabVisible := AShowTabs;

  ACalcResource.pnlTop.Visible := AOwner = nil;
  ACalcResource.pgc.ActivePageIndex := APage;

  if AOwner = nil then
    ACalcResource.WindowState := wsMaximized;

  ACalcResource.flLoaded := True;

  ACalcResource.pgcChange(nil);
  with ACalcResource do
    if fl then
      case pgc.ActivePageIndex of
        // ������ ����������
        1:
          qrMaterialData.First;
        // ������ ����������
        2:
          qrMechData.First;
        // ������ ������������
        3:
          qrDevices.First;
        // ������ �\�
        4:
          qrRates.First;
      end;
  if AOwner <> nil then
    ACalcResource.Width := AOwner.ClientWidth;
  ACalcResource.Show;
end;

procedure TfCalcResource.btnCalcSetupClick(Sender: TObject);
var
  fCalcSetup: TfCalcSetup;
begin
  // ��� ������� � ���� ����
  fCalcSetup := TfCalcSetup.Create(Self, VarArrayOf([OBJ_ID, Null]));
  // ��� �����
  // fCalcSetup := TfCalcSetup.Create(Self, VarArrayOf([Null, IDEstimate]));
  try
    fCalcSetup.ShowModal;
  finally
    FreeAndNil(fCalcSetup);
    // ��������� ������ �����
    GetRSReport;
  end;
end;

procedure TfCalcResource.btnCalcSetupIndexClick(Sender: TObject);
var
  fCalcSetupIndex: TfCalcSetupIndex;
begin
  // ��� ������� � ���� ����
  fCalcSetupIndex := TfCalcSetupIndex.Create(Self, VarArrayOf([OBJ_ID, Null]));
  // ��� �����
  // fCalcSetupIndex := TfCalcSetupIndex.Create(Self, VarArrayOf([Null, IDEstimate]));
  try
    fCalcSetupIndex.ShowModal;
  finally
    FreeAndNil(fCalcSetupIndex);
    GetRSReport;
  end;
end;

procedure TfCalcResource.btnShowTemplateClick(Sender: TObject);
begin
  // dmSmReport.showDocument(ExcelApp);
  // �������������� ������� ������
  if (not Assigned(fSmReportEdit)) then
    fSmReportEdit := TfSmReportEdit.Create(Self, 1);
  fSmReportEdit.ShowModal;
  GetRSReport;
end;

function TfCalcResource.CanEditField(Field: TField): Boolean;
begin
  Result := False;

  if (pnlCalculationYesNo.Tag = 0) or (not flLoaded) or (not Editable) then
    Exit;

  case pgc.ActivePageIndex of
    // ������ ����������
    1:
      Result := (Field = qrMaterialData.FieldByName('COAST')) or
        (Field = qrMaterialData.FieldByName('PROC_TRANSP')) or
        (Field = qrMaterialData.FieldByName('MAT_PROC_ZAC')) or
        (Field = qrMaterialData.FieldByName('MAT_PROC_PODR')) or
        (Field = qrMaterialData.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrMaterialData.FieldByName('TRANSP_PROC_PODR')) or
        (Field = qrMaterialData.FieldByName('DOC_DATE')) or (Field = qrMaterialData.FieldByName('DOC_NUM')) or
        (Field = qrMaterialDetail.FieldByName('COAST')) or
        (Field = qrMaterialDetail.FieldByName('PROC_TRANSP')) or
        (Field = qrMaterialDetail.FieldByName('TRANSP')) or
        (Field = qrMaterialDetail.FieldByName('MAT_PROC_ZAC')) or
        (Field = qrMaterialDetail.FieldByName('MAT_PROC_PODR')) or
        (Field = qrMaterialDetail.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrMaterialDetail.FieldByName('TRANSP_PROC_PODR'));
    // ������ ����������
    2:
      Result := (Field = qrMechData.FieldByName('COAST')) or (Field = qrMechData.FieldByName('ZP_1')) or
        (Field = qrMechData.FieldByName('PROC_ZAC')) or (Field = qrMechData.FieldByName('PROC_PODR')) or
        (Field = qrMechDetail.FieldByName('COAST')) or (Field = qrMechDetail.FieldByName('ZP_MASH')) or
        (Field = qrMechDetail.FieldByName('PROC_ZAC')) or (Field = qrMechDetail.FieldByName('PROC_PODR'));
    // ������ ������������
    3:
      Result := (Field = qrDevices.FieldByName('COAST')) or
      { (Field = qrDevices.FieldByName('PROC_TRANSP')) or }
        (Field = qrDevices.FieldByName('TRANSP')) or (Field = qrDevices.FieldByName('DOC_DATE')) or
        (Field = qrDevices.FieldByName('DOC_NUM')) or (Field = qrDevices.FieldByName('PROC_ZAC')) or
        (Field = qrDevices.FieldByName('PROC_PODR')) or (Field = qrDevices.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrDevices.FieldByName('TRANSP_PROC_PODR')) or (Field = qrDevicesDetail.FieldByName('COAST'))
        or (Field = qrDevicesDetail.FieldByName('TRANSP')) or (Field = qrDevicesDetail.FieldByName('PROC_ZAC')
        ) or (Field = qrDevicesDetail.FieldByName('PROC_PODR')) or
        (Field = qrDevicesDetail.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrDevicesDetail.FieldByName('TRANSP_PROC_PODR'));
  end;

end;

procedure TfCalcResource.edtMechCodeFilterChange(Sender: TObject);
begin
  qrMechData.Filtered := False;
  qrMechData.Filter := 'Upper(CODE) LIKE ''%' + AnsiUpperCase(edtMechCodeFilter.Text) +
    '%'' AND Upper(NAME) LIKE ''%' + AnsiUpperCase(edtMechNameFilter.Text) + '%''';
  // + ' AND NDS=' + IntToStr(cbbMechNDS.ItemIndex); //��������, �������� ������� � ���
  qrMechData.Filtered := True;
  // CalcFooter;
end;

procedure TfCalcResource.edtMatCodeFilterChange(Sender: TObject);
begin
  qrMaterialData.Filtered := False;
  qrMaterialData.Filter := 'Upper(CODE) LIKE UPPER(''%' + edtMatCodeFilter.Text +
    '%'') AND Upper(NAME) LIKE UPPER(''%' + edtMatNameFilter.Text + '%'')';
  // + ' AND NDS=' + IntToStr(cbbMatNDS.ItemIndex); //��������, �������� ������� � ���
  qrMaterialData.Filtered := True;
  // CalcFooter;
end;

procedure TfCalcResource.edtMatCodeFilterClick(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

procedure TfCalcResource.FormActivate(Sender: TObject);
begin
  // ���� ������ ������� Ctrl � �������� �����, �� ������
  // �������������� � ��������� ���� ����� �� �������� ����
  FormMain.CascadeForActiveWindow;
  // ������ ������� ������ �������� ����� (�� ������� ����� �����)
  FormMain.SelectButtonActiveWindow('������ ��������� ��������');
end;

procedure TfCalcResource.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCalcResource.FormCreate(Sender: TObject);
begin
  inherited;
  FOldGridProc := grMaterial.WindowProc;
  grMaterial.WindowProc := GridProc;
  pgc.ActivePageIndex := 0;
end;

procedure TfCalcResource.FormDestroy(Sender: TObject);
begin
  // ������� ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.DeleteButtonCloseWindow('������ ��������� ��������');
  if Assigned(FOwnPointer) then
    Pointer(FOwnPointer^) := nil;
end;

procedure TfCalcResource.FormShow(Sender: TObject);
  procedure RangeRead(AFileName: string);
  var
    Rows, i: Integer;
    flSkipOther: Boolean;
    WorkSheet: OLEVariant;
    FData: Variant;
  begin
    ExcelApp := dmSmReport.loadDocument(AFileName);
    dmSmReport.qrSR.Active := False;
    dmSmReport.qrSR.ParamByName('SM_ID').Value := IDEstimate;
    dmSmReport.qrSR.Active := True;
    dmSmReport.loadParams(dmSmReport.qrSR, ExcelApp, 5);
    try
      // ���������� ������� ���������---------------------------------------------------------------
      WorkSheet := ExcelApp.ActiveWorkbook.Worksheets[1];
      // ���������� ���������� ����� � �������� �������
      Rows := WorkSheet.UsedRange.Rows.Count;
      // Cols := WorkSheet.UsedRange.Columns.Count;
      // ��������� ������ ����� ���������
      FData := WorkSheet.UsedRange.Value;
      mtRS.Active := True;
      mtRS.DisableControls;
      flSkipOther := False;
      // ������� ������ � �������
      for i := 7 to Rows - 1 do
      begin
        // try
        if flSkipOther then
        begin
          Break;
          // Continue;
        end;
        // ������� ������ �� ������, ������� �������� � ����������� L ���������
        // =1 ���
        // =2 � ��� ���� �������� �� ������ � �� 0
        if (FData[i + 1, 12] = '1') or ((FData[i + 1, 12] = '2') and (VarToStr(FData[i + 1, 8]) <> '0'))
        { and (FData[i + 1, 8] <> '') and
          (FData[i + 1, 8] <> '0')) } then
        begin
          mtRS.Append;
          mtRS.Fields[0].Value := IIF(FData[i + 1, 2] = '0', Null, FData[i + 1, 2]);
          mtRS.Fields[1].Value := IIF(FData[i + 1, 7] = '0', Null, FData[i + 1, 7]);
          mtRS.Fields[2].Value := IIF(FData[i + 1, 8] = '0', Null, FData[i + 1, 8]);
          mtRS.Fields[3].Value := IIF(FData[i + 1, 9] = '0', Null, FData[i + 1, 9]);
          mtRS.Fields[4].Value := IIF(FData[i + 1, 10] = '0', Null, FData[i + 1, 10]);
          mtRS.Fields[5].Value := IIF(FData[i + 1, 11] = '0', Null, FData[i + 1, 11]);
        end;
        // ������� ����� ���������, ������ ��� �������
        if Pos('BCE�O � O��ATE:', FData[i + 1, 2]) <> 0 then
          flSkipOther := True;
        // except

        // end;
      end;
      mtRS.First;
      mtRS.EnableControls;

      // ���������� ������� ���������������---------------------------------------------------------------
      WorkSheet := ExcelApp.ActiveWorkbook.Worksheets[2];
      // ��������� ������ ����� ���������
      FData := WorkSheet.UsedRange.Value;
      mtTravel.Active := True;
      mtTravel.DisableControls;
      // ������� ������ � �������
      for i := 6 to 23 do
      begin
        mtTravel.Append;
        mtTravel.Fields[0].Value := IIF(FData[i + 1, 1] = '0', Null, FData[i + 1, 1]);
        mtTravel.Fields[1].Value := IIF(FData[i + 1, 2] = '0', Null, FData[i + 1, 2]);
        mtTravel.Fields[2].Value := IIF(FData[i + 1, 7] = '0', Null, FData[i + 1, 7]);
        mtTravel.Fields[3].Value := IIF(FData[i + 1, 8] = '0', Null, FData[i + 1, 8]);
      end;
      mtTravel.First;
      mtTravel.EnableControls;

      // ���������� ������� �����������---------------------------------------------------------------
      WorkSheet := ExcelApp.ActiveWorkbook.Worksheets[3];
      // ��������� ������ ����� ���������
      FData := WorkSheet.UsedRange.Value;
      mtTravelWork.Active := True;
      mtTravelWork.DisableControls;
      // ������� ������ � �������
      for i := 6 to 15 do
      begin
        mtTravelWork.Append;
        mtTravelWork.Fields[0].Value := IIF(FData[i + 1, 1] = '0', Null, FData[i + 1, 1]);
        mtTravelWork.Fields[1].Value := IIF(FData[i + 1, 2] = '0', Null, FData[i + 1, 2]);
        mtTravelWork.Fields[2].Value := IIF(FData[i + 1, 7] = '0', Null, FData[i + 1, 7]);
        mtTravelWork.Fields[3].Value := IIF(FData[i + 1, 8] = '0', Null, FData[i + 1, 8]);
      end;
      mtTravelWork.First;
      mtTravelWork.EnableControls;

      // ���������� ������� ��������� ---------------------------------------------------------------
      WorkSheet := ExcelApp.ActiveWorkbook.Worksheets[4];
      // ��������� ������ ����� ���������
      FData := WorkSheet.UsedRange.Value;
      mtWorkerDepartment.Active := True;
      mtWorkerDepartment.DisableControls;
      // ������� ������ � �������
      for i := 6 to 36 do
      begin
        mtWorkerDepartment.Append;
        mtWorkerDepartment.Fields[0].Value := IIF(FData[i + 1, 1] = '0', Null, FData[i + 1, 1]);
        mtWorkerDepartment.Fields[1].Value := IIF(FData[i + 1, 2] = '0', Null, FData[i + 1, 2]);
        mtWorkerDepartment.Fields[2].Value := IIF(FData[i + 1, 7] = '0', Null, FData[i + 1, 7]);
        mtWorkerDepartment.Fields[3].Value := IIF(FData[i + 1, 8] = '0', Null, FData[i + 1, 8]);
      end;
      mtWorkerDepartment.First;
      mtWorkerDepartment.EnableControls;

      // ���������� ������� ���������� ---------------------------------------------------------------
      WorkSheet := ExcelApp.ActiveWorkbook.Worksheets[5];
      // ��������� ������ ����� ���������
      FData := WorkSheet.UsedRange.Value;
      mtVars.Active := True;
      mtVars.DisableControls;
      // ������� ������ � �������
      for i := 1 to 30 do
      begin
        mtVars.Append;
        mtVars.Fields[0].Value := IIF(FData[i + 1, 1] = '0', Null, FData[i + 1, 1]);
        mtVars.Fields[1].Value := IIF(FData[i + 1, 2] = '0', Null, FData[i + 1, 2]);
        mtVars.Fields[2].Value := IIF(FData[i + 1, 3] = '0', Null, FData[i + 1, 3]);
      end;
      mtVars.First;
      mtVars.EnableControls;
    finally
      WorkSheet := Unassigned;
    end;
  end;

{ var
  fileName: string; }
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      begin
        {
          try
          FormWaiting.Show;
          Application.ProcessMessages;
          fileName := ExtractFilePath(Application.ExeName) + C_REPORTDIR + '������ ������.xls';
          if not FileExists(fileName) then
          begin
          Application.MessageBox(PChar('�� ������ ���� ������!'#13 + fileName), 'C������ ������',
          MB_OK + MB_ICONSTOP + MB_TOPMOST);
          Exit;
          end;
          // dmSmReport.test(fileName, IDEstimate);
          RangeRead(fileName); // ���������� ���������� � �������� ������� ���������
          finally
          FormWaiting.Close;
          pgc.SetFocus;
          end;
        }
        GetRSReport;
      end;
    // ������ ����������
    1:
      begin
        DoSort(qrMaterialData, grMaterial);
      end;
    // ������ ����������
    2:
      begin
        DoSort(qrMechData, grMech);
      end;
    // ������ ������������
    3:
      begin
        DoSort(qrDevices, grDev);
      end;
    // ������ �\�
    4:
      begin
        DoSort(qrRates, grRates);
      end;
  end;
end;

procedure TfCalcResource.GetRSReport;
var
  pOldForm: TfSmReportPreview;
begin
  pOldForm := fRS;
  fRS := ShowReport(1, VarArrayOf([VarArrayOf(['SM_ID', IIF(ShowFullObject, Null, IDEstimate)]),
    VarArrayOf(['OBJ_ID', FastSelectSQLOne('SELECT OBJ_ID FROM smetasourcedata WHERE SM_ID=:0',
    VarArrayOf([IDEstimate]))])]), ts6);
  if Assigned(pOldForm) then
    FreeAndNil(pOldForm);
end;

procedure TfCalcResource.grDevBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grDevColExit(Sender: TObject);
begin
  if PS.AutoSaveCalcResourcesAfterExitCell and ((Sender as TJvDBGrid).DataSource.DataSet.State
    in [dsEdit, dsInsert]) then
    (Sender as TJvDBGrid).DataSource.DataSet.CheckBrowseMode;
end;

procedure TfCalcResource.grDevDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if qrDevices.FieldByName('DELETED').AsInteger = 1 then
    grDev.Canvas.Font.Style := grDev.Canvas.Font.Style + [fsStrikeOut];

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMaterialBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if (qrMaterialDetail.FieldByName('FCOAST').AsInteger = 1) and (Column.FieldName = 'COAST') then
    grMaterialBott.Canvas.Font.Style := grMaterialBott.Canvas.Font.Style + [fsItalic];

  if qrMaterialDetail.FieldByName('DELETED').AsInteger = 1 then
    grMaterialBott.Canvas.Font.Style := grMaterialBott.Canvas.Font.Style + [fsStrikeOut];

  if qrMaterialDetail.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMaterialBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMaterialBott.Canvas.Font.Color := clNavy;
  end;

  if qrMaterialDetail.FieldByName('ID_REPLACED').AsInteger <> 0 then
  begin
    grMaterialBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMaterialBott.Canvas.Font.Color := clNavy;
  end;
  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  grMaterialBott.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMaterialCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := CanEditField(Field);
end;

procedure TfCalcResource.grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if (qrMaterialData.FieldByName('FCOAST').AsInteger = 1) and (Column.FieldName = 'COAST') then
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];

  if qrMaterialData.FieldByName('DELETED').AsInteger = 1 then
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut];

  if qrMaterialData.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMaterial.Canvas.Font.Color := clNavy;
  end;

  if qrMaterialData.FieldByName('FREPLACED').AsInteger <> 0 then
  begin
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMaterial.Canvas.Font.Color := clNavy;
  end;

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMaterialExit(Sender: TObject);
begin
  (Sender as TJvDBGrid).DataSource.DataSet.CheckBrowseMode;
end;

procedure TfCalcResource.grMaterialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if not(Sender AS TJvDBGrid).EditorMode and
          ((Sender AS TJvDBGrid).DataSource.DataSet.State in [dsEdit, dsInsert]) then
          (Sender AS TJvDBGrid).DataSource.DataSet.CheckBrowseMode;
      end;
  end;
end;

procedure TfCalcResource.GridProc(var Message: TMessage);
begin
  // // ������ ��������� �������
  // case Message.Msg of
  // WM_MOUSEWHEEL:
  // begin
  // Message.Result := 0;
  // Exit;
  // end;
  // end;
  // FOldGridProc(Message);

  // ��� ����� ��������� ������� � �������������
  case Message.Msg of
    WM_MOUSEWHEEL:
      with TWMMouseWheel(Message) do
      begin
        grMaterial.DataSource.DataSet.DisableControls;
        try
          if grMaterial.DataSource.DataSet.Active then
            grMaterial.DataSource.DataSet.MoveBy(-WheelDelta div 120);
          with grMaterial.SelectedRows do
          begin
            if Count < 2 then
            begin
              Clear;
              CurrentRowSelected := True;
            end;
          end;
          Message.Result := 0;
          Exit;
        finally
          grMaterial.DataSource.DataSet.EnableControls;
        end;
      end;
  end;
  FOldGridProc(Message);
end;

procedure TfCalcResource.grMechBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if qrMechDetail.FieldByName('DELETED').AsInteger = 1 then
    grMechBott.Canvas.Font.Style := grMechBott.Canvas.Font.Style + [fsStrikeOut];

  if qrMechDetail.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMechBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMechBott.Canvas.Font.Color := clNavy;
  end;

  if qrMechDetail.FieldByName('ID_REPLACED').AsInteger <> 0 then
  begin
    grMechBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMechBott.Canvas.Font.Color := clNavy;
  end;

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMechDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if qrMechData.FieldByName('DELETED').AsInteger = 1 then
    grMech.Canvas.Font.Style := grMech.Canvas.Font.Style + [fsStrikeOut];

  if qrMechData.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMech.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMech.Canvas.Font.Color := clNavy;
  end;

  if qrMechData.FieldByName('FREPLACED').AsInteger <> 0 then
  begin
    grMech.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMech.Canvas.Font.Color := clNavy;
  end;
  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grRatesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // ������ � ������
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // ������ � ������
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  if qrRates.FieldByName('DELETED').AsInteger = 1 then
    grRates.Canvas.Font.Style := grRates.Canvas.Font.Style + [fsStrikeOut];
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
  var CalcValue: Variant);
begin
  try
    if not CheckQrActiveEmpty(Sender.DataSource.DataSet) then
      Exit;
  except

  end;
  if VarIsArray(Footer) then
    CalcValue := Footer[Sender.DataSource.DataSet.FieldByName(FieldName).Index];
end;

procedure TfCalcResource.mDeteteClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin
        // ���� �������� ����������
        if (qrMaterialData.FieldByName('FREPLACED').AsInteger <> 0) and (not(qrMaterialData.State in [dsEdit]))
        then
        begin
          if MessageBox(0, PChar('�� ������������� ������ ������� ' + strngfldMaterialDataCODE.AsString +
            '?'), Pwidechar(Caption), MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) <> mrYes then
            Exit;
          DM.qrDifferent.SQL.Text := 'SELECT ID FROM materialcard_temp'#13 +
            'WHERE PROC_TRANSP=:PROC_TRANSP AND DELETED=:DELETED AND VOZVRAT=0 /*�� ��������� ���������� ���������*/'#13
            + 'AND MAT_PROC_ZAC=:MAT_PROC_ZAC AND MAT_PROC_PODR=:MAT_PROC_PODR'#13 +
            'AND TRANSP_PROC_ZAC=:TRANSP_PROC_ZAC AND TRANSP_PROC_PODR=:TRANSP_PROC_PODR'#13 +
            'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:COAST AND MAT_ID=:MAT_ID';
          DM.qrDifferent.ParamByName('PROC_TRANSP').Value := qrMaterialData.FieldByName('PROC_TRANSP').Value;
          DM.qrDifferent.ParamByName('DELETED').Value := qrMaterialData.FieldByName('DELETED').Value;
          DM.qrDifferent.ParamByName('MAT_PROC_ZAC').Value :=
            qrMaterialData.FieldByName('MAT_PROC_ZAC').Value;
          DM.qrDifferent.ParamByName('MAT_PROC_PODR').Value :=
            qrMaterialData.FieldByName('MAT_PROC_PODR').Value;
          DM.qrDifferent.ParamByName('TRANSP_PROC_ZAC').Value :=
            qrMaterialData.FieldByName('TRANSP_PROC_ZAC').Value;
          DM.qrDifferent.ParamByName('TRANSP_PROC_PODR').Value :=
            qrMaterialData.FieldByName('TRANSP_PROC_PODR').Value;
          DM.qrDifferent.ParamByName('NDS').Value := cbbNDS.ItemIndex;
          DM.qrDifferent.ParamByName('COAST').Value := qrMaterialData.FieldByName('COAST').Value;
          DM.qrDifferent.ParamByName('MAT_ID').Value := qrMaterialData.FieldByName('MAT_ID').Value;
          DM.qrDifferent.Active := True;
          while not DM.qrDifferent.Eof do
          begin
            FastExecSQL('CALL DeleteMaterial(:id, :CalcMode);',
              VarArrayOf([DM.qrDifferent.FieldByName('ID').Value, G_CALCMODE]));
            DM.qrDifferent.Next;
          end;
          FormCalculationEstimate.RecalcEstimate;
          CloseOpen(qrMaterialData);
        end
        else
        begin
          if not(qrMaterialData.State in [dsEdit]) then
            qrMaterialData.Edit;
          qrMaterialData.FieldByName('DELETED').Value := 1;
        end;
      end;
    // ������ ����������
    2:
      begin
        // ���� �������� ����������
        if (qrMechData.FieldByName('FREPLACED').AsInteger <> 0) and (not(qrMechData.State in [dsEdit])) then
        begin
          if MessageBox(0, PChar('�� ������������� ������ ������� ' + strngfldMechDataCODE.AsString + '?'),
            Pwidechar(Caption), MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) <> mrYes then
            Exit;
          DM.qrDifferent.SQL.Text := 'SELECT ID FROM mechanizmcard_temp'#13 +
            'WHERE DELETED=:DELETED AND PROC_ZAC=:PROC_ZAC AND PROC_PODR=:PROC_PODR'#13 +
            'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:COAST AND MECH_ID=:MECH_ID'#13
            + 'AND IF(:NDS=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:ZP_1';
          DM.qrDifferent.ParamByName('DELETED').Value := qrMechData.FieldByName('DELETED').Value;
          DM.qrDifferent.ParamByName('PROC_ZAC').Value := qrMechData.FieldByName('PROC_ZAC').Value;
          DM.qrDifferent.ParamByName('PROC_PODR').Value := qrMechData.FieldByName('PROC_PODR').Value;
          DM.qrDifferent.ParamByName('NDS').Value := cbbNDS.ItemIndex;
          DM.qrDifferent.ParamByName('COAST').Value := qrMechData.FieldByName('COAST').Value;
          DM.qrDifferent.ParamByName('MECH_ID').Value := qrMechData.FieldByName('MECH_ID').Value;
          DM.qrDifferent.ParamByName('ZP_1').Value := qrMechData.FieldByName('ZP_1').Value;
          DM.qrDifferent.Active := True;
          while not DM.qrDifferent.Eof do
          begin
            FastExecSQL('CALL DeleteMechanism(:id, :CalcMode);',
              VarArrayOf([DM.qrDifferent.FieldByName('ID').Value, G_CALCMODE]));
            DM.qrDifferent.Next;
          end;
          FormCalculationEstimate.RecalcEstimate;
          CloseOpen(qrMechData);
        end
        else
        begin
          if not(qrMechData.State in [dsEdit]) then
            qrMechData.Edit;
          qrMechData.FieldByName('DELETED').Value := 1;
        end;
      end;
    // ������ ������������
    3:
      begin
        if not(qrDevices.State in [dsEdit]) then
          qrDevices.Edit;
        qrDevices.FieldByName('DELETED').Value := 1;
      end;

    // ������ �\�
    4:
      begin
        if not(qrRates.State in [dsEdit]) then
          qrRates.Edit;
        qrRates.FieldByName('DELETED').Value := 1;
      end;
  end;
end;

procedure TfCalcResource.mN12Click(Sender: TObject);
var
  fTrPersSelect: TfTrPersSelect;
  TransPr: Double;
  MatCode: string;
  UpdateStr: string;
  SelType: byte;
  WhereStr: string;
  TempBookmark: TBookMark;
  X: Integer;
  Script: TStringList;
begin
  SelType := 0;

  if (Sender as TComponent).Tag in [1, 2, 3] then
  begin
    fTrPersSelect := TfTrPersSelect.Create(nil);
    try
      if fTrPersSelect.ShowModal = mrOk then
      begin
        SelType := fTrPersSelect.SelectType;
        TransPr := fTrPersSelect.TranspPers;
        MatCode := fTrPersSelect.MatCode;
      end
      else
        Exit;
    finally
      FreeAndNil(fTrPersSelect);
    end;
  end;

  Script := TStringList.Create;
  grMaterial.DataSource.DataSet.DisableControls;
  qrMaterialDetail.DisableControls;
  TempBookmark := grMaterial.DataSource.DataSet.GetBookmark;
  try
    if grMaterial.SelectedRows.Count = 0 then
      grMaterial.SelectedRows.CurrentRowSelected := True;

    for X := 0 to grMaterial.SelectedRows.Count - 1 do
    begin
      if grMaterial.SelectedRows.IndexOf(grMaterial.SelectedRows.Items[X]) > -1 then
      begin
        // grMaterial.DataSource.DataSet.Bookmark := grMaterial.SelectedRows.Items[X];
        grMaterial.DataSource.DataSet.GotoBookmark(Pointer(grMaterial.SelectedRows.Items[X]));
        qrMaterialDetail.Active := False;
        qrMaterialDetail.Active := True;
        qrMaterialDetail.First;
        while not qrMaterialDetail.Eof do
        begin

          if (Sender as TComponent).Tag in [1, 2, 3] then
          begin
            case SelType of
              1:
                UpdateStr := 'PROC_TRANSP = GetTranspPers(' + qrMaterialDetail.FieldByName('PTM_ID').AsString
                  + ', ''' + MatCode + ''')';
              2:
                UpdateStr := 'PROC_TRANSP = ' + TransPr.ToString;
            end;
            if (Sender as TComponent).Tag = 1 then
              WhereStr := ' and (MAT_CODE like ''�103%'')';
            if (Sender as TComponent).Tag = 2 then
              WhereStr := ' and ((MAT_CODE like ''�530%'') or ' +
                '(MAT_CODE like ''�533%'') or (MAT_CODE like ''�534%''))';
          end
          else
            UpdateStr := 'PROC_TRANSP = GetTranspPers(' + qrMaterialDetail.FieldByName('PTM_ID').AsString +
              ', MAT_CODE)';

          Script.Add('UPDATE materialcard_temp set ' + UpdateStr + ' WHERE ID=' +
            qrMaterialDetail.FieldByName('ID').AsString + WhereStr + ';');

          qrMaterialDetail.Next;
        end;

      end;
    end;
    fdScript.ExecuteScript(TStrings(Script));
  finally
    grMaterial.DataSource.DataSet.GotoBookmark(TempBookmark);
    grMaterial.DataSource.DataSet.FreeBookmark(TempBookmark);
    grMaterial.DataSource.DataSet.EnableControls;
    qrMaterialDetail.EnableControls;
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end;
end;

procedure TfCalcResource.mEditClick(Sender: TObject);
var
  TempBookmark: TBookMark;
  X: Integer;
  Script: TStringList;
  fCalcResourceEdit: TfCalcResourceEdit;
begin
  fCalcResourceEdit := TfCalcResourceEdit.Create(Self, pgc.ActivePageIndex);
  try
    if fCalcResourceEdit.ShowModal = mrOk then
    begin
      Script := TStringList.Create;
      case pgc.ActivePageIndex of

        // ������ ����������
        1:
          begin
            grMaterial.DataSource.DataSet.DisableControls;
            qrMaterialDetail.DisableControls;
            TempBookmark := grMaterial.DataSource.DataSet.GetBookmark;
            try
              if grMaterial.SelectedRows.Count = 0 then
                grMaterial.SelectedRows.CurrentRowSelected := True;

              for X := 0 to grMaterial.SelectedRows.Count - 1 do
              begin
                if grMaterial.SelectedRows.IndexOf(grMaterial.SelectedRows.Items[X]) > -1 then
                begin
                  grMaterial.DataSource.DataSet.GotoBookmark(Pointer(grMaterial.SelectedRows.Items[X]));
                  qrMaterialDetail.Active := False;
                  qrMaterialDetail.Active := True;
                  qrMaterialDetail.First;
                  while not qrMaterialDetail.Eof do
                  begin
                    Script.Add('UPDATE materialcard_temp set ID=ID' + IIF(fCalcResourceEdit.chkMatCoast.Checked,
                      ',FCOAST_NO_NDS=' + fCalcResourceEdit.edtMatCoast.Text + ',FCOAST_NDS=FCOAST_NO_NDS', '')
                      + IIF(fCalcResourceEdit.chkMatTransp.Checked,
                      ',PROC_TRANSP=' + fCalcResourceEdit.edtMatTransp.Text, '') +
                      IIF(fCalcResourceEdit.chkMatNaklDate.Checked,
                      ',DOC_DATE=''' + FormatDateTime('yyyy-mm-dd', fCalcResourceEdit.dtpMatNaklDate.Date) +
                      '''', '') + IIF(fCalcResourceEdit.chkMatNakl.Checked,
                      ',DOC_NUM=''' + fCalcResourceEdit.edtMatNakl.Text + '''', '') +
                      IIF(fCalcResourceEdit.chkMatZakPodr.Checked,
                      ',MAT_PROC_PODR=' + fCalcResourceEdit.edtMatPodr.Text + ',MAT_PROC_ZAC=' +
                      fCalcResourceEdit.edtMatZak.Text, '') + IIF(fCalcResourceEdit.chkMatTranspZakPodr.Checked,
                      ',TRANSP_PROC_PODR=' + fCalcResourceEdit.edtMatTranspPodr.Text + ',TRANSP_PROC_ZAC=' +
                      fCalcResourceEdit.edtMatTranspZak.Text, '') + ' WHERE ID=' +
                      qrMaterialDetail.FieldByName('ID').AsString + ';');

                    qrMaterialDetail.Next;
                  end;
                end;
              end;
              fdScript.ExecuteScript(TStrings(Script));
            finally
              grMaterial.DataSource.DataSet.GotoBookmark(TempBookmark);
              grMaterial.DataSource.DataSet.FreeBookmark(TempBookmark);
              grMaterial.DataSource.DataSet.EnableControls;
              qrMaterialDetail.EnableControls;
              FormCalculationEstimate.RecalcEstimate;
              pgcChange(nil);
            end;
          end;

        // ������ ����������
        2:
          begin
            grMech.DataSource.DataSet.DisableControls;
            qrMechDetail.DisableControls;
            TempBookmark := grMech.DataSource.DataSet.GetBookmark;
            try
              if grMech.SelectedRows.Count = 0 then
                grMech.SelectedRows.CurrentRowSelected := True;

              for X := 0 to grMech.SelectedRows.Count - 1 do
              begin
                if grMech.SelectedRows.IndexOf(grMech.SelectedRows.Items[X]) > -1 then
                begin
                  grMech.DataSource.DataSet.GotoBookmark(Pointer(grMech.SelectedRows.Items[X]));
                  qrMechDetail.Active := False;
                  qrMechDetail.Active := True;
                  qrMechDetail.First;
                  while not qrMechDetail.Eof do
                  begin
                    Script.Add('UPDATE mechanizmcard_temp set ID=ID' +
                      IIF(fCalcResourceEdit.chkMechCoast.Checked,
                      ',FCOAST_NO_NDS=' + fCalcResourceEdit.edtMechCoast.Text + ',FCOAST_NDS=FCOAST_NO_NDS', '')
                      + IIF(fCalcResourceEdit.chkMechZPMash.Checked,
                      ',FZP_MACH_NO_NDS=' + fCalcResourceEdit.edtMechZPMash.Text +
                      ',FZP_MACH_NDS=FZP_MACH_NO_NDS', '') + IIF(fCalcResourceEdit.chkMechNaklDate.Checked,
                      ',DOC_DATE=''' + FormatDateTime('yyyy-mm-dd', fCalcResourceEdit.dtpMechNaklDate.Date) +
                      '''', '') + IIF(fCalcResourceEdit.chkMechNakl.Checked,
                      ',DOC_NUM=''' + fCalcResourceEdit.edtMechNakl.Text + '''', '') +
                      IIF(fCalcResourceEdit.chkMechZakPodr.Checked,
                      ',PROC_PODR=' + fCalcResourceEdit.edtMechPodr.Text + ',PROC_ZAC=' +
                      fCalcResourceEdit.edtMechZak.Text, '') + ' WHERE ID=' + qrMechDetail.FieldByName('ID')
                      .AsString + ';');

                    qrMechDetail.Next;
                  end;
                end;
              end;
              fdScript.ExecuteScript(TStrings(Script));
            finally
              grMech.DataSource.DataSet.GotoBookmark(TempBookmark);
              grMech.DataSource.DataSet.FreeBookmark(TempBookmark);
              grMech.DataSource.DataSet.EnableControls;
              qrMechDetail.EnableControls;
              FormCalculationEstimate.RecalcEstimate;
              pgcChange(nil);
            end;
          end;

        // ������ ������������
        3:
          begin
            grDev.DataSource.DataSet.DisableControls;
            qrDevicesDetail.DisableControls;
            TempBookmark := grDev.DataSource.DataSet.GetBookmark;
            try
              if grDev.SelectedRows.Count = 0 then
                grDev.SelectedRows.CurrentRowSelected := True;

              for X := 0 to grDev.SelectedRows.Count - 1 do
              begin
                if grDev.SelectedRows.IndexOf(grDev.SelectedRows.Items[X]) > -1 then
                begin
                  grDev.DataSource.DataSet.GotoBookmark(Pointer(grDev.SelectedRows.Items[X]));
                  qrDevicesDetail.Active := False;
                  qrDevicesDetail.Active := True;
                  qrDevicesDetail.First;
                  while not qrDevicesDetail.Eof do
                  begin
                    Script.Add('UPDATE devicescard_temp set ID=ID' + IIF(fCalcResourceEdit.chkDevCoast.Checked,
                      ',FCOAST_NO_NDS=' + fCalcResourceEdit.edtDevCoast.Text + ',FCOAST_NDS=FCOAST_NO_NDS', '')
                      + IIF(fCalcResourceEdit.chkDevTransp.Checked,
                      ',DEVICE_TRANSP_NO_NDS=' + fCalcResourceEdit.edtDevTransp.Text +
                      ', DEVICE_TRANSP_NDS=DEVICE_TRANSP_NO_NDS', '') +
                      IIF(fCalcResourceEdit.chkDevNaklDate.Checked,
                      ',DOC_DATE=''' + FormatDateTime('yyyy-mm-dd', fCalcResourceEdit.dtpDevNaklDate.Date) +
                      '''', '') + IIF(fCalcResourceEdit.chkDevNakl.Checked,
                      ',DOC_NUM=''' + fCalcResourceEdit.edtDevNakl.Text + '''', '') +
                      IIF(fCalcResourceEdit.chkDevZakPodr.Checked,
                      ',PROC_PODR=' + fCalcResourceEdit.edtDevPodr.Text + ',PROC_ZAC=' +
                      fCalcResourceEdit.edtDevZak.Text, '') + IIF(fCalcResourceEdit.chkDevTranspZakPodr.Checked,
                      ',TRANSP_PROC_PODR=' + fCalcResourceEdit.edtDevTranspPodr.Text + ',TRANSP_PROC_ZAC=' +
                      fCalcResourceEdit.edtDevTranspZak.Text, '') + ' WHERE ID=' +
                      qrDevicesDetail.FieldByName('ID').AsString + ';');

                    qrDevicesDetail.Next;
                  end;
                end;
              end;
              fdScript.ExecuteScript(TStrings(Script));
            finally
              grDev.DataSource.DataSet.GotoBookmark(TempBookmark);
              grDev.DataSource.DataSet.FreeBookmark(TempBookmark);
              grDev.DataSource.DataSet.EnableControls;
              qrDevicesDetail.EnableControls;
              FormCalculationEstimate.RecalcEstimate;
              pgcChange(nil);
            end;
          end;
      end;
    end;
  finally
    FreeAndNil(fCalcResourceEdit);
  end;
end;

procedure TfCalcResource.mRestoreValuesClick(Sender: TObject);
begin
  if Application.MessageBox('������������ �������� �������� ������?', '������ ��������� ��������',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    case pgc.ActivePageIndex of
      // ������ ����������
      1:
        begin
          qrMaterialData.Edit;
          qrMaterialData.FieldByName('COAST').Value := 0;
          PMTrPerc0Click(mN11);
          qrMaterialData.Post;
        end;
      // ������ ����������
      2:
        begin
          qrMechData.Edit;
          qrMechDataCOAST.Value := 0;
          qrMechDataZP_1.Value := 0;
          qrMechData.Post;
        end;
      // ������ ������������
      3:
        begin

        end;
    end;

  end;

end;

procedure TfCalcResource.mReplaceClick(Sender: TObject);
var
  frmReplace: TfrmReplacement;
begin
  { grMaterial.Options := grMaterial.Options - [dgMultiSelect];
    grMaterialBott.Options := grMaterialBott.Options - [dgMultiSelect];
    grMech.Options := grMaterial.Options - [dgMultiSelect];
    grMechBott.Options := grMechBott.Options - [dgMultiSelect]; }
  case pgc.ActivePageIndex of
    1:
      frmReplace := TfrmReplacement.Create( { IDEstimate } 0, 0, 0, qrMaterialData.FieldByName('MAT_ID')
        .AsInteger, 2, False, False);
    2:
      frmReplace := TfrmReplacement.Create( { IDEstimate } 0, 0, 0, qrMechData.FieldByName('MECH_ID')
        .AsInteger, 3, False, False);
    3:
      frmReplace := TfrmReplacement.Create( { IDEstimate } 0, 0, 0, qrDevices.FieldByName('DEVICE_ID')
        .AsInteger, 4, False, False);
  end;
  if Assigned(frmReplace) then
    try
      if (frmReplace.ShowModal = mrYes) then
      begin
        // �������� ����� ������
        FormCalculationEstimate.RecalcEstimate;
        pgcChange(nil);
      end;
    finally
      FreeAndNil(frmReplace);
    end;
  { grMaterial.Options := grMaterial.Options + [dgMultiSelect];
    grMaterialBott.Options := grMaterialBott.Options + [dgMultiSelect];
    grMech.Options := grMaterial.Options + [dgMultiSelect];
    grMechBott.Options := grMechBott.Options + [dgMultiSelect]; }
end;

procedure TfCalcResource.mRestoreClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin
        if not(qrMaterialData.State in [dsEdit]) then
          qrMaterialData.Edit;
        qrMaterialData.FieldByName('DELETED').Value := 0;
      end;
    // ������ ����������
    2:
      begin
        if not(qrMechData.State in [dsEdit]) then
          qrMechData.Edit;
        qrMechData.FieldByName('DELETED').Value := 0;
      end;
    // ������ ������������
    3:
      begin
        if not(qrDevices.State in [dsEdit]) then
          qrDevices.Edit;
        qrDevices.FieldByName('DELETED').Value := 0;
      end;

    // ������ �\�
    4:
      begin
        if not(qrRates.State in [dsEdit]) then
          qrRates.Edit;
        qrRates.FieldByName('DELETED').Value := 0;
      end;
  end;
end;

procedure TfCalcResource.N1Click(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin

      end;
    // ������ ����������
    2:
      begin

      end;
    // ������ ������������
    3:
      begin

      end;
    // ������ �\�
    4:
      begin

      end;
  end;
end;

procedure TfCalcResource.N2Click(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin
        grMaterial.SelectAll;
      end;
    // ������ ����������
    2:
      begin
        grMech.SelectAll;
      end;
    // ������ ������������
    3:
      begin
        grDev.SelectAll;
      end;
    // ������ �\�
    4:
      begin
        grRates.SelectAll;
      end;
  end;
end;

procedure TfCalcResource.pgcChange(Sender: TObject);
begin
  pnlTop2.Visible := (pgc.ActivePageIndex = 0) and (Parent = FormCalculationEstimate);

  if not flLoaded then
    Exit;

  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      begin
        // pgcRS.ActivePageIndex := 0;
      end;
    // ������ ����������
    1:
      begin
        CloseOpen(qrMaterialData);
        if not qrMaterialDetail.Active then
          CloseOpen(qrMaterialDetail);
      end;
    // ������ ����������
    2:
      begin
        CloseOpen(qrMechData);
        if not qrMechDetail.Active then
          CloseOpen(qrMechDetail);
      end;
    // ������ ������������
    3:
      begin
        CloseOpen(qrDevices);
        if not qrDevicesDetail.Active then
          CloseOpen(qrDevicesDetail);
      end;
    // ������ �\�
    4:
      begin
        CloseOpen(qrRates);
      end;
  end;
end;

procedure TfCalcResource.pgcRSChange(Sender: TObject);
begin
  case pgcRS.ActivePageIndex of
    0:
      begin
        // ��������� ������ �����
        GetRSReport;
      end;
    // ������ ���������������
    1:
      begin
        // ������� ����� ������� ���������������
        if (not Assigned(fCalcTravel)) then
        begin
          fCalcTravel := TfCalcTravel.Create(tsTravel, VarArrayOf([OBJ_ID, Null]));
          fCalcTravel.BorderStyle := bsNone;
          fCalcTravel.Parent := tsTravel;
          fCalcTravel.Align := alClient;
          fCalcTravel.Show;
        end;
      end;
    // ����������
    2:
      begin
        if (not Assigned(fCalcTravelWork)) then
        begin
          fCalcTravelWork := TfCalcTravelWork.Create(tsTravelWork, VarArrayOf([OBJ_ID, Null]));
          fCalcTravelWork.BorderStyle := bsNone;
          fCalcTravelWork.Parent := tsTravelWork;
          fCalcTravelWork.Align := alClient;
          fCalcTravelWork.Show;
        end;
      end;
    // ���������
    3:
      begin
        if (not Assigned(fCalcWorkerDepartment)) then
        begin
          fCalcWorkerDepartment := TfCalcWorkerDepartment.Create(ts9, VarArrayOf([OBJ_ID, Null]));
          fCalcWorkerDepartment.BorderStyle := bsNone;
          fCalcWorkerDepartment.Parent := ts9;
          fCalcWorkerDepartment.Align := alClient;
          fCalcWorkerDepartment.Show;
        end;
      end;
  end;
end;

procedure TfCalcResource.pmPopup(Sender: TObject);
begin

  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin
        mDetete.Visible := (qrMaterialData.FieldByName('DELETED').AsInteger = 0) and Editable;
        mRestore.Visible := (qrMaterialData.FieldByName('DELETED').AsInteger = 1) and Editable;
        mReplace.Visible := True and Editable;
        mPROC_TRANSP.Visible := True and Editable;
        mRestoreValues.Visible := True and Editable;
        // grMaterial.SelectedRows.CurrentRowSelected := True;
        mEdit.Visible := CheckQrActiveEmpty(qrMaterialData) and Editable;
      end;
    // ������ ����������
    2:
      begin
        mDetete.Visible := (qrMechData.FieldByName('DELETED').AsInteger = 0) and Editable;
        mRestore.Visible := (qrMechData.FieldByName('DELETED').AsInteger = 1) and Editable;
        mReplace.Visible := True and Editable;
        mRestoreValues.Visible := True and Editable;
        mPROC_TRANSP.Visible := False and Editable;
        mEdit.Visible := CheckQrActiveEmpty(qrMechData) and Editable;
      end;
    // ������ ������������
    3:
      begin
        mDetete.Visible := (qrDevices.FieldByName('DELETED').AsInteger = 0) and Editable;
        mRestore.Visible := (qrDevices.FieldByName('DELETED').AsInteger = 1) and Editable;
        mReplace.Visible := True and Editable;
        mRestoreValues.Visible := True and Editable;
        mPROC_TRANSP.Visible := False and Editable;
        mEdit.Visible := CheckQrActiveEmpty(qrDevices) and Editable;
      end;
    // ������ �\�
    4:
      begin
        mDetete.Visible := (qrRates.FieldByName('DELETED').AsInteger = 0) and Editable;
        mRestore.Visible := (qrRates.FieldByName('DELETED').AsInteger = 1) and Editable;
        mReplace.Visible := False and Editable;
        mRestoreValues.Visible := True and Editable;
        mPROC_TRANSP.Visible := False and Editable;
        mEdit.Visible := False and Editable;
      end;
  end;

end;

procedure TfCalcResource.pnlCalculationYesNoClick(Sender: TObject);
begin
  with pnlCalculationYesNo do
    if Tag = 1 then
    begin
      Tag := 0;
      Color := clRed;
      Caption := '������� ���������';
      Self.Caption := '������ ��������� �������� [�������������� ���������]';
    end
    else
    begin
      Tag := 1;
      Color := clLime;
      Caption := '������� ���������';
      Self.Caption := '������ ��������� �������� [�������������� ���������]';
    end;

  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin
        grMaterial.Repaint;
        grMaterialBott.Repaint;
      end;
    // ������ ����������
    2:
      begin
        grMech.Repaint;
        grMechBott.Repaint;
      end;
    // ������ ������������
    3:
      begin
        grDev.Repaint;
        grDevBott.Repaint;
      end;
    // ������ �\�
    4:
      begin
        grRates.Repaint;
      end;
  end;
end;

procedure TfCalcResource.qrDevicesBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('��������� ���������?', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES)
  { and (Application.MessageBox('�� �������, ��� ������ ��������� ���������?'#13 +
    '(����� ����������� ������ �� ���� ��������� ���������)', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) } then
  begin
    with qrDevices do
    begin
      // ����
      case cbbNDS.ItemIndex of
        // ���� � ������ ��� ���
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:01, FCOAST_NDS=FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100),'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NO_NDS=:02, DEVICE_TRANSP_NDS=DEVICE_TRANSP_NO_NDS+(DEVICE_TRANSP_NO_NDS*NDS/100),'#13;
          end;
        // � ���
        1:
          begin
            priceQ := 'FCOAST_NDS=:01, FCOAST_NO_NDS=FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS),'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NDS=:02, DEVICE_TRANSP_NO_NDS=DEVICE_TRANSP_NDS-(DEVICE_TRANSP_NDS/(100+NDS)*NDS),'#13;
          end;
      end;

      FastExecSQL('UPDATE devicescard_temp SET'#13 + priceQ1 + priceQ +
        'TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2,'#13 + 'PROC_PODR=:3, PROC_ZAC=:4,'#13 +
        'DOC_DATE=:5,DOC_NUM=:6'#13 + 'WHERE '#13 + 'PROC_ZAC=:11 AND PROC_PODR=:12'#13 +
        'AND TRANSP_PROC_ZAC=:13 AND TRANSP_PROC_PODR=:14'#13 +
        'AND IF(:NDS=1, FCOAST_NDS, FCOAST_NO_NDS)=:15 AND DEVICE_ID=:16'#13 +
        'AND IF(:NDS1=1, DEVICE_TRANSP_NDS, DEVICE_TRANSP_NO_NDS)=:17 AND IFNULL(DOC_DATE, 0)=IFNULL(:18, 0) AND IFNULL(DOC_NUM, "")=:19',
        VarArrayOf([FieldByName('TRANSP').AsFloat, FieldByName('COAST').AsFloat,
        FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value, FieldByName('DOC_DATE').Value,
        FieldByName('DOC_NUM').AsString, FieldByName('PROC_ZAC').OldValue, FieldByName('PROC_PODR').OldValue,
        FieldByName('TRANSP_PROC_ZAC').OldValue, FieldByName('TRANSP_PROC_PODR').OldValue, cbbNDS.ItemIndex,
        FieldByName('COAST').OldValue, FieldByName('DEVICE_ID').Value, cbbNDS.ItemIndex,
        FieldByName('TRANSP').OldValue, FieldByName('DOC_DATE').OldValue,
        VarToStrDef(FieldByName('DOC_NUM').OldValue, '')]));
    end;
    // �������� ��������� ���� �����
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrDevices.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrDevicesCalcFields(DataSet: TDataSet);
begin
  qrDevicesNUMPP.Value := qrDevices.RecNo;
  if qrDevicesNUMPP.Value = 0 then
    qrDevicesNUMPP.Value := 1;
end;

procedure TfCalcResource.qrDevicesCOASTChange(Sender: TField);
begin
  qrDevices.FieldByName('PRICE').Value :=
    ROUND(qrDevices.FieldByName('COAST').AsFloat * qrDevices.FieldByName('CNT').Value);
end;

procedure TfCalcResource.qrDevicesDetailBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('��������� ���������?', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) then
  begin
    with qrDevicesDetail do
    begin
      // ����
      case cbbNDS.ItemIndex of
        // ���� � ������ ��� ���
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:01, FCOAST_NDS=FCOAST_NO_NDS /*FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)*/,'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NO_NDS=:02, DEVICE_TRANSP_NDS=DEVICE_TRANSP_NO_NDS /*DEVICE_TRANSP_NO_NDS+(DEVICE_TRANSP_NO_NDS*NDS/100)*/,'#13;
          end;
        // � ���
        1:
          begin
            priceQ := 'FCOAST_NDS=:01, FCOAST_NO_NDS=FCOAST_NDS /*FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)*/,'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NDS=:02, DEVICE_TRANSP_NO_NDS=DEVICE_TRANSP_NDS /*DEVICE_TRANSP_NDS-(DEVICE_TRANSP_NDS/(100+NDS)*NDS)*/,'#13;
          end;
      end;

      FastExecSQL('UPDATE devicescard_temp SET'#13 + priceQ1 + priceQ +
        'TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2, PROC_PODR=:3, PROC_ZAC=:4 WHERE ID=:11',
        VarArrayOf([FieldByName('TRANSP').AsFloat, FieldByName('COAST').AsFloat,
        FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value, FieldByName('ID').Value]));
    end;
    // �������� ��������� ���� �����
    FormCalculationEstimate.RecalcEstimate;
    qrDevicesDetail.Cancel;
    pgcChange(nil);
  end
  else
  begin
    qrDevicesDetail.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrDevicesPROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesPROC_ZAC.OnChange;
    qrDevicesPROC_ZAC.OnChange := nil;
    qrDevices.FieldByName('PROC_ZAC').Value := 100 - qrDevices.FieldByName('PROC_PODR').Value;
    qrDevicesPROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrDevicesPROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesPROC_PODR.OnChange;
    qrDevicesPROC_PODR.OnChange := nil;
    qrDevices.FieldByName('PROC_PODR').Value := 100 - qrDevices.FieldByName('PROC_ZAC').Value;
    qrDevicesPROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrDevicesTRANSP_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesTRANSP_PROC_ZAC.OnChange;
    qrDevicesTRANSP_PROC_ZAC.OnChange := nil;
    qrDevices.FieldByName('TRANSP_PROC_ZAC').Value := 100 - qrDevices.FieldByName('TRANSP_PROC_PODR').Value;
    qrDevicesTRANSP_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrDevicesTRANSP_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesTRANSP_PROC_PODR.OnChange;
    qrDevicesTRANSP_PROC_PODR.OnChange := nil;
    qrDevices.FieldByName('TRANSP_PROC_PODR').Value := 100 - qrDevices.FieldByName('TRANSP_PROC_ZAC').Value;
    qrDevicesTRANSP_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataAfterOpen(DataSet: TDataSet);
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      begin
        Footer := Null;
      end;
    // ������ ����������
    1:
      begin
        grMaterial.SelectedRows.Clear;
        Footer := CalcFooterSumm(qrMaterialData);
        JvDBGridFooter1.ReCalc;
      end;
    // ������ ����������
    2:
      begin
        grMech.SelectedRows.Clear;
        Footer := CalcFooterSumm(qrMechData);
        JvDBGridFooter2.ReCalc;
      end;
    // ������ ������������
    3:
      begin
        grDev.SelectedRows.Clear;
        Footer := CalcFooterSumm(qrDevices);
        JvDBGridFooter3.ReCalc;
      end;
    // ������ �\�
    4:
      begin
        Footer := CalcFooterSumm(qrRates);
        JvDBGridFooter4.ReCalc;
      end;
  end;
end;

procedure TfCalcResource.qrMaterialDataBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet as TFDQuery).FindParam('SM_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('SM_ID').AsInteger := IDEstimate;
  if (DataSet as TFDQuery).FindParam('NDS') <> nil then
    (DataSet as TFDQuery).ParamByName('NDS').AsInteger := cbbNDS.ItemIndex;
  if (DataSet as TFDQuery).FindParam('SHOW_DELETED') <> nil then
    (DataSet as TFDQuery).ParamByName('SHOW_DELETED').Value := mShowDeleted.Checked;
  if (DataSet as TFDQuery).FindParam('SHOW_FULL_OBJECT') <> nil then
    (DataSet as TFDQuery).ParamByName('SHOW_FULL_OBJECT').Value := ShowFullObject;
end;

procedure TfCalcResource.qrMaterialDataBeforePost(DataSet: TDataSet);
var
  priceQ: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('��������� ���������?', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES)
  { and (Application.MessageBox('�� �������, ��� ������ ��������� ���������?'#13 +
    '(����� ����������� ������ �� ���� ��������� ���������)', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) } then
  begin
    with qrMaterialData do
    begin
      FastExecSQL('UPDATE materialcard_temp SET TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2,'#13 +
        'MAT_PROC_PODR=:3, MAT_PROC_ZAC=:4, DELETED=:5, PROC_TRANSP=:7, DOC_DATE=:8, DOC_NUM=:88'#13 +
        'WHERE PROC_TRANSP=:9 AND DELETED=:10 AND MAT_PROC_ZAC=:11 AND MAT_PROC_PODR=:12'#13 +
        'AND TRANSP_PROC_ZAC=:13 AND TRANSP_PROC_PODR=:14'#13 +
        'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:15 AND MAT_ID=:16'#13
        + 'AND IFNULL(DOC_DATE, 0)=IFNULL(:17, 0) AND IFNULL(DOC_NUM, "")=:18',
        VarArrayOf([FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('MAT_PROC_PODR').Value, FieldByName('MAT_PROC_ZAC').Value, FieldByName('DELETED').Value,
        FieldByName('PROC_TRANSP').AsFloat, FieldByName('DOC_DATE').Value, FieldByName('DOC_NUM').AsString,
        FieldByName('PROC_TRANSP').OldValue, FieldByName('DELETED').OldValue,
        FieldByName('MAT_PROC_ZAC').OldValue, FieldByName('MAT_PROC_PODR').OldValue,
        FieldByName('TRANSP_PROC_ZAC').OldValue, FieldByName('TRANSP_PROC_PODR').OldValue, cbbNDS.ItemIndex,
        FieldByName('COAST').OldValue, FieldByName('MAT_ID').Value, FieldByName('DOC_DATE').OldValue,
        VarToStrDef(FieldByName('DOC_NUM').OldValue, '')]));

      // ����
      case cbbNDS.ItemIndex of
        // ���� � ������ ��� ���
        0:
          priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS/*FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
        // � ���
        1:
          priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS/*FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET'#13 + priceQ + ' WHERE PROC_TRANSP=:4 AND DELETED=:5'#13 +
          'AND MAT_PROC_ZAC=:6 AND MAT_PROC_PODR=:7'#13 + 'AND TRANSP_PROC_ZAC=:8 AND TRANSP_PROC_PODR=:9'#13
          + 'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MAT_ID=:11'#13
          + 'AND IFNULL(DOC_DATE, 0)=IFNULL(:17, 0) AND IFNULL(DOC_NUM, "")=:18',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('PROC_TRANSP').Value,
          FieldByName('DELETED').Value, FieldByName('MAT_PROC_ZAC').Value, FieldByName('MAT_PROC_PODR').Value,
          FieldByName('TRANSP_PROC_ZAC').Value, FieldByName('TRANSP_PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').OldValue, FieldByName('MAT_ID').Value, FieldByName('DOC_DATE').Value,
          VarToStrDef(FieldByName('DOC_NUM').Value, '')]));
      // ������� ����������
      if FieldByName('PROC_TRANSP').Value <> FieldByName('PROC_TRANSP').OldValue then
        FastExecSQL
          ('UPDATE materialcard_temp SET FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100) WHERE PROC_TRANSP=:4 AND DELETED=:5'#13
          + 'AND MAT_PROC_ZAC=:6 AND MAT_PROC_PODR=:7'#13 +
          'AND TRANSP_PROC_ZAC=:8 AND TRANSP_PROC_PODR=:9'#13 +
          'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MAT_ID=:11'#13
          + 'AND IFNULL(DOC_DATE, 0)=IFNULL(:17, 0) AND IFNULL(DOC_NUM, "")=:18',
          VarArrayOf([FieldByName('PROC_TRANSP').Value, FieldByName('DELETED').Value,
          FieldByName('MAT_PROC_ZAC').Value, FieldByName('MAT_PROC_PODR').Value,
          FieldByName('TRANSP_PROC_ZAC').Value, FieldByName('TRANSP_PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').Value, FieldByName('MAT_ID').Value, FieldByName('DOC_DATE').Value,
          VarToStrDef(FieldByName('DOC_NUM').Value, '')]));
      // ��������� ����������
      {
        if FieldByName('TRANSP').Value <> FieldByName('TRANSP').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET FTRANSP_NO_NDS = :1, FTRANSP_NDS = :2'#13 +
        'WHERE PROC_TRANSP=:4 AND DELETED=:5'#13 + 'AND MAT_PROC_ZAC=:6 AND MAT_PROC_PODR=:7'#13 +
        'AND TRANSP_PROC_ZAC=:8 AND TRANSP_PROC_PODR=:9'#13 +
        'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MAT_ID=:11',
        VarArrayOf([FieldByName('TRANSP').Value, FieldByName('TRANSP').Value,
        FieldByName('PROC_TRANSP').Value, FieldByName('DELETED').Value, FieldByName('MAT_PROC_ZAC').Value,
        FieldByName('MAT_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('TRANSP_PROC_PODR').Value, cbbNDS.ItemIndex, FieldByName('COAST').Value,
        FieldByName('MAT_ID').Value]));
      }
    end;
    // �������� ��������� ���� �����
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrMaterialData.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrMaterialDataCalcFields(DataSet: TDataSet);
begin
  qrMaterialDataNUMPP.Value := qrMaterialData.RecNo;
  if qrMaterialDataNUMPP.Value = 0 then
    qrMaterialDataNUMPP.Value := 1;
end;

procedure TfCalcResource.qrMaterialDataCOASTChange(Sender: TField);
begin
  qrMaterialData.FieldByName('PRICE').Value :=
    ROUND(qrMaterialData.FieldByName('COAST').AsFloat * qrMaterialData.FieldByName('CNT').Value);
  qrMaterialData.FieldByName('TRANSP').Value :=
    ROUND(qrMaterialData.FieldByName('PRICE').Value * qrMaterialData.FieldByName('PROC_TRANSP')
    .AsFloat / 100);
end;

procedure TfCalcResource.qrMaterialDataMAT_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataMAT_PROC_ZAC.OnChange;
    qrMaterialDataMAT_PROC_ZAC.OnChange := nil;
    qrMaterialData.FieldByName('MAT_PROC_ZAC').Value := 100 - qrMaterialData.FieldByName
      ('MAT_PROC_PODR').Value;
    qrMaterialDataMAT_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataMAT_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataMAT_PROC_PODR.OnChange;
    qrMaterialDataMAT_PROC_PODR.OnChange := nil;
    qrMaterialData.FieldByName('MAT_PROC_PODR').Value :=
      100 - qrMaterialData.FieldByName('MAT_PROC_ZAC').Value;
    qrMaterialDataMAT_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataTRANSP_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataTRANSP_PROC_ZAC.OnChange;
    qrMaterialDataTRANSP_PROC_ZAC.OnChange := nil;
    qrMaterialData.FieldByName('TRANSP_PROC_ZAC').Value :=
      100 - qrMaterialData.FieldByName('TRANSP_PROC_PODR').Value;
    qrMaterialDataTRANSP_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataTRANSP_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataTRANSP_PROC_PODR.OnChange;
    qrMaterialDataTRANSP_PROC_PODR.OnChange := nil;
    qrMaterialData.FieldByName('TRANSP_PROC_PODR').Value :=
      100 - qrMaterialData.FieldByName('TRANSP_PROC_ZAC').Value;
    qrMaterialDataTRANSP_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDetailBeforePost(DataSet: TDataSet);
var
  priceQ: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('��������� ���������?', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) then
  begin
    with qrMaterialDetail do
    begin
      FastExecSQL('UPDATE materialcard_temp SET TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2,'#13 +
        'MAT_PROC_PODR=:3, MAT_PROC_ZAC=:4, DELETED=:5, PROC_TRANSP=:7 WHERE ID=:9',
        VarArrayOf([FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('MAT_PROC_PODR').Value, FieldByName('MAT_PROC_ZAC').Value, FieldByName('DELETED').Value,
        FieldByName('PROC_TRANSP').Value, FieldByName('ID').Value]));

      // ����
      case cbbNDS.ItemIndex of
        // ���� � ������ ��� ���
        0:
          priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS/*FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
        // � ���
        1:
          priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS/*FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET'#13 + priceQ + ' WHERE ID=:4',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('ID').Value]));

      if FieldByName('PROC_TRANSP').Value <> FieldByName('PROC_TRANSP').OldValue then
        FastExecSQL
          ('UPDATE materialcard_temp SET FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100) WHERE ID=:4',
          VarArrayOf([FieldByName('ID').Value]));

      // ��������� ����������
      if FieldByName('TRANSP').Value <> FieldByName('TRANSP').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET FTRANSP_NO_NDS = :1, FTRANSP_NDS = :2 WHERE ID=:4',
          VarArrayOf([FieldByName('TRANSP').AsFloat, FieldByName('TRANSP').AsFloat,
          FieldByName('ID').Value]));
    end;
    // �������� ��������� ���� �����
    FormCalculationEstimate.RecalcEstimate;
    qrMaterialDetail.Cancel;
    pgcChange(nil);
  end
  else
  begin
    qrMaterialDetail.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrMechDataBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('��������� ���������?', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES)
  { and (Application.MessageBox('�� �������, ��� ������ ��������� ���������?'#13 +
    '(����� ����������� ������ �� ���� ��������� ���������)', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) } then
  begin
    with qrMechData do
    begin
      FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + 'PROC_PODR=:3, PROC_ZAC=:4, DELETED=:5'#13 +
        'WHERE DELETED=:10'#13 + 'AND PROC_ZAC=:11 AND PROC_PODR=:12'#13 +
        'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:15 AND MECH_ID=:16'#13
        + 'AND IF(:NDS1=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:17',
        VarArrayOf([FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value,
        FieldByName('DELETED').Value, FieldByName('DELETED').OldValue, FieldByName('PROC_ZAC').OldValue,
        FieldByName('PROC_PODR').OldValue, cbbNDS.ItemIndex, FieldByName('COAST').OldValue,
        FieldByName('MECH_ID').Value, cbbNDS.ItemIndex, FieldByName('ZP_1').OldValue]));

      // ����
      case cbbNDS.ItemIndex of
        // ���� � ������ ��� ���
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)'#13;
            priceQ1 := 'FZP_MACH_NO_NDS=:1, FZP_MACH_NDS=FZP_MACH_NO_NDS+(FZP_MACH_NO_NDS*NDS/100)'#13;
          end;
        // � ���
        1:
          begin
            priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)'#13;
            priceQ1 := 'FZP_MACH_NDS=:1, FZP_MACH_NO_NDS=FZP_MACH_NDS-(FZP_MACH_NDS/(100+NDS)*NDS)'#13;
          end;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ + ' WHERE DELETED=:5'#13 +
          'AND PROC_ZAC=:6 AND PROC_PODR=:7'#13 +
          'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MECH_ID=:11'#13
          + 'AND IF(:NDS1=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:12',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('DELETED').Value,
          FieldByName('PROC_ZAC').Value, FieldByName('PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').OldValue, FieldByName('MECH_ID').Value, cbbNDS.ItemIndex,
          FieldByName('ZP_1').OldValue]));

      if FieldByName('ZP_1').Value <> FieldByName('ZP_1').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ1 + ' WHERE DELETED=:5'#13 +
          'AND PROC_ZAC=:6 AND PROC_PODR=:7'#13 +
          'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MECH_ID=:11'#13
          + 'AND IF(:NDS1=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:12',
          VarArrayOf([FieldByName('ZP_1').AsFloat, FieldByName('DELETED').Value,
          FieldByName('PROC_ZAC').Value, FieldByName('PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').Value, FieldByName('MECH_ID').Value, cbbNDS.ItemIndex,
          FieldByName('ZP_1').OldValue]));
    end;
    // �������� ��������� ���� �����
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrMechData.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrMechDataCalcFields(DataSet: TDataSet);
begin
  qrMechDataNUMPP.Value := qrMechData.RecNo;
  if qrMechDataNUMPP.Value = 0 then
    qrMechDataNUMPP.Value := 1;
end;

procedure TfCalcResource.qrMechDataCOASTChange(Sender: TField);
begin
  qrMechData.FieldByName('PRICE').Value :=
    ROUND(qrMechData.FieldByName('COAST').AsFloat * qrMechData.FieldByName('CNT').Value);
  qrMechData.FieldByName('ZP_2').Value :=
    ROUND(qrMechData.FieldByName('ZP_1').AsFloat * qrMechData.FieldByName('CNT').Value);
end;

procedure TfCalcResource.qrMechDataPROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMechDataPROC_ZAC.OnChange;
    qrMechDataPROC_ZAC.OnChange := nil;
    qrMechData.FieldByName('PROC_ZAC').Value := 100 - qrMechData.FieldByName('PROC_PODR').Value;
    qrMechDataPROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMechDataPROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMechDataPROC_PODR.OnChange;
    qrMechDataPROC_PODR.OnChange := nil;
    qrMechData.FieldByName('PROC_PODR').Value := 100 - qrMechData.FieldByName('PROC_ZAC').Value;
    qrMechDataPROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMechDetailBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('��������� ���������?', '�����',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) then
  begin
    with qrMechDetail do
    begin
      FastExecSQL('UPDATE mechanizmcard_temp SET PROC_PODR=:3, PROC_ZAC=:4, DELETED=:5 WHERE ID=:10',
        VarArrayOf([FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value,
        FieldByName('DELETED').Value, FieldByName('ID').Value]));

      // ����
      case cbbNDS.ItemIndex of
        // ���� � ������ ��� ���
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS /*FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)*/'#13;
            priceQ1 :=
              'FZP_MACH_NO_NDS=:1, FZP_MACH_NDS=FZP_MACH_NO_NDS /*FZP_MACH_NO_NDS+(FZP_MACH_NO_NDS*NDS/100)*/'#13;
          end;
        // � ���
        1:
          begin
            priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS /*FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)*/'#13;
            priceQ1 :=
              'FZP_MACH_NDS=:1, FZP_MACH_NO_NDS=FZP_MACH_NDS /*FZP_MACH_NDS-(FZP_MACH_NDS/(100+NDS)*NDS)*/'#13;
          end;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ + ' WHERE ID=:5',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('ID').Value]));

      if FieldByName('ZP_MASH').Value <> FieldByName('ZP_MASH').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ1 + ' WHERE ID=:5',
          VarArrayOf([FieldByName('ZP_MASH').AsFloat, FieldByName('ID').Value]));
    end;
    // �������� ��������� ���� �����
    FormCalculationEstimate.RecalcEstimate;
    qrMechDetail.Cancel;
    pgcChange(nil);
  end
  else
  begin
    qrMechDetail.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.PMTrPerc0Click(Sender: TObject);
var
  TrPr: Variant;
  TmpCode: AnsiString;
begin
  case (Sender as TComponent).Tag of
    0:
      TmpCode := strngfldMaterialDataCODE.Value;
    // ������ ���������, ���-�� �������� ������ �������� �� GetTranspPers
    // GetTranspPers ������ �������� � ������ ������� � ���� �����
    1:
      TmpCode := '�101-0000';
    2:
      TmpCode := '�201-0000';
    3:
      TmpCode := '�300-0000';
    4:
      TmpCode := '�501-0000';
    5:
      TmpCode := '�000-0000';
  end;

  TrPr := FastSelectSQLOne('SELECT GetTranspPers(:IdEstimate, :MatCode);',
    VarArrayOf([FormCalculationEstimate.IDEstimate, TmpCode]));
  if VarIsNull(TrPr) then
    TrPr := 0;

  qrMaterialData.Edit;
  qrMaterialData.FieldByName('PROC_TRANSP').Value := TrPr;
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
