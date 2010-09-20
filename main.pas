unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ExtCtrls, Grids, About, StdCtrls, Buttons, Global, Special, Help;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    addComment: TMenuItem;
    addDistrict: TMenuItem;
    addFirstname: TMenuItem;
    addTheory: TMenuItem;
    BitBtn1: TBitBtn;
    cbAll_Caps_Surname: TCheckBox;
    cbSkip_Surname: TCheckBox;
    cbSkip_Firstname: TCheckBox;
    ddEvent_Type: TComboBox;
    ddMedia_Type: TComboBox;
    ddQuarter: TComboBox;
    ddTranscription_Type: TComboBox;
    ddVolume_Format: TComboBox;
    edYear: TEdit;
    edPassword: TEdit;
    edPage: TEdit;
    edChar_Set: TEdit;
    edScan_Ref: TEdit;
    edComments: TEdit;
    edYour_Name: TEdit;
    edSyndicate: TEdit;
    edEmail_Address: TEdit;
    edSubmitter_ID: TEdit;
    ImageList1: TImageList;
    Label11: TLabel;
    Label12: TLabel;
    miConfig_Skip_Firstname: TMenuItem;
    miFile1: TMenuItem;
    miFile_Open1: TMenuItem;
    miFile_Save1: TMenuItem;
    miHelp_About1: TMenuItem;
    miHelp_Tips: TMenuItem;
    miConfig_Save: TMenuItem;
    miConfig_Skip_Firstane: TMenuItem;
    miConfig_Skip_Surname: TMenuItem;
    miConfig_all_Caps: TMenuItem;
    miFile_Open: TMenuItem;
    miFile_Save: TMenuItem;
    miFile_Exit: TMenuItem;
    od: TOpenDialog;
    pm1: TPopupMenu;
    stCreated: TStaticText;
    stModified: TStaticText;
    stFilename: TEdit;
    edwinBMD_Add: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    label33: TLabel;
    label23: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pickList: TListBox;
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miConfig: TMenuItem;
    miHelp: TMenuItem;
    miHelp_About: TMenuItem;
    pc: TPageControl;
    Panel1: TPanel;
    rbWinBMD: TRadioButton;
    rbSpeedBMD: TRadioButton;
    rbCustom: TRadioButton;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    sg: TStringGrid;
    tsHeaderDetail: TTabSheet;
    tsTranscribedDetail: TTabSheet;
    procedure addCommentClick(Sender: TObject);
    procedure addDistrictClick(Sender: TObject);
    procedure addFirstnameClick(Sender: TObject);
    procedure addTheoryClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbAll_Caps_SurnameChange(Sender: TObject);
    procedure cbSkip_FirstnameChange(Sender: TObject);
    procedure cbSkip_FirstnameClick(Sender: TObject);
    procedure cbSkip_SurnameChange(Sender: TObject);
    procedure cbSkip_SurnameClick(Sender: TObject);
    procedure ddEvent_TypeChange(Sender: TObject);
    procedure edPageKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ddQuarterChange(Sender: TObject);
    procedure ddVolume_FormatChange(Sender: TObject);
    procedure edwinBMD_AddChange(Sender: TObject);
    procedure edYearChange(Sender: TObject);
    procedure edYearKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miConfig_All_CapsClick(Sender: TObject);
    procedure miConfig_Skip_FirstnameClick(Sender: TObject);
    procedure miConfig_Skip_SurnameClick(Sender: TObject);
    procedure miFile_ExitClick(Sender: TObject);
    procedure miFile_Open1Click(Sender: TObject);
    procedure miFile_Save1Click(Sender: TObject);
    procedure miHelp_TipsClick(Sender: TObject);
    procedure setCaption;
    procedure SetHeaders;
    procedure sgKeyPress(Sender: TObject; var Key: char);
    procedure sgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure UpdateSG;
    procedure updateFilename;
    procedure ReadConfig(AValue: String);
    procedure WriteConfig(AValue: String);
    procedure miHelp_AboutClick(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure rbCustomClick(Sender: TObject);
    procedure rbSpeedBMDClick(Sender: TObject);
    procedure rbWinBMDClick(Sender: TObject);
    procedure sgEditingDone(Sender: TObject);

    function Chomp(S: String): String;
    function lpos(LookFor, LookIn:String): Integer;
    function getStrDate(D:TDate): String;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmMain: TfrmMain;
  New_Word, First_Time: Boolean;
  Names, Districts, Supp_Districts, Fields, Widths, Theories: TStringList;
  Search_String: String;
  Character: Char;
  Headers, old_Headers, Year, old_Year, FieldCount, Current_Column, Current_Row: Integer;

const
  NAME_LIST = 1;
  DISTRICT_LIST = 2;


implementation

{ TfrmMain }

function TfrmMain.getStrDate(D:TDate): String;

var
  S: String;

begin
  S := ShortDateFormat;
  ShortDateFormat := 'dd-MMM-yyyy';
  getStrDate := DateToStr(D);
  ShortDateFormat := S;
end;


procedure TfrmMain.SetHeaders;
begin
  if (Length(edYear.Text) = 4) and (ddEvent_Type.ItemIndex > -1) then
    begin
      Case ddEvent_Type.ItemIndex of
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
                     FieldCount := Fields.Count;
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
                     FieldCount := Fields.Count;
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
                     FieldCount := Fields.Count;
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
                     FieldCount := Fields.Count;
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
                     FieldCount := Fields.Count;
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
                     FieldCount := Fields.Count;
                     old_Headers := Headers;
                     UpdateSG;
                   end;
               end;
           end;
      end;
  end;
end;

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

procedure TfrmMain.sgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

var
  LCV, Offset, x: Integer;
  NewRow: Boolean;
  Volume: String;

procedure get_From_PickList(id: Integer);
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

          if pos('|', PickList.Items[id]) > 0 then
            Name := Copy(PickList.Items[id], pos('. ', PickList.Items[id]) + 2, pos('|', PickList.Items[id]) - (pos('. ', PickList.Items[id]) + 2))
          else
            Name := Copy(PickList.Items[id],pos('. ', PickList.Items[id]) + 2, Length(PickList.Items[id]));
          if  Copy(sg.Cells[sg.Col, sg.Row], 0, pos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))-Length(Search_String)) <> '' then
            sg.Cells[sg.Col, sg.Row] := Copy(sg.Cells[sg.Col, sg.Row], 0, lpos(UpCase(Search_String), UpCase(sg.Cells[sg.Col, sg.Row]))-1) + Name + ' '
          else
            sg.Cells[sg.Col, sg.Row] := Name + ' '
        end
      else if pos('istrict', sg.cells[sg.col, 0]) > 0 then
        begin
          OffSet := pos(' ', PickList.Items[id]) + 1;
          sg.Col := sg.Col + 1;
          sg.Cells[sg.col-1, sg.row] := Copy(PickList.Items[id], OffSet, pos('|', PickList.Items[id]) - OffSet);
          Volume := Copy(PickList.Items[id], pos('|', PickList.Items[id]) + 1, length(PickList.Items[id]));
          if pos('|', Volume) > 0 then
            sg.Cells[sg.col, sg.row] := Copy(Volume, 0, pos('|', Volume) - 1)
          else
            sg.Cells[sg.col, sg.row] := Copy(Volume, 0, length(Volume));
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
//          miFile_Save1.Click;
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
                if cbSkip_Surname.Checked then
                  Cells[1, Row] := Cells[1, Row-1];
                if cbSkip_Firstname.Checked then
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
                      Volume := Copy(PickList.Items[0], pos('|', PickList.Items[0]) + 1, length(PickList.Items[0]));
                      if pos('|', Volume) > 0 then
                        Cells[col, row] := Copy(Volume, 0, pos('|', Volume) - 1)
                      else
                        Cells[col, row] := Volume;
                    end
                  else
                    begin
                      if pos('|', PickList.Items[0]) > 0 then
                        Cells[col, row] := Copy(Cells[col, row], 0, lpos(' ', Cells[col, row]))  + Copy(PickList.Items[0], OffSet, pos('|', (PickList.Items[0])))
                      else
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
      else if //(pos('other', Cells[Col,0]) > 1) or
              (pos('iven', Cells[Col,0]) > 1) then
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

