{
 /***************************************************************************
                                  main.pas
                                  --------
                           This is part of linBMD.

 ***************************************************************************/

 ***************************************************************************
 *                                                                         *
 *   This source is free software; you can redistribute it and/or modify   *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This code is distributed in the hope that it will be useful, but      *
 *   WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     *
 *   General Public License for more details.                              *
 *                                                                         *
 *   A copy of the GNU General Public License is available on the World    *
 *   Wide Web at <http://www.gnu.org/copyleft/gpl.html>. You can also      *
 *   obtain it by writing to the Free Software Foundation,                 *
 *   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.        *
 *                                                                         *
 ***************************************************************************
}


unit main; 

{$mode objfpc}{$H+}
{$DEFINE DEBUG}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtDlgs, EditBtn, ExtCtrls, Buttons, Grids, global, Menus, special, about,
  ComCtrls, cal, help, IniPropStorage, XMLPropStorage, MaskEdit;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnSave_Config: TBitBtn;
    cd: TCalendarDialog;
    cbOwn_Dates: TCheckBox;
    cbAll_Caps_Surname: TCheckBox;
    cbSkip_Surname: TCheckBox;
    cbSkip_Firstname: TCheckBox;
    edChar_Set: TEdit;
    edComments: TEdit;
    edEmail_Address: TEdit;
    edEvent_Type: TComboBox;
    edYear: TEdit;
    edwinBMD_Add: TEdit;
    edMedia_Type: TComboBox;
    edPage: TEdit;
    edPassword: TEdit;
    edQuarter: TComboBox;
    edScan_Ref: TEdit;
    edSubmitter_ID: TEdit;
    edSyndicate: TEdit;
    edTranscription_Type: TComboBox;
    edVolume_Format: TComboBox;
    edYour_Name: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    rgNaming_Convention: TGroupBox;
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    addComment: TMenuItem;
    Label4: TLabel;
    miFile_Save_And_Complete: TMenuItem;
    mi_Config_Skip_Firstname: TMenuItem;
    rb_winBMD: TRadioButton;
    rb_custom: TRadioButton;
    rb_speedBMD: TRadioButton;
    stModified: TLabel;
    stCreated: TLabel;
    lbwinBMD_Add: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    stFilename: TLabel;
    MainMenu1: TMainMenu;
    addTheory: TMenuItem;
    mi_Config_Skip_Surname: TMenuItem;
    mi_Config_All_Caps: TMenuItem;
    mi_Config_Save: TMenuItem;
    mi_Config: TMenuItem;
    mi_Help_Tips: TMenuItem;
    mi_File_Exit: TMenuItem;
    miFile1: TMenuItem;
    miFile_Open1: TMenuItem;
    miFile_Save1: TMenuItem;
    miHelp1: TMenuItem;
    miHelp_About1: TMenuItem;
    Notebook1: TNotebook;
    od: TOpenDialog;
    Page1: TPage;
    Page2: TPage;
    pm1: TPopupMenu;
    btnCreated: TSpeedButton;
    btnModified: TSpeedButton;
    sg: TStringGrid;
    Splitter1: TSplitter;
    PickList: TListBox;
    procedure MenuItem1Click(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure addCommentClick(Sender: TObject);
    procedure btnCreatedClick(Sender: TObject);
    procedure btnModifiedClick(Sender: TObject);
    procedure btnSave_ConfigClick(Sender: TObject);
    procedure cbAll_Caps_SurnameChange(Sender: TObject);
    procedure cbOwn_DatesClick(Sender: TObject);
    procedure cbSkip_FirstnameChange(Sender: TObject);
    procedure cbSkip_SurnameChange(Sender: TObject);
    procedure edEvent_TypeChange(Sender: TObject);
    procedure edLetter1KeyPress(Sender: TObject; var Key: char);
    procedure edPageKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQuarterChange(Sender: TObject);
    procedure edVolume_FormatChange(Sender: TObject);
    procedure edYearChange(Sender: TObject);
    procedure edYearKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Create(Sender: TObject);
    procedure edwinBMD_AddChange(Sender: TObject);
    procedure frmMainActivate(Sender: TObject);
    procedure mi_Config_All_CapsClick(Sender: TObject);
    procedure mi_Config_SaveClick(Sender: TObject);
    procedure mi_Config_Skip_FirstnameClick(Sender: TObject);
    procedure mi_Config_Skip_SurnameClick(Sender: TObject);
    procedure mi_File_ExitClick(Sender: TObject);
    procedure mi_Help_TipsClick(Sender: TObject);
    procedure rb_customClick(Sender: TObject);
    procedure rb_speedBMDClick(Sender: TObject);
    procedure rb_winBMDClick(Sender: TObject);
    procedure sgKeyPress(Sender: TObject; var Key: char);
    procedure sgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure miFile_OpenClick(Sender: TObject);
    procedure miFile_SaveAsClick(Sender: TObject);
    procedure miFile_SaveClick(Sender: TObject);
    procedure miFile_StartNewClick(Sender: TObject);
    procedure miHelp_AboutClick(Sender: TObject);
    procedure updateSG;
    procedure ReadConfig(AValue: String);
    procedure WriteConfig(AValue: String);
    procedure SetHeaders;
    function  getStrDate(D:TDate): String;
    procedure setCaption;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmMain: TfrmMain;
  New_Word, First_Time: Boolean;
  Names, Districts, Supp_Districts, Fields, Widths: TStringList;
  Search_String: String;
  Character: Char;
  Headers, old_Headers, Year, old_Year: Integer;

const
  NAME_LIST = 1;
  DISTRICT_LIST = 2;


implementation

{ TfrmMain }

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.SetHeaders;
begin
  if (Length(edYear.Text) = 4) and (edEvent_Type.ItemIndex > -1) then
    begin
      Case edEvent_Type.ItemIndex of
        0: begin
             //BIRTHS;
             try
               Year := StrToInt(edYear.Text);
             except
               Year := 1875;
             end;
             if (Year < 1912) then
               begin
                 Headers := 2;
                 if Headers <> old_Headers then
                   begin
                     Fields.Clear;
                     Widths.Clear;
                     Fields.Add('No.');
                     Widths.Add('35');
                     Fields.Add('Surname');
                     Widths.Add('160');
                     Fields.Add('GivenNames');
                     Widths.Add('160');
                     Fields.Add('District');
                     Widths.Add('160');
                     Fields.Add('Volume');
                     Widths.Add('50');
                     Fields.Add('Page');
                     Widths.Add('50');
                     old_Headers := Headers;
                     UpdateSG;
                   end;
               end
             else
               begin
                 Headers := 1;
                 if Headers <> old_Headers then
                   begin
                     Fields.Clear;
                     Widths.Clear;
                     Fields.Add('No.');
                     Widths.Add('35');
                     Fields.Add('Surname');
                     Widths.Add('120');
                     Fields.Add('GivenNames');
                     Widths.Add('120');
                     Fields.Add('MothersName');
                     Widths.Add('120');
                     Fields.Add('District');
                     Widths.Add('120');
                     Fields.Add('Volume');
                     Widths.Add('50');
                     Fields.Add('Page');
                     Widths.Add('50');
                     old_Headers := Headers;
                     UpdateSG;
                   end;
               end;
           end;


        1: begin
             //MARRIAGES;
             Try
               Year := StrToInt(edYear.Text);
             Except
               Year := 1875;
             End;
             if (Year < 1913) then
               begin
                 Headers := 11;
                 if Headers <> old_Headers then
                   begin
                     Fields.Clear;
                     Widths.Clear;
                     Fields.Add('No.');
                     Widths.Add('35');
                     Fields.Add('Surname');
                     Widths.Add('160');
                     Fields.Add('GivenNames');
                     Widths.Add('160');
                     Fields.Add('District');
                     Widths.Add('160');
                     Fields.Add('Volume');
                     Widths.Add('50');
                     Fields.Add('Page');
                     Widths.Add('50');
                     old_Headers := Headers;
                     UpdateSG;
                   end;
               end
             else
               begin
                 Headers := 12;
                 if Headers <> old_Headers then
                   begin
                     Fields.Clear;
                     Widths.Clear;
                     Fields.Add('No.');
                     Widths.Add('35');
                     Fields.Add('Surname');
                     Widths.Add('120');
                     Fields.Add('GivenNames');
                     Widths.Add('120');
                     Fields.Add('SpousesName');
                     Widths.Add('120');
                     Fields.Add('District');
                     Widths.Add('120');
                     Fields.Add('Volume');
                     Widths.Add('50');
                     Fields.Add('Page');
                     Widths.Add('50');
                     old_Headers := Headers;
                     UpdateSG;
                   end;
               end;
           end;


        2: begin
             //DEATHS;
             Try
               Year := StrToInt(edYear.Text);
             Except
               Year := 1875;
             End;
             if (Year < 1969) then
               begin
                 Headers := 21;
                 if Headers <> old_Headers then
                   begin
                     Fields.Clear;
                     Widths.Clear;
                     Fields.Add('No.');
                     Widths.Add('35');
                     Fields.Add('Surname');
                     Widths.Add('147');
                     Fields.Add('GivenNames');
                     Widths.Add('147');
                     Fields.Add('AAD');
                     Widths.Add('39');
                     Fields.Add('District');
                     Widths.Add('147');
                     Fields.Add('Volume');
                     Widths.Add('50');
                     Fields.Add('Page');
                     Widths.Add('50');
                     old_Headers := Headers;
                     if Year < 1865 then
                       Skip_Age := True
                     else
                       Skip_Age := False;
                     UpdateSG;
                   end;
               end
             else
               begin
                 Headers := 22;
                 if Headers <> old_Headers then
                   begin
                     Fields.Clear;
                     Widths.Clear;
                     Fields.Add('No.');
                     Widths.Add('35');
                     Fields.Add('Surname');
                     Widths.Add('140');
                     Fields.Add('GivenNames');
                     Widths.Add('140');
                     Fields.Add('DOB');
                     Widths.Add('60');
                     Fields.Add('District');
                     Widths.Add('140');
                     Fields.Add('Volume');
                     Widths.Add('50');
                     Fields.Add('Page');
                     Widths.Add('50');
                     old_Headers := Headers;
                     UpdateSG;
                   end;
               end;
           end;
      end;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ReadConfig(AValue: String);

var
  S, CompName: String;
  F: TextFile;
  Component: TComponent;
  i: Integer;
  
begin
  if FileExists(AValue) then
    begin
      AssignFile(F, AValue);
      Reset(F);
      while not EOF(F) do
        begin
          ReadLn(F,S);
          CompName := Copy(S, 0, Pos('=', S)-1);
          Component := frmMAin.FindComponent(CompName);
          if pos('ed', CompName) > 0 then
            (Component as TWinControl).Text := Copy(S, Pos('=', S)+1, Length(S));
          if pos('rgNaming', CompName) > 0 then
            begin
              i := StrToInt(Copy(S, Pos('=', S)+1, Length(S)));
              case i of
                0 : rb_winBMD.Checked := True;
                1 : rb_speedBMD.Checked := True;
                2 : rb_custom.Checked := True;
//                * : rb_winBMD.Checked := True;
              end;
            end;
          if pos('cbOwn', CompName) > 0 then
            (Component as TCheckBox).Checked := Copy(S, Pos('=', S)+1, Length(S)) = 'True';
        end;
    end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.WriteConfig(AValue: String);

var
  S: String;
  F: TextFile;

begin
  Assignfile(F, AValue);
  Rewrite(F);
  if rb_Custom.Checked then
    S := 'rgNaming_Convention=2'
  else if rb_speedBMD.Checked then
    S := 'rgNaming_Convention=1'
  else
    S := 'rgNaming_Convention=0';
  Writeln(F, S);
  S := 'edwinBMD_Add=' + edwinBMD_Add.Text;
  Writeln(F, S);
  S := 'edYear=' + edYear.Text;
  Writeln(F, S);
  S := 'edTranscription_Type=' + edTranscription_Type.Text;
  Writeln(F, S);
  S := 'edEvent_Type=' + edEvent_Type.Text;
  Writeln(F, S);
  S := 'edVolume_Format=' + edVolume_Format.Text;
  Writeln(F, S);
  S := 'edQuarter=' + edQuarter.Text;
  Writeln(F, S);
  S := 'edMedia_Type=' + edMedia_Type.Text;
  Writeln(F, S);
  S := 'edScan_Ref=' + edScan_Ref.Text;
  Writeln(F, S);
  S := 'edComments=' + edComments.Text;
  Writeln(F, S);
  S := 'edYour_Name=' + edYour_Name.Text;
  Writeln(F, S);
  S := 'edSyndicate=' + edSyndicate.Text;
  Writeln(F, S);
  S := 'edEmail_Address=' + edEmail_Address.Text;
  Writeln(F, S);
  S := 'edSubmitter_ID=' + edSubmitter_ID.Text;
  Writeln(F, S);
  S := 'edPassword=' + edPassword.Text;
  Writeln(F, S);
  if cbOwn_Dates.Checked then
    S := 'cbOwn_Dates=True'
  else
    S := 'cbOwn_Dates=False';
  Writeln(F, S);
  Closefile(F);
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

function lpos(LookFor, LookIn:String): Integer;

var
  i: integer;

begin
  i := 0;
  while  pos(LookFor, LookIn) > 0 do
    begin
      i := i + pos(LookFor, LookIn);
      LookIn := Copy(LookIn, pos(LookFor, LookIn) + 1, Length(LookIn));
      {$IFDEF DEBUG}
        WriteLn('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        WriteLn('  LookFor - ' + LookFor);
        WriteLn('  LookIn  - ' + LookIn);
        WriteLn('  lpos    - ' + IntToStr(i));
        WriteLn('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
      {$ENDIF}
    end;
  lpos := i;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

function Chomp(S: String): String;
begin
  if Length(S) > 0 then
    if S[Length(S)] = ' ' then
      S := Copy(S, 0, Length(S)-1);
  Chomp := S;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edEvent_TypeChange(Sender: TObject);

var
  S: String;
  i: Integer;
  
begin
  if rb_Custom.Checked then
    i := 2
  else if rb_speedBMD.Checked then
    i := 1
  else
    i := 0;
  Case i of
    0 : begin
          S := stFilename.Caption;
          Case edEvent_Type.ItemIndex of
            0: S[5] := 'B';
            1: S[5] := 'M';
            2: S[5] := 'D';
          end;
          stFilename.Caption := S;
        end;
    1 : begin
          S := stFilename.Caption;
          Case edEvent_Type.ItemIndex of
            0: S[3] := 'B';
            1: S[3] := 'M';
            2: S[3] := 'D';
          end;
          stFilename.Caption := S;
        end;
  end;
  SetHeaders;
end;

procedure TfrmMain.edLetter1KeyPress(Sender: TObject; var Key: char);
begin
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.btnCreatedClick(Sender: TObject);

var
  Old_Format: String;

begin
  with frmCalendar do
    begin
      if Showmodal = mrOK then
        begin
          Old_Format := ShortDateFormat;
          ShortDateFormat := 'dd-MMM-yyyy';
          stCreated.Text := DateToStr(StrToDate(Date_Selected));
          ShortDateFormat := Old_Format;
        end;
    end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.Notebook1PageChanged(Sender: TObject);
begin
  if Notebook1.ActivePage = 'Transcribed Data' then
    sg.SetFocus;
  setCaption;
end;

procedure TfrmMain.addCommentClick(Sender: TObject);

var
  S: String;

begin
  if InputQuery('Enter your comment','Comment:',S) then
    begin
      //sg.Row;
    end;
//    sg.Rows[sg.];
//    Showmessage(S);
  sg.setFocus;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.MenuItem1Click(Sender: TObject);

var
  S: String;
  
begin
  if InputQuery('Enter your theory','Theory:',S) then
    Showmessage(S);
  sg.setFocus;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.btnModifiedClick(Sender: TObject);

var
  Old_Format: String;

begin
  with frmCalendar do
    begin
      if Showmodal = mrOK then
        begin
          Old_Format := ShortDateFormat;
          ShortDateFormat := 'dd-MMM-yyyy';
          stModified.Text := DateToStr(StrToDate(Date_Selected));
          ShortDateFormat := Old_Format;
        end;
    end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.btnSave_ConfigClick(Sender: TObject);
begin
  WriteConfig(ExtractFilePath(Application.Exename) + 'linbmd.conf');
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.cbOwn_DatesClick(Sender: TObject);
begin
  btnCreated.Visible := cbOwn_Dates.Checked;
  btnModified.Visible := cbOwn_Dates.Checked;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.cbAll_Caps_SurnameChange(Sender: TObject);
begin
  mi_Config_All_Caps.Checked := cbAll_Caps_Surname.Checked;
  sg.SetFocus;
end;

procedure TfrmMain.cbSkip_FirstnameChange(Sender: TObject);
begin
  mi_Config_Skip_Firstname.Checked := cbSkip_Firstname.Checked;
  sg.SetFocus;
end;

procedure TfrmMain.cbSkip_SurnameChange(Sender: TObject);
begin
  mi_Config_Skip_Surname.Checked := cbSkip_Surname.Checked;
  sg.SetFocus;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edPageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var
  S, T: String;
  i,j: Integer;

begin
  if rb_Custom.Checked then
    j := 2
  else if rb_speedBMD.Checked then
    j := 1
  else
    j := 0;
  Case j of
    0 : begin
          S := stFilename.Caption;
          T := edPage.Text;
          if Length(T) > 4 then
            T := Copy(T, 0, 4)
          else
            while Length(T) < 4 do
              T := '0' + T;
          for i := 1 to 4 do
            S[7+i] := T[i];
          stFilename.Caption := S;
        end;
    1 : begin
          S := stFilename.Caption;
          if Length(T) > 4 then
            T := Copy(T, 0, 4)
          else
            while Length(T) < 4 do
              T := 'n' + T;
          for i := 1 to 4 do
            S[i+4] := T[i];
          stFilename.Caption := S;
        end;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edQuarterChange(Sender: TObject);

var
  S: String;
  i: Integer;

begin
  if rb_Custom.Checked then
    i := 2
  else if rb_speedBMD.Checked then
    i := 1
  else
    i := 0;
  Case i of
    0 : begin
          S := stFilename.Caption;
          Case edQuarter.ItemIndex of
            0: S[6] := '1';
            1: S[6] := '2';
            2: S[6] := '3';
            3: S[6] := '4';
          end;
          stFilename.Caption := S;
        end;
    1 : begin
          S := stFilename.Caption;
          Case edQuarter.ItemIndex of
            0: S[4] := '1';
            1: S[4] := '2';
            2: S[4] := '3';
            3: S[4] := '4';
          end;
          stFilename.Caption := S;
        end;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edVolume_FormatChange(Sender: TObject);
begin
  if not Assigned(Districts) then
    Districts := TStringList.Create;
  Districts.Clear;
  Case edVolume_Format.ItemIndex of
    0: begin
         Try
           Districts.LoadFromFile(ExtractFilePath(Application.Exename) + 'files/districts_9Z.txt');
         Except
           Showmessage('File - "files/districts_9Z.txt" is missing.' + #13 + 'District Pick Lists will not work correctly.');
         end;
       end;
    1: begin
         Try
           Districts.LoadFromFile(ExtractFilePath(Application.Exename) + 'files/districts_99.txt');
         Except
           Showmessage('File - "files/districts_99.txt" is missing.' + #13 + 'District Pick Lists will not work correctly.');
         end;
       end;
    2: begin
         Try
           Districts.LoadFromFile(ExtractFilePath(Application.Exename) + 'files/districts_XX.txt');
         Except
           Showmessage('File - "files/districts_XX.txt" is missing.' + #13 + 'District Pick Lists will not work correctly.');
         end;
       end;
  end;
  Districts.Sorted := True;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edYearChange(Sender: TObject);

var
  S, T: String;
  i,j: Integer;

begin
  if rb_Custom.Checked then
    j := 2
  else if rb_speedBMD.Checked then
    j := 1
  else
    j := 0;
  Case j of
    0 : begin
          S := stFilename.Caption;
          T := edYear.Text;
          if Length(T) > 4 then
            T := Copy(T, 0, 4)
          else
            while Length(T) < 4 do
              T := 'Y' + T;
          for i := 1 to 4 do
            S[i] := T[i];
          stFilename.Caption := S;
        end;
    1 : begin
          S := stFilename.Caption;
          T := edYear.Text;
          if Length(T) > 2 then
            T := Copy(T, Length(T)-1, 2)
          else
            while Length(T) < 2 do
              T := 'Y' + T;
          for i := 1 to 2 do
            S[i] := T[i];
          stFilename.Caption := S;
        end;
  end;
  SetHeaders;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edYearKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (((Key > 36) and (Key < 58)) or ((Key > 95) and (Key < 106)) or (Key = 8)) then
    Key := 0;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.Create(Sender: TObject);

var
  S, LB: String;
  i: Integer;
  D: TDate;
  
begin
  setCaption;
//Create Districts...
  Districts := TStringList.Create;
  Districts.Sorted := True;
//Create and populate the Names...
  Names := TStringList.Create;
  Try
    Names.LoadFromFile(ExtractFilePath(Application.Exename) + 'files/firstnames.txt');
   Except
    Showmessage('File - "files/firstnames.txt" is missing.' + #13 + 'Firstname Pick Lists will not work correctly.');
   end;
  Names.Sorted := True;
  Fields := TStringList.Create;
  Widths := TStringList.Create;
  sg.AutoAdvance := aaNone;
  old_Headers := 0;
  old_Year := 0;
  New_Word := True;
  First_Time := True;
  Skip_Age := False;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.setCaption;
begin
  frmMain.Caption := 'linBMD (ver : ' +_VERSION + ') - ' +Notebook1.ActivePage;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.edwinBMD_AddChange(Sender: TObject);

var
  S: String;

begin
  S := stFilename.Caption;
  if Length(edWinBMD_Add.Text) > 0 then
    S[7] := edwinBMD_Add.Text[1]
  else
    S[7] := 'L';
  stFilename.Caption := S;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

function TfrmMain.getStrDate(D:TDate): String;

var
  S: String;

begin
  S := ShortDateFormat;
  ShortDateFormat := 'dd-MMM-yyyy';
  getStrDate := DateToStr(D);
  ShortDateFormat := S;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.frmMainActivate(Sender: TObject);

var
  S: String;
  D: TDate;
  
begin
  if First_Time then
    begin
      ReadConfig(ExtractFilePath(Application.Exename) + '/linbmd.conf');
      First_Time := False;
      if not cbOwn_Dates.Checked then
        begin
          D := Date;
          stCreated.Text := getStrDate(D);
          stModified.Text := getStrDate(D);
        end;
    end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mi_Config_SaveClick(Sender: TObject);
begin
  WriteConfig(ExtractFilePath(Application.Exename) + '/linbmd.conf');
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mi_Config_All_CapsClick(Sender: TObject);
begin
  cbAll_Caps_Surname.Checked := mi_Config_All_Caps.Checked;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mi_Config_Skip_SurnameClick(Sender: TObject);
begin
  cbSkip_Surname.Checked := mi_Config_Skip_Surname.Checked;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mi_Config_Skip_FirstnameClick(Sender: TObject);
begin
  cBSkip_Firstname.Checked := mi_Config_Skip_Firstname.Checked;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mi_File_ExitClick(Sender: TObject);
begin
  frmMain.Close;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mi_Help_TipsClick(Sender: TObject);
begin
  frmHelp.Show;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.rb_customClick(Sender: TObject);

Var
  S: String;

begin
  edwinBMD_Add.Visible := False;
  lbwinBMD_Add.Visible := False;
  stFilename.Text := 'custom.csv';
  S := stFilename.Caption;
  if InputQuery('Choose a filename','Own filename:',S) then
    stFilename.Caption := S;
end;

procedure TfrmMain.rb_winBMDClick(Sender: TObject);
begin
  edwinBMD_Add.Visible := True;
  lbwinBMD_Add.Visible := True;
  stFilename.Text := 'YYYYEQLnnnn.bmd';
  //updateFilename;
end;

procedure TfrmMain.rb_speedBMDClick(Sender: TObject);
begin
  edwinBMD_Add.Visible := False;
  lbwinBMD_Add.Visible := False;
  stFilename.Text := 'YYEQnnnn.sca';
  //updateFilename;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.sgKeyPress(Sender: TObject; var Key: char);
begin
  Character := Key;
  if ((sg.Col = 1) and (cbAll_Caps_Surname.Checked)) or (New_Word) then
    begin
      Key := upcase(Key);
      New_Word := False;
    end;
  if Key = #32 then
    begin
      if not (pos('istrict', sg.Cells[sg.Col, 0]) > 0) then
        begin
          New_Word := True;
          Search_String := '';
        end;
    end;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.sgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

var
  LCV, Offset, x: Integer;
  S: String;
  NewRow: Boolean;
  
procedure get_From_PickList(id: Integer);

var
  S: String;
  
begin
  if PickList.Items.Count > id then
    begin
      if pos('iven', sg.cells[sg.col, 0]) > 0 then
        begin
          {$IFDEF DEBUG}
            WriteLn('get_From_PickList');
            WriteLn('  Current Cell Value     - ' + sg.Cells[sg.Col, sg.Row]);
            WriteLn('  Search String          - ' + UpCase(Search_String));
            WriteLn('  UpCase(Cell)           - ' + UpCase(sg.Cells[sg.Col, sg.Row]));
            WriteLn('  POS in cell            - ' + IntToStr(pos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))));
            WriteLn('  LPOS in cell           - ' + IntToStr(lpos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))));
            WriteLn('  What is kept from cell - ' + Copy(sg.Cells[sg.Col, sg.Row], 0, lpos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))-1));
            WriteLn('  Listbox Item           - ' + Copy(PickList.Items[id], pos('. ', PickList.Items[id]) + 2, Length(PickList.Items[id])));
          {$ENDIF}
          if  Copy(sg.Cells[sg.Col, sg.Row], 0, pos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))-Length(Search_String)) <> '' then
            sg.Cells[sg.Col, sg.Row] := Copy(sg.Cells[sg.Col, sg.Row], 0, lpos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))-1) + Copy(PickList.Items[id],pos('. ', PickList.Items[id]) + 2, Length(PickList.Items[id])) + ' '
          else
            sg.Cells[sg.Col, sg.Row] := Copy(PickList.Items[id], lpos('. ', PickList.Items[id]) + 2, Length(PickList.Items[id])) + ' '
        end
      else if pos('istrict', sg.cells[sg.col, 0]) > 0 then
        begin
          OffSet := pos(' ', PickList.Items[id]) + 1;
          sg.Col := sg.Col + 1;
          sg.Cells[sg.col-1, sg.row] := Copy(PickList.Items[id], OffSet, pos('|', PickList.Items[id]) - OffSet);
          sg.Cells[sg.col, sg.row] := Copy(PickList.Items[id], pos('|', PickList.Items[id]) + 1, length(PickList.Items[id]));
          sg.Col := sg.Col + 1;
        end;
    end;
  New_Word := True;
  Search_String := '';
  PickList.Items.Clear;
