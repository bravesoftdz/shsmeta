unit ImportExportModule;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils, System.UITypes, System.Variants,
  Winapi.Windows, Vcl.Forms, Vcl.Dialogs, Vcl.Controls, Data.DB, XMLIntf, XMLDoc,
  ActiveX, FireDAC.Comp.DataSet, FireDAC.Comp.Client, GlobsAndConst;

type
  TFromRateRec = record
    LocalType,
    DataType,
    OldId,
    NewId: Integer;
  end;
  TFromRateArray = array of TFromRateRec;

  procedure ImportObject(const AFileName: string);
  procedure ExportObject(const AIdObject: Integer; const AFileName: string);
  function PasteSmetaRow(const ASmClipArray: array of TSmClipRec;
    ADestSmID, AIterator: Integer): Boolean;
  function GetCopySmeta(const ASoursSmetaID: Integer): boolean;

implementation

uses DataModule, Tools;

////////////////////////////////////////////////////////////////////////////////
function GetNewId(const ALastID: Variant; const AType: Integer;
  var AIdConvert: TIDConvertArray): Variant;
var i: Integer;
   { TabName,
    FieldName: string; }
begin

  if VarIsNull(ALastID) or (ALastID = 0) then
  begin
    Result := ALastID;
    Exit;
  end;

  //������ ����������� �� ������� ����� ID
  for i := 0 to Length(AIdConvert[AType][0]) - 1 do
    if AIdConvert[AType][0][i] = ALastID then
    begin
      Result := AIdConvert[AType][1][i];
      Exit;
    end;


  DM.qrDifferent2.Active := False;
  DM.qrDifferent2.SQL.Text := 'SELECT GetNewID(:IDType)';
  DM.qrDifferent2.ParamByName('IDType').Value := AType;
  DM.qrDifferent2.Active := True;
  if not DM.qrDifferent2.IsEmpty then
    Result := DM.qrDifferent2.Fields[0].AsInteger
  else
    raise Exception.Create('�� ������� �������� ����� ID.');

  SetLength(AIdConvert[AType][0], Length(AIdConvert[AType][0]) + 1);
  SetLength(AIdConvert[AType][1], Length(AIdConvert[AType][1]) + 1);

  AIdConvert[AType][0][Length(AIdConvert[AType][0]) - 1] := ALastID;
  AIdConvert[AType][1][Length(AIdConvert[AType][1]) - 1] := Result;
end;

//��������� ������ �������
function GetQueryStr(AQuery: TFDQuery; ATabName: string): string;
var i: Integer;
    As1, As2: string;
begin
  As1 := '';
  As2 := '';
  for i := 0 to AQuery.Fields.Count - 1 do
  begin
    if As1 <> '' then As1 := As1 + ',';
    if As2 <> '' then As2 := As2 + ',';

    As1 := As1 + AQuery.Fields[i].FieldName;
    As2 := As2 + ':' + AQuery.Fields[i].FieldName;
  end;
  Result := 'Insert into ' + ATabName + ' (' + As1 + ') values (' + As2 + ')';
end;

////////////////////////////////////////////////////////////////////////////////
procedure ImportObject(const AFileName: string);
var XML : IXMLDocument;
    CurNode, Node1, Node2: IXMLNode;
    i, j: Integer;
    IdConvert: TIDConvertArray;
    ds: char;
    AutoCommitValue: Boolean;

  procedure GetStrAndExcec(ANode: IXMLNode; ATabName: string);
  var i: Integer;
      As1, As2: string;
  begin
    As1 := '';
    As2 := '';
    for i := 0 to ANode.ChildNodes.Count - 1 do
    begin
      if As1 <> '' then As1 := As1 + ',';
      if As2 <> '' then As2 := As2 + ',';

      As1 := As1 + ANode.ChildNodes.Nodes[i].NodeName;
      As2 := As2 + ':' + ANode.ChildNodes.Nodes[i].NodeName;
    end;

    DM.qrDifferent.SQL.Text := 'Insert into ' + ATabName +
      ' (' + As1 + ') values (' + As2 + ')';
    for i := 0 to ANode.ChildNodes.Count - 1 do
      DM.qrDifferent.ParamByName(ANode.ChildNodes.Nodes[i].NodeName).Value :=
        ANode.ChildNodes.Nodes[i].NodeValue;
    DM.qrDifferent.ExecSQL;
  end;

