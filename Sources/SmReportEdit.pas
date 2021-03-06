unit SmReportEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Tools, Main, DataModule, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Clipbrd,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  JvComponentBase, JvBalloonHint, Vcl.Samples.Spin;

type
  TfSmReportEdit = class(TSmForm)
    pgc: TPageControl;
    tsData: TTabSheet;
    tsView: TTabSheet;
    pgcData: TPageControl;
    tsRows: TTabSheet;
    tsFields: TTabSheet;
    grRows: TJvDBGrid;
    qrRows: TFDQuery;
    dsRows: TDataSource;
    qrCols: TFDQuery;
    dsCols: TDataSource;
    geCols: TJvDBGrid;
    tsCalc: TTabSheet;
    grCell: TJvDBGrid;
    tsVar: TTabSheet;
    grVars: TJvDBGrid;
    qrVars: TFDQuery;
    dsVars: TDataSource;
    qrRepCell: TFDQuery;
    dsRepCell: TDataSource;
    tsPreView: TTabSheet;
    qrPreview: TFDQuery;
    dsPreview: TDataSource;
    JvDBGrid5: TJvDBGrid;
    pnl1: TPanel;
    mmoLog: TMemo;
    mmoInParams: TMemo;
    pnlVarsBott: TPanel;
    dbnvgr4: TDBNavigator;
    pnlRowsBott: TPanel;
    dbnvgr1: TDBNavigator;
    pnlColsBott: TPanel;
    dbnvgr2: TDBNavigator;
    qrVarType: TFDQuery;
    dsVarType: TDataSource;
    btnTest: TButton;
    pnl5: TPanel;
    lbl1: TLabel;
    edtFormul: TEdit;
    btnSaveFormul: TSpeedButton;
    qrVarsREPORT_VAR_ID: TFDAutoIncField;
    qrVarsREPORT_ID: TIntegerField;
    qrVarsREPORT_VAR_NAME: TStringField;
    qrVarsREPORT_VAR_DESCR: TStringField;
    qrVarsREPORT_VAR_VAL: TStringField;
    qrVarsREPORT_VAR_TYPE: TIntegerField;
    qrVarsLK_TYPE: TStringField;
    lblCellLink: TLabel;
    bh: TBalloonHint;
    dsRowType: TDataSource;
    qrRowType: TFDQuery;
    qrRowsREPORT_ROW_ID: TFDAutoIncField;
    qrRowsREPORT_ID: TIntegerField;
    qrRowsROW_ID: TIntegerField;
    qrRowsPOS: TIntegerField;
    qrRowsREPORT_ROW_NAME: TStringField;
    qrRowsFL_SHOW: TBooleanField;
    qrRowsREPORT_ROW_TYPE: TIntegerField;
    qrRowsLK_TYPE: TStringField;
    qrReportListSql: TFDQuery;
    qrRowsREPORT_LIST_SQL_ID: TIntegerField;
    qrRowsLK_LIST_NAME: TStringField;
    qrColsREPORT_COL_ID: TFDAutoIncField;
    qrColsREPORT_ID: TIntegerField;
    qrColsCOL_ID: TIntegerField;
    qrColsPOS: TIntegerField;
    qrColsREPORT_COL_DATA: TStringField;
    qrColsREPORT_COL_LABEL: TStringField;
    qrColsFL_PRINT_ROW_NAME: TBooleanField;
    qrColsREPORT_COL_WIDTH: TIntegerField;
    qrColsREPORT_COL_TYPE: TIntegerField;
    qrColsREPORT_LIST_SQL_ID: TIntegerField;
    qrColsLK_TYPE: TStringField;
    qrColsLK_LIST_NAME: TStringField;
    qrColsFL_SAVE: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure qrRowsBeforeOpen(DataSet: TDataSet);
    procedure qrRowsNewRecord(DataSet: TDataSet);
    procedure pgcDataChange(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure grCellColEnter(Sender: TObject);
    procedure grCellCellClick(Column: TColumn);
    procedure btnSaveFormulClick(Sender: TObject);
    procedure lblCellLinkClick(Sender: TObject);
    procedure qrRepCellAfterScroll(DataSet: TDataSet);
  private
    REPORT_ID: Variant;
    ROW_ID, COL_ID: Variant;

  public
    { Public declarations }
  end;

  /// <summary>
  /// ������� ���������� ������
  /// </summary>
  /// <returns>
  /// <para>
  /// ���������� ������ [0..3]:
  /// </para>
  /// <para>
  /// [0] - ������ �� �������;
  /// </para>
  /// <para>
  /// [1][0..x][0..1] - ������ � [0] - ID, [1] - ��������� �����;
  /// </para>
  /// <para>
  /// [2][0..x] - ������ � ��������� �������;.
  /// </para>
  /// <para>
  /// [3][0..x] - ������ ������� �������;.
  /// </para>
  /// </returns>
function BuildReport(const AREPORT_ID: Integer): Variant;

var
  fSmReportEdit: TfSmReportEdit;

implementation

{$R *.dfm}

procedure TfSmReportEdit.btnSaveFormulClick(Sender: TObject);
begin
  // ���� ���� ��������� � ������ �������
  if not VarIsNull(COL_ID) and (qrRepCell.FieldByName(grCell.SelectedField.FieldName).AsString <>
    edtFormul.Text) then
  begin
    FastExecSQL
      ('INSERT INTO report_cell(REPORT_CELL_VAL, ROW_ID, COL_ID, REPORT_ID) VALUES(:0,:1,:2,:3) ON DUPLICATE KEY UPDATE REPORT_CELL_VAL=:4;',
      VarArrayOf([Trim(edtFormul.Text), ROW_ID, COL_ID, REPORT_ID, Trim(edtFormul.Text)]));
    CloseOpen(qrRepCell);
  end;
end;

procedure TfSmReportEdit.btnTestClick(Sender: TObject);
var
  startTime: Int64;
  res: Variant;
begin
  // DEBUG-->
  FastExecSQL(mmoInParams.Text, VarArrayOf([]));
  startTime := GetTickCount;
  res := BuildReport(REPORT_ID);
  qrPreview.SQL.Text := res[0];
  // qrPreview.SQL.SaveToFile('c:\report.sql');
  mmoLog.Lines.Add('Prepare time: ' + IntToStr(GetTickCount - startTime));
  startTime := GetTickCount;
  qrPreview.Active := True;
  mmoLog.Lines.Add('Exec time: ' + IntToStr(GetTickCount - startTime));
  // <--DEBUG
end;

function BuildReport(const AREPORT_ID: Integer): Variant;
var
  fullQuery, qr, SELECT, INTO, TABLE, FORMUL: string;
  OLD_REPORT_VAR_TYPE, formulCache, ColData, ColWidth, ColType, ColID: Variant;
  q, qrCol: TFDQuery;
  cnt, i, j, printRowNameID: Integer;

  procedure InitVariableType(const AREPORT_VAR_TYPE: Integer);
  begin
    qr := 'SELECT ' + SELECT + ''#13 + 'INTO ' + INTO + ''#13 + 'FROM ' + TABLE + ''#13;
    case OLD_REPORT_VAR_TYPE of
      // 1 - ��������� ������� (@OBJ_ID/@SM_ID) - ��/������������ ������� ���������
      // 5 - ������ ���������������
      // 6 - ������ �����������
      // 7 - ������ ��������� �������
      1, 5, 6, 7:
        begin
          qr := qr +
            'WHERE ((@OBJ_ID IS NULL) OR (OBJ_ID = @OBJ_ID)) AND IFNULL(SM_ID, 0) = IFNULL(@SM_ID, 0) LIMIT 1;';
        end;
      // ������� ������� ������ (@OBJ_ID/@SM_ID) - ��/������������ ������� ���������
      2:
        begin
          qr := qr + 'INNER JOIN smetasourcedata s ON s.SM_ID = summary_calculation.SM_ID'#13 +
            '  AND IFNULL(s.SM_SUBTYPE, 0) <> 2'#13 + // ��� ����� ���� �� ���
            '  AND ((@OBJ_ID IS NULL) OR (s.OBJ_ID = @OBJ_ID))'#13 +
            '  AND ((@SM_ID IS NULL AND s.ACT = 0) OR (s.TREE_PATH LIKE CONCAT((SELECT s2.TREE_PATH FROM smetasourcedata s2 WHERE s2.SM_ID=@SM_ID), "%")));';
        end;
      // ������  (@OBJ_ID) - ������������ ������� ��������
      3:
        begin
          qr := qr + 'WHERE OBJ_ID = @OBJ_ID';
        end;
      // data_row
      4:
        begin

        end;
    end;
    // ���������� ���������� ����������
    FastExecSQL(qr, VarArrayOf([]));
    // �������� ����� ������ ������
    fullQuery := qr + ''#13;
    SELECT := '';
    INTO := '';
  end;

// ������� �������� �������
  function ParseFormul(): string;
  { ������� ������ ��������/������� � ���� ����� ������ }
    function GetFormul(const R_ID, C_ID: Variant; var AID: Integer): string;
    var
      L, H, i, C: Integer;
    begin
      Result := '';

      L := 0;
      H := VarArrayHighBound(formulCache, 1);
      while L <= H do
      begin
        i := (L + H) shr 1;
        if (formulCache[i][0] = R_ID) and (formulCache[i][1] = C_ID) then
          C := 0
        else if (formulCache[i][0] * 10000 + formulCache[i][1]) <= (R_ID * 10000 + C_ID) then
          C := -1
        else
          C := 1;
        if C < 0 then
          L := i + 1
        else
        begin
          H := i - 1;
          if C = 0 then
          begin
            AID := i;
            Result := formulCache[i][2];
            Break;
          end;
        end;
      end;
    end;

  var
    ROW_ID, COL_ID, sp, fp, offset, ID: Integer;
    SubLinkFormul: string;
    tmp: Variant;
  begin
    Result := GetFormul(q.FieldByName('ROW_ID').Value, ColID[i], ID);
    offset := 1;
    while Pos('[', Result, offset) > 0 do
    begin
      sp := Pos('[', Result, offset);
      fp := Pos(']', Result, sp);
      SubLinkFormul := Copy(Result, sp + 1, fp - sp - 1);
      ROW_ID := StrToInt(Copy(SubLinkFormul, 0, Pos(':', SubLinkFormul) - 1));
      COL_ID := StrToInt(Copy(SubLinkFormul, Pos(':', SubLinkFormul) + 1, length(SubLinkFormul) - 1));
      SubLinkFormul := GetFormul(ROW_ID, COL_ID, ROW_ID);
      if SubLinkFormul <> '' then
        SubLinkFormul := '(' + SubLinkFormul + ')';
      Result := Copy(Result, 0, sp - 1) + SubLinkFormul + Copy(Result, fp + 1, length(Result) - 1);
      offset := sp;
    end;

    Result := StringReplace(Result, '#COL#', VarToStr(IIF(VarIsNull((ColData[i][j])[0]), 'NULL',
      (ColData[i][j])[0])), [rfReplaceAll, rfIgnoreCase]);

    if (Result <> '') and (Pos('t.', Result) = 0) and (ColType[i] = 1) then
    begin
      // ���� �������� ��� ���������, �� ����������
      if VarIsFloat(Result) or VarIsNumeric(Result) or (Result = 'NULL') then
        Exit;
      // ���������� ��������������� �����
      tmp := formulCache[ID];
      tmp[2] := FastSelectSQLOne('SELECT ' + Result, VarArrayOf([]));
      if VarIsNull(tmp[2]) or (VarToStr(tmp[2]) = '') then
        tmp[2] := 'NULL';
      Result := tmp[2];
      formulCache[ID] := tmp;
    end;
  end;

begin
  Result := Null;
  // ��������� ��������� ������
  // ����������� ����� ������
  formulCache := FastSelectSQL
    ('SELECT ROW_ID, COL_ID, REPORT_CELL_VAL, NULL FROM report_cell WHERE REPORT_ID=:0 ORDER BY ROW_ID, COL_ID',
    VarArrayOf([AREPORT_ID]));
  q := DM.qrDifferent;
  qrCol := DM.qrDifferent1;
  fullQuery := '';
  // ������������� ���������� ������-->
  q.SQL.Text := 'SELECT'#13 + '  rv.`REPORT_VAR_NAME`,'#13 + '  rv.`REPORT_VAR_TYPE`,'#13 +
    '  rvt.`TABLE_NAME`,'#13 + '  rv.`REPORT_VAR_VAL`'#13 + 'FROM `report_var` rv '#13 +
    'LEFT JOIN `report_var_type` rvt ON rvt.`REPORT_VAR_TYPE_ID`=rv.`REPORT_VAR_TYPE`'#13 +
    'WHERE rv.`REPORT_ID` = :REPORT_ID'#13 + 'ORDER BY rv.REPORT_VAR_TYPE';
  q.ParamByName('REPORT_ID').Value := AREPORT_ID;
  q.Active := True;
  q.First;
  SELECT := '';
  INTO := '';
  qr := '';
  OLD_REPORT_VAR_TYPE := q.FieldByName('REPORT_VAR_TYPE').Value;
  while not q.Eof do
  begin
    if q.FieldByName('REPORT_VAR_TYPE').Value <> OLD_REPORT_VAR_TYPE then
    begin
      InitVariableType(OLD_REPORT_VAR_TYPE);
      OLD_REPORT_VAR_TYPE := q.FieldByName('REPORT_VAR_TYPE').Value;
    end;

    SELECT := IIF(SELECT = '', '', SELECT + ', ') + q.FieldByName('REPORT_VAR_VAL').AsString;
    INTO := IIF(INTO = '', '@', INTO + ', @') + q.FieldByName('REPORT_VAR_NAME').AsString;
    TABLE := q.FieldByName('TABLE_NAME').AsString;

    q.Next;
  end;
  q.Active := False;
  if not VarIsNull(OLD_REPORT_VAR_TYPE) then
    InitVariableType(OLD_REPORT_VAR_TYPE);
  // <--������������� ���������� ������

  // ������ ������ ������� �� ����� ������-->
  fullQuery := '';

  // ������ ������
  q.SQL.Text := 'SELECT report_row.*, REPORT_LIST_SQL.REPORT_LIST_SQL_SRC'#13 +
    'FROM report_row LEFT JOIN REPORT_LIST_SQL ON REPORT_LIST_SQL.REPORT_LIST_SQL_ID=report_row.REPORT_LIST_SQL_ID'#13
    + 'WHERE REPORT_ID = :REPORT_ID'#13 + 'ORDER BY POS';
  q.ParamByName('REPORT_ID').Value := AREPORT_ID;
  q.Active := True;
  q.First;
  // ������� ������
  qrCol.SQL.Text := 'SELECT report_col.*, REPORT_LIST_SQL.REPORT_LIST_SQL_SRC'#13 +
    'FROM report_col LEFT JOIN REPORT_LIST_SQL ON REPORT_LIST_SQL.REPORT_LIST_SQL_ID=report_col.REPORT_LIST_SQL_ID'#13
    + 'WHERE REPORT_ID = :REPORT_ID'#13 + 'ORDER BY POS';
  qrCol.ParamByName('REPORT_ID').Value := AREPORT_ID;
  qrCol.Active := True;

  // ��������� ����� �������
  qrCol.First;
  cnt := 0;
  printRowNameID := -1;
  ColData := VarArrayCreate([0, qrCol.RecordCount - 1], varVariant);
  ColWidth := VarArrayCreate([0, qrCol.RecordCount - 1], varVariant);
  ColType := VarArrayCreate([0, qrCol.RecordCount - 1], varVariant);
  ColID := VarArrayCreate([0, qrCol.RecordCount - 1], varVariant);
  while not qrCol.Eof do
  begin
    if qrCol.FieldByName('FL_PRINT_ROW_NAME').Value = 1 then
      printRowNameID := cnt;
    ColWidth[cnt] := qrCol.FieldByName('REPORT_COL_WIDTH').AsInteger;
    ColType[cnt] := qrCol.FieldByName('REPORT_COL_TYPE').AsInteger;
    ColID[cnt] := qrCol.FieldByName('COL_ID').Value;
    case ColType[cnt] of
      // �������������
      1:
        begin
          ColData[cnt] := VarArrayOf([VarArrayOf([Null, qrCol.FieldByName('REPORT_COL_LABEL').AsString])]);
        end;
      // ������
      2:
        begin
          ColData[cnt] := FastSelectSQL(qrCol.FieldByName('REPORT_LIST_SQL_SRC').AsString, VarArrayOf([]));
        end;
    end;

    qrCol.Next;
    Inc(cnt);
  end;
  qrCol.Active := False;
  // �������� ��� ��������� ����� ������
  while not q.Eof do
  begin
    if fullQuery <> '' then
      fullQuery := fullQuery + 'UNION ALL'#13;

    SELECT := '';
    // �������� ��� ������� ������
    for i := 0 to cnt - 1 do
    begin
      for j := 0 to VarArrayHighBound(ColData[i], 1) do
      begin
        if i = printRowNameID then
        begin
          case q.FieldByName('REPORT_ROW_TYPE').AsInteger of
            // ������������� ������
            1:
              FORMUL := '"' + q.FieldByName('REPORT_ROW_NAME').AsString + '"';
            // ������
            2:
              FORMUL := 't.VALUE';
          end;
        end
        else
          FORMUL := ParseFormul();

        SELECT := IIF(SELECT = '', '', SELECT + ', ') + IIF(FORMUL = '', 'NULL', FORMUL);

        if q.RecNo = 1 then
          SELECT := SELECT + ' AS F';
      end;
    end;
    case q.FieldByName('REPORT_ROW_TYPE').AsInteger of
      // ������������� ������
      1:
        fullQuery := fullQuery + 'SELECT ' + SELECT + ''#13;
      // ������
      2:
        fullQuery := fullQuery + 'SELECT ' + SELECT + ''#13 + 'FROM (' + q.FieldByName('REPORT_LIST_SQL_SRC')
          .AsString + ') AS t'#13;
    end;
    q.Next;
  end;
  q.Active := False;
  // <--������ ������ ������� �� ����� ������
  Result := VarArrayOf([fullQuery, ColData, ColWidth, ColType]);
end;

procedure TfSmReportEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrRows.CheckBrowseMode;
  qrCols.CheckBrowseMode;
  qrVars.CheckBrowseMode;
  qrVars.Active := False;
  qrRows.Active := False;
  qrCols.Active := False;
  qrVarType.Active := False;
  qrRowType.Active := False;
  qrReportListSql.Active := False;
  Action := caFree;
end;

procedure TfSmReportEdit.FormCreate(Sender: TObject);
begin
  REPORT_ID := InitParams;
  qrRows.Active := True;
  qrCols.Active := True;
  qrVars.Active := True;
  qrVarType.Active := True;
  qrRowType.Active := True;
  qrReportListSql.Active := True;
end;

procedure TfSmReportEdit.FormDestroy(Sender: TObject);
begin
  fSmReportEdit := nil;
end;

procedure TfSmReportEdit.grCellCellClick(Column: TColumn);
begin
  grCellColEnter(nil);
end;

procedure TfSmReportEdit.grCellColEnter(Sender: TObject);
begin
  // dbedtROW_NAME.DataField := grCell.SelectedField.FieldName; //  Column.FieldName;
  edtFormul.Text := qrRepCell.FieldByName(grCell.SelectedField.FieldName).AsString;
  ROW_ID := qrRepCell.FieldByName('ROW_ID').Value;
  if qrRepCell.FindField('ID' + grCell.SelectedField.FieldName) <> nil then
  begin
    COL_ID := qrRepCell.FieldByName('ID' + grCell.SelectedField.FieldName).Value;
    lblCellLink.Caption := '[' + IntToStr(ROW_ID) + ':' + IntToStr(COL_ID) + ']'
  end
  else
  begin
    COL_ID := Null;
    lblCellLink.Caption := '';
  end;
end;

procedure TfSmReportEdit.lblCellLinkClick(Sender: TObject);
var
  point: TPoint;
begin
  // �������� ������ �� ������ � �����
  Clipboard.AsText := lblCellLink.Caption;
  bh.Title := '���������';
  bh.Description := '�������� ����������� � ����� ������';
  point.X := lblCellLink.Width;
  point.Y := lblCellLink.Height;
  bh.ShowHint(lblCellLink.ClientToScreen(point));
end;

procedure TfSmReportEdit.pgcDataChange(Sender: TObject);
var
  fields: string;
  fCount: Integer;
begin
  if pgcData.ActivePage <> tsCalc then
    Exit;

  ROW_ID := Null;
  COL_ID := Null;

  grCell.Columns.Clear;
  fields := 'SELECT r.REPORT_ROW_NAME AS ROW_NAME';
  addCol(grCell, 'ROW_ID', '', 30);
  addCol(grCell, 'ROW_NAME', '�����������', 300);
  fCount := 1;
  qrCols.First;

  while not qrCols.Eof do
  begin
    fields := fields +
      ', (SELECT REPORT_CELL_VAL FROM report_cell WHERE REPORT_ID=r.REPORT_ID AND ROW_ID=r.ROW_ID AND COL_ID='
      + qrCols.FieldByName('COL_ID').AsString + ') AS F' + IntToStr(fCount) + ''#13;
    fields := fields + ', ' + qrCols.FieldByName('COL_ID').AsString + ' AS IDF' + IntToStr(fCount) + ''#13;

    if qrCols.FieldByName('FL_PRINT_ROW_NAME').Value <> 1 then
      addCol(grCell, 'F' + IntToStr(fCount), qrCols.FieldByName('REPORT_COL_LABEL').AsString, 100);
    Inc(fCount);
    qrCols.Next;
  end;

  fields := fields + ', r.ROW_ID' + ''#13;

  qrRepCell.SQL.Text := fields + 'FROM report_row r WHERE r.REPORT_ID=:REPORT_ID ORDER BY r.POS';
  CloseOpen(qrRepCell);
end;

procedure TfSmReportEdit.qrRepCellAfterScroll(DataSet: TDataSet);
begin
  grCellColEnter(nil);
end;

procedure TfSmReportEdit.qrRowsBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet as TFDQuery).FindParam('REPORT_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('REPORT_ID').Value := REPORT_ID;
end;

procedure TfSmReportEdit.qrRowsNewRecord(DataSet: TDataSet);
begin
  (DataSet as TFDQuery).FieldByName('REPORT_ID').Value := REPORT_ID;
end;

end.
