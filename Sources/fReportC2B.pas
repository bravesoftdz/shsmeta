unit fReportC2B;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.StdCtrls, Tools, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Samples.Spin;

type
  TFormReportC2B = class(TSmForm)
    pnlObject: TPanel;
    gbObject: TGroupBox;
    qrObject: TFDQuery;
    dsObject: TDataSource;
    lbObjContNum: TLabel;
    lbObjContDate: TLabel;
    lbObjName: TLabel;
    ActionList1: TActionList;
    actObjectUpdate: TAction;
    cbObjName: TDBLookupComboBox;
    btnObjInfo: TSpeedButton;
    pcReportType: TPageControl;
    tsRepObj: TTabSheet;
    tsRepAct: TTabSheet;
    pnlRepObj: TPanel;
    Bevel1: TBevel;
    lbDateSmetDocTitle: TLabel;
    lbDateBegStrojTitle: TLabel;
    lbDateSmetDoc: TLabel;
    lbDateBegStroj: TLabel;
    lbSrokStrojTitle: TLabel;
    lbDateEndStrojTitle: TLabel;
    lbSrokStroj: TLabel;
    lbDateEndStroj: TLabel;
    edtObjContNum: TEdit;
    edtObjContDate: TEdit;
    pnlRepObjDate: TPanel;
    lbShowTypeTitle: TLabel;
    cbShowType: TComboBox;
    lbRepObjDataTitle: TLabel;
    pnlRepAct: TPanel;
    pnlRepActDate: TPanel;
    lbRepActTitle: TLabel;
    cbRepObjMonth: TComboBox;
    seRepObjYear: TSpinEdit;
    tsRegActs: TTabSheet;
    qrActs: TFDQuery;
    dsActs: TDataSource;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actObjectUpdateUpdate(Sender: TObject);
    procedure btnObjInfoClick(Sender: TObject);
    procedure cbObjNameClick(Sender: TObject);
  private const
    CaptionButton = '����� �2-�';
    HintButton = '���� ������ �2-�';
  private
    FOwnPanelButton: TSpeedButton;
    FOwnPointer: Pointer;
    FObjectID: Integer;
    { Private declarations }
  public
    procedure OwnPanelButtonClick;
    destructor Destroy; override;
    property OwnPointer: Pointer read FOwnPointer write FOwnPointer;
    property ObjectID: Integer read FObjectID write FObjectID;
  end;

var
  FormReportC2B: TFormReportC2B;

implementation

uses
  System.DateUtils, Main, DataModule, CardObject, GlobsAndConst;

{$R *.dfm}

procedure TFormReportC2B.actObjectUpdateUpdate(Sender: TObject);
begin
  edtObjContNum.Enabled :=  cbObjName.KeyValue <> null;
  edtObjContDate.Enabled :=  cbObjName.KeyValue <> null;
  btnObjInfo.Enabled :=  cbObjName.KeyValue <> null;
end;

procedure TFormReportC2B.btnObjInfoClick(Sender: TObject);
var fCardObject: TfCardObject;
begin
  fCardObject := TfCardObject.Create(Self);
  try
    fCardObject.IdObject := qrObject.FieldByName('obj_id').AsInteger;
    if fCardObject.ShowModal = mrOk then
      CloseOpen(qrObject, True);
  finally
    FreeAndNil(fCardObject);
  end;
end;

procedure TFormReportC2B.cbObjNameClick(Sender: TObject);
var TmpDate: TDateTime;
begin
  if not VarIsNull(cbObjName.KeyValue) then
  begin
    TmpDate := qrObject.FieldByName('beg_stroj').AsDateTime;
    if TmpDate > 1000 then
      lbDateSmetDoc.Caption := arraymes[MonthOf(TmpDate)][1] + ' ' +
        IntToStr(YearOf(TmpDate)) + '�.'
    else
      lbDateSmetDoc.Caption := '---';

    TmpDate := qrObject.FieldByName('beg_stroj2').AsDateTime;
    if TmpDate > 1000 then
      lbDateBegStroj.Caption :=arraymes[MonthOf(TmpDate)][1] + ' ' +
        IntToStr(YearOf(TmpDate)) + '�.'
    else
      lbDateBegStroj.Caption := '---';

    TmpDate := IncMonth(qrObject.FieldByName('beg_stroj2').AsDateTime,
      qrObject.FieldByName('srok_stroj').AsInteger);
    lbSrokStroj.Caption := IntToStr(qrObject.FieldByName('srok_stroj').AsInteger);
    if TmpDate > 1000 then
      lbDateEndStroj.Caption := arraymes[MonthOf(TmpDate)][1] + ' ' +
        IntToStr(YearOf(TmpDate)) + '�.'
    else
      lbDateEndStroj.Caption := '---';

    edtObjContNum.Text := qrObject.FieldByName('num_dog').AsString;
    edtObjContDate.Text := qrObject.FieldByName('date_dog').AsString;
  end
  else
  begin
    lbDateSmetDoc.Caption := '---';
    lbDateBegStroj.Caption := '---';
    lbSrokStroj.Caption := '---';
    lbDateEndStroj.Caption := '---';
    edtObjContNum.Text := '';
    edtObjContDate.Text := '';
  end;
end;

destructor TFormReportC2B.Destroy;
begin
  inherited;
  if Assigned(FOwnPointer) then
    Pointer(FOwnPointer^) := nil;
end;

procedure TFormReportC2B.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormReportC2B.FormCreate(Sender: TObject);
begin
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 30;
  Left := 30;
  WindowState := wsMaximized;
  // ������ ������ �� ����� ���� (�� ������� ����� �����)
  FOwnPanelButton :=
    FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self, 1);

  if not qrObject.Active then
    qrObject.Active := True;

  if FObjectID > 0 then
    qrObject.Locate('obj_id', FObjectID, []);

  cbObjName.KeyValue := qrObject.FieldByName('obj_id').Value;
  cbObjName.OnClick(cbObjName);
end;

procedure TFormReportC2B.FormDestroy(Sender: TObject);
begin
  // ������� ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

procedure TFormReportC2B.OwnPanelButtonClick;
begin
  if Assigned(FOwnPanelButton) then
    FOwnPanelButton.OnClick(FOwnPanelButton);
end;

end.
