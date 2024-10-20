(*
Chizhevsky chandelier grid calculator
Version: 1.
Written on FreePascal (https://freepascal.org/).
Copyright (C) 2010-2024  Artyomov Alexander
http://self-made-free.ru/
aralni@mail.ru

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
}

*)

{$MODE FPC}
{$SMARTLINK ON}

uses math,sysutils;

  var
	S, // шаг сетки
	D, // диаметр кольца
	R, // радиус кольца
	C  // накопитель смещения
	: Double;
	F : Int64 = 0;

begin

WriteLn('Chizhevsky chandelier grid calculator');
WriteLn('Use: ', ParamStr(0), ' [D] [S]');

S := 4; // сантиметра
D := 91.5; // сантиметра

case ParamCount of
1: begin
if (ParamStr(1) = '--help') or (ParamStr(1) = '-h') then begin Halt; end;
D := StrToFloat(ParamStr(1));
end;
2: begin
D := StrToFloat(ParamStr(1));
S := StrToFloat(ParamStr(2));
end;
end;

WriteLn('D=',FormatFloat('0.#',D),' S=',FormatFloat('0.#',S));

R := D/2;
C := 0;

while C <= (R - S) do begin

C := C + S;

WriteLn(Round((ArcSin(C/R))*R*10), ' mm.');

Inc(F);
end;

WriteLn(F, ' holes');

end.