begin
  for i := 1 to Length(IdConvert) do
  begin
    SetLength(IdConvert[i][0], 0);
    SetLength(IdConvert[i][1], 0);
  end;

  CoInitialize(nil);

  AutoCommitValue :=DM.qrDifferent.Transaction.Options.AutoCommit;
  DM.qrDifferent.Transaction.Options.AutoCommit := False;
  DM.qrDifferent.Active := False;

  ds := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';
  DM.qrDifferent.Transaction.StartTransaction;
  try
    try
      XML := TXMLDocument.Create(nil);
      XML.LoadFromFile(AFileName);
      //�������� �������
      Node1 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Data_object');

      if Pos(',', VarToStr(Node1.ChildNodes.Nodes['PER_CONTRACTOR'].NodeValue)) > 0 then
      begin
        raise Exception.Create('�������(,) �������� ����������� ������� �����');
      end;

      Node1.ChildNodes.Nodes['OBJ_ID'].NodeValue :=
        GetNewId(Node1.ChildNodes.Nodes['OBJ_ID'].NodeValue, C_ID_OBJ, IdConvert);
      GetStrAndExcec(Node1, 'objcards');
      Node1 := nil;

      //�������� ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smety');
      for j := 0 to Node2.ChildNodes.Count - 1 do
      begin
        Node1 := Node2.ChildNodes.Nodes[j];
        //������ ID������
        Node1.ChildNodes.Nodes['SM_ID'].NodeValue :=
          GetNewId(Node1.ChildNodes.Nodes['SM_ID'].NodeValue, C_ID_SM, IdConvert);
        Node1.ChildNodes.Nodes['OBJ_ID'].NodeValue :=
          GetNewId(Node1.ChildNodes.Nodes['OBJ_ID'].NodeValue, C_ID_OBJ, IdConvert);
        Node1.ChildNodes.Nodes['PARENT_ID'].NodeValue :=
          GetNewId(Node1.ChildNodes.Nodes['PARENT_ID'].NodeValue, C_ID_SM, IdConvert);

        GetStrAndExcec(Node1, 'smetasourcedata');
        Node1 := nil;
      end;
      Node2 := nil;

      //�������� Object_suppagreement
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Object_suppagreement');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];

          Node1.ChildNodes.Nodes['supp_agreement_id'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['supp_agreement_id'].NodeValue, C_ID_SUPPAG, IdConvert);
          Node1.ChildNodes.Nodes['OBJ_ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['OBJ_ID'].NodeValue, C_ID_OBJ, IdConvert);

          GetStrAndExcec(Node1, 'supp_agreement');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� �������� ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_Rates');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMRAT, IdConvert);

          GetStrAndExcec(Node1, 'card_rate');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ���������� ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_Materials');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMMAT, IdConvert);
          Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue, C_ID_SMRAT, IdConvert);
          Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue, C_ID_SMMAT, IdConvert);

          GetStrAndExcec(Node1, 'materialcard');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ���������� ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_Mechanizms');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMMEC, IdConvert);
          Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue, C_ID_SMRAT, IdConvert);
          Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue, C_ID_SMMEC, IdConvert);

          GetStrAndExcec(Node1, 'mechanizmcard');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ������������ ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_Devices');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMDEV, IdConvert);

          GetStrAndExcec(Node1, 'devicescard');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ������ ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_Dumps');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMDUM, IdConvert);

          GetStrAndExcec(Node1, 'dumpcard');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ���������� ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_Transps');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMTR, IdConvert);

          GetStrAndExcec(Node1, 'transpcard');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Data_estimate ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_calculation_coef');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['calculation_coef_id'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['calculation_coef_id'].NodeValue, C_ID_SMCOEF, IdConvert);
          Node1.ChildNodes.Nodes['id_estimate'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['id_estimate'].NodeValue, C_ID_SM, IdConvert);

          i := 0;
          case Node1.ChildNodes.Nodes['id_type_data'].NodeValue of
            1: i := C_ID_SMRAT;
            2: i := C_ID_SMMAT;
            3: i := C_ID_SMMEC;
            4: i := C_ID_SMDEV;
            5: i := C_ID_SMDUM;
            6, 7, 8, 9: i := C_ID_SMTR;
          end;

          if i > 0  then
            Node1.ChildNodes.Nodes['id_owner'].NodeValue :=
              GetNewId(Node1.ChildNodes.Nodes['id_owner'].NodeValue, i, IdConvert);

          Node1.ChildNodes.Nodes['id_coef'].NodeValue := null;

          GetStrAndExcec(Node1, 'calculation_coef');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Acts');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID_OBJECT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_OBJECT'].NodeValue, C_ID_OBJ, IdConvert);

          GetStrAndExcec(Node1, 'card_acts');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� �������� �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_Rates');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMRAT, IdConvert);

          GetStrAndExcec(Node1, 'card_rate_act');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ���������� �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_Materials');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMMAT, IdConvert);
          Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue, C_ID_SMRAT, IdConvert);
          Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue, C_ID_SMMAT, IdConvert);

          GetStrAndExcec(Node1, 'materialcard_act');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ���������� �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_Mechanizms');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMMEC, IdConvert);
          Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_CARD_RATE'].NodeValue, C_ID_SMRAT, IdConvert);
          Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_REPLACED'].NodeValue, C_ID_SMMEC,IdConvert);

          GetStrAndExcec(Node1, 'mechanizmcard_act');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ������������ �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_Devices');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMDEV, IdConvert);

          GetStrAndExcec(Node1, 'devicescard_act');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ������ �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_Dumps');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMDUM, IdConvert);

          GetStrAndExcec(Node1, 'dumpcard_act');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� ���������� �����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_Transps');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_SMTR, IdConvert);

          GetStrAndExcec(Node1, 'transpcard_act');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Data_row ����
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Smeta_data_row');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_DATA, IdConvert);
          Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue, C_ID_SM, IdConvert);

          i := 0;
          case Node1.ChildNodes.Nodes['ID_TYPE_DATA'].NodeValue of
            1: i := C_ID_SMRAT;
            2: i := C_ID_SMMAT;
            3: i := C_ID_SMMEC;
            4: i := C_ID_SMDEV;
            5: i := C_ID_SMDUM;
            6, 7, 8, 9: i := C_ID_SMTR;
          end;

          if i > 0  then
            Node1.ChildNodes.Nodes['ID_TABLES'].NodeValue :=
              GetNewId(Node1.ChildNodes.Nodes['ID_TABLES'].NodeValue, i, IdConvert);

          GetStrAndExcec(Node1, 'data_row');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Data_row ���
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Act_data_row');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];
          //������ ID������
          Node1.ChildNodes.Nodes['ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID'].NodeValue, C_ID_DATA, IdConvert);
          Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue, C_ID_SM, IdConvert);
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);

          i := 0;
          case Node1.ChildNodes.Nodes['ID_TYPE_DATA'].NodeValue of
            1: i := C_ID_SMRAT;
            2: i := C_ID_SMMAT;
            3: i := C_ID_SMMEC;
            4: i := C_ID_SMDEV;
            5: i := C_ID_SMDUM;
            6, 7, 8, 9: i := C_ID_SMTR;
          end;

          if i > 0  then
            Node1.ChildNodes.Nodes['ID_TABLES'].NodeValue :=
              GetNewId(Node1.ChildNodes.Nodes['ID_TABLES'].NodeValue, i, IdConvert);

          GetStrAndExcec(Node1, 'data_row');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Travel
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Travel');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];

          Node1.ChildNodes.Nodes['TRAVEL_ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['TRAVEL_ID'].NodeValue, C_ID_TRAVEL, IdConvert);
          Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue, C_ID_SM, IdConvert);
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);

          GetStrAndExcec(Node1, 'travel');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Travel_work
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Travel_work');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];

          Node1.ChildNodes.Nodes['TRAVEL_WORK_ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['TRAVEL_WORK_ID'].NodeValue, C_ID_TRWORK, IdConvert);
          Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue, C_ID_SM, IdConvert);
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);

          GetStrAndExcec(Node1, 'travel_work');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Worker_deartment
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Worker_deartment');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];

          Node1.ChildNodes.Nodes['WORKER_DEPARTMENT_ID'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['WORKER_DEPARTMENT_ID'].NodeValue, C_ID_WORKDEP, IdConvert);
          Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue, C_ID_SM, IdConvert);
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);

          GetStrAndExcec(Node1, 'worker_deartment');
          Node1 := nil;
        end;
      Node2 := nil;

      //�������� Summary_calculation
      Node2 := XML.ChildNodes.FindNode('Object').ChildNodes.FindNode('Summary_calculation');
      if Assigned(Node2) then
        for j := 0 to Node2.ChildNodes.Count - 1 do
        begin
          Node1 := Node2.ChildNodes.Nodes[j];

          Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ESTIMATE'].NodeValue, C_ID_SM, IdConvert);
          Node1.ChildNodes.Nodes['ID_ACT'].NodeValue :=
            GetNewId(Node1.ChildNodes.Nodes['ID_ACT'].NodeValue, C_ID_ACT, IdConvert);

          GetStrAndExcec(Node1, 'summary_calculation');
          Node1 := nil;
        end;
      Node2 := nil;

      DM.qrDifferent.Transaction.Commit;
    except
      DM.qrDifferent.Transaction.Rollback;
      raise;
    end;
  finally
    Node2 := nil;
    Node1 := nil;
    CurNode := nil;
    XML := nil;
    FormatSettings.DecimalSeparator := ds;
    DM.qrDifferent.Transaction.Options.AutoCommit := AutoCommitValue;

    CoUninitialize;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure ExportObject(const AIdObject: Integer; const AFileName: string);
