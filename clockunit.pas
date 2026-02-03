unit ClockUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus;

type

  { TClockForm }

  TClockForm = class(TForm)
    Clock: TLabel;
    ExitProgram: TMenuItem;
    Settings: TMenuItem;
    SettingsPopupMenu: TPopupMenu;
    ClockTimer: TTimer;
    TrayIcon: TTrayIcon;
    procedure ExitProgramClick(Sender: TObject);
    procedure SettingsClick(Sender: TObject);
    procedure ClockTimerTimer(Sender: TObject);
  private

  public
    procedure SetClockFontSize(FontSize: Integer);
    procedure SetClockFont(AFont: TFont);
    procedure SetClockFontUnderline(Toggle: Boolean);
    procedure SetClockPosition(APositionIndex: SmallInt);
    procedure SetClockTextColor(AColor: TColor);
    procedure SetClockBackgroundColor(AColor: TColor);
    procedure SetClockTransparency(Alpha: Integer);
  end;

var
  ClockForm: TClockForm;

implementation

Uses SettingsUnit;

{$R *.lfm}

{ TClockForm }

procedure TClockForm.ClockTimerTimer(Sender: TObject);
begin
  Clock.Caption := FormatDateTime('hh:nn:ss', Now);
end;

procedure TClockForm.SetClockFont(AFont: TFont);
begin
  Clock.Font.Assign(AFont);
end;

procedure TClockForm.SetClockFontSize(FontSize: Integer);
begin
  Clock.Font.Size := FontSize;
end;

procedure TClockForm.SetClockTextColor(AColor: TColor);
begin
  Clock.Font.Color := AColor;
end;

procedure TClockForm.SetClockFontUnderline(Toggle: Boolean);
begin
  if toggle = true then
  begin
  Clock.Font.Style := Clock.Font.Style + [fsUnderline];
  end
  else begin
  Clock.Font.Style := Clock.Font.Style - [fsUnderline];
  end;
end;

procedure TClockForm.SetClockPosition(APositionIndex: SmallInt);
begin
   case APositionIndex of
   0: //Top_Left
     begin
     Top := 0;
     Left := 0;
     end;
   1: //Top_Right
     begin
     Top := 0;
     Left := Screen.Width - Width;
     end;
   2: //Bottom_Left
     begin
     Top := Screen.Height - Height;
     Left := 0;
     end;
   3: //Bottom_Right
     begin
     Top := Screen.Height - Height;
     Left := Screen.Width - Width;
     end;
   4: //Center
     begin
     Top := (Screen.Height - Height) div 2;
     Left := (Screen.Width - Width) div 2;
     end;
   end;
end;


procedure TClockForm.SetClockBackgroundColor(AColor: TColor);
begin
  Color := AColor;
end;

procedure TClockForm.SetClockTransparency(Alpha: Integer);
begin
  if Alpha >=255 then Alpha := 255;
  AlphaBlendValue := Alpha;
end;

procedure TClockForm.ExitProgramClick(Sender: TObject);
begin
  SettingsForm.Close;
  Close;
end;

procedure TClockForm.SettingsClick(Sender: TObject);
begin
  SettingsForm.Show;
end;

end.