end;

begin
  NewRow := False;
  with sg do
    begin

 //CHECK IF CTRL-S HASS BEEN PRESSED
      if ((Key  =  83) and (ssCTRL in Shift)) then
        begin
//          showmessage('save');
          miFile_Save1.Click;
        end;

// CHECK IF A PICKLIST ITEM IS BEING SELECTED
      if (((Key > 48) and (Key < 58)) or ((Key > 96) and (Key < 106))) and (ssCTRL in Shift) and (PickList.Items.Count > 0) then
        case Key of
          49: get_From_PickList(0);
          50: get_From_PickList(1);
          51: get_From_PickList(2);
          52: get_From_PickList(3);
          53: get_From_PickList(4);
          54: get_From_PickList(5);
          55: get_From_PickList(6);
          56: get_From_PickList(7);
          57: get_From_PickList(8);

          97: get_From_PickList(0);
          98: get_From_PickList(1);
          99: get_From_PickList(2);
          100: get_From_PickList(3);
          101: get_From_PickList(4);
          102: get_From_PickList(5);
          103: get_From_PickList(6);
          104: get_From_PickList(7);
          105: get_From_PickList(8);
        end;

// IF CTRL TAB IS PRESSED THEN GO BACK A CELL
      if ((Key = 9) and (ssShift in Shift)) then
        if (Col = 1) and not (Row =1) then
          begin
            Row := Row - 1;
            New_Word := True;
            Search_String := '';
            Col := ColCount - 1;
          end
        else
          Col := Col - 1;

