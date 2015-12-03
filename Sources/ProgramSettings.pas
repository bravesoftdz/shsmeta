unit ProgramSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, UITypes, Tools, Grids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Buttons, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid;

type
  TFormProgramSettings = class(TSmForm)
    pcSettings: TPageControl;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    tsTables: TTabSheet;
    GroupBoxColor: TGroupBox;
    LabelFontSelectRow: TLabel;
    LabelFontSelectCell: TLabel;
    Button3: TButton;
    ShapeFontRows: TShape;
    ShapeBackgroundSelectRow: TShape;
    Bevel1: TBevel;
    StringGridDemo: TStringGrid;
    LabelBackgroundHead: TLabel;
    LabelBackgroundSelectRow: TLabel;
    LabelBackgroundSelectCell: TLabel;
    ShapeBackgroundHead: TShape;
    ShapeBackgroundSelectCell: TShape;
    LabelFontHead: TLabel;
    ShapeFontHead: TShape;
    ShapeFontSelectCell: TShape;
    LabelBackgroundRows: TLabel;
    LabelFontRows: TLabel;
    ShapeFontSelectRow: TShape;
    ShapeBackgroundRows: TShape;
    ColorDialog: TColorDialog;
    ButtonDefaultSettingsTables: TButton;
    Label1: TLabel;
    tsAll: TTabSheet;
    GroupBoxRound: TGroupBox;
    LabelRound1: TLabel;
    ComboBoxRound: TComboBox;
    LabelRound2: TLabel;
    ButtonDefaultOtherSettings: TButton;
    CheckBoxShowHint: TCheckBox;
    ShapeSelectRowUnfocusedTable: TShape;
    LabelSelectRowUnfocusedTable: TLabel;
    chkAutoCreateEstimates: TCheckBox;
    chkAutoExpandTreeEstimates: TCheckBox;
    chkCalcResourcesAutoSave: TCheckBox;
    chkAutoSaveCalcResourcesAfterExitCell: TCheckBox;
    qrOXROPR: TFDQuery;
    dsOXROPR: TDataSource;
    qrMainData: TFDQuery;
    dsMainData: TDataSource;
    dlgFont1: TFontDialog;
    grp1: TGroupBox;
    lblFontRow: TLabel;
    lblFontControls: TLabel;
    lblFontText: TLabel;
    btnExample: TButton;
    edtExample: TEdit;
    tsUpdate: TTabSheet;
    rbInetServer: TRadioButton;
    rbLocalMirror: TRadioButton;
    gbLocalMirrorSettings: TGroupBox;
    edtLocalMirrorPath: TEdit;
    sbOpenDir: TSpeedButton;
    lbMirrorPath: TLabel;
    gbInetServSettings: TGroupBox;
    cbCreateLocalMirror: TCheckBox;
    edtCreateMirrorPath: TEdit;
    sbOpenDir1: TSpeedButton;
    lbCreateMirrorPath: TLabel;
    tsSmeta: TTabSheet;
    chkAutosaveRateDescr: TCheckBox;
    chkShowNeedSaveDialog: TCheckBox;
    chkFindAutoRepInAllRate: TCheckBox;
    lblOXROPR: TLabel;
    dblkcbbOXROPR: TDBLookupComboBox;
    chkAddRateType1ToLocal: TCheckBox;
    chkAddRateType0ToPNR: TCheckBox;
    chkUseBoldFontForName: TCheckBox;
    chkAutoScrollToNextRow: TCheckBox;
    chkUseOldFormuls: TCheckBox;
    chkAllowObjectDatesChange: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure StringGridDemoDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure ShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure StringGridDemoEnter(Sender: TObject);
    procedure StringGridDemoClick(Sender: TObject);
    procedure StringGridDemoExit(Sender: TObject);
    procedure ButtonDefaultSettingsTablesClick(Sender: TObject);
    procedure ButtonDefaultOtherSettingsClick(Sender: TObject);
    procedure GetSettings;
    procedure StringGridDemoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblFontRowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbInetServerClick(Sender: TObject);
    procedure sbOpenDirClick(Sender: TObject);

  private
    procedure LoadUpdateSettings;
    procedure SaveUpdateSettings;
  public

  end;

const
  CaptionForm = '��������� ���������';

implementation

