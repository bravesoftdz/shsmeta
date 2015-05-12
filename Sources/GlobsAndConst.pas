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
    CoastNoNDS: Extended;
    MType: byte;
  end;
  PSprRecord = ^TSprRecord;
  TSprArray = array of TSprRecord;

  //���������
  TSmClipRec = packed record
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

  CTabNameAndID: array [0..17, 0..1] of string =
    (('objcards', 'obj_id'),
    ('smetasourcedata', 'SM_ID'),
    ('card_rate', 'ID'),
    ('materialcard', 'ID'),
    ('mechanizmcard', 'ID'),
    ('devicescard', 'ID'),
    ('dumpcard', 'ID'),
    ('transpcard', 'ID'),
    ('data_estimate', 'ID'),
    ('card_acts', 'ID'),
    ('card_rate_act', 'ID'),
    ('materialcard_act', 'ID'),
    ('mechanizmcard_act', 'ID'),
    ('devicescard_act', 'ID'),
    ('dumpcard_act', 'ID'),
    ('transpcard_act', 'ID'),
    ('data_act', 'ID'),
    ('calculation_coef', 'calculation_coef_id'));

type
  TIDConvertArray = array [0..17, 0..1] of array of Integer;
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
  G_CALCMODE: Byte = 1;   //0 - ������ (������) ������� �������
  //������������ ������� ����������� ������
  G_SHOWMODE: Byte = 1;  //0 - � ����������� �� ���������� � �����������
  //��������� RegisterClipboardFormat()
  G_SMETADATA: Integer;

implementation

end.