var XML : IXMLDocument;
    CurNode, Node1, Node2: IXMLNode;
    ds: char;
    TmpStr: string;

  procedure RowToNode(ANode: IXMLNode; AQ: TFDQuery);
  var i: Integer;
      {S: Single;}
  begin
    for i := 0 to AQ.Fields.Count - 1 do
    begin
        if (AQ.Fields[i].DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd,
          ftExtended, ftSingle]) then
          ANode.ChildValues[AQ.Fields[i].FieldName] :=
            AQ.Fields[i].AsFloat
        else if AQ.Fields[i].DataType = ftDate then
          ANode.ChildValues[AQ.Fields[i].FieldName] :=
            FormatDateTime('yy/mm/dd', AQ.Fields[i].AsDateTime)
        else
          ANode.ChildValues[AQ.Fields[i].FieldName] :=
            AQ.Fields[i].Value;
    end;
  end;
begin
  CoInitialize(nil);
  ds := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';
  try
    XML := TXMLDocument.Create(nil);
    XML.Active := True;
    XML.Encoding := 'unicode';
    XML.Version := '1.0';

    //�������� ���������� �� �������
    CurNode := XML.AddChild('Object');
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from objcards where obj_id = ' +
      IntToStr(AIdObject);
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      CurNode.SetAttributeNS('Type', '', '������');
      CurNode.SetAttributeNS('Name', '', DM.qrDifferent.FieldByName('name').AsString);

      Node1 := CurNode.AddChild('Data_object');
      RowToNode(Node1, DM.qrDifferent);
      Node1 := nil;
    end
    else
    begin
      raise Exception.Create('������ �� ������.');
      Exit;
    end;

    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from supp_agreement where (OBJ_ID = ' +
      IntToStr(AIdObject) + ') order by supp_agreement_id';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Object_suppagreement');
      Node1.SetAttributeNS('Type', '', '���. ����������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from smetasourcedata where (obj_id = ' +
      IntToStr(AIdObject) + ') and (DELETED=0) order by SM_ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smety');
      Node1.SetAttributeNS('Type', '', '�����');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Smeta');
        Node2.SetAttributeNS('Type', '', '�����');
        Node2.SetAttributeNS('Name', '', DM.qrDifferent.FieldByName('name').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end
    else
    begin
      XML.SaveToFile(AFileName);
      Exit;
    end;

    TmpStr := '(ID_ESTIMATE in ' +
      '(select SM_ID from smetasourcedata where (obj_id = ' +
      IntToStr(AIdObject) + ')  and (DELETED=0)))';

    //�������� ���������� �� ���������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from card_rate where ID in ' +
      '(select ID_TABLES from data_row where (ID_TYPE_DATA = 1) and ' + TmpStr +
      ' and (ID_ACT is NULL)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_Rates');
      Node1.SetAttributeNS('Type', '', '�����_��������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Rate');
        Node2.SetAttributeNS('Type', '', '��������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('RATE_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ����������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from materialcard where (ID in ' +
    '(select ID_TABLES from data_row where (ID_TYPE_DATA = 2) and ' + TmpStr +
    ' and (ID_ACT is NULL))) or ' +
    '(ID_CARD_RATE in (select ID_TABLES from data_row where ' +
    '(ID_TYPE_DATA = 1) and ' + TmpStr + ' and (ID_ACT is NULL))) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_Materials');
      Node1.SetAttributeNS('Type', '', '�����_���������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Material');
        Node2.SetAttributeNS('Type', '', '��������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('MAT_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ��������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from mechanizmcard where (ID in ' +
    '(select ID_TABLES from data_row where (ID_TYPE_DATA = 3) and ' + TmpStr +
    ' and (ID_ACT is NULL))) or ' +
    '(ID_CARD_RATE in (select ID_TABLES from data_row where ' +
    '(ID_TYPE_DATA = 1) and ' + TmpStr + ' and (ID_ACT is NULL))) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_Mechanizms');
      Node1.SetAttributeNS('Type', '', '�����_���������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Mechanizm');
        Node2.SetAttributeNS('Type', '', '��������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('MECH_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ������������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from devicescard where ID in ' +
    '(select ID_TABLES from data_row where (ID_TYPE_DATA = 4) and ' + TmpStr +
    ' and (ID_ACT is NULL)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_Devices');
      Node1.SetAttributeNS('Type', '', '�����_������������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Device');
        Node2.SetAttributeNS('Type', '', '������������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('DEVICE_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� �������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from dumpcard where ID in ' +
    '(select ID_TABLES from data_row where (ID_TYPE_DATA = 5) and ' + TmpStr +
    ' and (ID_ACT is NULL)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_Dumps');
      Node1.SetAttributeNS('Type', '', '�����_������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Dumpe');
        Node2.SetAttributeNS('Type', '', '������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('DUMP_CODE_JUST').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ����������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from transpcard where ID in ' +
    '(select ID_TABLES from data_row where (ID_TYPE_DATA in (6,7,8,9)) and ' +
    TmpStr + ' and (ID_ACT is NULL)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_Transps');
      Node1.SetAttributeNS('Type', '', '�����_���������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Transp');
        Node2.SetAttributeNS('Type', '', '���������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('TRANSP_CODE_JUST').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� calculation_coef
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from calculation_coef where ' + TmpStr +
      ' order by calculation_coef_id';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_calculation_coef');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� �����
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from card_acts where (ID_OBJECT = ' +
    IntToStr(AIdObject) + ') and (DEL_FLAG=0) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Acts');
      Node1.SetAttributeNS('Type', '', '����');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Act');
        Node2.SetAttributeNS('Type', '', '���');
        Node2.SetAttributeNS('NAME', '', DM.qrDifferent.FieldByName('NAME').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ���������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from card_rate_act where ID_ACT in ' +
    '(Select ID from card_acts where (ID_OBJECT = ' + IntToStr(AIdObject) +
    ') and (DEL_FLAG=0)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_Rates');
      Node1.SetAttributeNS('Type', '', '���_��������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Rate');
        Node2.SetAttributeNS('Type', '', '��������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('RATE_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ����������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from materialcard_act where ID_ACT in ' +
    '(Select ID from card_acts where (ID_OBJECT = ' + IntToStr(AIdObject) +
    ') and (DEL_FLAG=0)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_Materials');
      Node1.SetAttributeNS('Type', '', '���_���������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Material');
        Node2.SetAttributeNS('Type', '', '��������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('MAT_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ��������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from mechanizmcard_act where ID_ACT in ' +
    '(Select ID from card_acts where (ID_OBJECT = ' + IntToStr(AIdObject) +
    ') and (DEL_FLAG=0)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_Mechanizms');
      Node1.SetAttributeNS('Type', '', '���_���������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Mechanizm');
        Node2.SetAttributeNS('Type', '', '��������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('MECH_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ������������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from devicescard_act where ID_ACT in ' +
    '(Select ID from card_acts where (ID_OBJECT = ' + IntToStr(AIdObject) +
    ') and (DEL_FLAG=0)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_Devices');
      Node1.SetAttributeNS('Type', '', '���_������������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Device');
        Node2.SetAttributeNS('Type', '', '������������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('DEVICE_CODE').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� �������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from dumpcard_act where ID_ACT in ' +
    '(Select ID from card_acts where (ID_OBJECT = ' + IntToStr(AIdObject) +
    ') and (DEL_FLAG=0)) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_Dumps');
      Node1.SetAttributeNS('Type', '', '���_������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Dumpe');
        Node2.SetAttributeNS('Type', '', '������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('DUMP_CODE_JUST').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� ����������
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from transpcard_act where (ID_ACT in ' +
    '(Select ID from card_acts where (ID_OBJECT = ' + IntToStr(AIdObject) +
    ') and (DEL_FLAG=0))) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_Transps');
      Node1.SetAttributeNS('Type', '', '���_���������');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Transp');
        Node2.SetAttributeNS('Type', '', '���������');
        Node2.SetAttributeNS('CODE', '', DM.qrDifferent.FieldByName('TRANSP_CODE_JUST').AsString);
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    //�������� ���������� �� data_row
    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from data_row where ' + TmpStr +
      ' and (ID_ACT is null) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Smeta_data_row');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from data_row where ' +
      '(ID_ACT in (Select ID from card_acts where (ID_OBJECT = ' +
      IntToStr(AIdObject) + ') and (DEL_FLAG=0))) order by ID';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Act_data_row');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from travel where ' + TmpStr +
      ' or (ID_ACT in (Select ID from card_acts where (ID_OBJECT = ' +
      IntToStr(AIdObject) + ') and (DEL_FLAG=0))) order by travel_id';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Travel');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from travel_work where ' + TmpStr +
      ' or (ID_ACT in (Select ID from card_acts where (ID_OBJECT = ' +
      IntToStr(AIdObject) + ') and (DEL_FLAG=0))) order by travel_work_id';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Travel_work');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from worker_deartment where ' + TmpStr +
      ' or (ID_ACT in (Select ID from card_acts where (ID_OBJECT = ' +
      IntToStr(AIdObject) + ') and (DEL_FLAG=0))) order by worker_department_id';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Worker_deartment');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    DM.qrDifferent.Active := False;
    DM.qrDifferent.SQL.Text := 'Select * from summary_calculation where ' + TmpStr +
      ' or (ID_ACT in (Select ID from card_acts where (ID_OBJECT = ' +
      IntToStr(AIdObject) + ') and (DEL_FLAG=0)))';
    DM.qrDifferent.Active := True;
    if not DM.qrDifferent.IsEmpty then
    begin
      Node1 := CurNode.AddChild('Summary_calculation');
      while not DM.qrDifferent.Eof do
      begin
        Node2 := Node1.AddChild('Line');
        RowToNode(Node2, DM.qrDifferent);
        DM.qrDifferent.Next;
        Node2 := nil;
      end;
      Node1 := nil;
    end;

    XML.SaveToFile(AFileName);
  finally
    Node2 := nil;
    Node1 := nil;
    CurNode := nil;
    XML := nil;
    FormatSettings.DecimalSeparator := ds;
    CoUninitialize;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
//��������� ������� ������ � �����
function PasteSmetaRow(const ASmClipArray: array of TSmClipRec;
  ADestSmID, AIterator: Integer): Boolean;
var i, j, ii,
    ind,
    NewID,
    TmpID_N, TmpID_O: Integer;
    E1820COUNT: Extended;
    IdConvert: TIDConvertArray;
    TmpTab: string;
    FromRateArray,
    AllFromRateArray: TFromRateArray;
    Flag: Boolean;
    PSmClipRec: ^TSmClipRec;
    AutoCommitValue: Boolean;

    //������ ����� ���� ������� ���� ��������� �� ������ ����
    procedure CoefEstimCalc(ALocalType, ADataType, AOldId, ANewId: Integer);
    var i: Integer;
    begin
      //������� ������������� �������� �� ��������
      DM.qrDifferent.Active := False;
      DM.qrDifferent.SQL.Text := 'Select * from calculation_coef' +
        TmpTab + ' where (id_estimate = ' + IntToStr(PSmClipRec.SmID) + ') and ' +
        '(id_type_data = ' + IntToStr(ADataType) + ') and ' +
        '(id_owner = ' + IntToStr(AOldId) + ')';
      DM.qrDifferent.Active := True;
      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'calculation_coef_temp');
      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'CALCULATION_COEF_ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMCOEF, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              ADestSmID;
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_OWNER' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              ANewId;
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      //��� ���� ����� 10, 11
      if ALocalType > 0 then
      begin
        //���������� ��������� � �����
        AIterator := UpdateIterator(ADestSmID, AIterator, 0);
        //���������� ����� ������
        DM.qrDifferent1.SQL.Text :=
          'INSERT INTO data_row_temp (ID, id_estimate, id_type_data, id_tables, NUM_ROW) ' +
          'VALUE (GetNewID(:IDType), :id_estimate, :id_type_data, :id_tables, :NUM_ROW);';
        DM.qrDifferent1.ParamByName('IDType').Value := C_ID_DATA;
        DM.qrDifferent1.ParamByName('id_estimate').Value := ADestSmID;
        DM.qrDifferent1.ParamByName('id_type_data').Value := ADataType;
        DM.qrDifferent1.ParamByName('id_tables').Value := ANewId;
        DM.qrDifferent1.ParamByName('NUM_ROW').Value := AIterator;
        DM.qrDifferent1.ExecSQL;
      end;

      //������������� ����������� �������
      DM.qrDifferent1.SQL.Text := 'CALL CalcRowInRateTab(:ID, :TYPE, :CalcMode);';
      DM.qrDifferent1.ParamByName('ID').Value := ANewId;
      DM.qrDifferent1.ParamByName('TYPE').Value := ADataType;
      DM.qrDifferent1.ParamByName('CalcMode').Value := G_CALCMODE;
      DM.qrDifferent1.ExecSQL;

      DM.qrDifferent1.SQL.Text := 'CALL CalcCalculation(:ESTIMATE_ID, :TypeData_ID, :OWNER_ID, 0, 0);';
      DM.qrDifferent1.ParamByName('ESTIMATE_ID').Value := ADestSmID;
      DM.qrDifferent1.ParamByName('TypeData_ID').Value := ADataType;
      DM.qrDifferent1.ParamByName('OWNER_ID').Value := ANewId;
      DM.qrDifferent1.ExecSQL;
    end;
begin
  Result := False;

  AutoCommitValue :=DM.qrDifferent1.Transaction.Options.AutoCommit;
  DM.qrDifferent1.Transaction.Options.AutoCommit := False;
  try
    try
      DM.qrDifferent1.UpdateTransaction.StartTransaction;

      SetLength(AllFromRateArray, 0);
      for i := 1 to Length(IdConvert) do
      begin
        SetLength(IdConvert[i][0], 0);
        SetLength(IdConvert[i][1], 0);
      end;

      for ii := Low(ASmClipArray) to High(ASmClipArray) do
      begin
        PSmClipRec := @ASmClipArray[ii];

        //�������� ����������� ������ � �����������, ���� ��� �����������
        //�������� ����� � ����������, �� ��� �����������, ���-�� �� ����������� ������
        Flag := False;
        for i := 0 to Length(AllFromRateArray) - 1 do
          if (PSmClipRec.DataID = AllFromRateArray[i].OldId) and
             (PSmClipRec.DataType = AllFromRateArray[i].DataType) then
          begin
            Flag := True;
            Break;
          end;
        if Flag then
          Continue;

        ind := 0;
        case PSmClipRec.DataType of
          1: ind := C_ID_SMRAT;
          2: ind := C_ID_SMMAT;
          3: ind := C_ID_SMMEC;
          4: ind := C_ID_SMDEV;
          5: ind := C_ID_SMDUM;
          6, 7, 8, 9: ind := C_ID_SMTR;
          10, 11: ind := -1;
        end;

        if ind = 0 then
          raise Exception.Create('����������� ��� ������ (' +
            IntToStr(PSmClipRec.DataType) + ').');

        TmpTab := '_temp';

        //����� ��������� � ��
        if ind > 0 then
        begin
          DM.qrDifferent.SQL.Text := 'Select * from ' +
            CTabNameAndID[ind][0] + TmpTab + ' where ' + CTabNameAndID[ind][1] + ' = ' +
            IntToStr(PSmClipRec.DataID);
        end
        else
        begin
          DM.qrDifferent.SQL.Text := 'Select E1820_COUNT from data_row' + TmpTab +
            ' where (ID_ACT is null) and ' +
            '(ID_ESTIMATE = ' + IntToStr(PSmClipRec.SmID) +
            ') and (ID_TYPE_DATA = ' + IntToStr(PSmClipRec.DataType) + ')';
        end;
        DM.qrDifferent.Active := True;

        if DM.qrDifferent.IsEmpty then
        begin
          //�� ��������� �������� ������ ���, ��������� � ����������
          DM.qrDifferent.Active := False;
          TmpTab := '';

          if ind > 0 then
          begin
            DM.qrDifferent.SQL.Text := 'Select * from ' +
              CTabNameAndID[ind][0] + TmpTab + ' where ' +
              CTabNameAndID[ind][1] + ' = ' + IntToStr(PSmClipRec.DataID);
          end
          else
          begin
            DM.qrDifferent.SQL.Text := 'Select E1820_COUNT from data_row' + TmpTab +
              ' where (ID_ACT is null) and ' +
              '(ID_ESTIMATE = ' + IntToStr(PSmClipRec.SmID) +
              ') and (ID_TYPE_DATA = ' + IntToStr(PSmClipRec.DataType) + ')';
          end;
          DM.qrDifferent.Active := True;

          if DM.qrDifferent.IsEmpty then
            raise Exception.Create('�������� ����������� � ��.');
        end;

        NewID := -1;

        case PSmClipRec.DataType of
        1, 2, 3, 4, 5, 6, 7, 8, 9:
        begin
          DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent,
            CTabNameAndID[ind][0] + '_temp');
          for i := 0 to DM.qrDifferent.Fields.Count - 1 do
          begin
            if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
            begin
              NewID := GetNewId(DM.qrDifferent.Fields[i].Value, ind, IdConvert);
              DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value := NewID;
              Continue;
            end;
            if PSmClipRec.DataType in [2, 3] then
            begin
              //����� ��� ������������� �����
              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_CARD_RATE') or
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_REPLACED') or
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'REPLACED') or
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'FROM_RATE') or
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'CONS_REPLASED') or
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ADDED') or
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'DELETED') then
              begin
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value := 0;
                Continue;
              end;

              if (PSmClipRec.DataType = 2) and
                 (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'CONSIDERED') then
              begin
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value := 1;
                Continue;
              end;
            end;
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              DM.qrDifferent.Fields[i].Value;
          end;
          DM.qrDifferent1.ExecSQL;
        end;
        10,11:
        begin
          E1820COUNT := DM.qrDifferent.Fields[0].Value;
          DM.qrDifferent.Active := False;
          //�������� �� ��, ��� 10 ��� 11 ��� ���� � �����
          DM.qrDifferent.SQL.Text :=
            'Select E1820_COUNT from data_row' + TmpTab +' where ' +
            '(ID_ESTIMATE = ' + IntToStr(ADestSmID) +
            ') and (ID_TYPE_DATA = ' + IntToStr(PSmClipRec.DataType) + ')';
          DM.qrDifferent.Active := True;
          if not DM.qrDifferent.IsEmpty then
          begin
            if PSmClipRec.DataType = 10 then
              raise Exception.Create('��18 ��� ������������ � �����.')
            else
              raise Exception.Create('��20 ��� ������������ � �����.');
          end;
          DM.qrDifferent.Active := False;

          //���������� ����� ������
          DM.qrDifferent1.SQL.Text :=
            'INSERT INTO data_row_temp (ID, id_estimate, id_type_data, id_tables, ' +
            'E1820_COUNT, NUM_ROW) VALUE (GetNewID(:IDType), :id_estimate, :id_type_data, ' +
            ':id_tables, :E1820_COUNT, :NUM_ROW);';
          DM.qrDifferent1.ParamByName('IDType').Value := C_ID_DATA;
          DM.qrDifferent1.ParamByName('id_estimate').Value := ADestSmID;
          DM.qrDifferent1.ParamByName('id_type_data').Value := PSmClipRec.DataType;
          DM.qrDifferent1.ParamByName('id_tables').Value := 0;
          DM.qrDifferent1.ParamByName('E1820_COUNT').Value := E1820COUNT;
          //������� � ����� �����
          if PSmClipRec.DataType = 10 then
              DM.qrDifferent1.ParamByName('NUM_ROW').Value := C_ET18ITER
          else
              DM.qrDifferent1.ParamByName('NUM_ROW').Value := C_ET20ITER;
          DM.qrDifferent1.ExecSQL;

          DM.qrDifferent1.SQL.Text := 'CALL CalcCalculation(:ESTIMATE_ID, :TypeData_ID, :OWNER_ID, 0, 0);';
          DM.qrDifferent1.ParamByName('ESTIMATE_ID').Value := ADestSmID;
          DM.qrDifferent1.ParamByName('TypeData_ID').Value := PSmClipRec.DataType;
          DM.qrDifferent1.ParamByName('OWNER_ID').Value := 0;
          DM.qrDifferent1.ExecSQL;
        end;
        end;
        //��������� ������������, ��������� ������ � �����, ��������� �������� ������
        CoefEstimCalc(ind, PSmClipRec.DataType, PSmClipRec.DataID, NewId);

        //��� �������� �������� ��������� � ���������
        if PSmClipRec.DataType = 1 then
        begin
          SetLength(FromRateArray, 0);
          DM.qrDifferent.Active := False;
          DM.qrDifferent.SQL.Text := 'Select * from materialcard' +
            TmpTab + ' where ID_CARD_RATE = ' + IntToStr(PSmClipRec.DataID) +
            ' ORDER BY ID';
          DM.qrDifferent.Active := True;
          if not DM.qrDifferent.IsEmpty then
            DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'materialcard_temp');
          while not DM.qrDifferent.Eof do
          begin
            for i := 0 to DM.qrDifferent.Fields.Count - 1 do
            begin
              if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
              begin
                TmpID_O := DM.qrDifferent.Fields[i].Value;
                TmpID_N := GetNewId(TmpID_O, C_ID_SMMAT, IdConvert);
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                  TmpID_N;
                Continue;
              end;

              //����� ��� ������������� �����
              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_CARD_RATE') then
              begin
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                  NewID;
                Continue;
              end;

              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_REPLACED') then
              begin
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                  GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMMAT, IdConvert);
                Continue;
              end;

              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'FROM_RATE') and
                 (DM.qrDifferent.Fields[i].Value > 0) then
              begin
                j := Length(FromRateArray);
                SetLength(FromRateArray, j + 1);
                FromRateArray[j].LocalType := C_ID_SMMAT;
                FromRateArray[j].DataType := 2;
                FromRateArray[j].OldId := TmpID_O;
                FromRateArray[j].NewId := TmpID_N;

                j := Length(AllFromRateArray);
                SetLength(AllFromRateArray, j + 1);
                AllFromRateArray[j].DataType := 2;
                AllFromRateArray[j].OldId := TmpID_O;
              end;

              DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                DM.qrDifferent.Fields[i].Value;
            end;
            DM.qrDifferent1.ExecSQL;

            DM.qrDifferent.Next;
          end;

          DM.qrDifferent.Active := False;
          DM.qrDifferent.SQL.Text := 'Select * from mechanizmcard' +
            TmpTab + ' where ID_CARD_RATE = ' + IntToStr(PSmClipRec.DataID) +
            ' ORDER BY ID';
          DM.qrDifferent.Active := True;
          if not DM.qrDifferent.IsEmpty then
            DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'mechanizmcard_temp');
          while not DM.qrDifferent.Eof do
          begin
            for i := 0 to DM.qrDifferent.Fields.Count - 1 do
            begin
              if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
              begin
                TmpID_O := DM.qrDifferent.Fields[i].Value;
                TmpID_N := GetNewId(TmpID_O, C_ID_SMMEC, IdConvert);
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                  TmpID_N;
                Continue;
              end;

              //����� ��� ������������� �����
              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_CARD_RATE') then
              begin
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                  NewID;
                Continue;
              end;

              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_REPLACED') then
              begin
                DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                  GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMMEC, IdConvert);
                Continue;
              end;

              if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'FROM_RATE') and
                 (DM.qrDifferent.Fields[i].Value > 0) then
              begin
                j := Length(FromRateArray);
                SetLength(FromRateArray, j + 1);
                FromRateArray[j].LocalType := C_ID_SMMEC;
                FromRateArray[j].DataType := 3;
                FromRateArray[j].OldId := TmpID_O;
                FromRateArray[j].NewId := TmpID_N;

                j := Length(AllFromRateArray);
                SetLength(AllFromRateArray, j + 1);
                AllFromRateArray[j].DataType := 3;
                AllFromRateArray[j].OldId := TmpID_O;
              end;

              DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
                DM.qrDifferent.Fields[i].Value;
            end;
            DM.qrDifferent1.ExecSQL;

            DM.qrDifferent.Next;
          end;
          DM.qrDifferent.Active := False;
          //��������� � ����� ��������� �� ��������
          //��� ������� �� �������������� ������� ������, � �������� ����� �������
          for i := Low(FromRateArray) to High(FromRateArray) do
          begin
            Inc(AIterator);
            CoefEstimCalc(FromRateArray[i].LocalType, FromRateArray[i].DataType,
              FromRateArray[i].OldId, FromRateArray[i].NewId);
          end;
        end;
        Inc(AIterator);
      end;

      DM.qrDifferent1.Transaction.Commit;
      Result := True;
    except
      DM.qrDifferent1.Transaction.Rollback;
      raise;
    end;
  finally
    DM.qrDifferent1.Transaction.Options.AutoCommit := AutoCommitValue;
  end;
  if DM.qrDifferent.Active then
    DM.qrDifferent.Active := False;