// CHECK IF ENTER OR TAB (BUT NOT SHIFT TAB) WERE  PRESSED
      if (Key = 13) or ((Key = 9) and not (ssShift in Shift)) then
        begin
          if Col = ColCount - 1 then
            if Row = RowCount - 1 then
              begin
                RowCount := RowCount + 1;
                NewRow := True;
                Row := RowCount - 1;
                New_Word := True;
                Search_String := '';
                Cells[0, Row] := IntToStr(Row);
                Cells[1, Row] := Cells[1, Row-1];
                Cells[2, Row] := Cells[2, Row-1];
                x := 1;
                if cbSkip_Surname.Checked then
                  x := 2;
                if cbSkip_Firstname.Checked then
                  x := 3;
                Col := x;
              end
            else
              begin
                Row := Row + 1;
                New_Word := True;
                Search_String := '';
                NewRow := True;
                if Cells[Col, Row] = '' then
                  Cells[1, Row] := Cells[1, Row-1];
                x := 1;
                if cbSkip_Surname.Checked then
                  x := 2;
                if cbSkip_Firstname.Checked then
                  x := 3;
                Col := x;
              end
          else
            begin
              if (PickList.Items.Count = 1) then
                begin
                  OffSet := pos(' ', PickList.Items[0]) + 1;
                  if pos('istrict', Cells[Col,0]) > 1 then
                    begin
                      Col := Col + 1;
                      Cells[col-1, row] := Copy(PickList.Items[0], OffSet, pos('|', PickList.Items[0]) - OffSet);
                      Cells[col, row] := Copy(PickList.Items[0], pos('|', PickList.Items[0]) + 1, length(PickList.Items[0]));
                    end
                  else
                    begin
                      Cells[col, row] := Copy(Cells[col, row], 0, lpos(' ', Cells[col, row]))  + Copy(PickList.Items[0], OffSet, Length(PickList.Items[0]));
                    end;
                  New_Word := True;
                  Search_String := '';
                end;
            end;
          if not NewRow then
            begin
              Col := Col + 1;
              New_Word := True;
              Search_String := '';
            end;
          PickList.Clear;
        end;