procedure TfrmMain.sgSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  Current_Column := aCol;
  Current_Row := aRow;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ReadConfig(AValue: String);

var
  S, CompName: String;
  F: TextFile;
  Value: String;

begin
  if FileExists(AValue) then
    begin
      AssignFile(F, AValue);
      Reset(F);
      while not EOF(F) do
        begin
          ReadLn(F,S);
          CompName := Copy(S, 0, Pos('=', S)-1);

          if pos('rbWinBMD', CompName) > 0 then
            begin
              Value := Copy(S, Pos('=', S)+1, Length(S));
              if Value = '0' then
                rbWinBMD.Checked := True
              else
                rbWinBMD.Checked := False;
            end;

          if pos('rbSpeedBMD', CompName) > 0 then
            begin
              Value := Copy(S, Pos('=', S)+1, Length(S));
              if Value = '0' then
                rbSpeedBMD.Checked := True
              else
                rbSpeedBMD.Checked := False;
            end;

          if pos('rbCustom', CompName) > 0 then
            begin
              Value := Copy(S, Pos('=', S)+1, Length(S));
              if Value = '0' then
                rbCustom.Checked := True
              else
                rbCustom.Checked := False;
            end;

          if pos('stFilename', CompName) > 0 then
            begin
              stFilename.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edWinBMD_Add', CompName) > 0 then
            begin
              edWinBMD_Add.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edYear', CompName) > 0 then
            begin
              edYear.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edScan_Ref', CompName) > 0 then
            begin
              edScan_Ref.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edComments', CompName) > 0 then
            begin
              edComments.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edYour_Name', CompName) > 0 then
            begin
              edYour_Name.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edSyndicate', CompName) > 0 then
            begin
              edSyndicate.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edEmail_Address', CompName) > 0 then
            begin
              edEmail_Address.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edSubmitter_ID', CompName) > 0 then
            begin
              edSubmitter_ID.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('edPassword', CompName) > 0 then
            begin
              edPassword.Text := Copy(S, Pos('=', S)+1, Length(S));
            end;

          if pos('ddTranscription_Type', CompName) > 0 then
            begin
              ddTranscription_Type.ItemIndex := StrToInt(Copy(S, Pos('=', S)+1, Length(S)));
            end;

          if pos('ddEvent_Type', CompName) > 0 then
            begin
              ddEvent_Type.ItemIndex := StrToInt(Copy(S, Pos('=', S)+1, Length(S)));
            end;

          if pos('ddVolume_Format', CompName) > 0 then
            begin
              ddVolume_Format.ItemIndex := StrToInt(Copy(S, Pos('=', S)+1, Length(S)));
            end;

          if pos('ddQuarter', CompName) > 0 then
            begin
              ddQuarter.ItemIndex := StrToInt(Copy(S, Pos('=', S)+1, Length(S)));
            end;

          if pos('ddMedia_Type', CompName) > 0 then
            begin
              ddMedia_Type.ItemIndex := StrToInt(Copy(S, Pos('=', S)+1, Length(S)));
            end;

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
  if rbWinBMD.Checked then
    S := 'rbWinBMD=0'
  else S := 'rbWinBMD=1';
  Writeln(F, S);
  if rbSpeedBMD.Checked then
    S := 'rbSpeedBMD=0'
  else S := 'rbSpeedBMD=1';
  Writeln(F, S);
  if rbCustom.Checked then
    S := 'rbCustom=0'
  else S := 'rbCustom=1';

  Writeln(F, S);
  S := 'stFilename=' + stFilename.Text;
  WriteLn(F, S);
  S := 'edWinBMD_Add=' + edwinBMD_Add.Text;
  Writeln(F, S);
  S := 'edYear=' + edYear.Text;
  Writeln(F, S);
  S := 'ddTranscription_Type=' + IntToStr(ddTranscription_Type.ItemIndex);
  Writeln(F, S);
  S := 'ddEvent_Type=' + IntToStr(ddEvent_Type.ItemIndex);
  Writeln(F, S);
  S := 'ddVolume_Format=' + IntToStr(ddVolume_Format.ItemIndex);
  Writeln(F, S);
  S := 'ddQuarter=' + IntToStr(ddQuarter.ItemIndex);
  Writeln(F, S);
  S := 'ddMedia_Type=' + IntToStr(ddMedia_Type.ItemIndex);
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
  Closefile(F);
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