uses Main, GlobsAndConst, DataModule, System.Win.Registry, System.IniFiles;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.FormShow(Sender: TObject);
var
  i: Integer;
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  ButtonSave.Tag := 0;

  GetSettings;
  CloseOpen(qrMainData);
  CloseOpen(qrOXROPR);

  // ����������� ���������������� �������
  with StringGridDemo do
  begin
    ColCount := 4;
    RowCount := 11;

    FixedCols := 0;
    FixedRows := 1;

    ColWidths[0] := 40;
    ColWidths[2] := 80;
    ColWidths[3] := 50;
    ColWidths[1] := Width - ColWidths[0] - ColWidths[2] - ColWidths[3] - GetSystemMetrics(SM_CXVSCROLL) - 9;

    Cells[0, 0] := '� �/�';
    Cells[1, 0] := '������������';
    Cells[2, 0] := '���-��';
    Cells[3, 0] := '�������';

    for i := 1 to RowCount - 1 do
    begin
      Cells[0, i] := IntToStr(i);
      Cells[1, i] := '�������� ' + IntToStr(i);
      Cells[2, i] := IntToStr(Random(100));

      if StrToInt(Cells[2, i]) > 50 then
        Cells[3, i] := '��'
      else
      begin
        Cells[2, i] := '0';
        Cells[3, i] := '���';
      end;
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ButtonSave.Tag = 0 then
    if MessageBox(0, PChar('�� ������� ��� ������ ����� ��� ����������?'), CaptionForm,
      MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
      CanClose := True
    else
      CanClose := False;
end;

procedure TFormProgramSettings.FormCreate(Sender: TObject);
begin
  inherited;
  pcSettings.ActivePageIndex := 0;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.StringGridDemoClick(Sender: TObject);
begin
  with (Sender as TStringGrid) do
    Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.StringGridDemoDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  // ��� ��� �������� ������� DefaultDrawing ��������� (����� ������ ������� ����� �������� ���������� ������)
  // ���������� ������ ������������� ����� � ��� ������ �������

  with (Sender as TStringGrid) do
  begin
    Canvas.Font.Size := lblFontRow.Font.Size;
    Canvas.Font.Name := lblFontRow.Font.Name;
    Canvas.Font.Style := lblFontRow.Font.Style;
    // ���������� ����� �������
    if (ARow = 0) or (ACol = 0) then
    begin
      Canvas.Brush.Color := ShapeBackgroundHead.Brush.Color;
      Canvas.Font.Color := ShapeFontHead.Brush.Color;
    end
    else // ���������� ���� ��������� �����
    begin
      Canvas.Brush.Color := ShapeBackgroundRows.Brush.Color;
      Canvas.Font.Color := ShapeFontRows.Brush.Color;
    end;

    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 3, Rect.Top + 3, Cells[ACol, ARow]);

    // ���� ������� � ������ � ������ �� ����� ������ ������
    if Focused and (Row = ARow) and (Row > 0) and (ACol > 0) then
    begin
      if gdFocused in State then // ������ � ������
      begin
        Canvas.Brush.Color := ShapeBackgroundSelectCell.Brush.Color;
        Canvas.Font.Color := ShapeFontSelectCell.Brush.Color;
      end
      else // ������ �� � ������
      begin
        Canvas.Brush.Color := ShapeBackgroundSelectRow.Brush.Color;
        Canvas.Font.Color := ShapeFontSelectRow.Brush.Color;
      end;

      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left + 3, Rect.Top + 3, Cells[ACol, Row]);
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.StringGridDemoEnter(Sender: TObject);
begin
  with (Sender as TStringGrid) do
    Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.StringGridDemoExit(Sender: TObject);
begin
  with (Sender as TStringGrid) do
    Repaint;
end;

procedure TFormProgramSettings.StringGridDemoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  with (Sender as TStringGrid) do
    Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.ShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button <> mbLeft then
    Exit;

  if ColorDialog.Execute then
  begin
    with (Sender as TShape) do
      Brush.Color := ColorDialog.Color;

    StringGridDemo.Repaint;
  end;
end;

procedure TFormProgramSettings.sbOpenDirClick(Sender: TObject);
var
  DirStr: string;
  TmpType: Byte;
