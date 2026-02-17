unit SettingsUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Buttons, ExtCtrls, ComCtrls, RTTICtrls;

type

  { TSettingsForm }

  TSettingsForm = class(TForm)
    BackgroundColorButton: TColorButton;
    TransparencyBar: TTrackBar;
    FontSizeEdit: TEdit;
    TransparencyEdit: TEdit;
    TransparencyBox: TGroupBox;
    SizeBox: TGroupBox;
    TextColorButton: TColorButton;
    FontUnderline: TCheckBox;
    ComboBoxPosition: TComboBox;
    FontChoose: TFontDialog;
    AppearanceGroup: TGroupBox;
    FontPreviewBox: TGroupBox;
    ColorGroup: TGroupBox;
    FontGroup: TGroupBox;
    PositionGroup: TGroupBox;
    FontPreview: TLabel;
    FontChooseButton: TSpeedButton;
    FontSizeBar: TTrackBar;
    procedure BackgroundColorButtonColorChanged(Sender: TObject);
    procedure ComboBoxPositionChange(Sender: TObject);
    procedure FontChooseClose(Sender: TObject);
    procedure FontSizeBarChange(Sender: TObject);
    procedure FontUnderlineChange(Sender: TObject);
    procedure FontChooseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TextColorButtonColorChanged(Sender: TObject);
    procedure TransparencyBarChange(Sender: TObject);
    procedure TransparencyEditChange(Sender: TObject);
    procedure FontAssign();
    procedure CheckFontUnderline();
  private

  public

  end;

var
  SettingsForm: TSettingsForm;
  FontSize, Transparency: Integer;
  ClockFont: TFont;
implementation

Uses ClockUnit;

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.FontChooseButtonClick(Sender: TObject);
begin
   FontChoose.Execute;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  ClockFont := ClockForm.Clock.Font;
  FontPreview.Font.Assign(ClockFont);
  FontPreview.Font.Color := clBlack;
  FontSizeBar.Position := ClockFont.Size;
  TransparencyBar.Position := ClockForm.AlphaBlendValue;
end;

procedure TSettingsForm.FontAssign();
begin
   CheckFontUnderline();
   FontPreview.Font.Assign(ClockFont);
   FontPreview.Font.Color := clBlack;
   TextColorButtonColorChanged(ClockFont);
   ClockForm.SetClockFont(ClockFont);
end;

procedure TSettingsForm.TextColorButtonColorChanged(Sender: TObject);
begin
  ClockForm.SetClockTextColor(TextColorButton.ButtonColor);
end;

procedure TSettingsForm.FontChooseClose(Sender: TObject);
begin
  ClockFont := FontChoose.Font;
  FontAssign();
end;

procedure TSettingsForm.FontSizeBarChange(Sender: TObject);
begin
  FontSize := FontSizeBar.Position;
  FontSizeEdit.Text := IntToStr(FontSize);
  ClockFont.Size := FontSize;
  FontAssign();
end;

procedure TSettingsForm.TransparencyBarChange(Sender: TObject);
begin
  Transparency := TransparencyBar.Position;
  TransparencyEdit.Text := IntToStr(Transparency);
  ClockForm.SetClockTransparency(Transparency);
end;

procedure TSettingsForm.TransparencyEditChange(Sender: TObject);
begin
  if TransparencyEdit.Text <> '' then
  begin
   Transparency := StrToInt(TransparencyEdit.Text);
   TransparencyBar.Position := Transparency;
   TransparencyEdit.Text := IntToStr(Transparency);
   ClockForm.SetClockTransparency(Transparency);
  end;
end;

procedure TSettingsForm.CheckFontUnderline();
begin
  if FontUnderline.Checked = true then
  begin
  ClockFont.Style := ClockFont.Style + [fsUnderline];
  end
  else begin
  ClockFont.Style := ClockFont.Style - [fsUnderline];
  end;
end;

procedure TSettingsForm.FontUnderlineChange(Sender: TObject);
begin
  CheckFontUnderline();
  FontAssign();
end;

procedure TSettingsForm.ComboBoxPositionChange(Sender: TObject);
begin
   // Apply Position
  If ComboBoxPosition.ItemIndex >= 0 then ClockForm.SetClockPosition(ComboBoxPosition.ItemIndex);
end;

procedure TSettingsForm.BackgroundColorButtonColorChanged(Sender: TObject);
begin
  ClockForm.SetClockBackgroundColor(BackgroundColorButton.ButtonColor);
end;

end.