function TfrmMain.lpos(LookFor, LookIn:String): Integer;

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

function TfrmMain.Chomp(S: String): String;
begin
  if Length(S) > 0 then
    if S[Length(S)] = ' ' then
      S := Copy(S, 0, Length(S)-1);
  Chomp := S;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.updateFilename;

var
  S, T: String;
  i: Integer;

begin
  S := stFilename.Caption;

//  Case rg_Naming_Convention.ItemIndex of
  if rbWinBMD.Checked then
    begin
      T := edYear.Text;
      if Length(T) > 4 then
        T := Copy(T, 0, 4)
      else
        while Length(T) < 4 do
          T := 'Y' + T;
      for i := 1 to 4 do
        S[i] := T[i];

      Case ddEvent_Type.ItemIndex of
        0: S[5] := 'B';
        1: S[5] := 'M';
        2: S[5] := 'D';
      end;

      Case ddQuarter.ItemIndex of
        0: S[6] := '1';
        1: S[6] := '2';
        2: S[6] := '3';
        3: S[6] := '4';
      end;

      if length(edWinBMD_Add.Text) > 0 then
        S[7] := edWinBMD_Add.Text[1];

      T := edPage.Text;
      if Length(T) > 4 then
        T := Copy(T, 0, 4)
      else
        while Length(T) < 4 do
          T := '0' + T;
      for i := 1 to 4 do
        S[7+i] := T[i];

    end
  else if rbSpeedBMD.Checked then
    begin
      T := edYear.Text;
      if Length(T) > 2 then
        T := Copy(T, Length(T)-1, 2)
      else
        while Length(T) < 2 do
          T := 'Y' + T;
      for i := 1 to 2 do
        S[i] := T[i];

      Case ddEvent_Type.ItemIndex of
        0: S[3] := 'B';
        1: S[3] := 'M';
        2: S[3] := 'D';
      end;

      Case ddQuarter.ItemIndex of
        0: S[4] := '1';
        1: S[4] := '2';
        2: S[4] := '3';
        3: S[4] := '4';
      end;

      T := edPage.Text;
      if Length(T) > 4 then
        T := Copy(T, 0, 4)
      else
        while Length(T) < 4 do
          T := '0' + T;
      for i := 1 to 4 do
        S[i+4] := T[i];
    end;