begin
  TmpType := TComponent(Sender).Tag;

  if TmpType = 0 then
    DirStr := edtCreateMirrorPath.Text
  else
    DirStr := edtLocalMirrorPath.Text;

  if GetDirDialog(DirStr) then
    if TmpType = 0 then
      edtCreateMirrorPath.Text := DirStr
    else
      edtLocalMirrorPath.Text := DirStr;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.ButtonDefaultSettingsTablesClick(Sender: TObject);
var
  Path: string;
  IFile: TIniFile;
begin
  try
    // �������� ���� �� �����
    Path := ExtractFilePath(Application.ExeName) + FileDefaultProgramSettings;

    // ��������� ����
    IFile := TIniFile.Create(Path);

    with IFile do
    begin
      ShapeBackgroundHead.Brush.Color := ReadInteger('Tables', BackgroundHead, 14410967);
      ShapeFontHead.Brush.Color := ReadInteger('Tables', FontHead, 0);
      ShapeBackgroundRows.Brush.Color := ReadInteger('Tables', BackgroundRows, 16777215);
      ShapeFontRows.Brush.Color := ReadInteger('Tables', FontRows, 0);
      ShapeBackgroundSelectRow.Brush.Color := ReadInteger('Tables', BackgroundSelectRow, 5197647);
      ShapeFontSelectRow.Brush.Color := ReadInteger('Tables', FontSelectRow, 16777215);
      ShapeBackgroundSelectCell.Brush.Color := ReadInteger('Tables', BackgroundSelectCell, 2039583);
      ShapeFontSelectCell.Brush.Color := ReadInteger('Tables', FontSelectCell, 16777215);
      ShapeSelectRowUnfocusedTable.Brush.Color := ReadInteger('Tables', SelectRowUnfocusedTable, -16777201);
      lblFontRow.Font.Name := 'Tahoma';
      lblFontRow.Font.Size := 8;
      lblFontRow.Font.Style := [];
      lblFontControls.Font.Name := 'Tahoma';
      lblFontControls.Font.Size := 8;
      lblFontControls.Font.Style := [];
      lblFontText.Font.Name := 'Tahoma';
      lblFontText.Font.Size := 8;
      lblFontText.Font.Style := [];
    end;
  finally
    FreeAndNil(IFile); // ������� �������� ���� �� ������
    btnExample.Font := lblFontControls.Font;
    edtExample.Font := lblFontText.Font;
  end;

  StringGridDemo.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.ButtonDefaultOtherSettingsClick(Sender: TObject);
var
  Path: string;
  IFile: TIniFile;
