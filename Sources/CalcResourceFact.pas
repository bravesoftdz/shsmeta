unit CalcResourceFact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.Samples.Spin, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.Mask, JvDBGridFooter,
  JvComponentBase, JvFormPlacement, System.UITypes, Vcl.Buttons, Tools, FireDAC.UI.Intf,
  FireDAC.Comp.ScriptCommands, FireDAC.Comp.Script;

type
  TfCalcResourceFact = class(TSmForm)
    pnlTop: TPanel;
    lbl1: TLabel;
    pgc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    ts5: TTabSheet;
    lbl2: TLabel;
    pnlMatTop: TPanel;
    edtMatCodeFilter: TEdit;
    edtMatNameFilter: TEdit;
    pm: TPopupMenu;
    mSelect: TMenuItem;
    mSelectAll: TMenuItem;
    mDelete: TMenuItem;
    N4: TMenuItem;
    mRestore: TMenuItem;
    pnlMatClient: TPanel;
    grMaterial: TJvDBGrid;
    pnlMatBott: TPanel;
    grMaterialBott: TJvDBGrid;
    dbmmoNAME: TDBMemo;
    spl1: TSplitter;
    spl2: TSplitter;
    qrMainData: TFDQuery;
    dsMainData: TDataSource;
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
    pnlRatesTop: TPanel;
    pnlRatesClient: TPanel;
    JvDBGridFooter1: TJvDBGridFooter;
    JvDBGridFooter2: TJvDBGridFooter;
    JvDBGridFooter3: TJvDBGridFooter;
    edtEstimateName: TEdit;
    FormStorage: TJvFormStorage;
    mShowDeleted: TMenuItem;
    mN7: TMenuItem;
    qrMaterialDetail: TFDQuery;
    dsMaterialDetail: TDataSource;
    lbl6: TLabel;
    cbbFromMonth: TComboBox;
    seFromYear: TSpinEdit;
    cbbNDS: TComboBox;
    qrEstimate: TFDQuery;
    qrMechDetail: TFDQuery;
    dsMechDetail: TDataSource;
    qrDevicesDetail: TFDQuery;
    dsDevicesDetail: TDataSource;
    pnlCalculationYesNo: TPanel;
    btnShowDiff: TSpeedButton;
    qrMainDatafact_data_id: TFDAutoIncField;
    strngfldMainDataCODE: TStringField;
    strngfldMainDataNAME: TStringField;
    strngfldMainDataUNIT: TStringField;
    qrMainDataCNT: TFMTBCDField;
    qrMainDataDOC_DATE: TDateField;
    strngfldMainDataDOC_NUM: TStringField;
    qrMainDataPROC_TRANSP: TFMTBCDField;
    qrMainDataFCOAST: TShortintField;
    qrMainDataCOAST: TFMTBCDField;
    qrMainDataPRICE: TFMTBCDField;
    qrMainDataTRANSP: TFMTBCDField;
    qrMainDataDELETED: TShortintField;
    qrMainDataPROC_ZAC: TFMTBCDField;
    qrMainDataPROC_PODR: TFMTBCDField;
    qrMainDataTRANSP_PROC_ZAC: TFMTBCDField;
    qrMainDataTRANSP_PROC_PODR: TFMTBCDField;
    qrMainDataNDS: TBCDField;
    qrMainDataCOAST_ZP: TFMTBCDField;
    qrMainDataPRICE_ZP: TFMTBCDField;
    qrMainDataSRC_OBJECT_ID: TIntegerField;
    mN3: TMenuItem;
    mInsert: TMenuItem;
    mDoCopy: TMenuItem;
    mUpdate: TMenuItem;
    qrMainDataforecast_cost_index: TFMTBCDField;
    qrMainDataID_TYPE_DATA: TIntegerField;
    qrMainDataID_ACT: TLongWordField;
    mEdit: TMenuItem;
    fdScript: TFDScript;
    mInsertFromDict: TMenuItem;
    mInsertFromOunDict: TMenuItem;
    mInsertEmpty: TMenuItem;
    mDeleteReal: TMenuItem;
    qrMainDataSELECTED: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtMatCodeFilterChange(Sender: TObject);
    procedure edtMatCodeFilterClick(Sender: TObject);
    procedure qrMainDataAfterOpen(DataSet: TDataSet);
    procedure JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
      var CalcValue: Variant);
    procedure qrMainDataBeforeOpen(DataSet: TDataSet);
    procedure pmPopup(Sender: TObject);
    procedure grMaterialCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
    procedure mDeleteClick(Sender: TObject);
    procedure mRestoreClick(Sender: TObject);
    procedure grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure mSelectClick(Sender: TObject);
    procedure mSelectAllClick(Sender: TObject);
    procedure qrMainDataPROC_ZACChange(Sender: TField);
    procedure qrMainDataPROC_PODRChange(Sender: TField);
    procedure qrMainDataTRANSP_PROC_ZACChange(Sender: TField);
    procedure qrMainDataTRANSP_PROC_PODRChange(Sender: TField);
    procedure grMaterialBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure grMechBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure pnlCalculationYesNoClick(Sender: TObject);
    procedure btnShowDiffClick(Sender: TObject);
    procedure qrMainDataPROC_TRANSPChange(Sender: TField);
    procedure qrMainDataCNTChange(Sender: TField);
    procedure qrMainDataPRICEChange(Sender: TField);
    procedure mDoCopyClick(Sender: TObject);
    procedure mUpdateClick(Sender: TObject);
    procedure qrMainDataNewRecord(DataSet: TDataSet);
    procedure mEditClick(Sender: TObject);
    procedure mInsertEmptyClick(Sender: TObject);
    procedure qrMainDataAfterEdit(DataSet: TDataSet);
    procedure mDeleteRealClick(Sender: TObject);
  private
    Footer: Variant;
    IDEstimate: Integer;
    flLoaded, flTryUpdateOnce: Boolean;
    procedure CalcFooter;
    function CanEditField(Field: TField): Boolean;
  public
  end;

