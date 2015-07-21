unit FileStorage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.ComCtrls, JvExComCtrls, JvDBTreeView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ImgList, Vcl.DBCtrls,
  JvDBControls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfFileStorage = class(TForm)
    qrTreeData: TFDQuery;
    dsTreeData: TDataSource;
    tvDocuments: TJvDBTreeView;
    FormStorage: TJvFormStorage;
    il1: TImageList;
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    dbedtdoc_name: TDBEdit;
    dbedtdoc_path: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TBitBtn;
    btnSelect: TBitBtn;
    btn3: TBitBtn;
    btn4: TSpeedButton;
    dbchkdoc_use_owner_path: TDBCheckBox;
    btnAdd: TSpeedButton;
    btnDelete: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure qrTreeDataAfterScroll(DataSet: TDataSet);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // ������� ��������� ��������, ���� � AData ��������� ���� doc_id, ����� - ���������� ��������� ��� ����
function RunDocument(const AData: TDataSet; const AShowLinkDialogIfEmpty: Boolean = True;
  const AField: string = 'doc_id'): Variant;

var
  fFileStorage: TfFileStorage;
  SelectedDocument: Variant;

implementation

{$R *.dfm}

uses Main, DataModule, Tools;

function RunDocument(const AData: TDataSet; const AShowLinkDialogIfEmpty: Boolean = True;
  const AField: string = 'doc_id'): Variant;
begin
  Result := null;
  // ���� �������� �����, �� �������
  if not CheckQrActiveEmpty(AData) then
    Exit;
  // ���� ���� ������ ����
  if AData.FindField(AField) = nil then
  begin
    Application.MessageBox('��������� �������� �� ����� ����� ����� � ���������� � ���������!',
      '�������� ���������', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
    Exit;
  end;
  // ���� ��������� �������� �� ���������
  if (AData.FieldByName(AField).AsInteger = 0) and AShowLinkDialogIfEmpty then
  begin
    case Application.MessageBox('��������� ������ �� ������� �� � ����� �� ���������� �� ��������.' + #13#10 +
      '���������� �������� ������ ��� ������������� ���������?', '�������� ���������',
      MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) of
      IDYES:
        begin
          SelectedDocument := null;
          // ������� ����� ������ ���������
          if (not Assigned(fFileStorage)) then
            fFileStorage := TfFileStorage.Create(nil);
          fFileStorage.btnSelect.Visible := True;
          if fFileStorage.ShowModal = mrOk then
            Result := SelectedDocument;
          Exit;
        end;
      IDNO:
        begin
          Exit;
        end;
    end;
  end
  else if AData.FieldByName(AField).AsInteger <> 0 then



end;

procedure TfFileStorage.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfFileStorage.btnSelectClick(Sender: TObject);
begin
  qrTreeData.CheckBrowseMode;
  SelectedDocument := qrTreeData.FieldByName('doc_id').Value;
end;

procedure TfFileStorage.btn3Click(Sender: TObject);
begin
  Exec(qrTreeData.FieldByName('doc_path').AsString);
end;

procedure TfFileStorage.btnAddClick(Sender: TObject);
var
  parent_id: Integer;
begin
  parent_id := qrTreeData.FieldByName('doc_id').AsInteger;
  qrTreeData.Insert;
  qrTreeData.FieldByName('doc_name').AsString := '��������� ������';
  qrTreeData.FieldByName('parent_id').AsInteger := parent_id;
  qrTreeData.Post;
  qrTreeData.Locate('doc_id', parent_id, []);
end;

procedure TfFileStorage.btnDeleteClick(Sender: TObject);
begin
  qrTreeData.Delete;
end;

procedure TfFileStorage.FormActivate(Sender: TObject);
begin
  // ���� ������ ������� Ctrl � �������� �����, �� ������
  // �������������� � ��������� ���� ����� �� �������� ����
  FormMain.CascadeForActiveWindow;
  // ������ ������� ������ �������� ����� (�� ������� ����� �����)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfFileStorage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfFileStorage.FormCreate(Sender: TObject);
begin
  // ������ ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  CloseOpen(qrTreeData);
end;

procedure TfFileStorage.FormDestroy(Sender: TObject);
begin
  // ������� ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.DeleteButtonCloseWindow(Caption);
  fFileStorage := nil;
end;

procedure TfFileStorage.qrTreeDataAfterScroll(DataSet: TDataSet);
begin
  btnDelete.Enabled := qrTreeData.FieldByName('parent_id').AsInteger <> 0;
end;

end.