//  end;
  stFilename.Caption := S;
  SetHeaders;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.updateSG;


  procedure doit;
  var
    i: Integer;
  begin
    pickList.Width := 200;
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

procedure TfrmMain.setCaption;
begin
  frmMain.Caption := 'linBMD (ver : ' +_VERSION + ') - ' + pc.ActivePage.Caption;
end;


procedure TfrmMain.miHelp_AboutClick(Sender: TObject);
begin
  frmAbout.Show;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  pc.ActivePage := tsHeaderDetail;
  setCaption;
//Create Districts...
  Districts := TStringList.Create;
  Try
    Districts.LoadFromFile(ExtractFilePath(Application.Exename) + 'files/districts_9Z.txt');
  Except
    Showmessage('File - "files/districts_9Z.txt" is missing.' + #13 + 'District Pick Lists will not work correctly.');
  end;
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
  Modified := False;
end;

procedure TfrmMain.miConfig_All_CapsClick(Sender: TObject);
begin
  cbAll_Caps_Surname.Checked := miConfig_All_Caps.Checked;
end;

procedure TfrmMain.miConfig_Skip_FirstnameClick(Sender: TObject);
begin
  cBSkip_Firstname.Checked := miConfig_Skip_Firstname.Checked;
end;

procedure TfrmMain.miConfig_Skip_SurnameClick(Sender: TObject);
begin
  cbSkip_Surname.Checked := miConfig_Skip_Surname.Checked;
end;

procedure TfrmMain.miFile_ExitClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.miFile_Open1Click(Sender: TObject);

var
  F: TextFile;
  S: String;
  Page: Boolean;
  Line_Number, x, buttonSelected: Integer;
  i: Integer;

begin
  if Assigned(Theories) then
    Theories.Clear;
  od.InitialDir := ExtractFilePath(Application.ExeName);
  od.Filter := '*.bmd';
  Line_Number := 1;
  Page := False;
  if Modified then
    begin
      buttonSelected :=  MessageDlg('File modified.', 'The file has been modified. Would you like to save before opening another file?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
      if buttonSelected = mrCancel then
        exit;
      if buttonSelected = mrYes then
        miFile_Save1Click(nil);
   end;
  if od.Execute then
    begin
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
                    ddTranscription_Type.ItemIndex := 0
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'ONENAME') then
                    ddTranscription_Type.ItemIndex := 1
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'RANDOM') then
                    ddTranscription_Type.ItemIndex := 2;

                  S := Copy(S, pos(',', S) + 1, Length(S));

                  if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'BIRTHS') then
                    ddEvent_Type.ItemIndex := 0
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'MARRIAGES') then
                    ddEvent_Type.ItemIndex := 1
                  else if (UpperCase(Copy(S, 0, pos(',', S)-1)) = 'DEATHS') then
                    ddEvent_Type.ItemIndex := 2;

                  S := Copy(S, pos(',', S) + 1, Length(S));
                  edChar_Set.Text := Copy(S, 0, pos(',', S)-1);
                end;
            end
          else if (pos('+S', S) = 1) then
            begin
              S := Copy(S, 4, Length(S));
              with frmMain do
                begin
                  ddMedia_Type.Text := 'Scan';
                  edYear.Text := Copy(S, 0, pos(',', S)-1);
                  SetHeaders;
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  ddQuarter.Text := Copy(S, 0, pos(',', S)-1);
                  S := Copy(S, pos(',', S) + 1, Length(S));
                  edScan_Ref.Text := Copy(S, 0, pos(',', S)-1);
                  S := Copy(S, pos(',', S) + 1, Length(S));