begin
  try
    // �������� ���� �� �����
    Path := ExtractFilePath(Application.ExeName) + FileDefaultProgramSettings;

    // ��������� ����
    IFile := TIniFile.Create(Path);

    with IFile do
    begin
      ComboBoxRound.ItemIndex := ReadInteger('Round', vRoundTo, 0);
      CheckBoxShowHint.Checked := ReadBool('ShowHint', vShowHint, True);
    end;
  finally
    FreeAndNil(IFile); // ������� �������� ���� �� ������
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.ButtonSaveClick(Sender: TObject);
begin
  PS.BackgroundHead := ShapeBackgroundHead.Brush.Color;
  PS.FontHead := ShapeFontHead.Brush.Color;
  PS.BackgroundRows := ShapeBackgroundRows.Brush.Color;
  PS.FontRows := ShapeFontRows.Brush.Color;
  PS.BackgroundSelectRow := ShapeBackgroundSelectRow.Brush.Color;
  PS.FontSelectRow := ShapeFontSelectRow.Brush.Color;
  PS.BackgroundSelectCell := ShapeBackgroundSelectCell.Brush.Color;
  PS.FontSelectCell := ShapeFontSelectCell.Brush.Color;
  PS.SelectRowUnfocusedTable := ShapeSelectRowUnfocusedTable.Brush.Color;
  PS.AutoCreateEstimates := chkAutoCreateEstimates.Checked;
  PS.AutoExpandTreeEstimates := chkAutoExpandTreeEstimates.Checked;
  PS.RoundTo := ComboBoxRound.ItemIndex;
  PS.CalcResourcesAutoSave := chkCalcResourcesAutoSave.Checked;
  PS.ShowHint := CheckBoxShowHint.Checked;
  PS.AutosaveRateDescr := chkAutosaveRateDescr.Checked;
  PS.AutoSaveCalcResourcesAfterExitCell := chkAutoSaveCalcResourcesAfterExitCell.Checked;
  PS.ShowNeedSaveDialog := chkShowNeedSaveDialog.Checked;
  PS.FindAutoRepInAllRate := chkFindAutoRepInAllRate.Checked;
  PS.AddRateType1ToLocal := chkAddRateType1ToLocal.Checked;
  PS.AddRateType0ToPNR := chkAddRateType0ToPNR.Checked;
  PS.UseBoldFontForName := chkUseBoldFontForName.Checked;
  PS.AutoScrollToNextRow := chkAutoScrollToNextRow.Checked;
  PS.UseOldFormuls := chkUseOldFormuls.Checked;
  PS.AllowObjectDatesChange := chkAllowObjectDatesChange.Checked;

  G_CALCMODE := Byte(PS.UseOldFormuls);

  PS.GridFontName := lblFontRow.Font.Name;
  PS.GridFontSize := lblFontRow.Font.Size;
  PS.GridFontStyle := Byte(lblFontRow.Font.Style);
  PS.ControlsFontName := lblFontControls.Font.Name;
  PS.ControlsFontSize := lblFontControls.Font.Size;
  PS.ControlsFontStyle := Byte(lblFontControls.Font.Style);
  PS.TextFontName := lblFontText.Font.Name;
  PS.TextFontSize := lblFontText.Font.Size;
  PS.TextFontStyle := Byte(lblFontText.Font.Style);

  FormMain.WriteSettingsToFile(ExtractFilePath(Application.ExeName) + FileProgramSettings);

  SaveUpdateSettings;

  // �������� �����????
  MessageBox(0, PChar('��������� ��������� ����� ���� ��������� ' + sLineBreak +
    '������ ����� ����������� ���������!'), CaptionForm, MB_ICONINFORMATION + mb_OK + mb_TaskModal);

  ButtonSave.Tag := 1;
  if qrMainData.State in [dsEdit, dsInsert] then
    qrMainData.Post;

  ModalResult := mrOk;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormProgramSettings.GetSettings;
begin
  ShapeBackgroundHead.Brush.Color := PS.BackgroundHead;
  ShapeFontHead.Brush.Color := PS.FontHead;
  ShapeBackgroundRows.Brush.Color := PS.BackgroundRows;
  ShapeFontRows.Brush.Color := PS.FontRows;
  ShapeBackgroundSelectRow.Brush.Color := PS.BackgroundSelectRow;
  ShapeFontSelectRow.Brush.Color := PS.FontSelectRow;
  ShapeBackgroundSelectCell.Brush.Color := PS.BackgroundSelectCell;
  ShapeFontSelectCell.Brush.Color := PS.FontSelectCell;
  ShapeSelectRowUnfocusedTable.Brush.Color := PS.SelectRowUnfocusedTable;

  ComboBoxRound.ItemIndex := PS.RoundTo;

  CheckBoxShowHint.Checked := PS.ShowHint;

  chkAutoCreateEstimates.Checked := PS.AutoCreateEstimates;
  chkAutoExpandTreeEstimates.Checked := PS.AutoExpandTreeEstimates;
  chkCalcResourcesAutoSave.Checked := PS.CalcResourcesAutoSave;
  chkAutosaveRateDescr.Checked := PS.AutosaveRateDescr;
  chkAutoSaveCalcResourcesAfterExitCell.Checked := PS.AutoSaveCalcResourcesAfterExitCell;
  chkShowNeedSaveDialog.Checked := PS.ShowNeedSaveDialog;
  chkFindAutoRepInAllRate.Checked := PS.FindAutoRepInAllRate;
  chkAddRateType1ToLocal.Checked := PS.AddRateType1ToLocal;
  chkAddRateType0ToPNR.Checked := PS.AddRateType0ToPNR;
  chkUseBoldFontForName.Checked := PS.UseBoldFontForName;
  chkAutoScrollToNextRow.Checked := PS.AutoScrollToNextRow;
  chkUseOldFormuls.Checked := PS.UseOldFormuls;
  chkAllowObjectDatesChange.Checked := PS.AllowObjectDatesChange;

  lblFontRow.Font.Name := PS.GridFontName;
  lblFontRow.Font.Size := PS.GridFontSize;
  lblFontRow.Font.Style := TFontStyles(PS.GridFontStyle);

  lblFontControls.Font.Name := PS.ControlsFontName;
  lblFontControls.Font.Size := PS.ControlsFontSize;
  lblFontControls.Font.Style := TFontStyles(PS.ControlsFontStyle);

  lblFontText.Font.Name := PS.TextFontName;
  lblFontText.Font.Size := PS.TextFontSize;
  lblFontText.Font.Style := TFontStyles(PS.TextFontStyle);

  LoadUpdateSettings;
