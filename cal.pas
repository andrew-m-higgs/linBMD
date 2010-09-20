{
 /***************************************************************************
                                  cal.pas
                                  -------
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


unit cal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Calendar,
  global, Buttons, ExtCtrls;

type

  { TfrmCalendar }

  TfrmCalendar = class(TForm)
    Calendar1: TCalendar;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Calendar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure frmCalendarShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmCalendar: TfrmCalendar;

implementation

{ TfrmCalendar }

procedure TfrmCalendar.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCalendar.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCalendar.frmCalendarShow(Sender: TObject);
begin
  Calendar1.Date := DateToStr(Date);
end;

procedure TfrmCalendar.Calendar1Change(Sender: TObject);
begin
  Date_Selected := Calendar1.Date;
end;

initialization
  {$I cal.lrs}

end.