//TOFIX
//                  if pos(',', S) > 0 then
//                    stModified.Caption := Copy(S, 0, pos(',', S)-1)
//                  else
//                    stModified.Caption := S;
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
          else if ((pos('#', S) = 1) and not ((pos('#THEORY', S) > 0) or (pos('#COMMENT', S) > 0)))  then
            begin
              S := Copy(S, 3, Length(S));
              with frmMain do
                begin
                  if ( (pos('9z', S) > 0) or (pos('9Z', S) > 0) or (pos('99', S) > 0) or (pos('xx', S) > 0) or (pos('XX', S) > 0) ) then
                    begin
                      ddVolume_Format.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      edYour_Name.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      edSyndicate.Text := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      stFilename.Caption := Copy(S, 0, pos(',', S)-1);
                      S := Copy(S, pos(',', S) + 1, Length(S));
                      stCreated.Caption := Copy(S, 0, pos(',', S)-1);
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
              if S <> '' then
                begin
                  if Line_Number > 1 then
                    sg.RowCount := sg.RowCount +1 ;
                  with sg do
                    begin
                      Cells[0, Line_Number] := IntToStr(Line_Number);
                      if pos('#', S) > 0 then
                        begin
                          if pos('#', S) > 0 then
                            begin
                              Line_Number := Line_Number - 1;
                              if not Assigned(Theories) then
                                Theories := TStringList.Create;
                              if pos('#THEORY', S) > 0 then
                                begin
                                  Theories.Add(IntToStr(Line_Number) + '|t|' + Copy(S, pos('#THEORY', S) + 7, Length(S)));
                                end;
                              if pos('#COMMENT', S) > 0 then
                                begin
                                  Theories.Add(IntToStr(Line_Number) + '|c|' + Copy(S, pos('#COMMENT', S) + 8, Length(S)));
                                end;
                            end;
                        end
                      else
                        for x := 1 to FieldCount - 1 do
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
    end;
  CloseFile(F);
  Modified := False;
end;

