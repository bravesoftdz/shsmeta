unit GlobsAndConst;

interface
uses Winapi.Messages;

type
  TAppElement = record
    EName: string;
    EType: Byte;  //0 - ����, 1 - ����� (���������� �� �����������)
  end;

  //������ ��� ������������ ���������� � ����������
  TSprRecord = record
    ID: Integer;
    Code,
    Name,
    Unt: string;
    CoastNDS,
    CoastNoNDS,
    ZpMach,
    TrZatr: Extended;
    MType: byte;
  end;
  PSprRecord = ^TSprRecord;
  TSprArray = array of TSprRecord;
  PSprArray = ^TSprArray;

  //��������� ��� ����������� ����������� ����������
  TMatSprByffer = record
    Mat,
    JBI: Boolean;
    Month,
    Year,
    Region: Integer;
    SprArray: TSprArray;
    class procedure CopyByffer(ASoursByffer, ADestByffer: PSprArray); static;
  end;

  //��������� ��� ������ � ������� ������
  TSmClipRec = record
    ObjID,
    SmID,
    DataID,
    DataType: Integer;
  end;

const
//******************************************************************************
// ��������� ������ ����������
  //��������� ��� ��������� ����� �� ��� ������
  C_TMPDIR = 'Tmp\';
  //����� � �������
  C_ARHDIR = 'Arhiv\';
  //����� � ��������
  C_REPORTDIR = 'Reports\';
  //����� � ������
  C_LOGDIR = 'Logs\';
  //����� � ������������
  C_UPDATEDIR = 'Updates\';
  //�������� ������� ��� ���������� ���������� (��������)
  C_UPDATERNAME = 'SmUpd.exe';

  arraymes: array[1..12, 1..2] of string =
    (('������',   '������'),
    ('�������',  '�������'),
    ('����',     '�����'),
    ('������',   '������'),
    ('���',      '���'),
    ('����',     '����'),
    ('����',     '����'),
    ('������',   '�������'),
    ('��������', '��������'),
    ('�������',  '�������'),
    ('������',   '������'),
    ('�������',  '�������'));
  //��� ������ ��� ������ ������
  C_SMETADATA = 'CF_SMETA';

  //��������� (���������� � ����� �������) ��� ET18, ET20
  C_ET18ITER = 2000000000;
  C_ET20ITER = 2000000001;

  //ID ����� ��� ������� GetNewID
  C_ID_OBJ     = 1;  //1 - ������
  C_ID_SM      = 2;  //2 - �����
  C_ID_SMRAT   = 3;  //3 - ����� ��������
  C_ID_SMMAT   = 4;  //4 - ����� ��������
  C_ID_SMMEC   = 5;  //5 - ����� ��������
  C_ID_SMDEV   = 6;  //6 - ����� ������������
  C_ID_SMDUM   = 7;  //7 - ����� ������
  C_ID_SMTR    = 8;  //8 - ����� ���������
  C_ID_DATA    = 9;  //9 - ����� data_row
  C_ID_SMCOEF  = 10; //10 - ����� calculation_coef
  C_ID_ACT     = 11; //11 - ���
  C_ID_TRAVEL  = 12; //12 - ������ ���������������
  C_ID_TRWORK  = 13; //13 - ������ ���������� �����
  C_ID_WORKDEP = 14; //14 - ������ ��������� �������
  C_ID_SUPPAG  = 15; //15 - �������������� ����������

  //�������� �� ������������� ����������������
  CTabNameAndID: array [1..15, 0..1] of string =
    (('objcards', 'obj_id'),
    ('smetasourcedata', 'SM_ID'),
    ('card_rate', 'ID'),
    ('materialcard', 'ID'),
    ('mechanizmcard', 'ID'),
    ('devicescard', 'ID'),
    ('dumpcard', 'ID'),
    ('transpcard', 'ID'),
    ('data_row', 'ID'),
    ('calculation_coef', 'calculation_coef_id'),
    ('card_acts', 'ID'),
    ('travel', 'travel_id'),
    ('travel_work', 'travel_work_id'),
    ('worker_deartment', 'worker_department_id'),
    ('supp_agreement', 'supp_agreement_id'));


type
  TIDConvertArray = array [1..15, 0..1] of array of Integer;
//******************************************************************************

