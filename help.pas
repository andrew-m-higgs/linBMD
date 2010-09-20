{
 /***************************************************************************
                                  help.pas
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


unit help;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TfrmHelp }

  TfrmHelp = class(TForm)
    memo_Tips: TMemo;
    Notebook1: TNotebook;
    pgTips: TPage;
    procedure frmHelpActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmHelp: TfrmHelp;

implementation

{ TfrmHelp }

procedure TfrmHelp.frmHelpActivate(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.Exename) + '/files/tips.txt') then
    memo_Tips.Lines.LoadFromFile(ExtractFilePath(Application.Exename) + '/files/tips.txt')
  else
    begin
      with memo_Tips.Lines do
        begin
          Clear;
          Add('1. Pressing ''ESC'' in any cell will change the cells contents to that of the cell above. Very useful when transcribing a string of John''s.');
          Add('');
          Add('2. To select an item from the pick list, simply press ''CTRL'' and the number of the item at the same time. In the name column the item is added with a space and focus remains in the cell until enter is pressed. This allows you to add other names.');
          Add('');
          Add('3. If the pick list only contains one item, and it is all you need for the current cell, press ''ENTER'' and the cell contents is updated and focus progresses to the next cell.');
          Add('');
          Add('4. Press ''F9'' to view a list of special characters. Double click the required one and the cell is updated.');
          Add('');
          Add('I could not find files/tips.txt. Therefore, I have shown some basic tips. Try to download the latest tips.txt from http://higgs.co.za/linBMD and follow the installation directions. This file may contain newer tips and tricks.');
        end;
    end;
end;

initialization
  {$I help.lrs}

end.