procedure TfrmMain.miFile_Save1Click(Sender: TObject);

var
  F: TextFile;
  i,j, k: Integer;
  S, T, start, stop: String;
  CheckHeader: Boolean;

begin
  {$IFDEF DEBUG}
    start :=  TimeToStr(Time);
  {$ENDIF}
  S := '';
  if Modified then
    begin
      with frmMain do
        begin
          stModified.Caption := getStrDate(Date);
          AssignFile(F, ExtractFilePath(Application.Exename) + stFilename.Caption);
          Rewrite(F);
          Writeln(F, '+INFO,' + edEmail_Address.Text + ',password,'+ UpperCase(ddTranscription_Type.Text) +',' + UpperCase(ddEvent_Type.Text) + ',' + edChar_Set.Text);
          S := '#,' + ddVolume_Format.Text + ',' + edYour_Name.Text + ',' + edSyndicate.Text + ',';
          S := S + stFilename.Caption + ',' + stCreated.Caption + ',Y,Y,N,' + edwinBMD_Add.Text + ',0';
          Writeln(F, S);
          Writeln(F, '#,' + edComments.Text);
          Writeln(F,'+' + ddMedia_Type.Text[1] + ',' + edYear.Text + ',' + ddQuarter.Text + ',' + edScan_Ref.Text + ',' + stModified.Caption);
          Writeln(F, '+PAGE,' + edPage.Text);
        end;
