unit SmReportParamSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tools, Main, DataModule, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons;

type
  TfSmReportParamSelect = class(TSmForm)
    pnlBot: TPanel;
    grParamList: TJvDBGrid;
    qrParamList: TFDQuery;
    dsParamList: TDataSource;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    pnlTop: TPanel;
    edtSearch: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure grParamListDblClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grParamListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
    class function Select(AListIDorListName, ACodeLocate: Variant; MultiSelect: Boolean = False): Variant;
  end;

implementation

{$R *.dfm}

procedure TfSmReportParamSelect.edtSearchChange(Sender: TObject);
begin
  qrParamList.Filter := 'UPPER(VALUE) LIKE UPPER(''%' + Trim(edtSearch.Text) + '%'')';
  qrParamList.Filtered := True;
end;

procedure TfSmReportParamSelect.FormCreate(Sender: TObject);
begin
  // InitParams[0] - ��� ������ REPORT_LIST_SQL_ID/������, �������� ������
  // InitParams[1] - CODE ��� �������
  if VarIsNumeric(InitParams[0]) then
  begin
    qrParamList.SQL.Text :=
      VarToStr(FastSelectSQLOne('SELECT REPORT_LIST_SQL_SRC FROM report_list_sql WHERE REPORT_LIST_SQL_ID=:0',
      VarArrayOf([InitParams[0]])));
    grParamList.Columns[0].Title.Caption :=
      VarToStrDef(FastSelectSQLOne
      ('SELECT REPORT_LIST_SQL_DESCR FROM report_list_sql WHERE REPORT_LIST_SQL_ID=:0',
      VarArrayOf([InitParams[0]])), '  ');
    qrParamList.Active := True;
  end
  else
  begin
    qrParamList.SQL.Text :=
      VarToStr(FastSelectSQLOne
      ('SELECT REPORT_LIST_SQL_SRC FROM report_list_sql WHERE TRIM(UPPER(REPORT_LIST_SQL_NAME))=TRIM(UPPER(:0)) LIMIT 1',
      VarArrayOf([InitParams[0]])));
    grParamList.Columns[0].Title.Caption :=
      VarToStrDef(FastSelectSQLOne
      ('SELECT REPORT_LIST_SQL_DESCR FROM report_list_sql WHERE TRIM(UPPER(REPORT_LIST_SQL_NAME))=TRIM(UPPER(:0)) LIMIT 1',
      VarArrayOf([InitParams[0]])), '  ');
    qrParamList.Active := True;
  end;
  if not VarIsNull(InitParams[1]) then
    qrParamList.Locate('CODE', InitParams[1], []);
end;

procedure TfSmReportParamSelect.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ActiveControl = edtSearch then
    case Key of
      VK_UP:
        qrParamList.Prior;
      VK_DOWN:
        qrParamList.Next;
    end;
end;

procedure TfSmReportParamSelect.grParamListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSmReportParamSelect.grParamListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ActiveControl := edtSearch;
end;

class function TfSmReportParamSelect.Select(AListIDorListName, ACodeLocate: Variant;
  MultiSelect: Boolean = False): Variant;
// ������� ������ �������� �� ������
// AFromListID - REPORT_LIST_SQL_ID - ��� ������
// ACodeLocate - CODE ��� �������
// ������� ������ [0..1] = [CODE, VALUE] ���������� ��������
var
  form: TfSmReportParamSelect;
begin
  Result := Null;
  form := TfSmReportParamSelect.Create(nil, VarArrayOf([AListIDorListName, ACodeLocate]));
  try
    if form.ShowModal = mrOk then
    begin
      if MultiSelect then
      begin
        // TODO ����� � ��������������
      end
      else
        Result := VarArrayOf([form.qrParamList.FieldByName('CODE').Value,
          form.qrParamList.FieldByName('VALUE').Value]);
    end;
  finally
    FreeAndNil(form);
  end;
end;

end.
