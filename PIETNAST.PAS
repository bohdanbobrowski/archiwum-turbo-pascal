uses crt, dos;

var kolor, pozmen, zmienna : array[1..10] of integer;
var klawisz: array[1..10] of char;
var PI,I,X,Y,Z,A,B,C,kolejnosc,mie,M : integer;
var komorka: array[1..4,1..4] of string;
var pol_x, pol_y: integer;
var ruch: longint;
var imiona: array[1..10] of string;
var ruchy: array[1..10] of longint;
var slowa: file of string;
var cyfry: file of longint;
var imie: string;
var godz, min, sek, ssek: word;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}

procedure schowaj_kursor;
begin
 Window(60,24,60,24);
 TextColor(0);
 TextBackground(0);
 ClrScr;
end;

procedure main_menu;
Begin
TextColor(7);
TextBackground(0);
Window(1,1,80,25);
ClrScr;
Write('------------ ----------------     -------------------------      -------------- ');
Write('- -------  - -  -----  ---- -     -  ----    -----  ----  --------  --------  - ');
Write('- ---- --- --- ---- -- ---- ------- -- ---  ---- -- ----  ---- --  ---------- - ');
Write('- ---- --- --- ---- -- ----- ------ ------  ----    ----- -------  ---------- - ');
Write('- ---- --- --- ------- ----  --- -- -------  -----  ----  ---- -- ----   ---- - ');
Write('- -------- --- ----    ----  --- -- ------    ----  ----  ---- -- ---    ---- - ');
Write('- ---- --- --- ------  ----  --- -- -    -    ----  ----  ---- -- ---    ---- --');
Write('- ---- - - ---   --    ----- --- -- -    - -------  ----- ---- -- ------------ -');
Write('-------- ----------------------------    ---------------------------------------');
Write('                                                                                ');
Write(' WeRsJa: 1.0 \ Listopad 1998                                                    ');
Write(' aUtoR: BoHdaAn BoBroWSki                                                       ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write('                                                                                ');
Write(' ZeRkNiJ Do CzYtAjTo.TxT                                                        ');
Write('                                                                               ');

End;

Procedure variant_1;
begin
kolor[1]:=0;kolor[2]:=15;kolor[3]:=15;kolor[4]:=0; kolor[5]:=15; kolor[6]:=0;
end;

Procedure variant_2;
begin
kolor[1]:=15; kolor[2]:=0;kolor[3]:=0; kolor[4]:=15;kolor[5]:=15; kolor[6]:=0;
end;

procedure variant_3;
begin
kolor[1]:=15; kolor[2]:=0;kolor[3]:=15; kolor[4]:=0;kolor[5]:=0; kolor[6]:=15;
end;

Procedure menu_roll;
begin
 Window(31,16,50,19);
 TextColor(kolor[1]);
 TextBackground(kolor[2]);
 WriteLn('     START GRY     ');
 TextColor(kolor[3]);
 TextBackground(kolor[4]);
 WriteLn(' LISTA NAJLEPSZYCH ');
 TextColor(kolor[5]);
 TextBackground(kolor[6]);
 Write(' POWROT DO SYSTEMU ');
 Schowaj_kursor;

 Schowaj_kursor;
end;

Procedure zawartosc_poczatkowa_kostek;
begin;
komorka[1,1]:='  ';
komorka[1,2]:='15';
komorka[1,3]:='14';
komorka[1,4]:='13';
komorka[2,1]:='12';
komorka[2,2]:='11';
komorka[2,3]:='10';
komorka[2,4]:='9 ';
komorka[3,1]:='8 ';
komorka[3,2]:='7 ';
komorka[3,3]:='6 ';
komorka[3,4]:='5 ';
komorka[4,1]:='4 ';
komorka[4,2]:='3 ';
komorka[4,3]:='2 ';
komorka[4,4]:='1 ';
end;

Procedure kostki;
begin
 TextColor(10);
 TextBackground(0);
 Window(27,5,29,6);
 Write(komorka[1,1]);
 Window(36,5,38,6);
 Write(komorka[1,2]);
 Window(45,5,47,6);
 Write(komorka[1,3]);
 Window(54,5,56,6);
 Write(komorka[1,4]);
 Window(27,9,28,10);
 Write(komorka[2,1]);
 Window(36,9,38,10);
 Write(komorka[2,2]);
 Window(45,9,47,10);
 Write(komorka[2,3]);
 Window(54,9,56,10);
 Write(komorka[2,4]);
 Window(27,13,28,14);
 Write(komorka[3,1]);
 Window(36,13,38,14);
 Write(komorka[3,2]);
 Window(45,13,47,14);
 Write(komorka[3,3]);
 Window(54,13,56,14);
 Write(komorka[3,4]);
 Window(27,17,28,18);
 Write(komorka[4,1]);
 Window(36,17,38,18);
 Write(komorka[4,2]);
 Window(45,17,47,18);
 Write(komorka[4,3]);
 Window(54,17,56,18);
 Write(komorka[4,4]);
 Schowaj_kursor;
end;

procedure czytaj_liste_najlepszych;
begin
assign (cyfry, 'ruchy.$$$');
assign (slowa, 'imiona.$$$');
reset(cyfry);
reset(slowa);
for a:=1 to 10 do
begin
 read(cyfry, ruchy[a]);
end;
for a:=1 to 10 do
begin
 read(slowa, imiona[a]);
end;
end;

procedure zapisz_liste_najlepszych;
begin
 reset(slowa);
 reset(cyfry);
 write(slowa,imiona[1]);
 write(slowa,imiona[2]);
 write(slowa,imiona[3]);
 write(slowa,imiona[4]);
 write(slowa,imiona[5]);
 write(slowa,imiona[6]);
 write(slowa,imiona[7]);
 write(slowa,imiona[8]);
 write(slowa,imiona[9]);
 write(slowa,imiona[10]);
 write(cyfry,ruchy[1]);
 write(cyfry,ruchy[2]);
 write(cyfry,ruchy[3]);
 write(cyfry,ruchy[4]);
 write(cyfry,ruchy[5]);
 write(cyfry,ruchy[6]);
 write(cyfry,ruchy[7]);
 write(cyfry,ruchy[8]);
 write(cyfry,ruchy[9]);
 write(cyfry,ruchy[10]);
end;

procedure lista_najlepszych;
begin
Window(1,1,80,25);
TextColor(7);
TextBackground(0);
ClrScr;
Write('       ..                                                                       ');
Write(' ::    ::       ::         ....                                                 ');
Write(' ::..       ..  ::...     ::..   ....   ..  ....   ...                          ');
Write(' ::  : :: ::  : ::  ::        : ::    ::  : ::  : ::..:                         ');
Write(' ::  :.::.::..:.::  ::........:.::....::..:.::....::........................... ');
Write('  ....nr      :           ilosc ruchow.  ......   ......                        ');
Write('  :    ... :..:                       :  :    :...:    :                        ');
Write('       :......imiona              :..:                                    ');
Write('  1.  .................................................                         ');
Write('  2.  .................................................                         ');
Write('  3.  .................................................                         ');
Write('  4.  .................................................                         ');
Write('  5.  .................................................                         ');
Write('  6.  .................................................                         ');
Write('  7.  .................................................                         ');
Write('  8.  .................................................                         ');
Write('  9.  .................................................                         ');
Write('  10. .................................................                         ');
Write('    ..                               ..                                         ');
Write(' :: ::  ...  ::   ...           ...  :: ::             ...                ::    ');
Write(' ::    ::.  .::.  ...:   ....   ...:    ::  ...  .... ::.  ...  :: :  ... ::..  ');
Write(' :: ::    :  ::  ::  :   ::  : ::  : :: :: ::..: ::  :   :  ..: :: : ::   ::  : ');
Write(' ::.::....:..::..::..:...::  :.::..:.::.::.::....::..:...:.::...::.:.::...::  : ');
Write('                                     ::          ::               ::            ');
Write(' [nacisnij jakis klawisz]           .::          ::             :.::           ');
Window(7,9,60,18);
TextColor(15);
TextBackground(0);
WriteLn(imiona[1]);
WriteLn(imiona[2]);
WriteLn(imiona[3]);
WriteLn(imiona[4]);
WriteLn(imiona[5]);
WriteLn(imiona[6]);
WriteLn(imiona[7]);
WriteLn(imiona[8]);
WriteLn(imiona[9]);
Write(imiona[10]);
Window(56,9,80,18);
WriteLn(ruchy[1]);
WriteLn(ruchy[2]);
WriteLn(ruchy[3]);
WriteLn(ruchy[4]);
WriteLn(ruchy[5]);
WriteLn(ruchy[6]);
WriteLn(ruchy[7]);
WriteLn(ruchy[8]);
WriteLn(ruchy[9]);
Write(ruchy[10]);
Schowaj_kursor;
ReadKey;
Window(1,1,80,25);
 For I:=1 to 25 do
 begin;
  Delay(50);
  GotoXY(1,1);
  InsLine;
 end;
main_menu;
menu_roll;
end;

procedure wpisz_sie;
begin
 Window(1,1,80,25);
 TextColor(7);
 TextBackground(0);
 ClrScr;
 Write('  .....   ....  ..      ....   ....   ....  ..     ......  ...:.                ');
 Write('  ::   : ::   : ::     ::   : ::   : ::   : ::     ::   : ::  : :               ');
 Write('       : ::   : ::     ::   : ::   : ::   : ::     ::.:   ::            ::      ');
 Write('   ....: ::   : ::.:   ::   : ::...: ::   : ::.:   :: :    :....                ');
 Write('  ::     ::   : :::    ::   : ::     ::   : :::    ::           :   ... ::  ..  ');
 Write('  ::   : ::...: ::   . ::...: ::     ::...: ::     ::     ::    :  ::.  :: ::.: ');
 Write(' ..:...:.::   :.::...:.::   :.::.....::   :.::...:.::...:..:....:.....:.::.:... ');
 Write(' ****************************************************************************:* ');
 Write('                                                                                ');
 Write('                                                                                ');
 Write('                                                                                ');
 Write('                                                                                ');
 Write('                                                                               ');
 Write('  :......... WPISZ SWOJE IMIE                                                   ');
 Write('                                                        ----                    ');
 Write('                                                      --------                  ');
 Write('                                                      --------                  ');
 Write('                                                     ----------                 ');
 Write(' ....         .       .                              ----------                 ');
 Write(' :            :       :          :                    --------                  ');
 Write(' : .. ... ... :.. . . :  ... ... . ...                 ------                   ');
 Write(' :  : :   ..: :   : : :  ..: :   : :.:                    :                     ');
 Write(' :..: :   :.: :.. :.: :. :.: :.. : :.. . . .              :..                   ');
 Write('                               ..:                         .:                   ');
 Write(' **********************************************************:*******************');
 Window(2,10,70,15);
 WriteLn('Znalazles sie na pozycji nr. ',b);
 WriteLn;
 TextColor(15);
 imie:='';
 Ruchy[b]:=0;
 Repeat
  c:=0;
  klawisz[3]:=readkey;
  if klawisz[3]=#13 then c:=1;
  Write(klawisz[3]);
  imie:=imie+klawisz[3];
 Until c=1;
 imiona[b]:=imie;
 ruchy[b]:=ruch;
 zapisz_liste_najlepszych;
end;

procedure przemiesc_imiona;
begin
 if b<10 then imiona[10]:=imiona[9];
 if b<9 then imiona[9]:=imiona[8];
 if b<8 then imiona[8]:=imiona[7];
 if b<7 then imiona[7]:=imiona[6];
 if b<6 then imiona[6]:=imiona[5];
 if b<5 then imiona[5]:=imiona[4];
 if b<4 then imiona[4]:=imiona[3];
 if b<3 then imiona[3]:=imiona[2];
 if b<2 then imiona[2]:=imiona[1];
 if b<10 then ruchy[10]:=ruchy[9];
 if b<9 then ruchy[9]:=ruchy[8];
 if b<8 then ruchy[8]:=ruchy[7];
 if b<7 then ruchy[7]:=ruchy[6];
 if b<6 then ruchy[6]:=ruchy[5];
 if b<5 then ruchy[5]:=ruchy[4];
 if b<4 then ruchy[4]:=ruchy[3];
 if b<3 then ruchy[3]:=ruchy[2];
 if b<2 then ruchy[2]:=ruchy[1];
end;

procedure spr_1;
begin
 if ruch<= ruchy[10] then b:=10;
 if ruch<= ruchy[9] then b:=9;
 if ruch<= ruchy[8] then b:=8;
 if ruch<= ruchy[7] then b:=7;
 if ruch<= ruchy[6] then b:=6;
 if ruch<= ruchy[5] then b:=5;
 if ruch<= ruchy[4] then b:=4;
 if ruch<= ruchy[3] then b:=3;
 if ruch<= ruchy[2] then b:=2;
 if ruch<= ruchy[1] then b:=1;
 przemiesc_imiona;
 wpisz_sie;
 zapisz_liste_najlepszych;
end;

procedure sprawdzaj;
begin
 kolejnosc:=0;
 if komorka[1,1]='1 ' then kolejnosc:=kolejnosc+1;
 if komorka[1,2]='2 ' then kolejnosc:=kolejnosc+1;
 if komorka[1,3]='3 ' then kolejnosc:=kolejnosc+1;
 if komorka[1,4]='4 ' then kolejnosc:=kolejnosc+1;
 if komorka[2,1]='5 ' then kolejnosc:=kolejnosc+1;
 if komorka[2,2]='6 ' then kolejnosc:=kolejnosc+1;
 if komorka[2,3]='7 ' then kolejnosc:=kolejnosc+1;
 if komorka[2,4]='8 ' then kolejnosc:=kolejnosc+1;
 if komorka[3,1]='9 ' then kolejnosc:=kolejnosc+1;
 if komorka[3,2]='10' then kolejnosc:=kolejnosc+1;
 if komorka[3,3]='11' then kolejnosc:=kolejnosc+1;
 if komorka[3,4]='12' then kolejnosc:=kolejnosc+1;
 if komorka[4,1]='13' then kolejnosc:=kolejnosc+1;
 if komorka[4,2]='14' then kolejnosc:=kolejnosc+1;
 if komorka[4,3]='15' then kolejnosc:=kolejnosc+1;
 if komorka[4,4]='  ' then kolejnosc:=kolejnosc+1;
 if kolejnosc>15 then spr_1;
 if kolejnosc>15 then z:=1;
end;

Procedure pobierz_czas;
begin
GetTime(godz, min, sek, ssek);
end;

procedure status;
begin
Window(1,25,80,25);
 TextColor(14);
 TextBackground(1);
 ClrScr;
 Write('  GRASZ OD GODZINY: ',godz,':');
 if min<10 then write('0');
 Write(min,':',sek,'   ILOSC RUCHOW: ',ruch);
 TextBackground(0);
 TextColor(7);
 Schowaj_kursor;
end;

procedure lewo_1;
begin
komorka[pol_y,pol_x]:=komorka[pol_y,pol_x-1];
komorka[pol_y,pol_x-1]:='  ';
pol_x:=pol_x-1;
kostki;
ruch:=ruch+1;
end;

procedure lewo;
begin
if pol_x>1 then lewo_1;
end;

procedure prawo_1;
begin
komorka[pol_y,pol_x]:=komorka[pol_y,pol_x+1];
komorka[pol_y,pol_x+1]:='  ';
pol_x:=pol_x+1;
kostki;
ruch:=ruch+1;
end;

procedure prawo;
begin
if pol_x<4 then prawo_1
end;

procedure gora_1;
begin
komorka[pol_y,pol_x]:=komorka[pol_y-1,pol_x];
komorka[pol_y-1,pol_x]:='  ';
pol_y:=pol_y-1;
kostki;
ruch:=ruch+1;
end;

procedure gora;
begin
if pol_y>1 then gora_1;
end;

procedure dol_1;
begin
komorka[pol_y,pol_x]:=komorka[pol_y+1,pol_x];
komorka[pol_y+1,pol_x]:='  ';
pol_y:=pol_y+1;
kostki;
ruch:=ruch+1;
end;

procedure dol;
begin
if pol_y<4 then dol_1;
end;

procedure mieszanie;
begin
 randomize;
 ruch:=0;
 status;
 repeat;
  mie:=random(11);
  if mie=0 then prawo;
  if mie=1 then lewo;
  if mie=2 then gora;
  if mie=3 then dol;
  if mie=4 then prawo;
  if mie=5 then lewo;
  if mie=6 then gora;
  if mie=7 then dol;
  if mie=8 then prawo;
  if mie=9 then lewo;
  if mie=10 then gora;
  if mie=11 then dol;
 until ruch=1000;
 ruch:=0;
 status;
end;

procedure real_game_1;
begin
 repeat
  klawisz[2]:= readkey;
  z:=0;
  if klawisz[2]=#77 then lewo;
  if klawisz[2]=#75 then prawo;
  if klawisz[2]=#80 then gora;
  if klawisz[2]=#72 then dol;
  if klawisz[2]=#27 then z:=1;
  status;
  sprawdzaj;
 until z=1;
end;

Procedure game_screen;
Begin
 TextColor(10);
 TextBackground(0);
 Window(1,1,80,25);
 Delay(50);
 ClrScr;
 Write('-------                                                                ---------');
 Write('--------                                                                --------');
 Write('-------              ---------------------------------------             -------');
 Write('---------            ---      ---      ---      ---      ---            --------');
 Write('--------             ---      ---      ---      ---      ---             -------');
 Write('------               ---      ---      ---      ---      ---              ------');
 Write('-------              ---------------------------------------             -------');
 Write('--------             ---      ---      ---      ---      ---              ------');
 Write('---------            ---      ---      ---      ---      ---             -------');
 Write('----------           ---      ---      ---      ---      ---            --------');
 Write('---------            ---------------------------------------             -------');
 Write('--------             ---      ---      ---      ---      ---            --------');
 Write('-------              ---      ---      ---      ---      ---           ---------');
 Write('--------             ---      ---      ---      ---      ---            --------');
 Write('---------            ---------------------------------------             -------');
 Write('-------              ---      ---      ---      ---      ---           ---------');
 Write('--------             ---      ---      ---      ---      ---            --------');
 Write('---------            ---      ---      ---      ---      ---           ---------');
 Write('--------             ---------------------------------------             -------');
 Write('---------                                                                 ------');
 Write('--------                                                                --------');
 Write('-------                                                                ---------');
 Write('--------                                                                --------');
 Write('--------                                                                 -------');
 Write('                                                                               ');
 Window(1,1,80,1);
 TextColor(14);
 TextBackground(1);
 ClrScr;
 Write(' PIETNASTKA v. 1.0                                             PAZDZIERNIK 1998');
 Window(1,25,80,25);
 TextColor(14);
 TextBackground(1);
 ClrScr;
 pobierz_czas;
 Write(' ILOSC RUCHOW: ',ruch );
 status;
 Kostki;
 mieszanie;
 Schowaj_kursor;
 status;
 Real_game_1;
 Window(1,1,80,25);
 For I:=1 to 25 do
 begin;
 Delay(50);
 GotoXY(1,1);
 DelLine;
 end;
 Delay(100);
 czytaj_liste_najlepszych;
 zapisz_liste_najlepszych;
 main_menu;
 menu_roll;
End;

procedure rozdziel_1;
begin
 if pozmen[1]=0 then game_screen;
 if pozmen[1]=1 then lista_najlepszych;
 if pozmen[1]=2 then halt;
end;

procedure przewijanie;
begin
 repeat;
  klawisz[1]:=readkey;
  if klawisz[1]=#72 then zmienna[1]:=1;
  if klawisz[1]=#80 then zmienna[1]:=1;
  if klawisz[1]=#80 then pozmen[1]:=pozmen[1]+1;
  if klawisz[1]=#72 then pozmen[1]:=pozmen[1]-1;
  if klawisz[1]=#13 then rozdziel_1;
  if pozmen[1]<0 then pozmen[1]:=2;
  if pozmen[1]>2 then pozmen[1]:=0;
  if pozmen[1]=0 then variant_1;
  if pozmen[1]=1 then variant_2;
  if pozmen[1]=2 then variant_3;
  if zmienna[1]=1 then menu_roll;
  zmienna[1]:=0;
 until klawisz[1]=#27;
end;

BEGIN
pol_x:=1;
pol_y:=1;
zawartosc_poczatkowa_kostek;
czytaj_liste_najlepszych;
variant_1;
main_menu;
menu_roll;
przewijanie;
zapisz_liste_najlepszych;
END.
