 {
 /***************************************************************************
                                 special.pas
                                 -----------
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


unit special;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Grids,
  ExtCtrls, Buttons, FileCtrl;

type

  { TfrmSpecial }

  TfrmSpecial = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    sgSpecial: TStringGrid;
    procedure FormDeactivate(Sender: TObject);
    procedure frmSpecialCreate(Sender: TObject);
    procedure frmSpecialPaint(Sender: TObject);
    procedure sgSpecialDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmSpecial: TfrmSpecial;

implementation

{ TfrmSpecial }

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmSpecial.frmSpecialCreate(Sender: TObject);

var
  i,j,k: Integer;
  
begin
  k := 192;
  for i := 0 to 7 do
    for j := 0 to 7 do
      begin
        sgSpecial.Cells[i,j] := char(k);
        k := k + 1;
      end;
end;

procedure TfrmSpecial.FormDeactivate(Sender: TObject);
begin

end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmSpecial.frmSpecialPaint(Sender: TObject);
begin
  sgSpecial.DefaultColWidth := sgSpecial.ClientWidth div 8;
  sgSpecial.DefaultRowHeight := sgSpecial.ClientHeight div 8;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmSpecial.sgSpecialDblClick(Sender: TObject);
begin
  frmSpecial.ModalResult := mrOK;
end;

/////////////////////////////////////////////////////////////////////////////////
//_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_-¯-_//
/////////////////////////////////////////////////////////////////////////////////

procedure TfrmSpecial.Button1Click(Sender: TObject);
begin
  frmSpecial.ModalResult := mrOK;
end;

initialization
  {$I special.lrs}

end.

