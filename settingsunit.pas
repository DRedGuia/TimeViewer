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
    procedure FontPreviewClick(Sender: TObject);
    procedure FontSizeBarChange(Sender: TObject);
    procedure FontUnderlineChange(Sender: TObject);
    procedure FontChooseButtonClick(Sender: TObject);
    procedure SizeBoxClick(Sender: TObject);
    procedure GroupBox3Click(Sender: TObject);
    procedure TextColorButtonColorChanged(Sender: TObject);
    procedure TransparencyBarChange(Sender: TObject);
    procedure TransparencyEditChange(Sender: TObject);
  private

  public

  end;

var
  SettingsForm: TSettingsForm;
  FontSize, Transparency: Integer;
implementation

Uses ClockUnit;

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.FontChooseButtonClick(Sender: TObject);
begin
   FontChoose.Execute;
end;

procedure TSettingsForm.SizeBoxClick(Sender: TObject);
begin

end;

procedure TSettingsForm.GroupBox3Click(Sender: TObject);
begin

end;

procedure TSettingsForm.TextColorButtonColorChanged(Sender: TObject);
begin
  ClockForm.SetClockTextColor(TextColorButton.ButtonColor);
end;

procedure TSettingsForm.FontChooseClose(Sender: TObject);
begin
   FontPreview.Font.Assign(FontChoose.Font);
   //Apply font if changed
   If FontChoose.Font <> nil then ClockForm.SetClockFont(FontChoose.Font);
   TextColorButtonColorChanged(FontChoose);
end;

procedure TSettingsForm.FontPreviewClick(Sender: TObject);
begin

end;

procedure TSettingsForm.FontSizeBarChange(Sender: TObject);
begin
  FontSize := FontSizeBar.Position;
  FontSizeEdit.Text := IntToStr(FontSize);
  ClockForm.SetClockFontSize(FontSize);
end;

procedure TSettingsForm.TransparencyBarChange(Sender: TObject);
begin
  Transparency := TransparencyBar.Position;
  TransparencyEdit.Text := IntToStr(Transparency);
  ClockForm.SetClockTransparency(Transparency);
end;

procedure TSettingsForm.TransparencyEditChange(Sender: TObject);
begin
   Transparency := StrToInt(TransparencyEdit.Text);
   TransparencyBar.Position := Transparency;
   TransparencyEdit.Text := IntToStr(Transparency);
   ClockForm.SetClockTransparency(Transparency);
end;

procedure TSettingsForm.FontUnderlineChange(Sender: TObject);
begin
  ClockForm.SetClockFontUnderline(FontUnderline.Checked);
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
