unit ForemanList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.DBCtrls, JvComponentBase, JvFormPlacement, Tools, Vcl.StdCtrls, Vcl.Buttons;

type
  TfForemanList = class(TForm)
    grMain: TJvDBGrid;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    dbnvgr1: TDBNavigator;
    FormStorage: TJvFormStorage;
    qrMainforeman_id: TFDAutoIncField;
    strngfldMainforeman_name: TStringField;
    strngfldMainforeman_first_name: TStringField;
    strngfldMainforeman_second_name: TStringField;
    qrMainNUMPP: TIntegerField;
    pnlSelect: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMainCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Kind: TKindForm;
    OutValue: Integer;
  end;

var
  fForemanList: TfForemanList;

implementation

{$R *.dfm}

uses Main, DataModule;

procedure TfForemanList.btn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfForemanList.btn2Click(Sender: TObject);
begin
  OutValue := 0;
  if not qrMain.IsEmpty then
    OutValue := qrMain.FieldByName('foreman_id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfForemanList.FormActivate(Sender: TObject);
begin
  // ���� ������ ������� Ctrl � �������� �����, �� ������
  // �������������� � ��������� ���� ����� �� �������� ����
  FormMain.CascadeForActiveWindow;
  // ������ ������� ������ �������� ����� (�� ������� ����� �����)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfForemanList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfForemanList.FormCreate(Sender: TObject);
begin
  Kind := kdNone;
  // ������ ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  LoadDBGridSettings(grMain);
  CloseOpen(qrMain);
end;

procedure TfForemanList.FormDestroy(Sender: TObject);
begin
  // ������� ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.DeleteButtonCloseWindow(Caption);
  fForemanList := nil;
end;

procedure TfForemanList.FormShow(Sender: TObject);
begin
  pnlSelect.Visible := Kind in [kdSelect];
end;

procedure TfForemanList.grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfForemanList.qrMainCalcFields(DataSet: TDataSet);
begin
  qrMainNUMPP.Value := qrMain.RecNo;
end;

end.
