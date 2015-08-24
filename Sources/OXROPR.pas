unit OXROPR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFrameOXROPR, fFrameSmeta, JvComponentBase, JvFormPlacement;

type
  TfOXROPR = class(TForm)
    FormStorage: TJvFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FrameOXROPR: TFrameOXROPR;
  public

  end;

var
  fOXROPR: TfOXROPR;

implementation

{$R *.dfm}

uses Main, Waiting;

procedure TfOXROPR.FormActivate(Sender: TObject);
begin
  // ���� ������ ������� Ctrl � �������� �����, �� ������
  // �������������� � ��������� ���� ����� �� �������� ����
  FormMain.CascadeForActiveWindow;
  // ������ ������� ������ �������� ����� (�� ������� ����� �����)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfOXROPR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfOXROPR.FormCreate(Sender: TObject);
begin
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  FrameOXROPR := TFrameOXROPR.Create(Self);
  FrameOXROPR.Parent := Self;
  FrameOXROPR.Align := alClient;
  FrameOXROPR.ReceivingAll;
  FrameOXROPR.Visible := True;
end;

procedure TfOXROPR.FormDestroy(Sender: TObject);
begin
  // ������� ������ �� ����� ���� (�� ������� ����� �����)
  FormMain.DeleteButtonCloseWindow(Caption);
  fOXROPR := nil;
end;

end.