// CHECK IF ESC WAS PRESSED AND SET CURRENT CELL TO ABOVE CELL
      if Key = 27 then
        begin
          Cells[Col, Row] := Cells[Col, Row-1];
          Col := Col + 1;
        end;

// CHECK IF F9 WAS PRESSED AND SHOW SPECIAL CHARACTERS
      if Key = 120 then
        begin
          if frmSpecial.ShowModal = mrOK then
            Cells[col, row] := Cells[col, row] + frmSpecial.sgSpecial.Cells[frmSpecial.sgSpecial.Col,frmSpecial.sgSpecial.Row];
          sg.Setfocus;
        end;
          
// RECALCULATE SEARCH_STRING BASED ON THE CELL CONTENTS.
      if not (ssCTRL in Shift) then
        begin
          if not New_Word then
            begin
              Search_String := Chomp(Cells[Col, Row]);
              if not (pos('istrict', sg.Cells[sg.Col, 0]) > 0) then
                begin
                  While pos(' ', Search_String) > 0 do
                    Search_String := Copy(Search_String, pos(' ', Search_String) + 1, Length(Cells[Col, Row]));
                  if Length(Search_String) < 1 then
                    New_Word := True;
                  {$IFDEF DEBUG}
                    WriteLn('sgKeyUp - Making Search_String');
                    WriteLn('  Search String - ' + Search_String);
                    WriteLn('  Character - ' + Char(Key));
                  {$ENDIF}
                end;
            end;
        end;

