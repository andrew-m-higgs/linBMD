 {
 /***************************************************************************
                                 about.pas
                                 ---------
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


unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, global;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmAbout: TfrmAbout;

implementation

{ TfrmAbout }

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmAbout.SpeedButton1Click(Sender: TObject);
begin
  frmAbout.Close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  with Memo1.Lines do
    begin
      Clear;
      Add('linBMD - version ' + _VERSION);
      Add('');
      Add('This is a simple application to allow GNU/Linux users to transcribe for the FreeBMD project.');
      Add('');
      Add('It is licensed under the GNU/GPL. See http://www.gnu.org/copyleft/gpl.html for licensing details.');
      Add('');
      Add('For additional assistance or information email me (' + _EMAIL + ').');// or icq me (' + _ICQ + ').');
      Add('');
      Add('Happy transcribing.');
    end;
end;

initialization
  {$I about.lrs}

end.