var
  fCalcResourceFact: TfCalcResourceFact;

procedure ShowCalcResourceFact(const ID_ESTIMATE: Variant; const APage: Integer = 0;
  AOwner: TWinControl = nil);

implementation

{$R *.dfm}

uses Main, CalculationEstimate, DataModule, CalcResourceFactDiff, CalcResourceEdit;

procedure ShowCalcResourceFact(const ID_ESTIMATE: Variant; const APage: Integer = 0;
  AOwner: TWinControl = nil);
{ var
  pageID: Integer; }
begin
  if VarIsNull(ID_ESTIMATE) then
    Exit;
  if (not Assigned(fCalcResourceFact)) then
    fCalcResourceFact := TfCalcResourceFact.Create(AOwner);
  fCalcResourceFact.flLoaded := False;
  fCalcResourceFact.IDEstimate := ID_ESTIMATE;
  fCalcResourceFact.qrEstimate.ParamByName('SM_ID').Value := ID_ESTIMATE;
  fCalcResourceFact.qrEstimate.Active := True;
  fCalcResourceFact.cbbFromMonth.ItemIndex := fCalcResourceFact.qrEstimate.FieldByName('MONTH').AsInteger - 1;
  fCalcResourceFact.edtEstimateName.Text := fCalcResourceFact.qrEstimate.FieldByName('NAME').AsString;
  fCalcResourceFact.seFromYear.Value := fCalcResourceFact.qrEstimate.FieldByName('YEAR').AsInteger;
  fCalcResourceFact.cbbNDS.ItemIndex := fCalcResourceFact.qrEstimate.FieldByName('NDS').AsInteger;

  if AOwner <> nil then
  begin
    fCalcResourceFact.BorderStyle := bsNone;
    fCalcResourceFact.Parent := AOwner;
    fCalcResourceFact.Align := alClient;
  end
  else
    // ������ ������ �� ����� ���� (�� ������� ����� �����)
    FormMain.CreateButtonOpenWindow('������ ����������� ��������� ��������',
      '������ ����������� ��������� ��������', fCalcResourceFact, 1);

  // ���� ������� � ��� ���������� (�� ��� ��������) , �� �������� ��� �������
  { for pageID := 0 to fCalcResourceFact.pgc.PageCount - 1 do
    fCalcResourceFact.pgc.Pages[pageID].TabVisible := AOwner = nil;
  }

  // fCalcResource.pnlTop.Visible := AOwner = nil;
  if APage = 0 then
    fCalcResourceFact.pgc.ActivePageIndex := 1
  else
    fCalcResourceFact.pgc.ActivePageIndex := APage;

  fCalcResourceFact.Show;
  if AOwner = nil then
    fCalcResourceFact.WindowState := wsMaximized;
  fCalcResourceFact.flLoaded := True;
  fCalcResourceFact.pgcChange(nil);
end;

procedure TfCalcResourceFact.btnShowDiffClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ����������
    1:
      begin
        if (not Assigned(fCalcResourceFactDiff)) then
          fCalcResourceFactDiff := TfCalcResourceFactDiff.Create(nil);
        fCalcResourceFactDiff.qrMainData.SQL.Text := 'CALL SP_DIFF_MAT_REPORT(:ID_ACT, :NDS, :IND);';
        CloseOpen(fCalcResourceFactDiff.qrMainData);
        fCalcResourceFactDiff.ShowModal;
      end;
    // ������ ����������
    2:
      begin
        if (not Assigned(fCalcResourceFactDiff)) then
          fCalcResourceFactDiff := TfCalcResourceFactDiff.Create(nil);
        fCalcResourceFactDiff.qrMainData.SQL.Text := 'CALL SP_DIFF_MECH_REPORT(:ID_ACT, :NDS, :IND);';
        CloseOpen(fCalcResourceFactDiff.qrMainData);
        fCalcResourceFactDiff.ShowModal;
      end;
    // ������ ������������
    3:
      begin
        if (not Assigned(fCalcResourceFactDiff)) then
          fCalcResourceFactDiff := TfCalcResourceFactDiff.Create(nil);
        fCalcResourceFactDiff.qrMainData.SQL.Text := 'CALL SP_DIFF_DEV_REPORT(:ID_ACT, :NDS, :IND);';
        CloseOpen(fCalcResourceFactDiff.qrMainData);
        fCalcResourceFactDiff.ShowModal;
      end;
  end;
end;

procedure TfCalcResourceFact.CalcFooter;
begin
  // � ����������� �� �������
  case pgc.ActivePageIndex of
    // ������ ����������
    1, 2, 3:
      Footer := CalcFooterSumm(qrMainData);
  end;
end;