end;

////////////////////////////////////////////////////////////////////////////////

function GetCopySmeta(const ASoursSmetaID: Integer): boolean;
var IdConvert: TIDConvertArray;
    i, j: Integer;
    TmpId: Integer;
    SmIdStr: string;
    TmpStr: string;
    AutoCommitValue: Boolean;
begin
  Result := False;
  for i := 1 to Length(IdConvert) do
  begin
    SetLength(IdConvert[i][0], 0);
    SetLength(IdConvert[i][1], 0);
  end;

  AutoCommitValue :=DM.qrDifferent1.Transaction.Options.AutoCommit;
  DM.qrDifferent1.Transaction.Options.AutoCommit := False;
  try
    DM.qrDifferent1.Transaction.StartTransaction;
    try
      DM.qrDifferent.Active := False;
      DM.qrDifferent.SQL.Text := 'SELECT * FROM smetasourcedata WHERE ' +
        '((SM_ID = ' + ASoursSmetaID.ToString + ') OR ' +
         '(((PARENT_ID = ' + ASoursSmetaID.ToString + ')) OR ' +
         '((PARENT_ID IN (SELECT smetasourcedata.SM_ID FROM ' +
          'smetasourcedata WHERE smetasourcedata.PARENT_ID = ' +
            ASoursSmetaID.ToString + '))) AND (DELETED=0))) ORDER BY SM_ID';
      DM.qrDifferent.Active := True;
      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'smetasourcedata')
      else
      begin
        //���� ���� � ����� ID �� ����������
        DM.qrDifferent.Active := False;
        raise Exception.Create('����� �������� �� �������.');
      end;

      SmIdStr := '';
      while not DM.qrDifferent.Eof do
      begin
        TmpId := DM.qrDifferent.FieldByName('SM_ID').AsInteger;

        //������ ��������, ���-�� �� ������ �� ����� ������� ������
        if SmIdStr <> '' then
          SmIdStr := SmIdStr + ',';
        SmIdStr := SmIdStr + IntToStr(TmpId);

        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'SM_ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'NAME' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              DM.qrDifferent.Fields[i].Value + ' (�����)';
            Continue;
          end;

          //����� ����� ������ ���� ����������� � ��� �� �����, ��� � �������
          if (UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'PARENT_ID') and
             (TmpId <> ASoursSmetaID) then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from card_rate where ID in ' +
      '(select ID_TABLES from data_row where (ID_TYPE_DATA = 1) and ' +
      '(ID_ESTIMATE in (' + SmIdStr + ')) and (ID_ACT is null)) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'card_rate');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMRAT, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from materialcard where (ID in ' +
        '(select ID_TABLES from data_row where (ID_TYPE_DATA = 2) and ' +
        '(ID_ACT is null) and (ID_ESTIMATE in (' + SmIdStr + ')))) or ' +
        '(ID_CARD_RATE in (select ID_TABLES from data_row where ' +
        '(ID_TYPE_DATA = 1) and (ID_ACT is null) and ' +
        '(ID_ESTIMATE in (' + SmIdStr + ')))) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'materialcard');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMMAT, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_CARD_RATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMRAT, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_REPLACED' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMMAT, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from mechanizmcard where ' +
      '(ID in (select ID_TABLES from data_row where ' +
      '(ID_TYPE_DATA = 3) and (ID_ACT is null) and ' +
      '(ID_ESTIMATE in (' + SmIdStr + ')))) or ' +
      '(ID_CARD_RATE in (select ID_TABLES from data_row where ' +
      '(ID_TYPE_DATA = 1) and (ID_ACT is null) and ' +
      '(ID_ESTIMATE in (' + SmIdStr + ')))) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'mechanizmcard');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMMEC, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_CARD_RATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMRAT, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_REPLACED' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMMEC, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from devicescard where ID in ' +
      '(select ID_TABLES from data_row where (ID_TYPE_DATA = 4) and ' +
      '(ID_ACT is null) and (ID_ESTIMATE in (' + SmIdStr + '))) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'devicescard');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMDEV, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from dumpcard where ID in ' +
      '(select ID_TABLES from data_row where (ID_TYPE_DATA = 5) and ' +
      '(ID_ACT is null) and (ID_ESTIMATE in (' + SmIdStr + '))) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'dumpcard');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMDUM, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from transpcard where ID in ' +
      '(select ID_TABLES from data_row where (ID_TYPE_DATA in (6,7,8,9)) and ' +
      '(ID_ACT is null) and (ID_ESTIMATE in (' + SmIdStr + '))) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'transpcard');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMTR, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from data_row where ' +
        '(ID_ACT is null) and (ID_ESTIMATE in (' + SmIdStr + ')) order by ID';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'data_row');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_DATA, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_TABLES' then
          begin
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_TYPE_DATA' then
          begin
            j := 0;
            case DM.qrDifferent.Fields[i].Value of
              1: j := C_ID_SMRAT;
              2: j := C_ID_SMMAT;
              3: j := C_ID_SMMEC;
              4: j := C_ID_SMDEV;
              5: j := C_ID_SMDUM;
              6, 7, 8, 9: j := C_ID_SMTR;
            end;

            if j > 0  then
              DM.qrDifferent1.ParamByName('ID_TABLES').Value :=
                GetNewId(DM.qrDifferent.FieldByName('ID_TABLES').Value, j, IdConvert);
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from calculation_coef where ' +
        '(ID_ESTIMATE in (' + SmIdStr + ')) order by calculation_coef_id';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'calculation_coef');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'CALCULATION_COEF_ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SMCOEF, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_OWNER' then
          begin
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_TYPE_DATA' then
          begin
            j := 0;

            case DM.qrDifferent.Fields[i].Value of
              1: j := C_ID_SMRAT;
              2: j := C_ID_SMMAT;
              3: j := C_ID_SMMEC;
              4: j := C_ID_SMDEV;
              5: j := C_ID_SMDUM;
              6, 7, 8, 9: j := C_ID_SMTR;
            end;

            if j > 0  then
              DM.qrDifferent1.ParamByName('ID_OWNER').Value :=
                GetNewId(DM.qrDifferent.FieldByName('ID_OWNER').Value, j, IdConvert);
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from travel where ' +
        '(SOURCE_TYPE = 1) and (ID_ESTIMATE in (' + SmIdStr + ')) order by travel_id';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'travel');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'TRAVEL_ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_TRAVEL, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from travel_work where ' +
        '(SOURCE_TYPE = 1) and (ID_ESTIMATE in (' + SmIdStr + ')) order by travel_work_id';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'travel_work');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'TRAVEL_WORK_ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_TRWORK, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from worker_deartment where ' +
        '(SOURCE_TYPE = 1) and (ID_ESTIMATE in (' + SmIdStr + ')) order by worker_department_id';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'worker_deartment');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'WORKER_DEPARTMENT_ID' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_WORKDEP, IdConvert);
            Continue;
          end;

          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent.SQL.Text := 'Select * from summary_calculation where ' +
        '(ID_ACT is null) and (ID_ESTIMATE in (' + SmIdStr + '))';
      DM.qrDifferent.Active := True;

      if not DM.qrDifferent.IsEmpty then
        DM.qrDifferent1.SQL.Text := GetQueryStr(DM.qrDifferent, 'summary_calculation');

      while not DM.qrDifferent.Eof do
      begin
        for i := 0 to DM.qrDifferent.Fields.Count - 1 do
        begin
          if UpperCase(DM.qrDifferent.Fields[i].FieldName) = 'ID_ESTIMATE' then
          begin
            DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
              GetNewId(DM.qrDifferent.Fields[i].Value, C_ID_SM, IdConvert);
            Continue;
          end;

          DM.qrDifferent1.ParamByName(DM.qrDifferent.Fields[i].FieldName).Value :=
            DM.qrDifferent.Fields[i].Value;
        end;
        DM.qrDifferent1.ExecSQL;
        DM.qrDifferent.Next;
      end;
      DM.qrDifferent.Active := False;

      DM.qrDifferent1.Transaction.Commit;
      Result := True;
    except
      DM.qrDifferent1.Transaction.Rollback;
      raise;
    end;
  finally
    DM.qrDifferent1.Transaction.Options.AutoCommit := AutoCommitValue;
  end;
end;

end.
