unit CopyToOwnDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfCopyToOwnDialog = class(TForm)
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    lbl2: TLabel;
    procedure btn2Click(Sender: TObject);
  private
    OBJ_NAME: string;
  public

  end;

function ShowCopyToOwnDialog(var AOBJ_NAME: string): Variant;

implementation

{$R *.dfm}

function ShowCopyToOwnDialog(var AOBJ_NAME: string): Variant;
var
  f: TfCopyToOwnDialog;
begin
  Result := Null;
  f := TfCopyToOwnDialog.Create(nil);
  try
    f.OBJ_NAME := AOBJ_NAME;
    f.lbl2.Caption := '������ � ���������: ' + AOBJ_NAME;
    case f.ShowModal of
      // ��������
      mrOk:
        Result := 1;
      // ���������� �������������
      mrRetry:
        begin
          AOBJ_NAME := f.OBJ_NAME;
          Result := 2;
        end;
    end;
  finally
    FreeAndNil(f);
  end;
end;

procedure TfCopyToOwnDialog.btn2Click(Sender: TObject);
var
  s: string;
begin
  s := InputBox('�����������', '������� ����� ������������:', OBJ_NAME);

  if TRIM(s) <> '' then
  begin
    OBJ_NAME := s;
    ModalResult := mrRetry;
  end;
end;

end.
