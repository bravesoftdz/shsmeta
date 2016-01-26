unit SmReportData;

interface

uses
  System.SysUtils, System.Classes, DataModule, Main, Tools, GlobsAndConst, ActiveX, ComObj, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Variants;

type
  TdmSmReport = class(TDataModule)
    qrSR: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    ADocument: OleVariant;
    { ������� ��������� ���������� �������:
      ADocument - ��������;
      AWorkSheetParamID - ���� � �����������;
      AParams: TFDDataSet - ������ �������� �� �����, ��������� ��� ��� � ��������� ������
      ���������� True ��� �������� ���������� }
    function loadParams(AParams: TFDDataSet; ADocument: OleVariant; AWorkSheetParamID: Integer): Boolean;
    { ������� �������� ���������
      AFileName - ���� � ��������� �� �����
      ���������� ADocument ��� �������� ���������� }
    function loadDocument(AFileName: string): OleVariant;
    { ������� �������� ���������
      ADocument - ��������;
      ASaveChanges - ��������� �� ���������
      ���������� True ��� �������� ���������� }
    function closeDocument(ADocument: OleVariant; ASaveChanges: Boolean = False): Boolean;
    function showDocument(ADocument: OleVariant): Boolean;
    function test(AFileName: string; SM_ID: Integer): Boolean;
    procedure doCreateDoc;
  end;

var
  dmSmReport: TdmSmReport;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

function TdmSmReport.closeDocument(ADocument: OleVariant; ASaveChanges: Boolean = False): Boolean;
begin
  Result := False;
  try
    ADocument.DisplayAlerts := False;
    ADocument.ActiveWorkbook.Close(SaveChanges := ASaveChanges);
    ADocument.Application.Quit;
    ADocument := Unassigned;
    Result := True;
  except
    on E: Exception do
    begin

    end;
  end;
end;

procedure TdmSmReport.DataModuleCreate(Sender: TObject);
begin
  // doCreateDoc;
  ADocument := Null;
end;

procedure TdmSmReport.doCreateDoc;
begin
  // TODO ��� �� ���� � ����� ��������� � ������ �������...
  try
    if not(VarIsNull(ADocument)) then
      Exit;

    ADocument := CreateOleObject('Excel.Application');
    ADocument.Application.EnableEvents := False;
    ADocument.DisplayAlerts := False;
  except

  end;
end;

function TdmSmReport.loadDocument(AFileName: string): OleVariant;
var
  WorkBook: OleVariant;
begin
  Result := Null;
  try
    if VarIsNull(ADocument) then
    begin
      // ������� ����� ������
      ADocument := CreateOleObject('Excel.Application');
      ADocument.Application.EnableEvents := False;
      ADocument.DisplayAlerts := False;
    end;

    //if not ADocument.ActiveWorkbook then
    //ADocument.ActiveWorkbook.Close(SaveChanges := False);
    ADocument.Workbooks.Open(AFileName);

    Result := ADocument;
  except
    on E: Exception do
    begin

    end;
  end;
end;

function TdmSmReport.loadParams(AParams: TFDDataSet; ADocument: OleVariant;
  AWorkSheetParamID: Integer): Boolean;
var
  WorkSheet: OleVariant;
  Rows, i, firstRowID: Integer;
  FData, v: Variant;
  fieldName: string;
begin
  Result := False;
  firstRowID := 2;
  // ���������� ����������
  try
    try
      // �������� ������ �� ����
      WorkSheet := ADocument.ActiveWorkbook.Worksheets[AWorkSheetParamID];
      Rows := WorkSheet.UsedRange.Rows.Count;
      FData := WorkSheet.UsedRange.Value;
      // ������� ������ ��� �������� ����������
      v := VarArrayCreate([firstRowID, Rows, 1, 1], varVariant);
      // ������
      for i := firstRowID to Rows do
      begin
        fieldName := VarToStr(FData[i, 2]);
        // ���� �������� ���������� �� �����������
        if fieldName = '' then
          v[i, 1] := Null
        else
        begin
          if AParams.FindField(fieldName) <> nil then
          begin
            try
              if VarIsNumeric(AParams.FieldByName(fieldName).Value) then
                v[i, 1] := AParams.FieldByName(fieldName).AsFloat
              else
                v[i, 1] := AParams.FieldByName(fieldName).AsString;
            except
              v[i, 1] := AParams.FieldByName(fieldName).AsString;
            end;
          end
          else
            v[i, 1] := Null;
        end;
      end;
      // ������
      WorkSheet.Range['C' + IntToStr(firstRowID) + ':C' + IntToStr(Rows)] := v;
      Result := True;
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    // �����������
    WorkSheet := Unassigned;
  end;
end;

function TdmSmReport.showDocument(ADocument: OleVariant): Boolean;
begin
  Result := False;
  try
    ADocument.Visible := True;
    Result := True;
  except
    on E: Exception do
    begin

    end;
  end;
end;

function TdmSmReport.test(AFileName: string; SM_ID: Integer): Boolean;
var
  doc: OleVariant;
begin
  Result := False;
  try
    doc := loadDocument(AFileName);
    // qrSR.Active := False;
    // qrSR.ParamByName('SM_ID').Value := SM_ID;
    // qrSR.Active := True;
    // loadParams(qrSR, doc, 5);
    showDocument(doc);
    // closeDocument(doc);
    Result := True;
  except
    on E: Exception do
    begin

    end;
  end;
end;

initialization

ReportMemoryLeaksOnShutdown := False;

end.