function TfCalcResourceFact.CanEditField(Field: TField): Boolean;
begin
  Result := False;

  if pnlCalculationYesNo.Tag = 0 then
    Exit;

  if (Field = grMaterial.Columns[0].Field) or (Field = grMaterial.Columns[1].Field) or
    (Field = grMaterial.Columns[2].Field) or (Field = grMaterial.Columns[3].Field) or
    (Field = grMaterial.Columns[4].Field) or (Field = grMaterial.Columns[6].Field) or
    (Field = grMaterial.Columns[7].Field) or (Field = grMaterial.Columns[8].Field) or
    (Field = grMaterial.Columns[9].Field) or (Field = grMaterial.Columns[10].Field) or
    (Field = grMaterial.Columns[11].Field) or (Field = grMaterial.Columns[12].Field) or
    (Field = grMaterial.Columns[13].Field) or (Field = grMaterial.Columns[14].Field) or
    (Field = grMech.Columns[0].Field) or (Field = grMech.Columns[1].Field) or
    (Field = grMech.Columns[2].Field) or (Field = grMech.Columns[3].Field) or
    (Field = grMech.Columns[4].Field) or (Field = grMech.Columns[5].Field) or
    (Field = grMech.Columns[6].Field) or (Field = grMech.Columns[7].Field) or
    (Field = grMech.Columns[8].Field) or (Field = grMech.Columns[9].Field) or
    (Field = grMech.Columns[10].Field) or
  { (Field = grMaterialBott.Columns[4].Field) or
    (Field = grMaterialBott.Columns[5].Field) or (Field = grMaterialBott.Columns[6].Field) or
    (Field = grMaterialBott.Columns[7].Field) or (Field = grMaterialBott.Columns[8].Field) or
    (Field = grMaterialBott.Columns[9].Field) or (Field = grMaterialBott.Columns[10].Field) or
    (Field = grMechBott.Columns[4].Field) or (Field = grMechBott.Columns[5].Field) or
    (Field = grMechBott.Columns[6].Field) or (Field = grMechBott.Columns[7].Field) or }
    (Field = grDev.Columns[0].Field) or (Field = grDev.Columns[1].Field) or (Field = grDev.Columns[2].Field)
    or (Field = grDev.Columns[3].Field) or (Field = grDev.Columns[4].Field) or
    (Field = grDev.Columns[5].Field) or (Field = grDev.Columns[6].Field) or (Field = grDev.Columns[7].Field)
    or (Field = grDev.Columns[8].Field) or (Field = grDev.Columns[9].Field) or
    (Field = grDev.Columns[10].Field) or (Field = grDev.Columns[11].Field) or
    (Field = grDev.Columns[12].Field) or (Field = grDev.Columns[13].Field) or
    (Field = grDev.Columns[14].Field) { or
    (Field = grDevBott.Columns[4].Field) or (Field = grDevBott.Columns[5].Field) or
    (Field = grDevBott.Columns[6].Field) or (Field = grDevBott.Columns[7].Field) or
    (Field = grDevBott.Columns[8].Field) or (Field = grDevBott.Columns[9].Field) } then
  begin
    Result := True;
    Exit;
  end;
end;

procedure TfCalcResourceFact.edtMatCodeFilterChange(Sender: TObject);
begin
  qrMainData.Filtered := False;
  qrMainData.Filter := 'Upper(CODE) LIKE UPPER(''%' + edtMatCodeFilter.Text +
    '%'') AND Upper(NAME) LIKE UPPER(''%' + edtMatNameFilter.Text + '%'')';
  // + ' AND NDS=' + IntToStr(cbbMatNDS.ItemIndex); //��������, �������� ������� � ���
  qrMainData.Filtered := True;
  // CalcFooter;
end;

procedure TfCalcResourceFact.edtMatCodeFilterClick(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

procedure TfCalcResourceFact.FormActivate(Sender: TObject);
begin
  // ���� ������ ������� Ctrl � �������� �����, �� ������
  // �������������� � ��������� ���� ����� �� �������� ����
  FormMain.CascadeForActiveWindow;
  // ������ ������� ������ �������� ����� (�� ������� ����� �����)
  FormMain.SelectButtonActiveWindow('������ ����������� ��������� ��������');
end;

procedure TfCalcResourceFact.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCalcResourceFact.FormDestroy(Sender: TObject);
begin
  // ������� ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.DeleteButtonCloseWindow('������ ����������� ��������� ��������');
  fCalcResourceFact := nil;
end;

procedure TfCalcResourceFact.grMaterialBottDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
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

  if CanEditField(Column.Field) then
    grMaterialBott.Canvas.Brush.Color := clMoneyGreen;

  grMaterialBott.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResourceFact.grMaterialCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := CanEditField(Field);
end;

procedure TfCalcResourceFact.grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    if (gdSelected in State) then // ������ � ������
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  if (qrMainData.FieldByName('FCOAST').AsInteger = 1) and (Column.FieldName = 'COAST') then
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];

  if qrMainData.FieldByName('DELETED').AsInteger = 1 then
    (Sender AS TJvDBGrid).Canvas.Font.Style := (Sender AS TJvDBGrid).Canvas.Font.Style + [fsStrikeOut];
  {
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
  }
  if CanEditField(Column.Field) and not(gdFocused in State) then
    (Sender AS TJvDBGrid).Canvas.Brush.Color := clMoneyGreen;

  if CanEditField(Column.Field) and (gdFocused in State) then
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      MixColors(clMoneyGreen, (Sender AS TJvDBGrid).Canvas.Brush.Color, 100);

  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResourceFact.grMechBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
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

  if CanEditField(Column.Field) then
    grMechBott.Canvas.Brush.Color := clMoneyGreen;
  grMechBott.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResourceFact.JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
  var CalcValue: Variant);
begin
  try
    if not CheckQrActiveEmpty(Sender.DataSource.DataSet) then
      Exit;
    if Sender.DataSource.DataSet.FindField(FieldName) <> nil then
      CalcValue := Round(Footer[Sender.DataSource.DataSet.FieldByName(FieldName).Index]);
  except

  end;

end;

procedure TfCalcResourceFact.mDeleteClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ����������
    1, 2, 3:
      begin
        if not(qrMainData.State in [dsEdit]) then
          qrMainData.Edit;
        qrMainData.FieldByName('DELETED').Value := 1;
      end;
  end;
end;

