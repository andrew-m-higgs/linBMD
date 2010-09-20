{
 /***************************************************************************
                                 linBMD.lpr
                                 ----------
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


program linbmd;

{$mode objfpc}{$H+}
{$IFDEF WIN32}
  {$AppType GUI}
{$ENDIF}

uses
  Interfaces,
  Forms, main, special, global, about, cal, help;
  
begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSpecial, frmSpecial);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmCalendar, frmCalendar);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.Run;
end.