// CHECK WHICH PICKLIST TO USE BASED ON THE COL HEADER
      if (pos('istrict', Cells[Col,0]) > 1) then
        begin
          PickList.Items.Clear;
          for LCV := 0 to Districts.Count - 1 do
            if pos(UpperCase(Search_string), UpperCase(Districts.Strings[LCV])) = 1 then
              if PickList.Items.Count < 9 then
                PickList.Items.Add(IntToStr(PickList.Items.Count + 1)+'. ' + Districts.Strings[LCV]);
        end
      else if (pos('other', Cells[Col,0]) > 1) or (pos('iven', Cells[Col,0]) > 1) then
        begin
          PickList.Items.Clear;
          for LCV := 0 to Names.Count - 1 do
            if pos(UpperCase(Search_string), UpperCase(Names.Strings[LCV])) = 1 then
              if PickList.Items.Count < 9 then
                PickList.Items.Add(IntToStr(PickList.Items.Count + 1)+'. ' + Names.Strings[LCV]);
        end;
        
      //THIS SHOULD WORK WHEN USING GTK2
      if PickList.Items.Count = 0 then
        PickList.Brush.Color := clRed
      else if PickList.Items.Count = 1 then
        PickList.Brush.Color := clGreen
      else
        PickList.Brush.Color := clWhite;
    end;
  sg.Repaint;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure Not_Yet(S: String);
