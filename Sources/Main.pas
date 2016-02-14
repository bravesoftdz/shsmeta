Unit Main;

interface

uses
  Classes, Windows, Messages, SysUtils, Variants,
  Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Menus, ComCtrls, ToolWin, StdCtrls, Buttons,
  DBGrids, ShellAPI, DateUtils, IniFiles, Grids,
  UpdateModule, ArhivModule, Data.DB, GlobsAndConst,
  Vcl.Imaging.pngimage, JvComponentBase, JvAppStorage, JvAppIniStorage,
  JvFormPlacement, Vcl.Clipbrd, JvGIF, Vcl.Imaging.GIFImg,
  System.UITypes,
  RC6,
  uMemoryLoader,
  hwid_impl,
  winioctl,
  System.AnsiStrings;

type
  TLayeredWndAttr = function(hwnd: integer; color: integer; level: integer; mode: integer): integer; stdcall;

  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    MenuHelp: TMenuItem;
    HelpAbout: TMenuItem;
    MenuFile: TMenuItem;
    FileClose: TMenuItem;
    MenuWindows: TMenuItem;
    WindowsMinimize: TMenuItem;
    WindowsHorizontal: TMenuItem;
    WindowsVertical: TMenuItem;
    WindowsCascade: TMenuItem;
    WindowsSeparator: TMenuItem;
    WindowsExpand: TMenuItem;
    N3: TMenuItem;
    MenuConnectDatabase: TMenuItem;
    FileSaveAs: TMenuItem;
    MenuHRR: TMenuItem;
    HRRTariffs: TMenuItem;
    TariffsTransportation: TMenuItem;
    HelpSupport: TMenuItem;
    HelpRegistration: TMenuItem;
    HelpSite: TMenuItem;
    MenuService: TMenuItem;
    ServiceBackup: TMenuItem;
    ServiceRecovery: TMenuItem;
    ServiceUpdate: TMenuItem;
    ServiceAssistant: TMenuItem;
    ServiceSettings: TMenuItem;
    PanelOpenWindows: TPanel;
    TimerCover: TTimer;
    N4: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N31: TMenuItem;
    N51: TMenuItem;
    N62: TMenuItem;
    ActC6: TMenuItem;
    N1: TMenuItem;
    N14: TMenuItem;
    N17: TMenuItem;
    CalculationSettings: TMenuItem;
    MenuCatalogs: TMenuItem;
    HRRReferenceData: TMenuItem;
    HRROwnData: TMenuItem;
    PanelCover: TPanel;
    N16: TMenuItem;
    OXRandOPRg: TMenuItem;
    HRRPrices: TMenuItem;
    MMAeroAdmin: TMenuItem;
    MMAmmyyAdmin: TMenuItem;
    MenuOrganizations: TMenuItem;
    MenuLists: TMenuItem;
    MenuSetCoefficients: TMenuItem;
    MenuListsPartsEstimates: TMenuItem;
    MenuListsSectionsEstimates: TMenuItem;
    MenuListsTypesWorks: TMenuItem;
    mTypeAct: TMenuItem;
    MenuListsIndexesChangeCost: TMenuItem;
    MenuLists�ategoriesObjects: TMenuItem;
    N61: TMenuItem;
    mCalcResources: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Administator: TMenuItem;
    UpdatePanel: TPanel;
    imgUpdate: TImage;
    Label1: TLabel;
    TimerUpdate: TTimer;
    LabelDot: TLabel;
    N11: TMenuItem;
    mnZP_OBJ: TMenuItem;
    mnZP_OBJ_AKT: TMenuItem;
    mnRASX_ACT: TMenuItem;
    PMAddNewBackup: TMenuItem;
    N18: TMenuItem;
    PMRestoreBackup: TMenuItem;
    PMDeleteBackup: TMenuItem;
    PMRestoreOldBackup: TMenuItem;
    vk1: TMenuItem;
    vk2: TMenuItem;
    vk3: TMenuItem;
    vk4: TMenuItem;
    vk5: TMenuItem;
    vk6: TMenuItem;
    vk7: TMenuItem;
    N10: TMenuItem;
    vk9: TMenuItem;
    mnREPORT_SMETA_OBJ_BUILD: TMenuItem;
    N12: TMenuItem;
    mN15: TMenuItem;
    mN16: TMenuItem;
    mN17: TMenuItem;
    mnSMETA_LSR_FROM_OBJ: TMenuItem;
    mnSMETA_LSR_ZIM: TMenuItem;
    mnSMETA_LSR_TRUD: TMenuItem;
    mnCALC_SMETA_OBJ_GRAPH_C: TMenuItem;
    mnSMETA_RES_FROM_OBJ: TMenuItem;
    N13: TMenuItem;
    jsMenu1: TMenuItem;
    jsMenu2: TMenuItem;
    jsMenu3: TMenuItem;
    jsMenu4: TMenuItem;
    N15: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    JSMenu10: TMenuItem;
    JSMenu9: TMenuItem;
    JSMenu6: TMenuItem;
    JSMenu7: TMenuItem;
    JSMenu8: TMenuItem;
    jsMenu5: TMenuItem;
    AppIni: TJvAppIniFileStorage;
    img1: TImage;
    img2: TImage;
    mN22: TMenuItem;
    mN2: TMenuItem;
    mReport: TMenuItem;
    N22: TMenuItem;
    Excel1: TMenuItem;
    EXCEL2: TMenuItem;
    Excel3: TMenuItem;
    mN23: TMenuItem;
    mhfybkbotafqkjd1: TMenuItem;
    mN24: TMenuItem;
    mN27: TMenuItem;
    mN28: TMenuItem;
    mN32: TMenuItem;
    mN41: TMenuItem;
    mN52: TMenuItem;
    mN29: TMenuItem;
    mN110: TMenuItem;
    ArchivPanel: TPanel;
    lbArchStatys: TLabel;
    imgArchive: TImage;
    pnlArchiv1: TPanel;
    pgArchiv: TProgressBar;
    N23: TMenuItem;
    ServiceUpdNorm: TMenuItem;
    mConstractorService: TMenuItem;
    mTranspNorm: TMenuItem;
    mBuildZone: TMenuItem;
    mHelpKfSt: TMenuItem;
    mN33: TMenuItem;
    mN111: TMenuItem;
    mN34: TMenuItem;
    mN35: TMenuItem;
    mN42: TMenuItem;
    mUsers: TMenuItem;
    mLogIn: TMenuItem;
    mN31: TMenuItem;
    mN36: TMenuItem;
    mN26: TMenuItem;
    mN30: TMenuItem;
    mN37: TMenuItem;
    mN25: TMenuItem;
    mN38: TMenuItem;
    FormStorage: TJvFormStorage;
    mDebug1: TMenuItem;
    pmLicenseKey: TMenuItem;
    mN3: TMenuItem;
    mTest_1: TMenuItem;
    mTesting: TMenuItem;
    mRecucle1: TMenuItem;
    mReportPrint: TMenuItem;
    pmTestSlava: TMenuItem;
    procedure TariffsTransportationClick(Sender: TObject);
    procedure TariffsMechanismClick(Sender: TObject);
    procedure TariffsDumpClick(Sender: TObject);
    procedure TariffsIndexClick(Sender: TObject);

    procedure WindowsHorizontalClick(Sender: TObject);
    procedure WindowsVerticalClick(Sender: TObject);
    procedure WindowsCascadeClick(Sender: TObject);
    procedure WindowsMinimizeClick(Sender: TObject);
    procedure WindowsExpandClick(Sender: TObject);

    procedure FileCloseClick(Sender: TObject);

    procedure HelpAboutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure CascadeForActiveWindow();
    procedure FormCreate(Sender: TObject);

    function CreateButtonOpenWindow(const CaptionButton, HintButton: String; const AForm: TForm;
      AEventType: Byte = 0): TSpeedButton;
    procedure DeleteButtonCloseWindow(const CaptionButton: String);
    procedure SelectButtonActiveWindow(const CaptionButton: String);
    procedure ReplaceButtonOpenWindow(const AFrom, ATo: TForm);

    procedure TimerCoverTimer(Sender: TObject);
    procedure ServiceSettingsClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ActC6Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure OXRandOPRgClick(Sender: TObject);
    procedure CalculationSettingsClick(Sender: TObject);
    procedure ReadSettingsFromFile(PathFile: String);
    procedure WriteSettingsToFile(PathFile: String);
    procedure HRRReferenceDataClick(Sender: TObject);
    procedure HRROwnDataClick(Sender: TObject);
    procedure RunProgramsRemoteControl(Sender: TObject);
    procedure MenuPartsEstimatesClick(Sender: TObject);
    procedure MenuSetCoefficientsClick(Sender: TObject);
    procedure MenuOrganizationsClick(Sender: TObject);
    procedure MenuListsSectionsEstimatesClick(Sender: TObject);
    procedure MenuListsTypesWorksClick(Sender: TObject);
    procedure MenuListsIndexesChangeCostClick(Sender: TObject);
    procedure MenuLists�ategoriesObjectsClick(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure mCalcResourcesClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure ServiceUpdateClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure UpdatePanelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure mnZP_OBJClick(Sender: TObject);
    procedure mnZP_OBJ_AKTClick(Sender: TObject);
    procedure mnRASX_ACTClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PMAddNewBackupClick(Sender: TObject);
    procedure ServiceBackupClick(Sender: TObject);
    procedure PMRestoreBackupClick(Sender: TObject);
    procedure PMDeleteBackupClick(Sender: TObject);
    procedure vk2Click(Sender: TObject);
    procedure vk3Click(Sender: TObject);
    procedure vk4Click(Sender: TObject);
    procedure vk5Click(Sender: TObject);
    procedure vk6Click(Sender: TObject);
    procedure vk7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure vk9Click(Sender: TObject);
    procedure mnREPORT_SMETA_OBJ_BUILDClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure mN15Click(Sender: TObject);
    procedure mN17Click(Sender: TObject);
    procedure mnSMETA_LSR_FROM_OBJClick(Sender: TObject);
    procedure mnSMETA_LSR_ZIMClick(Sender: TObject);
    procedure mnSMETA_LSR_TRUDClick(Sender: TObject);
    procedure mnCALC_SMETA_OBJ_GRAPH_CClick(Sender: TObject);
    procedure mnSMETA_RES_FROM_OBJClick(Sender: TObject);
    procedure VK2N13Click(Sender: TObject);
    procedure JSMenuClick(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure EXCEL3Click(Sender: TObject);
    procedure mN22Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure mN23Click(Sender: TObject);
    procedure mhfybkbotafqkjd1Click(Sender: TObject);
    procedure HRRPricesClick(Sender: TObject);
    procedure mN24Click(Sender: TObject);
    procedure mN27Click(Sender: TObject);
    procedure mN110Click(Sender: TObject);
    procedure MenuServiceClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N23Click(Sender: TObject);
    procedure ServiceUpdNormClick(Sender: TObject);
    procedure mConstractorServiceClick(Sender: TObject);
    procedure mTranspNormClick(Sender: TObject);
    procedure mBuildZoneClick(Sender: TObject);
    procedure mHelpKfStClick(Sender: TObject);
    procedure mN111Click(Sender: TObject);
    procedure mLogInClick(Sender: TObject);
    procedure mUsersClick(Sender: TObject);
    procedure mN26Click(Sender: TObject);
    procedure mN30Click(Sender: TObject);
    procedure mN36Click(Sender: TObject);
    procedure mN25Click(Sender: TObject);
    procedure mN38Click(Sender: TObject);
    procedure mReportClick(Sender: TObject);
    procedure HelpSupportClick(Sender: TObject);
    procedure mDebug1Click(Sender: TObject);
    procedure pmLicenseKeyClick(Sender: TObject);
    procedure mN3Click(Sender: TObject);
    procedure PMRestoreOldBackupClick(Sender: TObject);
    procedure mTest_1Click(Sender: TObject);
    procedure mReportPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmTestSlavaClick(Sender: TObject);
    procedure mTypeActClick(Sender: TObject);
  private
    CountOpenWindows: integer;
    ButtonsWindows: array [0 .. 11] of TSpeedButton;

    FChackUpdateThread: TChackUpdateThread; // ���� �������� ����������
    FCreateMirrorThread: TCreateMirrorThread; // ���� �������� �������
    FUpdateType: Byte; // 0 - ���������� � �������; 1 - ���������� � �������
    FCreateMirror: Boolean; // ���� �������� ������� ����������
    FCreateMirrorPath: string; // ���� ���� �������� ����������
    FMirrorPath: string; // ����� �� ������� ������� ����������� ��� FUpdateType = 1
    FCurVersion: TVersion; // ������� ������ ���������� � ��
    FDebugMode: Boolean; // ����� ������� ���������� (��������� ��������� ���������� �� ����� ��� �������)

    FFirstStart: Integer;

    FileReportPath: string; // ���� � ����� � ��������(���� �� ���������� ���������� ������� ��������)

    // ������ �������� �� �������� ������� � �� ��������������
    FArhiv: TBaseAppArhiv;
    FCheckLicenseFlag: Boolean;
    FLicenseClose: Boolean;

    procedure GetUpdateSystemInfo;
    procedure OnUpdate(var Mes: TMessage); message WM_SHOW_SPLASH;
    procedure ThreadEXCEPTION(var Mes: TMessage); message WM_EXCEPTION;
    procedure ARCHIVEPROGRESS(var Mes: TMessage); message WM_ARCHIVEPROGRESS;
    procedure CHECKLICENCE(var Mes: TMessage); message WM_CHECKLICENCE;
    procedure ShowSplashForm;
    procedure ShowUpdateForm(const AResp: TServiceResponse);

    procedure ButtonClickEvent1(Sender: TObject);
    procedure ButtonClickEvent2(Sender: TObject);
    procedure FormShowEvent1(Sender: TObject);
    procedure FormShowEvent2(Sender: TObject);
  public
    procedure IniSystem;
  end;

  TProgramSettings = record
    BackgroundHead: integer;
    FontHead: integer;
    BackgroundRows: integer;
    FontRows: integer;
    BackgroundSelectRow: integer;
    FontSelectRow: integer;
    BackgroundSelectCell: integer;
    FontSelectCell: integer;
    SelectRowUnfocusedTable: integer;
    AutoCreateEstimates: Boolean; // ������������� ��������� ����� ���� ��� �������� �������
    AutoExpandTreeEstimates: Boolean; // ������������� ���������� ������ ����
    CalcResourcesAutoSave: Boolean;
    // ������������� ��������� ��������� �� ����� ������� ��������� �������� ��� �������������
    RoundTo: integer; // ��������� ����� �� vRoundTo ������ ����� �������
    AutosaveRateDescr: Boolean;
    // ������������� ��������� �������� ������� � ����� ������� �� ����� ������� �����
    AutoSaveCalcResourcesAfterExitCell: Boolean;
    // �������������� ���� ������ ��� �������� ������ ������������� ������ �� ����� ������� ��������� ��������
    ShowNeedSaveDialog: Boolean; // ������ �� ���������� ����� ������-���-������ ���������
    ShowHint: Boolean;
    FindAutoRepInAllRate: Boolean; // ���� ������������� ������ ���������� �� ���� ���������
    GridFontName: string; // ����� ������
    GridFontSize: integer; // ������
    GridFontStyle: Byte; // �����
    ControlsFontName: string; // ����� ������
    ControlsFontSize: integer; // ������
    ControlsFontStyle: Byte; // �����
    TextFontName: string; // ����� ������
    TextFontSize: integer; // ������
    TextFontStyle: Byte; // �����
    AddRateType1ToLocal: Boolean; // ���������� ��������� ������������ � ��������� �����
    AddRateType0ToPNR: Boolean; // ���������� ��������� �������� � ��� �����
    UseBoldFontForName: Boolean;
    AutoScrollToNextRow: Boolean;
    UseOldFormuls: Boolean;
    AllowObjectDatesChange: Boolean; // ��������� ��������� ��� ������� �������� � ������� �������
  end;

const
  ColorWarningField = $008080FF;

  FolderSettings = '';
  FileSettingsTables = FolderSettings + 'SettingsTables.ini';
  FileProgramSettings = FolderSettings + 'ProgramSettings.ini';
  FileDefaultSettingsTables = FolderSettings + 'SettingsDefault\SettingsTables.ini';
  FileDefaultProgramSettings = FolderSettings + 'SettingsDefault\ProgramSettings.ini';
  ProgramsRemoteControl = 'Programs remote control';
  AmmyyAdmin = 'AA_v3.exe';
  AeroAdmin = 'AeroAdmin.exe';
  // -----------------------------------------

  { SettingsTables.ini }

  ColumnCount = 'CC';
  ColumnCountHide = 'CCH';
  RowsCount = 'RC';
  ColumnWidth = 'CW';
  ColumnVisible = 'CV';
  ColumnName = 'CN';
  RowName = 'RN';

  // -----------------------------------------

  { ProgramSettings.ini }

  BackgroundHead = 'BH';
  FontHead = 'FH';
  BackgroundRows = 'BR';
  FontRows = 'FR';
  BackgroundSelectRow = 'BSR';
  FontSelectRow = 'FSR';
  BackgroundSelectCell = 'BSC';
  FontSelectCell = 'FSC';
  SelectRowUnfocusedTable = 'SRUT';

  vRoundTo = 'RT';
  vShowHint = 'SH';

  // �������� ����
  FormNameMain = '�����';
  FormNameCoefficientOrders = '����������� �� ��������';
  FormNameCardOrganization = '�������� �����������';
  FormNameCardCoefficients = '�������� �������������';
  FormNameCardPartsEstimates = '�������� ������ ����';
  FormNameCardSectionsEstimates = '�������� �������� ����';
  FormNameCardTypesWorks = '�������� ����� �����';
  FormNameTypesActs = '���� �����';
  FormNameIndexesChangeCost = '������� ��������� ���������';
  FormNameCardIndexesChangeCost = '�������� �������� ��������� ���������';
  FormNameCardCategoriesObjects = '�������� ��������� ��������';
  FormNamePriceMaterials = '���� �� ���������';
  FormNamePriceMechanizms = '���� �� ���������';
  FormNamePriceDumps = '������ �� �������';
  FormNameOwnData = '����������� ������';
  FormNameReferenceData = '���������� ������';
  FormNamePricesOwnData = '���� �� ����������� ������';
  FormNamePricesReferenceData = '���� �� ���������� ������';
  FormNameAdditionData = '���������� ������';
  FormNamePartsEstimates = '����� ����';
  FormNameSectionsEstimates = '������� ����';
  FormNameTypesWorks = '���� �����';
  FormNameOrganizations = '�����������';

const
  LWA_ALPHA = $2;
  LWA_COLORKEY = $1;
  WS_EX_LAYERED = $80000;

var
  FormMain: TFormMain;
  PS: TProgramSettings;
  FMEndTables: Char;

implementation

uses TariffsTransportanion, TariffsMechanism, TariffsDump, TariffsIndex,
  About, CalculationEstimate, CardObject, DataModule,
  Login, Waiting, ActC6, WorkSchedule, HelpC3, HelpC5, CatalogSSR,
  OXRandOPR, DataTransfer, CalculationSettings, ProgramSettings,
  ObjectsAndEstimates, OwnData, ReferenceData, PricesOwnData,
  CardObjectContractorServices, PricesReferenceData, AdditionData,
  PartsEstimates, IndexesChangeCost, CategoriesObjects,
  KC6Journal, CalcResource, CalcTravel, UniDict, TravelList, Tools,
  fUpdate, EditExpression, dmReportU, Coef, WinterPrice, TariffDict,
  OXROPRSetup, OrganizationsEx, KC6, NormativDirectory, ForecastCostIndex,
  FileStorage, ForemanList, OXROPR, SprController, SSR, ArhivRestore,
  FireDAC.UI.Intf, CategoryList, NormativDictHelp, BuildZone, HelpKfSt,
  Users, RoundSetup, InstructionHelp, TypeWorkList, SectionEstimateList,
  SprSelection,
  DebugTables,
  System.Win.Registry,
  SerialKeyModule,
  fLicense, SmReportData,
  uTestForRoma, SmReportMain, TypeAct,
  IdHTTP,
  IdGlobal,
  IdCoderMIME;

{$R *.dfm}

// ---------------------------------------------------------------------------------------------------------------------
procedure TFormMain.ShowSplashForm;
begin
  UpdatePanel.Left := ClientWidth - UpdatePanel.Width;
  UpdatePanel.Top := ClientHeight - UpdatePanel.Height;
  UpdatePanel.Visible := true;
  TimerUpdate.Enabled := UpdatePanel.Visible;
end;

procedure TFormMain.ShowUpdateForm(const AResp: TServiceResponse);
var
  UPForm: TUpdateForm;
begin
  UPForm := TUpdateForm.Create(Self);
  try
    UPForm.SetVersion(FCurVersion, AResp);
    UPForm.SetArhiv(FArhiv);
    UPForm.UpdateType := FUpdateType;

    UPForm.ShowModal;
    GetUpdateSystemInfo;
  finally
    FreeAndNil(UPForm);
  end;

  if G_STARTAPP then
  begin
    ShowMessage('��� ���������� ���������� ��������� ����� ������������.');
    Close;
  end;
end;

// ����� ���������� �� ��������������� �������
procedure TFormMain.ThreadEXCEPTION(var Mes: TMessage);
begin
  if Assigned(TObject(Mes.WParam)) and (TObject(Mes.WParam) is Exception) then
    Application.ShowException(Exception(Mes.WParam));
end;

procedure TFormMain.ARCHIVEPROGRESS(var Mes: TMessage);
begin
  if Mes.LParam in [0, 1] then
  begin
    ArchivPanel.Left := ClientWidth - ArchivPanel.Width;
    ArchivPanel.Top := ClientHeight - ArchivPanel.Height;
    ArchivPanel.Visible := true;
  end;

  if Mes.LParam = 0 then
  begin
    pgArchiv.Enabled := False;
    pgArchiv.State := pbsPaused;

    lbArchStatys.Caption := string(PChar(Mes.WParam));
  end;

  if Mes.LParam = 1 then
  begin
    pgArchiv.Enabled := true;
    pgArchiv.Style := pbstMarquee;
    pgArchiv.State := pbsNormal;

    lbArchStatys.Caption := string(PChar(Mes.WParam));
  end;

  if Mes.LParam = 2 then
  begin
    ArchivPanel.Visible := False;
    FArhiv.Update();
  end;
end;

procedure TFormMain.CHECKLICENCE(var Mes: TMessage);
var
  LicenseForm: TLicenseForm;
begin
  if FCheckLicenseFlag then
    Exit;

  LicenseForm := TLicenseForm.Create(Self);
  try
    FCheckLicenseFlag := true;
    LicenseForm.ShowModal;
  finally
    FreeAndNil(LicenseForm);
    FCheckLicenseFlag := False;
    if not CheckCurLicense then
    begin
      FLicenseClose := true;
      PostMessage(Handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

// ����������� � ����������� ����� ����������
procedure TFormMain.OnUpdate(var Mes: TMessage);
var
  Resp: TServiceResponse;
begin
  UpdatePanel.Visible := False;
  TimerUpdate.Enabled := UpdatePanel.Visible;
  Resp := TServiceResponse.Create;
  try
    Resp.Assign(TServiceResponse(Mes.LParam));

    if not Resp.UserRequest then
      ShowSplashForm
    else
      ShowUpdateForm(Resp);
  finally
    FreeAndNil(Resp);
  end;
end;

// �������� ��������� ���������� �� smeta.ini � ������� ������ ����������
procedure TFormMain.GetUpdateSystemInfo;
var
  ini: TIniFile;
  Reg: TRegistry;
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + �_UPD_NAME + '.ini');
  try
    if not ini.SectionExists('System') then
    begin
      ini.WriteInteger('System', 'version', 0);
      ini.WriteInteger('System', 'UpdateType', 0);
      ini.WriteBool('System', 'CreateMirror', False);
      ini.WriteString('System', 'CreateMirrorPath', '');
      ini.WriteString('System', 'MirrorPath', '');

      ini.WriteString('System', 'clientname', '');
      ini.WriteBool('System', 'sendreport', False);

      ini.WriteBool('System', 'debugmode', true);
    end;
    FCurVersion.App := ini.ReadInteger('System', 'version', 0);
    FDebugMode := ini.ReadBool('System', 'debugmode', true);

  finally
    FreeAndNil(ini);
  end;

  Reg := TRegistry.Create(KEY_ALL_ACCESS);
  try
    Reg.RootKey := C_REGROOT;

    if Reg.OpenKey(C_REGKEY + '\' + �_UPD_NAME, true) then
    begin
      if not Reg.ValueExists('UpdateType') then
        Reg.WriteInteger('UpdateType', 0);
      if not Reg.ValueExists('CreateMirror') then
        Reg.WriteBool('CreateMirror', False);
      if not Reg.ValueExists('CreateMirrorPath') then
        Reg.WriteString('CreateMirrorPath', '');
      if not Reg.ValueExists('MirrorPath') then
        Reg.WriteString('MirrorPath', '');

      FUpdateType := Reg.ReadInteger('UpdateType');
      FCreateMirror := Reg.ReadBool('CreateMirror');
      FCreateMirrorPath := Reg.ReadString('CreateMirrorPath');
      FMirrorPath := Reg.ReadString('MirrorPath');
    end
    else
      MessageDlg('Unable to create key!', mtError, mbOKCancel, 0);
    Reg.CloseKey;

    if Reg.OpenKey(C_REGKEY + '\' + C_LICENSEKEY, true) then
    begin
      if Reg.ValueExists('CurLicense') then
        G_CURLISENSE := Reg.ReadString('CurLicense');
    end
    else
      MessageDlg('Unable to create key!', mtError, mbOKCancel, 0);

    // ��������� �����, ���-�� �������� ������ ���������
    if Reg.OpenKey(C_REGKEY, true) then
    begin
      FFirstStart := 0;
      if Reg.ValueExists('FirstStart') then
        FFirstStart := Reg.ReadInteger('FirstStart');
      Reg.WriteInteger('FirstStart', 2)
    end
    else
      MessageDlg('Unable to create key!', mtError, mbOKCancel, 0);
  finally
    Reg.CloseKey;
    FreeAndNil(Reg);
  end;

  if FFirstStart = 1 then
  begin
    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Smeta_form.ini');
    try
      try
        ini.EraseSection('FormCalculationEstimate\TFormCalculationEstimatedbgrdMechanizm');
        ini.EraseSection('FormCalculationEstimate\TFormCalculationEstimatedbgrdMaterial');
        ini.EraseSection('FormCalculationEstimate\TFormCalculationEstimatedbgrdDevices');
      except
      end;
    finally
      FreeAndNil(ini);
    end;

    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Smeta_form.ini');
    try
      try
        ini.EraseSection('FormCalculationEstimate\TFormCalculationEstimatedbgrdMechanizm');
        ini.EraseSection('FormCalculationEstimate\TFormCalculationEstimatedbgrdMaterial');
        ini.EraseSection('FormCalculationEstimate\TFormCalculationEstimatedbgrdDevices');
      except
      end;
    finally
      FreeAndNil(ini);
    end;
  end;

  DM.qrDifferent.Active := False;
  DM.qrDifferent.SQL.Text := 'SELECT max(version) FROM versionref WHERE ' +
    '(execresult > 0) and (SCRIPTCOUNT = SCRIPTNO)';
  DM.qrDifferent.Active := true;
  if not DM.qrDifferent.Eof then
    FCurVersion.Catalog := DM.qrDifferent.Fields[0].AsInteger;
  DM.qrDifferent.Active := False;

  DM.qrDifferent.SQL.Text := 'SELECT max(version) FROM versionuser WHERE ' +
    '(execresult > 0) and (SCRIPTCOUNT = SCRIPTNO)';
  DM.qrDifferent.Active := true;
  if not DM.qrDifferent.Eof then
    FCurVersion.User := DM.qrDifferent.Fields[0].AsInteger;
  DM.qrDifferent.Active := False;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // if VarIsNull(dmSmReport.ADocument) then
  dmSmReport.closeDocument(dmSmReport.ADocument);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (not G_STARTAPP) and (not FLicenseClose) then
    case Application.MessageBox('�� ������������� ������ ������� ���������?', '�����',
      MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) of
      IDYES:
        begin
          CanClose := true;
        end;
      IDNO:
        begin
          CanClose := False;
        end;
    end;

  if FArhiv.CreateArhInProgress then
  begin
    Application.MessageBox('� ������ ������ ���� �������� ������. ' + #13#10 +
      '��������� ��������� ��������.', '�����', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);

    CanClose := False;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Width := Screen.Width;
  Height := Screen.Height;

  img1.Align := alClient;
  img2.Align := alClient;
  PanelCover.Align := alClient;

  FMEndTables := 'g';
  // ��������� ��������� �����������
  FormatSettings.DecimalSeparator := '.';

  ReadSettingsFromFile(ExtractFilePath(Application.ExeName) + FileProgramSettings);

  // ������ ��� ���������� �������
  FArhiv := TBaseAppArhiv.Create(ExtractFilePath(Application.ExeName), ExtractFilePath(Application.ExeName) +
    C_ARHDIR);

  // ���� � ����� � �������� (�����)
  // {$IFDEF DEBUG}
  // FileReportPath := Copy(ExtractFilePath(Application.ExeName), 1, Length(ExtractFilePath(Application.ExeName))
  // - 12) + C_REPORTDIR;
  // {$ELSE}
  // FileReportPath := ExtractFilePath(Application.ExeName) + C_REPORTDIR;
  // {$ENDIF}
  FileReportPath := ExtractFilePath(Application.ExeName) + C_REPORTDIR;

  // ���������� ����� ��� ������ ������������� ����� � ���������
  Windows.SetEnvironmentVariable('SMETADIR', PChar(ExtractFileDir(Application.ExeName)));
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(SprControl);
  FreeAndNil(FArhiv);
  DM.Connect.Connected := False;
  if Assigned(FChackUpdateThread) then
  begin // ��������� Terminate ����������� ��� ��� �� �������������
    FChackUpdateThread.Terminate;
    FChackUpdateThread.WaitFor;
    FreeAndNil(FChackUpdateThread);
  end;

  if Assigned(FCreateMirrorThread) then
    FreeAndNil(FCreateMirrorThread);
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  if UpdatePanel.Visible then
  begin
    UpdatePanel.Left := ClientWidth - UpdatePanel.Width;
    UpdatePanel.Top := PanelOpenWindows.Top - UpdatePanel.Height;
  end;
end;

procedure TFormMain.IniSystem;
begin
  if Assigned(FChackUpdateThread) then
  begin // ��������� Terminate ����������� ��� ��� �� �������������
    FChackUpdateThread.Terminate;
    FChackUpdateThread.WaitFor;
    FreeAndNil(FChackUpdateThread);
  end;

  if Assigned(FCreateMirrorThread) then
    FreeAndNil(FCreateMirrorThread);

  GetUpdateSystemInfo;

  if not CheckCurLicense then
    PostMessage(Handle, WM_CHECKLICENCE, 0, 0);

  // ������ ������� ��� ����������� ����������
  if not FDebugMode then
    FChackUpdateThread := TChackUpdateThread.Create(Self.Handle, FCurVersion, FUpdateType, FMirrorPath)
  else
  begin
    FChackUpdateThread := nil;
    ServiceUpdate.Enabled := False;
  end;

  if FCreateMirror then
    FCreateMirrorThread := TCreateMirrorThread.Create(FCreateMirrorPath, Application.ExeName,
      FCurVersion.App);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  try
    if not DM.Connect.Connected then
    begin
      // DM.Connect.Params.Text := G_CONNECTSTR;
      // DM.Connect.Connected := true;

      mLogInClick(nil);
      if G_USER_ID = 0 then
      begin
        Application.Terminate;
        Exit;
      end;

      // �������� ������������
      FormWaiting.Height := 110;
      FormWaiting.lbProcess.Caption := '�������� ������������:';
      FormWaiting.Show;
      Application.ProcessMessages;

      FormWaiting.lbProcess.Caption := '�������� ������������:'#13 + '����������� ���';
      Application.ProcessMessages;
      // ������ ��� �������� ������������
      SprControl := TSprControl.Create(Handle);

      // ���������� ��������� ��������
      FormWaiting.lbProcess.Caption := '�������� ������������:'#13 + '�������� ���������';
      Application.ProcessMessages;
      if (not Assigned(fNormativDirectory)) then
        fNormativDirectory := TfNormativDirectory.Create(Self);

      // ���������� Excel
      FormWaiting.lbProcess.Caption := '�������� ������������:'#13 + '������� �������';
      Application.ProcessMessages;
      dmSmReport.doCreateDoc;
      //
      FormWaiting.Close;
      FormWaiting.Height := 88;
      FormWaiting.lbProcess.Caption := '';
      Application.ProcessMessages;
    end;
  except
    on e: Exception do
    begin
      e.Message := '������ ����������� � ����:' + sLineBreak + e.Message;
      Application.ShowException(e);
      Application.Terminate;
      Exit;
    end;
  end;

  IniSystem;

  PanelCover.Visible := true;

  if (not Assigned(fObjectsAndEstimates)) then
    fObjectsAndEstimates := TfObjectsAndEstimates.Create(Self);
end;

// ---------------------------------------------------------------------------------------------------------------------
// ���������� �������� �� ������ ������
procedure TFormMain.ButtonClickEvent1(Sender: TObject);
var
  sb: TSpeedButton;
begin
  sb := TSpeedButton(Sender);
  if Assigned(TForm(sb.Tag)) then
    FormShowEvent1(TForm(sb.Tag));
end;

procedure TFormMain.ButtonClickEvent2(Sender: TObject);
var
  sb: TSpeedButton;
begin
  sb := TSpeedButton(Sender);
  if Assigned(TForm(sb.Tag)) then
    FormShowEvent2(TForm(sb.Tag));
end;

procedure TFormMain.FormShowEvent2(Sender: TObject);
var
  TmpForm: TForm;
begin
  // PanelCover.Visible := true;
  try
    TmpForm := TForm(Sender);
    if TmpForm.WindowState = wsMinimized then
      TmpForm.WindowState := wsNormal;

    TmpForm.Show;
  finally
    // PanelCover.Visible := False;
  end;
end;

procedure TFormMain.FormShowEvent1(Sender: TObject);
begin
  TForm(Sender).Show;
  TForm(Sender).BringToFront;
end;

function TFormMain.CreateButtonOpenWindow(const CaptionButton, HintButton: String; const AForm: TForm;
  AEventType: Byte = 0): TSpeedButton;
begin
  Result := TSpeedButton.Create(Application);
  Result.Parent := PanelOpenWindows;
  Result.Align := alLeft;
  Result.Font.Name := PS.ControlsFontName;
  Result.Font.Size := PS.ControlsFontSize;
  Result.Font.Style := TFontStyles(PS.ControlsFontStyle);
  Result.Width := GetTextWidth(CaptionButton, Handle) + 4;
  Result.Height := 25;
  Result.Top := 1;
  Result.Caption := CaptionButton;
  Result.GroupIndex := 1;
  Result.Down := true;
  Result.ShowHint := true;
  Result.Hint := HintButton;

  if (AEventType = 1) then
    Result.OnClick := ButtonClickEvent2
  else
    Result.OnClick := ButtonClickEvent1;

  Result.Tag := integer(AForm);
  ButtonsWindows[CountOpenWindows] := Result;
  Inc(CountOpenWindows);
end;

procedure TFormMain.DeleteButtonCloseWindow(const CaptionButton: String);
var
  i, Y: integer;
begin
  if not Assigned(PanelOpenWindows) or Application.Terminated then
    Exit;

  Y := -1;
  for i := 0 to CountOpenWindows - 1 do
    if (ButtonsWindows[i].Caption = CaptionButton) then
    begin
      Y := i;
      Break;
    end;

  if (Y = -1) then // ��� ������ � ����� ���������
    Exit;

  ButtonsWindows[Y].Free;
  ButtonsWindows[Y] := nil;

  while Y < CountOpenWindows - 1 do
  begin
    ButtonsWindows[Y] := ButtonsWindows[Y + 1];
    Inc(Y);
  end;

  Dec(CountOpenWindows);
end;

procedure TFormMain.SelectButtonActiveWindow(const CaptionButton: String);
var
  i: integer;
begin
  for i := 0 to CountOpenWindows - 1 do
    if ButtonsWindows[i].Caption = CaptionButton then
    begin
      ButtonsWindows[i].Down := true;
      Exit;
    end;
end;

procedure TFormMain.ServiceBackupClick(Sender: TObject);
var
  i: integer;
  Mi, TmpMi, TmpMi2: TMenuItem;
begin
  Mi := TMenuItem(Sender);
  // ������ 3� ������ ���������� ������, ��������� ����������� ��� �������������
  for i := 3 to Mi.Count - 1 do
    Mi.Delete(3);

  // ���� ���� ������������� ������ �� ������� ������
  if G_STARTUPDATER > 0 then
  begin
    PMAddNewBackup.Enabled := False;
    Exit;
  end
  else
    PMAddNewBackup.Enabled := true;

  for i := Low(FArhiv.ArhFiles) to High(FArhiv.ArhFiles) do
  begin
    TmpMi := TMenuItem.Create(Mi);

    try
      TmpMi.Caption := DateTimeToStr(FArhiv.GetArhivTime(FArhiv.ArhFiles[i]));
    except
      TmpMi.Caption := ExtractFileName(FArhiv.ArhFiles[i]);
    end;

    TmpMi2 := TMenuItem.Create(TmpMi);
    TmpMi2.Caption := '������������';
    TmpMi2.OnClick := PMRestoreBackupClick;
    TmpMi.Add(TmpMi2);
    TmpMi2 := TMenuItem.Create(TmpMi);
    TmpMi2.Caption := '�������';
    TmpMi2.OnClick := PMDeleteBackupClick;
    TmpMi.Add(TmpMi2);
    TmpMi.Tag := integer(FArhiv.ArhFiles[i]);
    Mi.Add(TmpMi);
  end;
end;

procedure TFormMain.ServiceSettingsClick(Sender: TObject);
var
  FormProgramSettings: TfProgramSettings;
begin
  LicenseAssigned(nil);
  FormProgramSettings := TfProgramSettings.Create(nil);
  try
    if FormProgramSettings.ShowModal = mrOk then
    begin
      // ������ ��� ����� ��������� �������� �������������������� ������� ����������
      IniSystem;
    end;
  finally
    FreeAndNil(FormProgramSettings);
  end;
end;

procedure TFormMain.ServiceUpdateClick(Sender: TObject);
begin
  if LicenseAssigned(FChackUpdateThread) then
  begin
    FChackUpdateThread.UserRequest;
  end;
end;

procedure TFormMain.ServiceUpdNormClick(Sender: TObject);
var
  tmp: TFDGUIxScreenCursor;
begin
  try
    with DM.qrDifferent do
    begin
      Active := False;
      SQL.Text := 'CALL `UpdateNormSortField`()';
      tmp := DM.FDGUIxWaitCursor1.ScreenCursor;
      try
        DM.FDGUIxWaitCursor1.ScreenCursor := TFDGUIxScreenCursor.gcrHourGlass;
        ExecSQL;
      finally
        DM.FDGUIxWaitCursor1.ScreenCursor := tmp;
      end;
    end;
  except
    on e: Exception do
    begin
      e.Message := '�������� ����������:' + sLineBreak + e.Message;
      Application.ShowException(e);
    end;
  end;
end;

procedure TFormMain.TimerCoverTimer(Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  PanelCover.Visible := False;
end;

procedure TFormMain.TimerUpdateTimer(Sender: TObject);
var
  i: integer;
begin
  LabelDot.Caption := '';
  for i := 1 to TimerUpdate.Tag do
    LabelDot.Caption := LabelDot.Caption + '.';
  if TimerUpdate.Tag >= 3 then
    TimerUpdate.Tag := 0
  else
    TimerUpdate.Tag := TimerUpdate.Tag + 1;
end;

// ������� ������ ����������
procedure TFormMain.UpdatePanelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: integer);
begin
  UpdatePanel.Visible := False;
  TimerUpdate.Enabled := UpdatePanel.Visible;
end;

procedure TFormMain.vk2Click(Sender: TObject);
begin
  // dmReportF.Report_WINTER_RS_OBJ(FormObjectsAndEstimates.IdEstimate, FileReportPath);
  Screen.Cursor := crSQLWait;
  try
    if LicenseAssigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_WINTER_RS_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        dmReportF.Report_WINTER_RS_OBJ(FormCalculationEstimate.IdEstimate, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.TariffsTransportationClick(Sender: TObject);
begin
  PanelCover.Visible := true;

  if (not LicenseAssigned(FormTariffsTransportation)) then
    FormTariffsTransportation := TFormTariffsTransportation.Create(Self);
end;

procedure TFormMain.TariffsMechanismClick(Sender: TObject);
begin
  if not LicenseAssigned(FormCalculationEstimate) then
  begin
    MessageBox(0, PChar('C������ ���� ������� �����.'), FormNamePriceMechanizms,
      MB_ICONINFORMATION + MB_OK + mb_TaskModal);
    Exit;
  end;

  PanelCover.Visible := true;

  if (not LicenseAssigned(FormTariffsMechanism)) then
    FormTariffsMechanism := TFormTariffsMechanism.Create(Self);
end;

procedure TFormMain.TariffsDumpClick(Sender: TObject);
begin
  PanelCover.Visible := true;

  if (not LicenseAssigned(FormTariffsDump)) then
    FormTariffsDump := TFormTariffsDump.Create(Self);
end;

// ������ �� �������������� ��������
procedure TFormMain.TariffsIndexClick(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not LicenseAssigned(FormTariffsIndex)) then
    FormTariffsIndex := TFormTariffsIndex.Create(Self);

  FormTariffsIndex.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.ActC6Click(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not LicenseAssigned(FormActC6)) then
    FormActC6 := TFormActC6.Create(Self);

  FormActC6.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.N1Click(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not LicenseAssigned(FormWorkSchedule)) then
    FormWorkSchedule := TFormWorkSchedule.Create(Self);

  FormWorkSchedule.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.N22Click(Sender: TObject);
begin

  Screen.Cursor := crSQLWait;
  try
    if LicenseAssigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      // **************************************************************************************************************************************

      ShellExecute(Handle, nil, 'report.exe',
        PChar('S' + INTTOSTR(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger)),
        PChar(FileReportPath + 'report\'), SW_maximIZE);

      // **************************************************************************************************************************************
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        ShellExecute(Handle, nil, 'report.exe', PChar('S' + INTTOSTR(FormCalculationEstimate.IdEstimate)),
          PChar(FileReportPath + 'report\'), SW_maximIZE);

        // **************************************************************************************************************************************
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.N23Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if fObjectsAndEstimates.qrActsEx.FieldByName('PARENT_ID').AsInteger <> 0 then
        ShellExecute(Handle, nil, 'report.exe',
          PChar('A' + INTTOSTR(fObjectsAndEstimates.qrActsEx.FieldByName('MASTER_ID').AsInteger)),
          PChar(FileReportPath + 'report\'), SW_maximIZE);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.Act then
          ShellExecute(Handle, nil, 'report.exe', PChar('A' + INTTOSTR(FormCalculationEstimate.IdEstimate)),
            PChar(FileReportPath + 'report\'), SW_maximIZE);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.mTest_1Click(Sender: TObject);
var
  Form: TTest_Form1;
begin
  Form := TTest_Form1.Create(Self);
  try
    if Form.ShowModal = mrOk then
      ShowMessage(Form.SprRect.Name);
  finally
    FreeAndNil(Form);
  end;

end;

procedure TFormMain.mBuildZoneClick(Sender: TObject);
var
  fBuildZone: TfBuildZone;
begin
  fBuildZone := TfBuildZone.Create(Self);
  try
    fBuildZone.ShowModal;
  finally
    FreeAndNil(fBuildZone);
  end;
end;

procedure TFormMain.mCalcResourcesClick(Sender: TObject);
begin
  if LicenseAssigned(FormCalculationEstimate) then
    ShowCalcResource(FormCalculationEstimate.IdEstimate);
end;

// ������ ���������� �� ����
procedure TFormMain.mConstractorServiceClick(Sender: TObject);
begin {
    if (not Assigned(fUniDict)) then
    fUniDict := TfUniDict.Create(Self);
    fUniDict.qrUniDictType.Locate('unidicttype_id', 7, []);
    fUniDict.Show; }
  ShowContractorServices;
end;

procedure TFormMain.mDebug1Click(Sender: TObject);
begin
  if (not Assigned(fDebugTables)) then
    fDebugTables := TfDebugTables.Create(Self);
  fDebugTables.Show;
end;

procedure TFormMain.mLogInClick(Sender: TObject);
begin
  if FArhiv.CreateArhInProgress then
  begin
    Application.MessageBox('� ������ ������ ���� �������� ������. ' + #13#10 +
      '��������� ��������� ��������.', '�����', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
    Exit;
  end;

  if (not Assigned(fLogIn)) then
    fLogIn := TfLogIn.Create(FormMain);
  if fLogIn.ShowModal <> mrOk then
  begin
    // OnCloseQuery := nil;
    // Close;
  end;
end;

procedure TFormMain.mhfybkbotafqkjd1Click(Sender: TObject);
begin
  if (not LicenseAssigned(fFileStorage)) then
    fFileStorage := TfFileStorage.Create(Self);
  fFileStorage.Show;
end;

procedure TFormMain.mN110Click(Sender: TObject);
var fSSR: TfSSR;
begin
  fSSR := TfSSR.Create(Self,
    VarArrayOf([(Sender as TMenuItem).Tag, (Sender as TMenuItem).Caption, False]));
  try
    fSSR.ShowModal;
  finally
    FreeAndNil(fSSR);
  end;
end;

procedure TFormMain.mN111Click(Sender: TObject);
begin
  if (LicenseAssigned(fNormativDictHelp)) then
    // fNormativDictHelp.Close;
    FreeAndNil(fNormativDictHelp);
  if (not Assigned(fNormativDictHelp)) then
    fNormativDictHelp := TfNormativDictHelp.Create(FormMain,
      VarArrayOf([(Sender as TMenuItem).Caption, (Sender as TMenuItem).Caption]));
  fNormativDictHelp.pgc1.ActivePageIndex := (Sender as TMenuItem).Tag;
  fNormativDictHelp.pgc1Change(nil);
  fNormativDictHelp.Show;
end;

procedure TFormMain.mN15Click(Sender: TObject);
begin
  if (not LicenseAssigned(fTariffDict)) then
    fTariffDict := TfTariffDict.Create(Self);
  fTariffDict.Show;
end;

procedure TFormMain.mN17Click(Sender: TObject);
begin
  if (not LicenseAssigned(fOXROPRSetup)) then
    fOXROPRSetup := TfOXROPRSetup.Create(Self);
  fOXROPRSetup.Show;
end;

procedure TFormMain.mN22Click(Sender: TObject);
begin
  if (not Assigned(fNormativDirectory)) then
    fNormativDirectory := TfNormativDirectory.Create(nil);
  fNormativDirectory.Show;
end;

procedure TFormMain.mN23Click(Sender: TObject);
begin
  if (not LicenseAssigned(fForecastCostIndex)) then
    fForecastCostIndex := TfForecastCostIndex.Create(nil);
  fForecastCostIndex.Show;
end;

procedure TFormMain.mN24Click(Sender: TObject);
begin
  if (not LicenseAssigned(fForemanList)) then
    fForemanList := TfForemanList.Create(FormMain);
  fForemanList.Show;
end;

procedure TFormMain.mN25Click(Sender: TObject);
begin
  if (not Assigned(fUniDict)) then
    fUniDict := TfUniDict.Create(Self);
  fUniDict.FormStyle := fsNormal;
  fUniDict.Width := 400;
  fUniDict.Height := 200;
  fUniDict.Position := poMainFormCenter;
  fUniDict.Visible := False;
  fUniDict.qrUniDictType.Filtered := False;
  fUniDict.qrUniDictType.Locate('unidicttype_id', 14, []);
  fUniDict.pnlLeft.Visible := False;
  fUniDict.lbl1.Visible := False;
  fUniDict.seYear.Visible := False;
  fUniDict.dbmmoparam_description1.Visible := False;
  FormMain.DeleteButtonCloseWindow(fUniDict.Caption);
  fUniDict.Caption := '������';
  fUniDict.pnlClient.Align := alClient;
  fUniDict.FormStorage.Active := False;
  fUniDict.grUniDictParam.RowsHeight := 17;
  fUniDict.grUniDictParam.RowResize := False;
  fUniDict.grUniDictParam.Options := fUniDict.grUniDictParam.Options - [dgIndicator];
  fUniDict.Show;
end;

procedure TFormMain.mN26Click(Sender: TObject);
begin
  if (not Assigned(fCategoryList)) then
    fCategoryList := TfCategoryList.Create(FormMain);
  fCategoryList.Show;
end;

procedure TFormMain.mN27Click(Sender: TObject);
begin
  if (not Assigned(fOXROPR)) then
    fOXROPR := TfOXROPR.Create(FormMain);
  fOXROPR.FormStyle := fsNormal;
  fOXROPR.Show;
end;

procedure TFormMain.mN30Click(Sender: TObject);
begin
  if (not Assigned(fRoundSetup)) then
    fRoundSetup := TfRoundSetup.Create(FormMain);
  fRoundSetup.ShowModal;
end;

procedure TFormMain.mN36Click(Sender: TObject);
begin
  if (not Assigned(fInstructionHelp)) then
    fInstructionHelp := TfInstructionHelp.Create(FormMain);
  fInstructionHelp.ShowModal;
end;

procedure TFormMain.mN38Click(Sender: TObject);
begin
  if (not Assigned(fObjectsAndEstimates)) then
    fObjectsAndEstimates := TfObjectsAndEstimates.Create(Self);
  fObjectsAndEstimates.Show;
end;

procedure TFormMain.mN3Click(Sender: TObject);
begin
  Exec('http://85.143.218.164:3113/');
end;

procedure TFormMain.mUsersClick(Sender: TObject);
begin
  if (not Assigned(fUsers)) then
    fUsers := TfUsers.Create(FormMain);
  fUsers.ShowModal;
end;

procedure TFormMain.mHelpKfStClick(Sender: TObject);
begin
  if (not Assigned(fHelpKfSt)) then
    fHelpKfSt := TfHelpKfSt.Create(FormMain);
  fHelpKfSt.Show;
end;

// ������ ��������� ����� �� ������� (����� �) v1.00 (�����)
procedure TFormMain.mnCALC_SMETA_OBJ_GRAPH_CClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_CALC_SMETA_OBJ_GRAPH_C(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_CALC_SMETA_OBJ_GRAPH_C(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID')
          .AsInteger, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.mnRASX_ACTClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if fObjectsAndEstimates.qrActsEx.IsEmpty then
      begin
        ShowMessage('�� ������ ���');
        Exit;
      end;
      dmReportF.Report_RASX_MAT(fObjectsAndEstimates.qrActsEx.FieldByName('ID').AsInteger, FileReportPath);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// --> "����� �� ������� �������������" v.1.03
procedure TFormMain.mnREPORT_SMETA_OBJ_BUILDClick(Sender: TObject);
{ var
  param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15,
  param16, param17, param18, param19, param20, param21, param22, param23: Double; }
begin
  {
    Screen.Cursor := crSQLWait;
    try
    if Assigned(FormObjectsAndEstimates) then
    begin
    if FormObjectsAndEstimates.IdEstimate = 0 then
    begin
    ShowMessage('�� ������� �����');
    Exit;
    end;

    // ShowEnter;

    dmReportF.Report_SMETA_OBJ_BUILD(FormObjectsAndEstimates.IdEstimate, FileReportPath, param4, param5,
    param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16,
    param17, param18, param19, param20, param21, param22, param23);
    end
    else
    begin
    if Assigned(FormCalculationEstimate) then
    begin
    if FormCalculationEstimate.IdEstimate = 0 then
    begin
    ShowMessage('�� ������� �����');
    Exit;
    end;

    // ShowEnter;

    dmReportF.Report_SMETA_OBJ_BUILD(FormCalculationEstimate.IdEstimate, FileReportPath, param4, param5,
    param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16,
    param17, param18, param19, param20, param21, param22, param23);
    end;
    end;
    finally
    Screen.Cursor := crDefault;
    end;
  }
end;

// ����� (��������� ������� ������) �� ������� v1.00 (�����)
procedure TFormMain.mnSMETA_LSR_FROM_OBJClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_SMETA_LSR_FROM_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_SMETA_LSR_FROM_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
          FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// ����� (��������� ������� ������) � �������������� �� ������� v1.00 (�����)
procedure TFormMain.mnSMETA_LSR_TRUDClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_SMETA_LSR_TRUD(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_SMETA_LSR_TRUD(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
          FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// ����� (��������� ������� ������) � ������� v1.00 (�����)
procedure TFormMain.mnSMETA_LSR_ZIMClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_SMETA_LSR_ZIM(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_SMETA_LSR_ZIM(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
          FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// ����� (��������-������� ������) �� ������� v1.00 (�����)
procedure TFormMain.mnSMETA_RES_FROM_OBJClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_SMETA_RES_FROM_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_SMETA_RES_FROM_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
          FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.vk3Click(Sender: TObject);
begin

  // dmReportF.Report_WINTER_RS_OBJ(FormObjectsAndEstimates.IdEstimate, FileReportPath);
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_RSMO_OBJ(0, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, 0,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_RSMO_OBJ(0, 0, FormCalculationEstimate.IdObject, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.vk4Click(Sender: TObject);
begin
  // dmReportF.Report_WINTER_RS_OBJ(FormObjectsAndEstimates.IdEstimate, FileReportPath);
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_RSMO_OBJ(1, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, 0,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_RSMO_OBJ(1, 0, FormCalculationEstimate.IdObject, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.vk5Click(Sender: TObject);
begin
  // vk ������ ��������� ���������� ��� ��� �� �������
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_RSMEH_OBJ(0, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, 0,
        FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;

        dmReportF.Report_RSMEH_OBJ(0, 0, FormCalculationEstimate.IdObject, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.vk6Click(Sender: TObject);
begin
  // vk - ������ ��������� ������������ �� �������
end;

procedure TFormMain.vk7Click(Sender: TObject);
begin
  // vk ��������� ��ڨ��� � ��������� �����  �������-1
  Screen.Cursor := crSQLWait;
  try

    if Assigned(FormCalculationEstimate) then
    begin
      if FormCalculationEstimate.IdEstimate = 0 then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_VED_OANDPWV1_OBJ(1, 0, FormCalculationEstimate.IdObject, FileReportPath);
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.vk9Click(Sender: TObject);
begin
  // vk ��������� ������� ����� � ������� �������� �� �����
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_VED_OBRAB_RASHRES_SMET_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID')
        .AsInteger, FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        dmReportF.Report_VED_OBRAB_RASHRES_SMET_OBJ(FormCalculationEstimate.IdObject, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.N10Click(Sender: TObject);
begin
  // vk ��������� ��ڨ��� � ��������� �����  �������-1
  Screen.Cursor := crSQLWait;
  try

    if Assigned(FormCalculationEstimate) then
    begin
      if FormCalculationEstimate.IdEstimate = 0 then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_VED_OANDPWV1_OBJ(2, 0, FormCalculationEstimate.IdObject, FileReportPath);
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.N12Click(Sender: TObject);
begin
  if (not Assigned(fWinterPrice)) then
    fWinterPrice := TfWinterPrice.Create(Self);
  fWinterPrice.Show;
end;

procedure TFormMain.VK2N13Click(Sender: TObject);
begin

  Screen.Cursor := crSQLWait;
  try

    // if Assigned(FormCalculationEstimate) then
    // begin
    // if FormCalculationEstimate.GetIdEstimate = 0 then
    // begin
    // showmessage('�� ������� �����');
    // Exit;
    // end;
    dmReportF.vk2n13(fObjectsAndEstimates.getCurObject, FileReportPath);
    // end;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TFormMain.N31Click(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not Assigned(FormHelpC3)) then
    FormHelpC3 := TFormHelpC3.Create(Self);

  FormHelpC3.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.N51Click(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not Assigned(FormHelpC5)) then
    FormHelpC5 := TFormHelpC5.Create(Self);

  FormHelpC5.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.N61Click(Sender: TObject);
begin
  if (not(Assigned(FormCalculationEstimate))) then
  begin
    if fObjectsAndEstimates.qrTreeData.IsEmpty then
      Exit;
    if (not Assigned(fKC6Journal)) then
      fKC6Journal := TfKC6Journal.Create(Self);
    if Assigned(fObjectsAndEstimates) then
      fKC6Journal.LocateObject(fObjectsAndEstimates.getCurObject);
    fKC6Journal.LocateEstimate(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').Value);
    fKC6Journal.tvEstimates.SelectNode(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').Value)
      .Expand(true);
    fKC6Journal.Show;
  end
  else
  begin
    if FormCalculationEstimate.Act then
    // ��� ����
    begin
      if MessageBox(0, PChar('���������� ������� ������ �� �����?'), '������ �����',
        MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
        fKC6.MyShow(FormCalculationEstimate.IdObject);
    end
    // ��� �����
    else
    begin
      if (not Assigned(fKC6Journal)) then
        fKC6Journal := TfKC6Journal.Create(Self);
      fKC6Journal.LocateObject(FormCalculationEstimate.IdObject);
      fKC6Journal.LocateEstimate(FormCalculationEstimate.IdEstimate);
      fKC6Journal.tvEstimates.SelectNode(FormCalculationEstimate.IdEstimate).Expand(true);
      fKC6Journal.Show;
    end;
  end;
end;

procedure TFormMain.N6Click(Sender: TObject);
begin
  if (not Assigned(fTravelList)) then
    fTravelList := TfTravelList.Create(Self);
  fTravelList.Show;
end;

procedure TFormMain.N8Click(Sender: TObject);
{ var
  s: string; }
begin
  {
    s := InputBox('���������� ����������� �������', '������� ������:', '');
    if s <> '1' then
    Exit;
  }
  if (not LicenseAssigned(fUniDict)) then
    fUniDict := TfUniDict.Create(Self);
  fUniDict.FormStyle := fsMDIChild;
  fUniDict.WindowState := wsMaximized;
  fUniDict.Show;
end;

procedure TFormMain.JSMenuClick(Sender: TObject);
begin

  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      // **************************************************************************************************************************************
      if (Sender as TMenuItem).Name = 'jsMenu1' then
        dmReportF.JSReport(1, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      // ��������� ������� ����� � ������� ��������
      if (Sender as TMenuItem).Name = 'jsMenu2' then
        dmReportF.JSReport(2, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      // ��������� ������� ����� � ������� �������� (�� ��������� ������)
      if (Sender as TMenuItem).Name = 'jsMenu3' then
        dmReportF.JSReport(3, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      // ��������� ������� ����� � ������� �������� (�� ��������� ������)
      if (Sender as TMenuItem).Name = 'jsMenu4' then
        dmReportF.JSReport(4, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      // !!! ��������� ������� ����� � ������� �������� (� ����������� ���������)
      if (Sender as TMenuItem).Name = 'jsMenu5' then
        dmReportF.JSReport(5, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      // ��������� �������� �� �����

      if (Sender as TMenuItem).Name = 'JSMenu6' then
        dmReportF.JSReport(6, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      if (Sender as TMenuItem).Name = 'JSMenu7' then
        dmReportF.JSReport(7, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      if (Sender as TMenuItem).Name = 'JSMenu8' then
        dmReportF.JSReport(8, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      if (Sender as TMenuItem).Name = 'JSMenu9' then
        dmReportF.JSReport(9, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
      if (Sender as TMenuItem).Name = 'JSMenu10' then
        dmReportF.JSReport(10, fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger,
          FileReportPath);
      // **************************************************************************************************************************************
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        // **************************************************************************************************************************************
        if (Sender as TMenuItem).Name = 'jsMenu1' then
          dmReportF.JSReport(1, FormCalculationEstimate.IdEstimate, FileReportPath);
        // ��������� ������� ����� � ������� ��������
        if (Sender as TMenuItem).Name = 'jsMenu2' then
          dmReportF.JSReport(2, FormCalculationEstimate.IdEstimate, FileReportPath);
        // ��������� ������� ����� � ������� �������� (�� ��������� ������)
        if (Sender as TMenuItem).Name = 'jsMenu3' then
          dmReportF.JSReport(3, FormCalculationEstimate.IdEstimate, FileReportPath);
        // ��������� ������� ����� � ������� �������� (�� ��������� ������)
        if (Sender as TMenuItem).Name = 'jsMenu4' then
          dmReportF.JSReport(4, FormCalculationEstimate.IdEstimate, FileReportPath);
        // !!! ��������� ������� ����� � ������� �������� (� ����������� ���������)
        if (Sender as TMenuItem).Name = 'jsMenu5' then
          dmReportF.JSReport(5, FormCalculationEstimate.IdEstimate, FileReportPath);
        // ��������� �������� �� �����

        if (Sender as TMenuItem).Name = 'JSMenu6' then
          dmReportF.JSReport(6, FormCalculationEstimate.IdEstimate, FileReportPath);
        if (Sender as TMenuItem).Name = 'JSMenu7' then
          dmReportF.JSReport(7, FormCalculationEstimate.IdEstimate, FileReportPath);
        if (Sender as TMenuItem).Name = 'JSMenu8' then
          dmReportF.JSReport(8, FormCalculationEstimate.IdEstimate, FileReportPath);
        if (Sender as TMenuItem).Name = 'JSMenu9' then
          dmReportF.JSReport(9, FormCalculationEstimate.IdEstimate, FileReportPath);
        if (Sender as TMenuItem).Name = 'JSMenu10' then
          dmReportF.JSReport(10, FormCalculationEstimate.IdEstimate, FileReportPath);
        // **************************************************************************************************************************************
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TFormMain.N14Click(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not Assigned(FormCatalogSSR)) then
    FormCatalogSSR := TFormCatalogSSR.Create(Self);

  FormCatalogSSR.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.MenuServiceClick(Sender: TObject);
begin
  ServiceBackup.Enabled := not FArhiv.CreateArhInProgress and not FArhiv.RestoreArhInProgress;
end;

procedure TFormMain.MenuSetCoefficientsClick(Sender: TObject);
begin
  fCoefficients.Show;
end;

// --> ������ ������� (�����)
procedure TFormMain.mnZP_OBJClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_ZP_OBJ(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, FileReportPath);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        dmReportF.Report_ZP_OBJ(FormCalculationEstimate.IdEstimate, FileReportPath);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.mnZP_OBJ_AKTClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if fObjectsAndEstimates.qrActsEx.IsEmpty then
      begin
        ShowMessage('�� ������ ���');
        Exit;
      end;
      dmReportF.Report_ZP_OBJ_ACT(fObjectsAndEstimates.qrActsEx.FieldByName('ID').AsInteger, FileReportPath);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.mReportClick(Sender: TObject);
begin
  if Assigned(FormCalculationEstimate) then
  begin
    FormCalculationEstimate.ShowNeedSaveDialog;
    // FormCalculationEstimate.IdEstimate > 0
    if FormCalculationEstimate.Act then
      ShellExecute(Handle, nil, 'report.exe', PChar('A' + INTTOSTR(FormCalculationEstimate.IdEstimate)),
        PChar(FileReportPath), SW_maximIZE)
    else
      ShellExecute(Handle, nil, 'report.exe', PChar('S' + INTTOSTR(FormCalculationEstimate.IdEstimate)),
        PChar(FileReportPath), SW_maximIZE);

  end;
end;

procedure TFormMain.mReportPrintClick(Sender: TObject);
begin
  if (not Assigned(fSmReportMain)) then
    fSmReportMain := TfSmReportMain.Create(FormMain);
  fSmReportMain.Show;
end;

procedure TFormMain.mTranspNormClick(Sender: TObject);
begin
  DM.qrDifferent.Active := False;
  DM.qrDifferent.SQL.Text := 'Select doc_id from doc where doc_id = ' + INTTOSTR(C_DOCID_TRANSP_XLT);
  DM.qrDifferent.Active := true;
  try
    if DM.qrDifferent.IsEmpty then
      raise Exception.Create('����� � ���������� �� �����������.')
    else
      RunDocument(DM.qrDifferent, False);
  finally
    DM.qrDifferent.Active := False;
  end;
end;

procedure TFormMain.mTypeActClick(Sender: TObject);
begin
  if (not Assigned(fTypeAct)) then
    fTypeAct := TfTypeAct.Create(Self);
  fTypeAct.ShowModal;
end;

// <-- ������ ������� (�����)

procedure TFormMain.MenuListsIndexesChangeCostClick(Sender: TObject);
begin
  FormIndexesChangeCost.ShowModal;
end;

procedure TFormMain.MenuLists�ategoriesObjectsClick(Sender: TObject);
begin
  if (not Assigned(fCategoriesObjects)) then
    fCategoriesObjects := TfCategoriesObjects.Create(FormMain);
  fCategoriesObjects.ShowModal;
end;

procedure TFormMain.MenuPartsEstimatesClick(Sender: TObject);
begin
  if (not Assigned(fPartsEstimates)) then
    fPartsEstimates := TfPartsEstimates.Create(FormMain);
  fPartsEstimates.Show;
end;

procedure TFormMain.MenuListsSectionsEstimatesClick(Sender: TObject);
begin
  if (not Assigned(fSectionEstimateList)) then
    fSectionEstimateList := TfSectionEstimateList.Create(FormMain);
  // fSectionEstimateList.FormStyle := fsNormal;
  fSectionEstimateList.Show;
end;

procedure TFormMain.MenuListsTypesWorksClick(Sender: TObject);
begin
  if (not Assigned(fTypeWorkList)) then
    fTypeWorkList := TfTypeWorkList.Create(FormMain);
  // fTypeWorkList.FormStyle := fsNormal;
  fTypeWorkList.Show;
end;

procedure TFormMain.MenuOrganizationsClick(Sender: TObject);
begin
  if (not LicenseAssigned(fOrganizationsEx)) then
    fOrganizationsEx := TfOrganizationsEx.Create(FormMain);
  fOrganizationsEx.Show;
end;

procedure TFormMain.HRRReferenceDataClick(Sender: TObject);
begin
  if (not LicenseAssigned(FormReferenceData)) then
    FormReferenceData := TFormReferenceData.Create(Self, '0', False)
  else
    FormReferenceData.Show;
end;

procedure TFormMain.HRROwnDataClick(Sender: TObject);
begin
  if (not LicenseAssigned(FormOwnData)) then
    FormOwnData := TFormOwnData.Create(Self, '1', False);
end;

procedure TFormMain.HRRPricesClick(Sender: TObject);
begin
  // ����������
  if (not LicenseAssigned(FormPricesReferenceData)) then
    FormPricesReferenceData := TFormPricesReferenceData.Create(Self, 'g', true);
  { �����������
    if (not Assigned(FormPricesOwnData)) then
    FormPricesOwnData := TFormPricesOwnData.Create(Self, 's', true);
  }
end;

procedure TFormMain.OXRandOPRgClick(Sender: TObject);
begin
  // ��������� ����� ��������
  FormWaiting.Show;
  Application.ProcessMessages;

  if (not Assigned(FormOXRandOPR)) then
    FormOXRandOPR := TFormOXRandOPR.Create(Self);

  FormOXRandOPR.Show;

  // ��������� ����� ��������
  FormWaiting.Close;
end;

procedure TFormMain.PMAddNewBackupClick(Sender: TObject);
var
  i: integer;
begin
  LicenseAssigned(nil);
  // �������� C_ARHCOUNT �����, ���-�� �� �������� �����
  for i := C_ARHCOUNT - 1 to High(FArhiv.ArhFiles) do
    FArhiv.DeleteArhiv(FArhiv.ArhFiles[i]);
  FArhiv.CreateNewArhiv(Handle);
end;

procedure TFormMain.PMDeleteBackupClick(Sender: TObject);
var
  Mi: TMenuItem;
begin
  Mi := TMenuItem(Sender);
  if (MessageBox(Self.Handle, PChar('������� ��������� ����� �� ' + StringReplace(Mi.Parent.Caption, '&', '',
    [rfReplaceAll]) + '?'), '��������� �����������', MB_YESNO + MB_ICONQUESTION) = IDYES) then
    FArhiv.DeleteArhiv(string(Mi.Parent.Tag));
end;

procedure TFormMain.pmLicenseKeyClick(Sender: TObject);
var
  LicenseForm: TLicenseForm;
begin
  LicenseForm := TLicenseForm.Create(Self);
  try
    LicenseForm.ShowModal;
  finally
    FreeAndNil(LicenseForm);
  end;
end;

procedure TFormMain.PMRestoreBackupClick(Sender: TObject);
var
  Mi: TMenuItem;
  ArhForm: TfrmArhRestore;
  mr: TModalResult;
begin
  Mi := TMenuItem(Sender);
  beep;
  if (MessageBox(Self.Handle, PChar('������������ �� ��������� ����� �� ' + StringReplace(Mi.Parent.Caption,
    '&', '', [rfReplaceAll]) + '?' + #13#10 + '��������, ��� ������ ��������� ����� �������� ������ �����, ' +
    '����� �������!'), '��������� �����������', MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    mr := 0;
    try
      ArhForm := TfrmArhRestore.Create(Self);
      FArhiv.RestoreArhiv(ArhForm.Handle, string(Mi.Parent.Tag));
      mr := ArhForm.ShowModal;
    finally
      FreeAndNil(ArhForm);
      if mr = mrOk then
        Close;
    end;
  end;
end;

procedure TFormMain.PMRestoreOldBackupClick(Sender: TObject);
begin
  LicenseAssigned(nil);
end;

const
  { TestKey: array[0..31] of byte =
    ($01, $23, $45, $67, $89, $ab, $cd, $ef,
    $01, $12, $23, $34, $45, $56, $67, $78,
    $89, $9a, $ab, $bc, $cd, $de, $ef, $f0,
    $10, $32, $54, $76, $98, $ba, $dc, $fe);

    TestDate: array[0..3] of LongWord =
    ($35241302, $79685746, $bdac9b8a, $f1e0dfce);
    TestDate1: array[0..3] of LongWord =
    ($161824c8, $89e4d7f0, $a116ad20, $485d4e67);
  }

  TestDate: array [0 .. 15] of Byte = (36, 42, 77, 37, 64, 73, 57, 56, 119, 85, 3, 71, 30, 89, 119, 69);
  TestDate1: array [0 .. 15] of Byte = (72, 98, 245, 166, 209, 131, 234, 19, 140, 141, 135, 142, 158,
    1, 5, 154);

procedure TFormMain.pmTestSlavaClick(Sender: TObject);
var
  RC6: TRC6Encryptor;
  ResDate, ResDate1: array [0 .. 3] of LongWord;
  TmByte: TBytes;
  HTTP: TIdHTTP;
  StrimPage: TMemoryStream;
  TmpStr: string;
begin

  move(TestDate[0], ResDate1[0], Sizeof(ResDate1));
  if ResDate1[0] = 0 then
    Sleep(1);

  SetLength(TmByte, 16);
  move(TestDate[0], TmByte[0], Sizeof(TestDate));

  HTTP := TIdHTTP.Create(nil);
  HTTP.ConnectTimeout := 3000;
  StrimPage := TMemoryStream.Create;
  try
    HTTP.HandleRedirects := true;
    HTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1) ' +
      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36';
    HTTP.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    HTTP.Request.AcceptLanguage := 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4,ar;q=0.2';
    HTTP.Request.AcceptCharSet := 'windows-1251,utf-8;q=0.7,*;q=0.7';

    TmpStr := TIdEncoderMIME.EncodeBytes(TIdBytes(TmByte));
    HTTP.Get('http://85.143.218.164:3113/api/v1/gen/rc6test_encrypt?in_data=' +
      TIdEncoderMIME.EncodeBytes(TIdBytes(TmByte)), StrimPage);

    StrimPage.SaveToFile('d:\1234567.txt');
  finally
    HTTP.Free;
    StrimPage.Free;
  end;

  RC6 := TRC6Encryptor.Create(ConstKey);
  try
    TmByte := RC6.BytesEncrypt(TmByte);
  finally
    FreeAndNil(RC6);
  end;
  move(TmByte[0], ResDate[0], Sizeof(ResDate));
  move(TestDate1[0], ResDate1[0], Sizeof(ResDate1));
  if ResDate[0] = ResDate1[0] then
    Sleep(1);

end;

// �� �����������
procedure TFormMain.WindowsHorizontalClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

// �� ���������
procedure TFormMain.WindowsVerticalClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

// �� ��������
procedure TFormMain.WindowsCascadeClick(Sender: TObject);
begin
  FormMain.PanelCover.Visible := true; // ���������� ������ �� ������� �����
  Cascade;
  FormMain.PanelCover.Visible := False; // �������� ������ �� ������� �����
end;

// �������� ���
procedure TFormMain.WindowsMinimizeClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].WindowState := wsMinimized;

  ActiveMDIChild.WindowState := wsMinimized;
end;

// ���������� ���
procedure TFormMain.WindowsExpandClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].WindowState := wsNormal;
end;

procedure TFormMain.Excel2Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_EXCEL(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, 1);

      ShellExecute(Handle, nil, 'report.exe',
        PChar('E' + INTTOSTR(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger)),
        PChar(GetCurrentDir + '\reports\report\'), SW_maximIZE);

    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        dmReportF.Report_EXCEL(FormCalculationEstimate.IdEstimate, 1);
        ShellExecute(Handle, nil, 'report.exe', PChar('E' + INTTOSTR(FormCalculationEstimate.IdEstimate)),
          PChar(GetCurrentDir + '\reports\report\'), SW_maximIZE);

      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.EXCEL3Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    if Assigned(fObjectsAndEstimates) then
    begin
      if not CheckQrActiveEmpty(fObjectsAndEstimates.qrTreeData) then
      begin
        ShowMessage('�� ������� �����');
        Exit;
      end;
      dmReportF.Report_EXCEL(fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger, 2);
    end
    else
    begin
      if Assigned(FormCalculationEstimate) then
      begin
        if FormCalculationEstimate.IdEstimate = 0 then
        begin
          ShowMessage('�� ������� �����');
          Exit;
        end;
        dmReportF.Report_EXCEL(FormCalculationEstimate.IdEstimate, 2);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.FileCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.CalculationSettingsClick(Sender: TObject);
begin
  FormCalculationSettings.Show;
end;

procedure TFormMain.HelpAboutClick(Sender: TObject);
var
  fAbout: TfAbout;
begin
  fAbout := TfAbout.Create(nil);
  try
    fAbout.ShowModal;
  finally
    FreeAndNil(fAbout);
  end;
end;

procedure TFormMain.HelpSupportClick(Sender: TObject);
begin
  Exec('%SMETADIR%\Docs\Help.rtf');
end;

function ShiftDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Shift] and 128) <> 0);
end;

function CtrlDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Control] and 128) <> 0);
end;

function AltDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Menu] and 128) <> 0);
end;

procedure TFormMain.CascadeForActiveWindow();
begin
  if (MDIChildCount > 1) and (CtrlDown = true) then
    Cascade;
end;

procedure TFormMain.ReadSettingsFromFile(PathFile: String);
var
  IFile: TIniFile;
begin
  try
    IFile := TIniFile.Create(PathFile); // ��������� ����

    with IFile do
    begin
      PS.BackgroundHead := ReadInteger('Tables', BackgroundHead, 14410967);
      PS.FontHead := ReadInteger('Tables', FontHead, 0);
      PS.BackgroundRows := ReadInteger('Tables', BackgroundRows, 16777215);
      PS.FontRows := ReadInteger('Tables', FontRows, 0);
      PS.BackgroundSelectRow := ReadInteger('Tables', BackgroundSelectRow, 5197647);
      PS.FontSelectRow := ReadInteger('Tables', FontSelectRow, 16777215);
      PS.BackgroundSelectCell := ReadInteger('Tables', BackgroundSelectCell, 2039583);
      PS.FontSelectCell := ReadInteger('Tables', FontSelectCell, 16777215);
      PS.SelectRowUnfocusedTable := ReadInteger('Tables', SelectRowUnfocusedTable, -16777201);
      PS.AutoCreateEstimates := ReadBool('Object', 'AutoCreateEstimates', true);
      PS.AutoExpandTreeEstimates := ReadBool('Object', 'AutoExpandTreeEstimates', true);
      PS.RoundTo := ReadInteger('Round', vRoundTo, 0);
      PS.CalcResourcesAutoSave := ReadBool('CalcResources', 'CalcResourcesAutoSave', true);
      PS.AutoSaveCalcResourcesAfterExitCell :=
        ReadBool('CalcResources', 'AutoSaveCalcResourcesAfterExitCell', False);
      PS.ShowHint := ReadBool('ShowHint', vShowHint, true);
      PS.AutosaveRateDescr := ReadBool('ESTIMATE', 'AutosaveRateDescr', true);
      PS.ShowNeedSaveDialog := ReadBool('ESTIMATE', 'ShowNeedSaveDialog', true);
      PS.FindAutoRepInAllRate := ReadBool('ESTIMATE', 'FindAutoRepInAllRate', False);

      PS.GridFontName := ReadString('Tables', 'GridFontName', 'Tahoma');
      PS.GridFontSize := ReadInteger('Tables', 'GridFontSize', 8);
      PS.GridFontStyle := Byte(ReadInteger('Tables', 'GridFontStyle', 0));

      PS.ControlsFontName := ReadString('Controls', 'ControlsFontName', 'Tahoma');
      PS.ControlsFontSize := ReadInteger('Controls', 'ControlsFontSize', 8);
      PS.ControlsFontStyle := Byte(ReadInteger('Controls', 'ControlsFontStyle', 0));

      PS.TextFontName := ReadString('Controls', 'TextFontName', 'Tahoma');
      PS.TextFontSize := ReadInteger('Controls', 'TextFontSize', 8);
      PS.TextFontStyle := Byte(ReadInteger('Controls', 'TextFontStyle', 0));
      PS.AddRateType1ToLocal := ReadBool('ESTIMATE', 'AddRateType1ToLocal', False);
      PS.AddRateType0ToPNR := ReadBool('ESTIMATE', 'AddRateType0ToPNR', False);
      PS.UseBoldFontForName := ReadBool('ESTIMATE', 'UseBoldFontForName', true);
      PS.AutoScrollToNextRow := ReadBool('ESTIMATE', 'AutoScrollToNextRow', False);
      PS.AllowObjectDatesChange := ReadBool('ESTIMATE', 'AllowObjectDatesChange', False);
      PS.UseOldFormuls := ReadBool('ESTIMATE', 'UseOldFormuls', False);
      G_CALCMODE := Byte(PS.UseOldFormuls);
    end;
  finally
    FreeAndNil(IFile); // ������� �������� ���� �� ������
  end;
end;

procedure TFormMain.ReplaceButtonOpenWindow(const AFrom, ATo: TForm);
var
  i: integer;
begin
  for i := 0 to CountOpenWindows - 1 do
  begin
    if ButtonsWindows[i].Tag = integer(AFrom) then
      ButtonsWindows[i].Tag := integer(ATo);
  end;
end;

procedure TFormMain.WriteSettingsToFile(PathFile: String);
var
  IFile: TIniFile;
begin
  try
    IFile := TIniFile.Create(PathFile); // ��������� ����

    with IFile do
    begin
      WriteInteger('Tables', BackgroundHead, PS.BackgroundHead);
      WriteInteger('Tables', FontHead, PS.FontHead);
      WriteInteger('Tables', BackgroundRows, PS.BackgroundRows);
      WriteInteger('Tables', FontRows, PS.FontRows);
      WriteInteger('Tables', BackgroundSelectRow, PS.BackgroundSelectRow);
      WriteInteger('Tables', FontSelectRow, PS.FontSelectRow);
      WriteInteger('Tables', BackgroundSelectCell, PS.BackgroundSelectCell);
      WriteInteger('Tables', FontSelectCell, PS.FontSelectCell);
      WriteInteger('Tables', SelectRowUnfocusedTable, PS.SelectRowUnfocusedTable);
      WriteString('Tables', 'GridFontName', PS.GridFontName);
      WriteInteger('Tables', 'GridFontSize', PS.GridFontSize);
      WriteInteger('Tables', 'GridFontStyle', PS.GridFontStyle);

      WriteString('Controls', 'ControlsFontName', PS.ControlsFontName);
      WriteInteger('Controls', 'ControlsFontSize', PS.ControlsFontSize);
      WriteInteger('Controls', 'ControlsFontStyle', PS.ControlsFontStyle);

      WriteString('Controls', 'TextFontName', PS.TextFontName);
      WriteInteger('Controls', 'TextFontSize', PS.TextFontSize);
      WriteInteger('Controls', 'TextFontStyle', PS.TextFontStyle);

      WriteInteger('Round', vRoundTo, PS.RoundTo);

      WriteBool('ShowHint', vShowHint, PS.ShowHint);
      WriteBool('Object', 'AutoCreateEstimates', PS.AutoCreateEstimates);
      WriteBool('Object', 'AutoExpandTreeEstimates', PS.AutoExpandTreeEstimates);
      WriteBool('CalcResources', 'CalcResourcesAutoSave', PS.CalcResourcesAutoSave);
      WriteBool('CalcResources', 'AutoSaveCalcResourcesAfterExitCell', PS.AutoSaveCalcResourcesAfterExitCell);
      WriteBool('ESTIMATE', 'AutosaveRateDescr', PS.AutosaveRateDescr);
      WriteBool('ESTIMATE', 'ShowNeedSaveDialog', PS.ShowNeedSaveDialog);
      WriteBool('ESTIMATE', 'FindAutoRepInAllRate', PS.FindAutoRepInAllRate);
      WriteBool('ESTIMATE', 'AddRateType1ToLocal', PS.AddRateType1ToLocal);
      WriteBool('ESTIMATE', 'AddRateType0ToPNR', PS.AddRateType0ToPNR);
      WriteBool('ESTIMATE', 'UseBoldFontForName', PS.UseBoldFontForName);
      WriteBool('ESTIMATE', 'AutoScrollToNextRow', PS.AutoScrollToNextRow);
      WriteBool('ESTIMATE', 'UseOldFormuls', PS.UseOldFormuls);
      WriteBool('ESTIMATE', 'AllowObjectDatesChange', PS.AllowObjectDatesChange);
    end;
  finally
    FreeAndNil(IFile); // ������� �������� ���� �� ������
  end;
end;

procedure TFormMain.RunProgramsRemoteControl(Sender: TObject);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + ProgramsRemoteControl + '\';

  case (Sender as TMenuItem).Tag of
    1:
      Path := Path + AeroAdmin;
    2:
      Path := Path + AmmyyAdmin;
  end;

  if not FileExists(Path) then
  begin
    MessageBox(0, PChar('���� ��������� ������������� �� ������:' + sLineBreak + Path + sLineBreak +
      '�� ������!'), FormNameMain, MB_ICONWARNING + MB_OK + mb_TaskModal);
    Exit;
  end;

  ShellExecute(Handle, nil, PChar(Path), nil, nil, SW_RESTORE);
end;

end.
