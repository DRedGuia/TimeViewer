unit SettingsUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Buttons;

type

  { TSettingsForm }

  TSettingsForm = class(TForm)
    ComboBoxAlign: TComboBox;
    FontChoose: TFontDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    StaticText1: TStaticText;
    procedure ComboBoxAlignChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
  private

  public

  end;

var
  SettingsForm: TSettingsForm;
  position_index: Integer;


implementation

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.GroupBox1Click(Sender: TObject);
begin

end;

procedure TSettingsForm.SpeedButton1Click(Sender: TObject);
begin
   FontChoose.Execute;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin

end;

procedure TSettingsForm.ComboBoxAlignChange(Sender: TObject);
begin
   position_index := ComboBoxAlign.ItemIndex;

end;

procedure TSettingsForm.StaticText1Click(Sender: TObject);
begin

end;

end.