begin
  ShowMessage(S + ' is not yet implemented.');
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.updateSG;


  procedure doit;
  var
    i: Integer;
  begin
    pickList.Width := 500;
    pickList.Left := frmMain.ClientWidth - PickList.Width;
    with sg do
      begin
        ColCount := Fields.Count;
        Width := frmMain.ClientWidth - PickList.Width;
        for i := 0 to Fields.Count - 1 do
          begin
            ColWidths[i] := StrToInt(Widths.Strings[i]);
            Cells[i,0] := Fields.Strings[i];
          end;
        Cells[0,1] := '1';
      end;
  end;

begin
{  if not First_Time then
    begin
      if QuestionDlg('Header change.', 'Your transcription headers are about to be changed. This may affect data already captured. Are you sure you want to continue?', mtWarning, [mbNo,mbOK], -1) = mrOK then
        begin
          doit;
        end
      else
        begin
          edYear.Text := '';
          Showmessage('The year of the transcription has been cleared. Please insert the correct year before continuing.');
        end;
    end
  else}
    doit;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.miFile_OpenClick(Sender: TObject);

var
  F: TextFile;
  S: String;
  Page: Boolean;
  Line_Number, x: Integer;
  i: Integer;

begin
  od.InitialDir := ExtractFilePath(Application.ExeName);
  od.Filter := '*.bmd';
  Line_Number := 1;
  Page := False;
  if od.Execute then
    begin
      Modified := False;
      if Modified then