//******************************************************************************
// ��������� ����������� ��� ������ ������� ���������� �����������
const
  //����� ����� ������ ������
  C_ARHBASEDIR = 'Base\';
  C_ARHAPPDIR = 'App\';

  //������� ������ ������ � ����� � �������
  C_BASETODUMP = 'To_Dump_all_database.bat';
  C_DUMPTOBASE = 'From_Dump_all_database.bat';
  //��� ����� ������ ��������������� ����� ����������� � �������
  C_DUMPNAME = 'all_database.sql';

  //������ �������� ������ ���������� ������� �����
  //�������������� ��� ���������� �����������
  //����� ���������� � ���������� ������� ����������
  //������������� ������ ���� � ���� �������
  �_APPSTRUCT: array [0..8] of TAppElement =
    ((EName: 'smeta.exe'; EType: 0),
     (EName: 'smeta.ini'; EType: 0),
     (EName: 'libmysql.dll'; EType: 0),
     (EName: C_UPDATERNAME; EType: 0),
     (EName: C_ARHDIR + '\' + C_BASETODUMP; EType: 0),
     (EName: C_ARHDIR + '\' + C_DUMPTOBASE; EType: 0),
     (EName: 'sql'; EType: 1),
     (EName: 'settings'; EType: 1),
     (EName: 'reports'; EType: 1));
  //���������� ���-�� �������
  C_ARHCOUNT = 3;
//******************************************************************************

//******************************************************************************
//  ��������� ����������� ��� ������ ������� ����������
  //�������� ������� ����� ������� ���������� ����� �������
  C_GETVERSINTERVAL = 1200000;
  //��������� ���������� �������� ���� �� ���������� �������� ����������
  WM_SHOW_SPLASH = WM_USER + 1;
  //����� ������� ����������
  C_UPDATESERV = 'http://31.130.201.132:3000';
  //����� ����� ������������
  C_SUPPORTMAIL = 'd_grin@mail.ru';
  //��������� ����� �����������
  C_UPDATELOG = 'update.log';
//******************************************************************************

//******************************************************************************
//  ��������� ���������� ����������
  C_UPD_UPDATE = '-u'; //����������
  C_UPD_RESTOR = '-r'; //�������������� �� ������
  C_UPD_PATH = '-path'; //���� � ����� � ������������ (������)
  C_UPD_VERS = '-v'; //����� ������ ���������
  C_UPD_START = '-s'; //���������� ��������� ����� ����� ��������� ���������
//******************************************************************************

//******************************************************************************
//  ����������� ���� � ���������� �������
  WM_EXCECUTE = WM_USER + 2;
//******************************************************************************

var
//******************************************************************************
  //���������� ���������� �������������� ���������� ����������
  //���� ������������� ��������� �������� �� ���������� ���������
  // 1 - ����������, 2 - �������������� �� ��������� �����
  G_STARTUPDATER: Byte = 0;

  G_UPDPATH: string = ''; //���� � ����� � ������������ ��� ��������� ������ ����������
  G_NEWAPPVERS: Integer = 0; //����� ������ ����������
  G_STARTAPP: Boolean = False; //��������� ���������� ����� ����������

  G_CONNECTSTR: string = 'DriverID=MySQL' + sLineBreak +
                         'User_name=root' + sLineBreak +
                         'Password=serg' + sLineBreak +
                         'SERVER=localhost' + sLineBreak +
                         'DATABASE=smeta' + sLineBreak +
                         'CharacterSet=cp1251' + sLineBreak +
                         'TinyIntFormat=Integer';
//******************************************************************************

//******************************************************************************
  //������������ ��������� �������
  G_CALCMODE: Byte = 1;   //0 - ����� (������) ������� �������; 1 - ������ (�� ������), ��� � ������ ���������
  //������������ ������� ����������� ������
  G_SHOWMODE: Byte = 1;  //0 - � ����������� �� ���������� � �����������
  //��������� RegisterClipboardFormat()
  G_SMETADATA: Integer;
  //����� ����������� ����������, ����������� ��� ������ ��������
  G_MATBYFFER: TMatSprByffer;

implementation

class procedure TMatSprByffer.CopyByffer(ASoursByffer, ADestByffer: PSprArray);
var i: Integer;
begin
  SetLength(ADestByffer^, Length(ASoursByffer^));
  for i := Low(ASoursByffer^) to High(ASoursByffer^) do
  begin
    ADestByffer^[i].ID := ASoursByffer^[i].ID;
    ADestByffer^[i].Code := ASoursByffer^[i].Code;
    ADestByffer^[i].Name := ASoursByffer^[i].Name;
    ADestByffer^[i].Unt := ASoursByffer^[i].Unt;
    ADestByffer^[i].CoastNDS := ASoursByffer^[i].CoastNDS;
    ADestByffer^[i].CoastNoNDS := ASoursByffer^[i].CoastNoNDS;
    ADestByffer^[i].ZpMach := ASoursByffer^[i].ZpMach;
    ADestByffer^[i].TrZatr := ASoursByffer^[i].TrZatr;
    ADestByffer^[i].MType := ASoursByffer^[i].MType;
  end;
end;

end.
