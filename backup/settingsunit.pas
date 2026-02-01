unit SettingsUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Buttons;

type

  { TSettingsForm }

  TSettingsForm = class(TForm)
    ComboBox1: TComboBox;
    FontChoose: TFontDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    StaticText1: TStaticText;
    procedure ComboBox1Change(Sender: TObject);
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

procedure TSettingsForm.ComboBox1Change(Sender: TObject);
begin
   position_index := ComboBox1.ItemIndex;

end;

procedure TSettingsForm.StaticText1Click(Sender: TObject);
begin

end;

end.