// MAKE THIS A MODAL DIALOG
        exit;
      AssignFile(F, od.Filename);
      Reset(F);
      sg.RowCount := 2;
      for i := 1 to sg.ColCount - 1 do
        sg.Cells[i, 1] := '';
      while not EOF(F) do
        begin
          Readln(F, S);
          if (pos('+INFO', S) = 1) then
            begin
              S := Copy(S, 7, Length(S));
              with frmMain do
                begin
                  edEmail_Address.Text := Copy(S, 0, pos(',', S)-1);
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  edPassword.Text := Copy(S, 0, pos(',', S)-1);
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  
                  if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'SEQUENCED') then
                    edTranscription_Type.ItemIndex := 0
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'ONENAME') then
                    edTranscription_Type.ItemIndex := 1
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'RANDOM') then
                    edTranscription_Type.ItemIndex := 2;

                  S := Copy(S, pos(',', S) + 1, Length(S));
                  
                  if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'BIRTHS') then
                    edEvent_Type.ItemIndex := 0
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'MARRIAGES') then
                    edEvent_Type.ItemIndex := 1
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'DEATHS') then
                    edEvent_Type.ItemIndex := 2;

                  S := Copy(S, pos(',', S) + 1, Length(S));
                  edChar_Set.Text := Copy(S, 0, pos(',', S)-1);
                end;
            end
          else if (pos('+S', S) = 1) then
            begin
              S := Copy(S, 4, Length(S));
              with frmMain do
                begin
                  edMedia_Type.Text := 'Scan';
                  edYear.Text := Copy(S, 0, pos(',', S)-1);
                  SetHeaders;
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  edQuarter.Text := Copy(S, 0, pos(',', S)-1);
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  edScan_Ref.Text := Copy(S, 0, pos(',', S)-1);
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  if pos(',', S) > 0 then
                    stModified.Text := Copy(S, 0, pos(',', S)-1)
                  else
                    stModified.Text := S;
                end;
            end
          else if (pos('+PAGE', S) = 1) then
            begin
              S := Copy(S, 7, Length(S));
              with frmMain do
                begin
                  if not Page then
                    edPage.Text := S;
                  Page := True
                end;
            end
          else if (pos('#', S) = 1) then
            begin
              S := Copy(S, 3, Length(S));
              with frmMain do
                begin
                  if ( (pos('9z', S) > 0) or (pos('9Z', S) > 0) or (pos('99', S) > 0) or (pos('xx', S) > 0) or (pos('XX', S) > 0) ) then
                    begin
                      edVolume_Format.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      edYour_Name.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      edSyndicate.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      stFilename.Caption := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      stCreated.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      edwinBMD_Add.Text := Copy(S, 0, pos(',', S)-1);
                    end
                  else
                    edComments.Text := S;
                end;
            end
          else
            begin
              if Line_Number > 1 then
                sg.RowCount := sg.RowCount +1 ;
              with sg do
                begin
                  Cells[0, Line_Number] := IntToStr(Line_Number);
                  for x := 1 to ColCount - 1 do
                    begin
                      if pos(',', S) > 0 then
                        begin
                          if pos('"', S) = 1 then
                            begin
                              S := Copy(S, 2, Length(S));
                              Cells[x, Line_Number] := Copy(S, 0, pos('"', S)-1);
                              S := Copy(S, pos('"', S) + 2, Length(S));
                            end
                          else
                            begin
                              Cells[x, Line_Number] := Copy(S, 0, pos(',', S)-1);
                              S := Copy(S, pos(',', S) + 1, Length(S));
                            end;
                        end
                      else
                        Cells[x, Line_Number] := Copy(S, 0, Length(S));
                    end;
                  Line_Number := Line_Number + 1;
                end;
            end;
        end;
    end;
  CloseFile(F);
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.miFile_SaveAsClick(Sender: TObject);
begin
// STILL TO BE IMPLEMENTED
  Not_Yet('"Save as"');
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.miFile_SaveClick(Sender: TObject);