end;

procedure TFormProgramSettings.LoadUpdateSettings;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_ALL_ACCESS);
  try
    Reg.RootKey := C_REGROOT;
    if Reg.OpenKey(C_REGKEY + '\' + �_UPD_NAME, True) then
    begin
      if not Reg.ValueExists('UpdateType') then
        Reg.WriteInteger('UpdateType', 0);
      if not Reg.ValueExists('CreateMirror') then
        Reg.WriteBool('CreateMirror', False);
      if not Reg.ValueExists('CreateMirrorPath') then
        Reg.WriteString('CreateMirrorPath', '');
      if not Reg.ValueExists('MirrorPath') then
        Reg.WriteString('MirrorPath', '');

      if Reg.ReadInteger('UpdateType') = 0 then
        rbInetServer.Checked := True
      else
        rbLocalMirror.Checked := True;

      if rbInetServer.Checked then
      begin
        cbCreateLocalMirror.Checked := Reg.ReadBool('CreateMirror');
        edtCreateMirrorPath.Text := Reg.ReadString('CreateMirrorPath');
      end
      else
      begin
        edtLocalMirrorPath.Text := Reg.ReadString('MirrorPath');
      end;
    end
    else
      MessageDlg('Unable to create key!', mtError, mbOKCancel, 0);
  finally
    Reg.CloseKey;
    FreeAndNil(Reg);
  end;
end;

procedure TFormProgramSettings.SaveUpdateSettings;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_ALL_ACCESS);
  try
    Reg.RootKey := C_REGROOT;
    if Reg.OpenKey(C_REGKEY + '\' + �_UPD_NAME, True) then
    begin
      if rbInetServer.Checked then
      begin
        Reg.WriteInteger('UpdateType', 0);
        Reg.WriteBool('CreateMirror', cbCreateLocalMirror.Checked);
        Reg.WriteString('CreateMirrorPath', edtCreateMirrorPath.Text);
        Reg.WriteString('MirrorPath', '');
      end
      else
      begin
        Reg.WriteInteger('UpdateType', 1);
        Reg.WriteBool('CreateMirror', False);
        Reg.WriteString('CreateMirrorPath', '');
        Reg.WriteString('MirrorPath', edtLocalMirrorPath.Text);
      end;
    end
    else
      MessageDlg('Unable to create key!', mtError, mbOKCancel, 0);
  finally
    Reg.CloseKey;
    FreeAndNil(Reg);
  end;
end;

procedure TFormProgramSettings.lblFontRowClick(Sender: TObject);
begin
  dlgFont1.Font := (Sender AS TLabel).Font;
  if dlgFont1.Execute then
  begin
    (Sender AS TLabel).Font := dlgFont1.Font;
    StringGridDemo.Repaint;
  end;
  btnExample.Font := lblFontControls.Font;
  edtExample.Font := lblFontText.Font;
end;

procedure TFormProgramSettings.rbInetServerClick(Sender: TObject);
begin
  gbInetServSettings.Enabled := rbInetServer.Checked;
  cbCreateLocalMirror.Enabled := rbInetServer.Checked;
  edtCreateMirrorPath.Enabled := rbInetServer.Checked;
  sbOpenDir1.Enabled := rbInetServer.Checked;
  lbCreateMirrorPath.Enabled := rbInetServer.Checked;

  gbLocalMirrorSettings.Enabled := rbLocalMirror.Checked;
  edtLocalMirrorPath.Enabled := rbLocalMirror.Checked;
  sbOpenDir.Enabled := rbLocalMirror.Checked;
  lbMirrorPath.Enabled := rbLocalMirror.Checked;

  if (rbLocalMirror.Checked) and (rbLocalMirror.Focused) then
    edtLocalMirrorPath.SetFocus;
end;

end.