procedure TfCalcResourceFact.mEditClick(Sender: TObject);
var
  TempBookmark: TBookMark;
  X: Integer;
  Script: TStringList;
begin
  if (not Assigned(fCalcResourceEdit)) then
    fCalcResourceEdit := TfCalcResourceEdit.Create(Self, pgc.ActivePageIndex);
  if fCalcResourceEdit.ShowModal = mrOk then
  begin
    Script := TStringList.Create;
    case pgc.ActivePageIndex of

      // ������ ����������
      1:
        begin
          grMaterial.DataSource.DataSet.DisableControls;
          TempBookmark := grMaterial.DataSource.DataSet.GetBookmark;
          try
            if grMaterial.SelectedRows.Count = 0 then
              grMaterial.SelectedRows.CurrentRowSelected := True;

            for X := 0 to grMaterial.SelectedRows.Count - 1 do
            begin
              if grMaterial.SelectedRows.IndexOf(grMaterial.SelectedRows.Items[X]) > -1 then
              begin
                grMaterial.DataSource.DataSet.GotoBookmark(Pointer(grMaterial.SelectedRows.Items[X]));
                Script.Add('UPDATE fact_data SET fact_data_id=fact_data_id' +
                  IIF(fCalcResourceEdit.chkMatCoast.Checked,
                  ',FCOAST=1, COAST=' + fCalcResourceEdit.edtMatCoast.Text +
                  ', PRICE=ROUND(CNT*COAST*IFNULL(forecast_cost_index, 1))', '') +
                  IIF(fCalcResourceEdit.chkMatTransp.Checked,
                  ',PROC_TRANSP=' + fCalcResourceEdit.edtMatTransp.Text, '') +
                  IIF(fCalcResourceEdit.chkMatNaklDate.Checked, ',DOC_DATE=''' + FormatDateTime('yyyy-mm-dd',
                  fCalcResourceEdit.dtpMatNaklDate.Date) + '''', '') +
                  IIF(fCalcResourceEdit.chkMatNakl.Checked, ',DOC_NUM=''' + fCalcResourceEdit.edtMatNakl.Text
                  + '''', '') + IIF(fCalcResourceEdit.chkMatZakPodr.Checked,
                  ',PROC_PODR=' + fCalcResourceEdit.edtMatPodr.Text + ',PROC_ZAC=' +
                  fCalcResourceEdit.edtMatZak.Text, '') + IIF(fCalcResourceEdit.chkMatTranspZakPodr.Checked,
                  ',TRANSP_PROC_PODR=' + fCalcResourceEdit.edtMatTranspPodr.Text + ',TRANSP_PROC_ZAC=' +
                  fCalcResourceEdit.edtMatTranspZak.Text, '') + ' WHERE fact_data_id=' +
                  qrMainData.FieldByName('fact_data_id').AsString + ';');
              end;
            end;
            fdScript.ExecuteScript(TStrings(Script));
          finally
            grMaterial.DataSource.DataSet.GotoBookmark(TempBookmark);
            grMaterial.DataSource.DataSet.FreeBookmark(TempBookmark);
            grMaterial.DataSource.DataSet.EnableControls;
          end;
        end;

      // ������ ����������
      2:
        begin
          grMech.DataSource.DataSet.DisableControls;
          TempBookmark := grMech.DataSource.DataSet.GetBookmark;
          try
            if grMech.SelectedRows.Count = 0 then
              grMech.SelectedRows.CurrentRowSelected := True;

            for X := 0 to grMech.SelectedRows.Count - 1 do
            begin
              if grMech.SelectedRows.IndexOf(grMech.SelectedRows.Items[X]) > -1 then
              begin
                grMech.DataSource.DataSet.GotoBookmark(Pointer(grMech.SelectedRows.Items[X]));
                Script.Add('UPDATE fact_data set fact_data_id=fact_data_id' +
                  IIF(fCalcResourceEdit.chkMechCoast.Checked,
                  ',FCOAST=1, COAST=' + fCalcResourceEdit.edtMechCoast.Text +
                  ', PRICE=ROUND(CNT*COAST*IFNULL(forecast_cost_index, 1))', '') +
                  IIF(fCalcResourceEdit.chkMechZPMash.Checked,
                  ',COAST_ZP=' + fCalcResourceEdit.edtMechZPMash.Text +
                  ', PRICE_ZP=ROUND(CNT*COAST_ZP*IFNULL(forecast_cost_index, 1))', '') +
                  IIF(fCalcResourceEdit.chkMechNaklDate.Checked, ',DOC_DATE=''' + FormatDateTime('yyyy-mm-dd',
                  fCalcResourceEdit.dtpMechNaklDate.Date) + '''', '') +
                  IIF(fCalcResourceEdit.chkMechNakl.Checked,
                  ',DOC_NUM=''' + fCalcResourceEdit.edtMechNakl.Text + '''', '') +
                  IIF(fCalcResourceEdit.chkMechZakPodr.Checked,
                  ',PROC_PODR=' + fCalcResourceEdit.edtMechPodr.Text + ',PROC_ZAC=' +
                  fCalcResourceEdit.edtMechZak.Text, '') + ' WHERE fact_data_id=' +
                  qrMainData.FieldByName('fact_data_id').AsString + ';');
              end;
            end;
            fdScript.ExecuteScript(TStrings(Script));
          finally
            grMech.DataSource.DataSet.GotoBookmark(TempBookmark);
            grMech.DataSource.DataSet.FreeBookmark(TempBookmark);
            grMech.DataSource.DataSet.EnableControls;
          end;
        end;

      // ������ ������������
      3:
        begin
          grDev.DataSource.DataSet.DisableControls;
          TempBookmark := grDev.DataSource.DataSet.GetBookmark;
          try
            if grDev.SelectedRows.Count = 0 then
              grDev.SelectedRows.CurrentRowSelected := True;

            for X := 0 to grDev.SelectedRows.Count - 1 do
            begin
              if grDev.SelectedRows.IndexOf(grDev.SelectedRows.Items[X]) > -1 then
              begin
                grDev.DataSource.DataSet.GotoBookmark(Pointer(grDev.SelectedRows.Items[X]));
                Script.Add('UPDATE fact_data set fact_data_id=fact_data_id' +
                  IIF(fCalcResourceEdit.chkDevCoast.Checked,
                  ',FCOAST=1, COAST=' + fCalcResourceEdit.edtDevCoast.Text +
                  ', PRICE=ROUND(CNT*COAST*IFNULL(forecast_cost_index, 1))', '') +
                  IIF(fCalcResourceEdit.chkDevTransp.Checked,
                  ',TRANSP=' + fCalcResourceEdit.edtDevTransp.Text, '') +
                  IIF(fCalcResourceEdit.chkDevNaklDate.Checked, ',DOC_DATE=''' + FormatDateTime('yyyy-mm-dd',
                  fCalcResourceEdit.dtpDevNaklDate.Date) + '''', '') +
                  IIF(fCalcResourceEdit.chkDevNakl.Checked, ',DOC_NUM=''' + fCalcResourceEdit.edtDevNakl.Text
                  + '''', '') + IIF(fCalcResourceEdit.chkDevZakPodr.Checked,
                  ',PROC_PODR=' + fCalcResourceEdit.edtDevPodr.Text + ',PROC_ZAC=' +
                  fCalcResourceEdit.edtDevZak.Text, '') + IIF(fCalcResourceEdit.chkDevTranspZakPodr.Checked,
                  ',TRANSP_PROC_PODR=' + fCalcResourceEdit.edtDevTranspPodr.Text + ',TRANSP_PROC_ZAC=' +
                  fCalcResourceEdit.edtDevTranspZak.Text, '') + ' WHERE fact_data_id=' +
                  qrMainData.FieldByName('fact_data_id').AsString + ';');
              end;
            end;
            fdScript.ExecuteScript(TStrings(Script));
          finally
            grDev.DataSource.DataSet.GotoBookmark(TempBookmark);
            grDev.DataSource.DataSet.FreeBookmark(TempBookmark);
            grDev.DataSource.DataSet.EnableControls;
          end;
        end;
    end;
    pgcChange(nil);
  end;
end;

procedure TfCalcResourceFact.mInsertEmptyClick(Sender: TObject);
begin
  qrMainData.Insert;
end;

procedure TfCalcResourceFact.mDeleteRealClick(Sender: TObject);
begin
  if Application.MessageBox('�� ������������� ������ ������� ������?', PChar(Caption),
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    qrMainData.Delete;
  end;
end;

procedure TfCalcResourceFact.mDoCopyClick(Sender: TObject);
begin
  FastExecSQL('INSERT INTO fact_data'#13 +
    '(ID_ACT,ID_TYPE_DATA,ID_TABLES,CODE,NAME,CNT,UNIT,forecast_cost_index,'#13 +
    'PROC_TRANSP,COAST,PRICE,TRANSP,DELETED,PROC_ZAC,TRANSP_PROC_ZAC,TRANSP_PROC_PODR,'#13 +
    'PROC_PODR,NDS,DOC_NUM,DOC_DATE,FCOAST,COAST_ZP,PRICE_ZP,SRC_OBJECT_ID)'#13 +
    '(SELECT ID_ACT,ID_TYPE_DATA,NULL,CODE,NAME,CNT,UNIT,NULL,'#13 +
    'PROC_TRANSP,COAST,PRICE,TRANSP,DELETED,PROC_ZAC,TRANSP_PROC_ZAC,TRANSP_PROC_PODR,PROC_PODR, NDS,'#13 +
    'DOC_NUM,DOC_DATE,FCOAST,COAST_ZP,PRICE_ZP,SRC_OBJECT_ID FROM fact_data WHERE fact_data_id=:fact_data_id);',
    VarArrayOf([qrMainDatafact_data_id.Value]));
  CloseOpen(qrMainData);
end;

procedure TfCalcResourceFact.mUpdateClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ����������
    1:
      begin
        FastExecSQL
          ('DELETE FROM fact_data WHERE ID_ACT=:ID_ACT AND ID_TABLES IS NOT NULL AND ID_TYPE_DATA=2 AND FCOAST=0;',
          VarArrayOf([FormCalculationEstimate.IDEstimate]));
        FastExecSQL('INSERT INTO fact_data'#13 +
          '(ID_ACT,ID_TYPE_DATA,ID_TABLES,CODE,NAME,CNT,UNIT,DOC_DATE,DOC_NUM,forecast_cost_index,'#13 +
          ' PROC_TRANSP,FCOAST,COAST,PRICE,TRANSP,DELETED,PROC_ZAC,PROC_PODR,TRANSP_PROC_ZAC,'#13 +
          ' TRANSP_PROC_PODR,NDS,SRC_OBJECT_ID)'#13 + '(SELECT'#13 +
          '  :ID_ACT,:ID_TYPE_DATA,ID,MAT_CODE AS CODE,MAT_NAME AS NAME,'#13 +
          '  SUM(COALESCE(MAT_COUNT, 0)), MAT_UNIT AS UNIT,DOC_DATE,DOC_NUM,NULL,PROC_TRANSP,'#13 +
          '  IF(:NDS1=1, IF(FCOAST_NDS<>0, 1, 0), IF(FCOAST_NO_NDS<>0, 1, 0)) AS FCOAST,'#13 +
          '  IF(:NDS2=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS)) AS COAST,'#13
          + '  SUM(ROUND(IF(:NDS3=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))*COALESCE(MAT_COUNT, 0))) AS PRICE,'#13
          + '  SUM(IF(:NDS4=1, IF(FTRANSP_NDS<>0, FTRANSP_NDS, TRANSP_NDS), IF(FTRANSP_NO_NDS<>0, FTRANSP_NO_NDS, TRANSP_NO_NDS))) AS TRANSP,'#13
          + '  DELETED,MAT_PROC_ZAC,MAT_PROC_PODR,TRANSP_PROC_ZAC,TRANSP_PROC_PODR,NDS,MAT_ID'#13 +
          'FROM materialcard_temp'#13 +
          'WHERE ((DELETED = 0) OR (:SHOW_DELETED)) AND NOT EXISTS(SELECT fact_data_id FROM fact_data WHERE ID_ACT=:ID_ACT1 AND ID_TYPE_DATA=:ID_TYPE_DATA1 AND ID_TABLES=ID)'#13
          + 'GROUP BY CODE, NAME, UNIT, DOC_DATE, DOC_NUM, PROC_TRANSP, FCOAST, COAST, DELETED,'#13 +
          'MAT_PROC_ZAC, MAT_PROC_PODR, TRANSP_PROC_ZAC, TRANSP_PROC_PODR, NDS, MAT_ID)',
          VarArrayOf([FormCalculationEstimate.IDEstimate, 2, cbbNDS.ItemIndex, cbbNDS.ItemIndex,
          cbbNDS.ItemIndex, cbbNDS.ItemIndex, mShowDeleted.Checked, FormCalculationEstimate.IDEstimate, 2]));
      end;
    // ������ ����������
    2:
      begin
        FastExecSQL
          ('DELETE FROM fact_data WHERE ID_ACT=:ID_ACT AND ID_TABLES IS NOT NULL AND ID_TYPE_DATA=3 AND FCOAST=0;',
          VarArrayOf([FormCalculationEstimate.IDEstimate]));
        FastExecSQL('INSERT INTO fact_data'#13 +
          '(ID_ACT,ID_TYPE_DATA,ID_TABLES,CODE,NAME,CNT,UNIT,DOC_DATE,DOC_NUM,forecast_cost_index,'#13 +
          'COAST,PRICE,COAST_ZP,PRICE_ZP,DELETED,PROC_ZAC,PROC_PODR,NDS,SRC_OBJECT_ID)'#13 +
          '(SELECT :ID_ACT,:ID_TYPE_DATA,ID,MECH_CODE AS CODE, /* �����������*/'#13 +
          '  MECH_NAME AS NAME, /* ������������ */'#13 +
          '  SUM(COALESCE(MECH_COUNT, 0)) AS CNT, /* ���-�� */'#13 +
          '  MECH_UNIT AS UNIT, /* ��. ��������� */'#13 + '  DOC_DATE, /* ���� ��������� */'#13 +
          '  DOC_NUM, NULL, /* ����� ��������� */'#13 +
          '  IF(:NDS1=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS)) AS COAST, /* ���� */'#13
          + '  SUM(IF(:NDS2=1, IF(FPRICE_NDS<>0, FPRICE_NDS, PRICE_NDS), IF(FPRICE_NO_NDS<>0, FPRICE_NO_NDS, PRICE_NO_NDS))) AS PRICE, /* ��������� */'#13
          + '  IF(:NDS3=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS)) AS COAST_ZP, /* �� ��������� */'#13
          + '  SUM(IF(:NDS4=1, IF(FZPPRICE_NDS <>0, FZPPRICE_NDS, ZPPRICE_NDS), IF(FZPPRICE_NO_NDS<>0, FZPPRICE_NO_NDS, ZPPRICE_NO_NDS))) AS PRICE_ZP, /* ��������� �� ��������� */'#13
          + '  DELETED,PROC_ZAC,PROC_PODR,NDS,MECH_ID'#13 + 'FROM  mechanizmcard_temp'#13 +
          'WHERE ((DELETED = 0) OR (:SHOW_DELETED)) AND NOT EXISTS(SELECT fact_data_id FROM fact_data WHERE ID_ACT=:ID_ACT1 AND ID_TYPE_DATA=:ID_TYPE_DATA1 AND ID_TABLES=ID)'#13
          + 'GROUP BY CODE, NAME, UNIT, DOC_DATE, DOC_NUM, COAST, COAST_ZP, DELETED, PROC_ZAC, PROC_PODR, NDS, MECH_ID)',
          VarArrayOf([FormCalculationEstimate.IDEstimate, 3, cbbNDS.ItemIndex, cbbNDS.ItemIndex,
          cbbNDS.ItemIndex, cbbNDS.ItemIndex, mShowDeleted.Checked, FormCalculationEstimate.IDEstimate, 3]));
      end;
    // ������ ������������
    3:
      begin
        FastExecSQL
          ('DELETE FROM fact_data WHERE ID_ACT=:ID_ACT AND ID_TABLES IS NOT NULL AND ID_TYPE_DATA=4 AND FCOAST=0;',
          VarArrayOf([FormCalculationEstimate.IDEstimate]));
        FastExecSQL('INSERT INTO fact_data'#13 +
          '(ID_ACT,ID_TYPE_DATA,ID_TABLES,CODE,NAME,CNT,UNIT,DOC_DATE,DOC_NUM,forecast_cost_index,'#13 +
          'COAST,PRICE,TRANSP,DELETED,PROC_ZAC,PROC_PODR,TRANSP_PROC_ZAC,TRANSP_PROC_PODR,NDS,SRC_OBJECT_ID)'#13
          + '(SELECT :ID_ACT,:ID_TYPE_DATA,ID,DEVICE_CODE AS CODE,DEVICE_NAME AS NAME,SUM(COALESCE(DEVICE_COUNT, 0)) AS CNT,'#13
          + '  DEVICE_UNIT AS UNIT,DOC_DATE,DOC_NUM,NULL,'#13 +
          '  IF(:NDS1=1, IF(FCOAST_NDS<>0, FCOAST_NDS, 0), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, 0)) AS COAST,'#13
          + '  SUM(IF(:NDS2=1, IF(FPRICE_NDS<>0, FPRICE_NDS, 0), IF(FPRICE_NO_NDS<>0, FPRICE_NO_NDS, 0))) AS PRICE,'#13
          + '  SUM(IF(:NDS3=1, IF(DEVICE_TRANSP_NDS<>0, DEVICE_TRANSP_NDS, 0), IF(DEVICE_TRANSP_NO_NDS<>0, DEVICE_TRANSP_NO_NDS, 0))) AS TRANSP,'#13
          + '  0 AS DELETED,PROC_ZAC,PROC_PODR,TRANSP_PROC_ZAC,TRANSP_PROC_PODR,NDS,DEVICE_ID'#13 +
          'FROM devicescard_temp'#13 +
          'WHERE NOT EXISTS(SELECT fact_data_id FROM fact_data WHERE ID_ACT=:ID_ACT1 AND ID_TYPE_DATA=:ID_TYPE_DATA1 AND ID_TABLES=ID)'#13
          + 'GROUP BY CODE,NAME,UNIT,DOC_DATE,DOC_NUM,COAST,PROC_ZAC,PROC_PODR,TRANSP_PROC_ZAC,TRANSP_PROC_PODR,DELETED, DEVICE_ID, NDS)',
          VarArrayOf([FormCalculationEstimate.IDEstimate, 4, cbbNDS.ItemIndex, cbbNDS.ItemIndex,
          cbbNDS.ItemIndex, FormCalculationEstimate.IDEstimate, 4]));
      end;
  end;
  CloseOpen(qrMainData);
end;

procedure TfCalcResourceFact.mRestoreClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1, 2, 3:
      begin
        if not(qrMainData.State in [dsEdit]) then
          qrMainData.Edit;
        qrMainData.FieldByName('DELETED').Value := 0;
      end;
  end;
end;

procedure TfCalcResourceFact.mSelectClick(Sender: TObject);
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

procedure TfCalcResourceFact.mSelectAllClick(Sender: TObject);
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

      end;
  end;
end;

procedure TfCalcResourceFact.pgcChange(Sender: TObject);
begin
  if not flLoaded then
    Exit;
  flTryUpdateOnce := True;
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ����������
    1:
      begin
        CloseOpen(qrMainData);
        CloseOpen(qrMaterialDetail);
      end;
    // ������ ����������
    2:
      begin
        CloseOpen(qrMainData);
        CloseOpen(qrMechDetail);
      end;
    // ������ ������������
    3:
      begin
        CloseOpen(qrMainData);
        CloseOpen(qrDevicesDetail);
      end;
    // ������ �\�
    4:
      begin
        CloseOpen(qrMainData);
      end;
  end;
end;

procedure TfCalcResourceFact.pmPopup(Sender: TObject);
var
  Editable: Boolean;
begin
  case pgc.ActivePageIndex of
    // ������ ���������
    0:
      ;
    // ������ ���������� ...
    1, 2, 3:
      begin
        mDelete.Visible := qrMainData.FieldByName('DELETED').AsInteger = 0;
        mRestore.Visible := qrMainData.FieldByName('DELETED').AsInteger = 1;
        mDeleteReal.Visible := qrMainData.FieldByName('DELETED').AsInteger = 1;
      end;
  end;
  Editable := pnlCalculationYesNo.Tag = 1;
  mDoCopy.Enabled := Editable;
  mInsert.Enabled := Editable;
  mUpdate.Enabled := Editable;
  mEdit.Enabled := Editable;
  mDelete.Enabled := Editable;
  mDeleteReal.Visible := Editable;
  mRestore.Enabled := Editable;
end;

procedure TfCalcResourceFact.pnlCalculationYesNoClick(Sender: TObject);
begin
  with pnlCalculationYesNo do
    if Tag = 1 then
    begin
      Tag := 0;
      Color := clRed;
      Caption := '������� ���������';
      fCalcResourceFact.Caption := '������ ����������� ��������� [�������������� ���������]';
    end
    else
    begin
      Tag := 1;
      Color := clLime;
      Caption := '������� ���������';
      fCalcResourceFact.Caption := '������ ����������� ��������� [�������������� ���������]';
    end;
  case pgc.ActivePageIndex of
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
  end;
end;

procedure TfCalcResourceFact.qrMainDataAfterEdit(DataSet: TDataSet);
begin
  qrMainData.FieldByName('FCOAST').Value := 1;
end;

procedure TfCalcResourceFact.qrMainDataAfterOpen(DataSet: TDataSet);
begin
  if qrMainData.Active and qrMainData.IsEmpty and flTryUpdateOnce then
  begin
    flTryUpdateOnce := False;
    mUpdateClick(nil);
  end;

  if CheckQrActiveEmpty(DataSet) then
    CalcFooter;
end;

procedure TfCalcResourceFact.qrMainDataBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet as TFDQuery).FindParam('SM_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('SM_ID').AsInteger := IDEstimate;
  if (DataSet as TFDQuery).FindParam('NDS') <> nil then
    (DataSet as TFDQuery).ParamByName('NDS').AsInteger := cbbNDS.ItemIndex;
  if (DataSet as TFDQuery).FindParam('SHOW_DELETED') <> nil then
    (DataSet as TFDQuery).ParamByName('SHOW_DELETED').Value := mShowDeleted.Checked;
  if (DataSet as TFDQuery).FindParam('ID_ACT') <> nil then
    (DataSet as TFDQuery).ParamByName('ID_ACT').Value := FormCalculationEstimate.IDEstimate;

  if (DataSet as TFDQuery).FindParam('ID_TYPE_DATA') <> nil then
    case pgc.ActivePageIndex of
      // ������ ���������
      0:
        (DataSet as TFDQuery).ParamByName('ID_TYPE_DATA').Value := 0;
      // ������ ����������
      1:
        (DataSet as TFDQuery).ParamByName('ID_TYPE_DATA').Value := 2;
      // ������ ����������
      2:
        (DataSet as TFDQuery).ParamByName('ID_TYPE_DATA').Value := 3;
      // ������ ������������
      3:
        (DataSet as TFDQuery).ParamByName('ID_TYPE_DATA').Value := 4;
      // ������ �\�
      4:
        (DataSet as TFDQuery).ParamByName('ID_TYPE_DATA').Value := 0;
end;

end;

procedure TfCalcResourceFact.qrMainDataCNTChange(Sender: TField);
var
  e: TFieldNotifyEvent;
  forecast_cost_index: Double;
begin
  try
    e := qrMainDataforecast_cost_index.OnChange;
    qrMainDataforecast_cost_index.OnChange := nil;
    if (qrMainData.FieldByName('COAST').Value <> qrMainData.FieldByName('COAST').OldValue) or
      (qrMainData.FieldByName('COAST_ZP').Value <> qrMainData.FieldByName('COAST_ZP').OldValue) then
      qrMainData.FieldByName('forecast_cost_index').Value := null;

    if VarIsNull(qrMainData.FieldByName('forecast_cost_index').Value) then
      forecast_cost_index := 1
    else
      forecast_cost_index := qrMainData.FieldByName('forecast_cost_index').Value;

    qrMainData.FieldByName('PRICE').Value := qrMainData.FieldByName('COAST').Value *
      qrMainData.FieldByName('CNT').Value * forecast_cost_index;

    if not(VarIsNull(qrMainData.FieldByName('COAST_ZP').Value)) then
      qrMainData.FieldByName('PRICE_ZP').Value := qrMainData.FieldByName('COAST_ZP').Value *
        qrMainData.FieldByName('CNT').Value * forecast_cost_index;
    qrMainDataforecast_cost_index.OnChange := e;
  except
  end;
end;

procedure TfCalcResourceFact.qrMainDataNewRecord(DataSet: TDataSet);
begin
  qrMainData.FieldByName('FCOAST').Value := 0;
  qrMainData.FieldByName('DELETED').Value := 0;
  qrMainData.FieldByName('ID_ACT').Value := FormCalculationEstimate.IDEstimate;
  case pgc.ActivePageIndex of
    // ������ ����������
    1:
      qrMainData.FieldByName('ID_TYPE_DATA').Value := 2;
    // ������ ����������
    2:
      qrMainData.FieldByName('ID_TYPE_DATA').Value := 3;
    // ������ ������������
    3:
      qrMainData.FieldByName('ID_TYPE_DATA').Value := 4;
  end;
end;

procedure TfCalcResourceFact.qrMainDataPRICEChange(Sender: TField);
begin
  if not(VarIsNull(qrMainData.FieldByName('PROC_TRANSP').Value)) then
    qrMainData.FieldByName('TRANSP').Value := qrMainData.FieldByName('PRICE').Value *
      qrMainData.FieldByName('PROC_TRANSP').Value / 100;
end;

procedure TfCalcResourceFact.qrMainDataPROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMainDataPROC_ZAC.OnChange;
    qrMainDataPROC_ZAC.OnChange := nil;
    qrMainData.FieldByName('PROC_ZAC').Value := 100 - qrMainData.FieldByName('PROC_PODR').Value;
    qrMainDataPROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResourceFact.qrMainDataPROC_TRANSPChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMainDataTRANSP.OnChange;
    qrMainDataTRANSP.OnChange := nil;
    qrMainData.FieldByName('TRANSP').Value := qrMainData.FieldByName('PRICE').Value *
      qrMainData.FieldByName('PROC_TRANSP').Value / 100;
    qrMainDataTRANSP.OnChange := e;
  except
  end;
end;

procedure TfCalcResourceFact.qrMainDataPROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMainDataPROC_PODR.OnChange;
    qrMainDataPROC_PODR.OnChange := nil;
    qrMainData.FieldByName('PROC_PODR').Value := 100 - qrMainData.FieldByName('PROC_ZAC').Value;
    qrMainDataPROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResourceFact.qrMainDataTRANSP_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMainDataTRANSP_PROC_ZAC.OnChange;
    qrMainDataTRANSP_PROC_ZAC.OnChange := nil;
    qrMainData.FieldByName('TRANSP_PROC_ZAC').Value := 100 - qrMainData.FieldByName('TRANSP_PROC_PODR').Value;
    qrMainDataTRANSP_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResourceFact.qrMainDataTRANSP_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMainDataTRANSP_PROC_PODR.OnChange;
    qrMainDataTRANSP_PROC_PODR.OnChange := nil;
    qrMainData.FieldByName('TRANSP_PROC_PODR').Value := 100 - qrMainData.FieldByName('TRANSP_PROC_ZAC').Value;
    qrMainDataTRANSP_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('����������� �������� ��������!' + #13#10 +
      '�������� ������ ���������� � ���������� 0-100.', '�����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

end.