var
  F: TextFile;
  i,j: Integer;
  S, start, stop: String;
  CheckHeader: Boolean;
  
begin
  {$IFDEF DEBUG}
    start :=  TimeToStr(Time);
  {$ENDIF}
  S := '';
  CheckHeader := True;
  if CheckHeader then
    begin
      with frmMain do
        begin
          stModified.Text := getStrDate(Date);
          AssignFile(F, ExtractFilePath(Application.Exename) + stFilename.Caption);
          Rewrite(F);
          Writeln(F, '+INFO,' + edEmail_Address.Text + ',password,'+ UpperCase(edTranscription_Type.Text) +',' + UpperCase(edEvent_Type.Text) + ',' + edChar_Set.Text);
          S := '#,' + edVolume_Format.Text + ',' + edYour_Name.Text + ',' + edSyndicate.Text + ',';
          S := S + stFilename.Caption + ',' + stCreated.Text + ',Y,Y,N,' + edwinBMD_Add.Text + ',0';
          Writeln(F, S);
          Writeln(F, '#,' + edComments.Text);
          Writeln(F,'+' + edMedia_Type.Text[1] + ',' + edYear.Text + ',' + edQuarter.Text + ',' + edScan_Ref.Text + ',' + stModified.Text);
          Writeln(F, '+PAGE,' + edPage.Text);
        end;
// NOW WRITE THE TRANSCRIBED DATA TO THE FILE
      if sg.RowCount > 1 then
        for i := 1 to sg.RowCount - 1 do
          begin
            S := '';
            for j := 1 to sg.ColCount - 1 do
              if S = '' then
                if pos(',', sg.Cells[j, i]) > 1 then
                  S := '"' + chomp(sg.Cells[j,i]) + '"'
                else
                  S := chomp(sg.Cells[j,i])
              else
                if pos(',', sg.Cells[j, i]) > 1 then
                  S := S + ',"' + chomp(sg.Cells[j,i]) + '"'
                else
                  S := S + ',' + chomp(sg.Cells[j,i]);
            Writeln(F, S);
          end;
    end;
  CloseFile(F);
  {$IFDEF DEBUG}
    stop :=  TimeToStr(Time);
    Writeln('Start - ' + Start + #13 + 'Stop  - ' + stop);
  {$ENDIF}
  Modified := False;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.miFile_StartNewClick(Sender: TObject);
begin
// STILL TO BE IMPLEMENTED
  Not_Yet('"Start New"');
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.miHelp_AboutClick(Sender: TObject);
begin
  frmAbout.Showmodal;
end;


initialization
  {$I main.lrs}

end.

