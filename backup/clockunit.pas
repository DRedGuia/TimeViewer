unit ClockUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, SettingsUnit;

type

  { TClockForm }

  TClockForm = class(TForm)
    Label1: TLabel;
    ExitProgram: TMenuItem;
    Settings: TMenuItem;
    SettingsPopupMenu: TPopupMenu;
    Timer1: TTimer;
    TrayIcon: TTrayIcon;
    procedure Label1Click(Sender: TObject);
    procedure ExitProgramClick(Sender: TObject);
    procedure SettingsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
  private

  public

  end;

var
  ClockForm: TClockForm;
  position_index: Integer;

implementation

{$R *.lfm}

{ TClockForm }

procedure TClockForm.Label1Click(Sender: TObject);
begin

end;

procedure TClockForm.ExitProgramClick(Sender: TObject);
begin
  ClockForm.Close;
  SettingsForm.Close;
end;

procedure TClockForm.SettingsClick(Sender: TObject);
begin
  SettingsForm.Show;
end;

procedure TClockForm.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := TimeToStr(Now);
end;

procedure TClockForm.TrayIconClick(Sender: TObject);
begin
end;

end.