// NOW WRITE THE TRANSCRIBED DATA TO THE FILE
      if sg.RowCount > 1 then
        for i := 1 to sg.RowCount - 1 do
          begin
            S := '';
            for j := 1 to FieldCount - 1 do
              begin
                T := T + ',';
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
              end;
            if S <> T then
              Writeln(F, S);

            if Assigned(Theories) then
              if Theories.Count > 0 then
                begin
                  for k := 0 to Theories.Count - 1 do
                    begin
                      if pos(IntToStr(i) + '|t|', Theories[k]) > 0 then
                        WriteLn(F, '#THEORY' + Copy(Theories[k], lpos('|', Theories[k]) + 1, Length(Theories[k])));
                      if pos(IntToStr(i) + '|c|', Theories[k]) > 0 then
                        WriteLn(F, '#COMMENT' + Copy(Theories[k], lpos('|', Theories[k]) + 1, Length(Theories[k])));
                    end;
                end;
          end;
      if (Sender as TMenuItem).Name = 'miFile_Save_And_Complete' then
        WriteLn(F, '+PAGE,' + IntToStr(StrToInt(edPage.Text) + 1));
      CloseFile(F);
    end;
  {$IFDEF DEBUG}
    stop :=  TimeToStr(Time);
    Writeln('Start - ' + Start + #13 + 'Stop  - ' + stop);
  {$ENDIF}
  Modified := False;
end;

procedure TfrmMain.miHelp_TipsClick(Sender: TObject);
begin
  frmHelp.Show;
end;

procedure TfrmMain.edYearChange(Sender: TObject);

var
  S, T: String;
  i: Integer;

begin
  if not Modified then
    Modified := True;
  if rbWinBMD.Checked then
    begin
      S := stFilename.Caption;
      T := edYear.Text;
      if Length(T) > 4 then
        T := Copy(T, 0, 4)
      else
        while Length(T) < 4 do
          T := '?' + T;
      for i := 1 to 4 do
        S[i] := T[i];
      stFilename.Caption := S;
    end
  else if rbSpeedBMD.Checked then
    begin
      S := stFilename.Caption;
      T := edYear.Text;
      if Length(T) > 2 then
        T := Copy(T, Length(T)-1, 2)
      else
        while Length(T) < 2 do
          T := '?' + T;
      for i := 1 to 2 do
        S[i] := T[i];
      stFilename.Caption := S;
    end;
  SetHeaders;
end;

procedure TfrmMain.edPageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var
  S, T: String;
  i: Integer;

begin
  T := edPage.Text;
  if rbWinBMD.Checked then
    begin
      S := stFilename.Caption;
      if Length(T) > 4 then
        T := Copy(T, 0, 4)
      else
        while Length(T) < 4 do
          T := '0' + T;
      for i := 1 to 4 do
        S[7+i] := T[i];
      stFilename.Caption := S;
    end
  else if rbSpeedBMD.Checked then
    begin
      S := stFilename.Caption;
      if Length(T) > 4 then
        T := Copy(T, 0, 4)
      else
        while Length(T) < 4 do
          T := '0' + T;
      for i := 1 to 4 do
        S[i+4] := T[i];
      stFilename.Caption := S;
    end;
end;

procedure TfrmMain.ddQuarterChange(Sender: TObject);

var
  S: String;

begin
  if not Modified then
    Modified := True;
  if rbWinBMD.Checked then
    begin
      S := stFilename.Caption;
      Case ddQuarter.ItemIndex of
        0: S[6] := '1';
        1: S[6] := '2';
        2: S[6] := '3';
        3: S[6] := '4';
      end;
      stFilename.Caption := S;
    end
  else if rbSpeedBMD.Checked then
    begin
      S := stFilename.Caption;
      Case ddQuarter.ItemIndex of
        0: S[4] := '1';
        1: S[4] := '2';
        2: S[4] := '3';
        3: S[4] := '4';
      end;
      stFilename.Caption := S;
    end;
end;

procedure TfrmMain.ddVolume_FormatChange(Sender: TObject);
begin
  if not Modified then
    Modified := True;
  if not Assigned(Districts) then
    Districts := TStringList.Create;
  Districts.Clear;
  Case ddVolume_Format.ItemIndex of
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

procedure TfrmMain.edwinBMD_AddChange(Sender: TObject);

var
  S: String;

begin
  if not Modified then
    Modified := True;
  S := stFilename.Caption;
  if Length(edwinBMD_Add.Text) > 0 then
    S[7] := edwinBMD_Add.Text[1];
  stFilename.Caption := S;
end;

procedure TfrmMain.ddEvent_TypeChange(Sender: TObject);

var
  S: String;

begin
  if not Modified then
    Modified := True;
  if rbWinBMD.Checked then
    begin
      S := stFilename.Caption;
      Case ddEvent_Type.ItemIndex of
        0: S[5] := 'B';
        1: S[5] := 'M';
        2: S[5] := 'D';
      end;
      stFilename.Caption := S;
    end
  else if rbSpeedBMD.Checked then
    begin
      S := stFilename.Caption;
      Case ddEvent_Type.ItemIndex of
        0: S[3] := 'B';
        1: S[3] := 'M';
        2: S[3] := 'D';
      end;
      stFilename.Caption := S;
    end;
  SetHeaders;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  WriteConfig(ExtractFilePath(Application.Exename) + 'linbmd.conf');
end;

procedure TfrmMain.cbAll_Caps_SurnameChange(Sender: TObject);
begin
  miConfig_All_Caps.Checked := cbAll_Caps_Surname.Checked;
end;

procedure TfrmMain.cbSkip_FirstnameChange(Sender: TObject);
begin
  miConfig_Skip_Firstname.Checked := cbSkip_Firstname.Checked;
end;

procedure TfrmMain.cbSkip_FirstnameClick(Sender: TObject);
begin
  sg.Setfocus;
end;

procedure TfrmMain.cbSkip_SurnameChange(Sender: TObject);
begin
  miConfig_Skip_Surname.Checked := cbSkip_Surname.Checked;
end;

procedure TfrmMain.cbSkip_SurnameClick(Sender: TObject);
begin

end;

procedure TfrmMain.addCommentClick(Sender: TObject);

var
  S: String;

begin
  if InputQuery('Enter your comment','Comment:',S) then
    begin
      if not Assigned(Theories) then
        Theories := TStringList.Create;
      if pos('(', S) = 1 then
        Theories.Add(sg.Cells[0, sg.Row] + '|c|' + S)
      else
        Theories.Add(' ' + sg.Cells[0, sg.Row] + '|c|' + S);
    end;
  sg.setFocus;
end;

procedure TfrmMain.addDistrictClick(Sender: TObject);

var
  d, v, i: Integer;

begin
  d := -1;
  v := -1;
  for i := 0 to sg.ColCount - 1 do
    begin
      if pos('istrict', sg.Cells[i, 0]) > 0 then
        d := i;
      if pos('olume', sg.Cells[i, 0]) > 0 then
        v := i;
    end;
  if (d > -1) and (v > -1) then
    Districts.Add(sg.Cells[d, sg.Row] + '|' + sg.Cells[v, sg.Row] + '|user')
  else
    Showmessage ('There was a problem determining the District and Volume cells. District not added.');
  Case ddVolume_Format.ItemIndex of
    0: begin
         Try
           Districts.SaveToFile(ExtractFilePath(Application.Exename) + 'files/districts_9Z.txt');
         Except
           Showmessage('File - "files/districts_9Z.txt" could not be saved.');
         end;
       end;
    1: begin
         Try
           Districts.SaveToFile(ExtractFilePath(Application.Exename) + 'files/districts_99.txt');
         Except
           Showmessage('File - "files/districts_99.txt" could not be saved.');
         end;
       end;
    2: begin
         Try
           Districts.SaveToFile(ExtractFilePath(Application.Exename) + 'files/districts_XX.txt');
         Except
           Showmessage('File - "files/districts_XX.txt" could not be saved.');
         end;
       end;
  end;
end;

procedure TfrmMain.addFirstnameClick(Sender: TObject);

var
  i, n: Integer;

begin
  for i := 0 to sg.ColCount - 1 do
    begin
      if pos('iven', sg.Cells[i, 0]) > 0 then
        n := i;
    end;
  if n > -1 then
    Names.Add(sg.Cells[n, sg.Row] + '|user')
  else
    Showmessage ('There was a problem determining the Firstname cells. Firstname not added.');
  Try
    Names.SaveToFile(ExtractFilePath(Application.Exename) + 'files/firstnames.txt');
   Except
    Showmessage('File - "files/firstnames.txt" was not changed.');
   end;
end;

procedure TfrmMain.addTheoryClick(Sender: TObject);

var
  S: String;

begin
  if InputQuery('Enter your theory','Theory:',S) then
    begin
      if not Assigned(Theories) then
        Theories := TStringList.Create;
      if pos('(', S) = 1 then
        Theories.Add(sg.Cells[0, sg.Row] + '|t|' + S)
      else
        Theories.Add(' ' + sg.Cells[0, sg.Row] + '|t|' + S);
    end;
  sg.setFocus;
end;

procedure TfrmMain.edYearKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (((Key > 36) and (Key < 58)) or ((Key > 95) and (Key < 106)) or (Key = 8)) then
    Key := 0;
end;

procedure TfrmMain.FormActivate(Sender: TObject);

var
  D: TDate;

begin
  if First_Time then
    begin
      ReadConfig(ExtractFilePath(Application.Exename) + '/linbmd.conf');
      First_Time := False;
      D := Date;
      stCreated.Caption := getStrDate(D);
      stModified.Caption := getStrDate(D);
    end;
  Modified := False;
  setHeaders;
end;

procedure TfrmMain.pcChange(Sender: TObject);
begin
  if pc.ActivePage = tsTranscribedDetail then
    sg.SetFocus;
end;

procedure TfrmMain.rbCustomClick(Sender: TObject);
begin
  if rbCustom.Checked then
    begin
      stFilename.Enabled := True;
      edwinBMD_Add.Enabled := False;
      stFilename.Text := 'custom.csv';
    end;
end;

procedure TfrmMain.rbSpeedBMDClick(Sender: TObject);
begin
  if rbSpeedBMD.Checked then
    begin
      stFilename.Enabled := False;
      edwinBMD_Add.Enabled := False;
      stFilename.Text := '????????.sca';
    end;
end;

procedure TfrmMain.rbWinBMDClick(Sender: TObject);
begin
  if rbWinBMD.Checked then
    begin
      stFilename.Enabled := False;
      edwinBMD_Add.Enabled := True;
      stFilename.Text := '???????????.bmd';
    end;
end;

procedure TfrmMain.sgEditingDone(Sender: TObject);
begin
  if not Modified then
    Modified := True;
end;

initialization
  {$I main.lrs}

end.

