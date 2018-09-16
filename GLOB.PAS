uses Crt;

{----------------------------------------------------------------------------}
{dane podstawowe}
{----------------------------------------------------------------------------}
var kasa, rok, tura         : Longint;
var miesiac                  : string;
var gubernator           : string[20];  {imie gubernatora kolonii}
var baza : array[1..10] of string[10];
{----------------------------------------------------------------------------}
{dane potrzebne dla obsugi kaพdego menu}
{----------------------------------------------------------------------------}
var r1     : array[1..2] of integer;
var r      : array[1..10] of integer;
var kl     : array[1..100] of char;
var tm     : array[1..10] of integer;
var g      : array[1..100] of integer;
var g1     : array[1..100] of integer;
var b      : array[1..10] of integer;
var p      : array[1..4] of integer;
var e      : array[1..5] of integer;
var e1, e2 : integer;
var poz    : array[1..100] of integer;
{----------------------------------------------------------------------------}
{Iloci budynkขw
array[1..10(ilo w danej bazie)]}
{----------------------------------------------------------------------------}
var magazyny         : array [1..12] of longint;
var moduly_mieszkalne: array [1..12] of longint;
var elektrownie      : array [1..12] of longint;
var fabryki          : array [1..12] of longint;
var stocznie         : array [1..12] of longint;
var farmy            : array [1..12] of longint;
var kopalnie         : array [1..12] of longint;
var fabryki_SM       : array [1..12] of longint;
var fabryki_TS       : array [1..12] of longint;
var fabryki_paliw    : array [1..12] of longint;
var labolatoria      : array [1..12] of longint;{}
var koszary          : array [1..12] of longint;{}
var szkoly           : array [1..12] of longint;{}
var stacje_d_n       : array [1..12] of longint;{}
var szpitale         : array [1..12] of longint;{}
var hangary          : array [1..12] of longint;{}
{----------------------------------------------------------------------------}
{iloci robotขw, maszyn, statkขw, pขproduktขw i materiaขw eksploatacyjnych}
{array[1..10(ilo w danej bazie), 1..10(zaawansowanie technologii), 1.(cena).2(wydajno)}
{----------------------------------------------------------------------------}
var robot_agro       : array [1..12] of longint;
var robot_robo       : array [1..12] of longint;
var robot_inzy       : array [1..12] of longint;
var robot_nauk       : array [1..12] of longint;
var robot_leka       : array [1..12] of longint;
var robot_porz       : array [1..12] of longint;
var robot_zoln       : array [1..12] of longint;
{----------------------------------------------------------------------------}
var silnik_jonowy    : array [1..12] of longint;
var silnik_o_h       : array [1..12] of longint;
var zestaw_czesci    : array [1..12] of longint;
var komputer_pokl    : array [1..12] of longint;
var maszyny_fabry    : array [1..12] of longint;
var maszyny_rolnicze : array [1..12] of longint;{}
var maszyny_kopaln   : array [1..12] of longint;{}
var baterie_slon     : array [1..12] of longint;{}
var ekwipunek_zoln   : array [1..12] of longint;
var miotacz          : array [1..12] of longint;
var dzialko_laserowe : array [1..12] of longint;
{----------------------------------------------------------------------------}
var fenix_I          : array [1..12] of longint;{niszczyciel, n. tl.-wod.}
var fenix_II         : array [1..12] of longint;{niszczyciel, n. jon.}
var tygrys_I         : array [1..12] of longint;{d.myl., nap. tl.-wod.}
var tygrys_II        : array [1..12] of longint;{d.myl., nap. jonowy}
var orzel_I          : array [1..12] of longint;{m.myliwiec, napฉd tl.-wod.}
var orzel_II         : array [1..12] of longint;{m.myliwiec, napฉd jonowy}
var polonez          : array [1..12] of longint;{m., n. uzbr.,nap.o-h ,statek pasaพerski}
var polonez_bis      : array [1..12] of longint;{d., uzbr., nap. jon. ,statek pasaพerski}
var atlas_500        : array [1..12] of longint;{may statek towarowy,nap. o-h}
var atlas_1000       : array [1..12] of longint;{redni statek towarowy, nap. jon.}
var atlas_2000       : array [1..12] of longint;{duพy statek towarowy, nap. jon., uzbr.}
{----------------------------------------------------------------------------}
var odpadki          : array [1..12] of longint;
var polprodukt_zywno : array [1..12] of longint;
{----------------------------------------------------------------------------}
var paliwo_O_H       : array [1..12] of longint;{}
var paliwo_jon       : array [1..12] of longint;{}
var porcje_zywnosci  : array [1..12] of longint;{}
var tworz_bakter     : array [1..12] of longint;{}
var stopy_metali     : array [1..12] of longint;{}
{----------------------------------------------------------------------------}
{ Dane sytuacyjne}
{----------------------------------------------------------------------------}
var zloza_szacowane  : array [1..12] of longint;{}
var zloza_odkryte    : array [1..12] of longint;{}
var bazy_szacowane   : array [1..12] of longint;{}
var bazy_odkryte     : array [1..12] of longint;{}
var wielkosc_planety : array [1..12] of longint;{}
var teren_pod_kontr  : array [1..12] of longint;{}
{----------------------------------------------------------------------------}
var morale_zalogi    : array [1..12] of longint;{}
var poziom_zycia     : array [1..12] of longint;{}
var ilosc_ch_i_ran   : array [1..12] of longint;{}
var pensje           : array [1..12] of longint;{}
var przydzial_zywn   : array [1..12] of longint;{}
{----------------------------------------------------------------------------}
var wyslane_sondy    : array [1..12] of longint;{}
var ilosc_odkr_pl    : array [1..12] of longint;{}
var ilosc_zaje_pl    : array [1..12] of longint;{}
{----------------------------------------------------------------------------}
var zaawansowanie_t  : array [1..12] of longint;{}
var wyslane_eksped   : array [1..12] of longint;{}
{----------------------------------------------------------------------------}


{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure klawisze;
  begin
  asm
  mov  bh, 0002h   ;
  mov  bl, 000Fh   ;
  mov  ax, 0305h   ;
  int  16h         ;
  end;
  end;
 procedure klaw_koncowe;
  begin
  asm
  mov  bh, 00h   ;
  mov  bl, 00h   ;
  mov  ax, 0305h   ;
  int  16h         ;
  end;
  end;
 procedure schowaj_kursor;
  Begin
  window(79, 25, 80, 25);
  TextColor(0);
  TextBackground(0);
  ClrScr;
  End;
{----------------------------------------------------------------------------}

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure MAIN_MENU;
   Begin
   Window(1, 1, 80, 3);
    TextColor(0);
    TextBackground(7);
    TextBackground(tm[1]);
    Write(' Gra ');
    TextBackground(tm[2]);
    Write(' Budowa ');
    TextBackground(tm[3]);
    Write(' Zaopatrzenie ');
    TextBackground(tm[4]);
    Write(' Zaloga ');
    TextBackground(tm[5]);
    Write(' Nauka ');
    TextBackground(tm[6]);
    Write(' Port ');
    TextBackground(tm[7]);
    Write(' Bazy ');
    TextBackground(tm[8]);
    Write(' Resorty ');
    TextBackground(tm[9]);
    Write(' Informacje ');
    TextColor(0);
    TextBackGround(7);
    Write('                             ');
   Window(1, 2 , 80, 25);
    TextColor(0);
    TextBackground(0);
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
    Write('                                                                                ');
    Write('                                                                               ');
    Schowaj_kursor

   End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 Procedure Nowa_gra;
  Begin
   Main_Menu;
   kl[1]:=#0; kl[2]:=#0; kl[3]:=#0;
   r1[2]:=1; r1[1]:=1;
   tm[1]:=2; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=7;
   kasa:=100; miesiac:='styczeไ'; rok:=2998;
   g[1]:=2; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;
  End;
{----------------------------------------------------------------------------}
 procedure m_gra;
   Begin
    e1:=6;
    tm[1]:=2; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=7;
   Window(1, 2, 27, 11);
    TextColor(0);
    TextBackground(7);
    WriteLn(' ษออออออออออออออออออป ');
    TextBackground(7);
    Write(' ');
    TextBackground(g[1]);
    Write('บ Nowa gra         บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Koniec gry       บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    WriteLn('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Otworz           บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[4]);
    Write('บ Zapisz           บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[5]);
    Write('บ Zapisz jako      บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    WriteLn('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ ');
    Write(' ');
    TextBackground(g[6]);
    Write('บ Nastepny miesiac บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ศออออออออออออออออออผ ');


    Schowaj_kursor;
   End;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Budowa;
   Begin
    e1:=7;
    tm[1]:=7; tm[2]:=2; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=7;
   Window(6, 2, 31, 12);
    TextColor(0);
    TextBackground(7);
    WriteLn(' ษออออออออออออออออออออป ');
    Write(' ');
    TextBackground(g[1]);
    Write('บ Moduly przemyslowe บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Infrastruktura     บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Flota              บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[4]);
    Write('บ Roboty i komputery บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[5]);
    Write('บ Silniki i maszyny  บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[6]);
    Write('บ Uzbrojenie         บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[7]);
    Write('บ Inne elementy      บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ศออออออออออออออออออออผ ');

   Schowaj_kursor;

   End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Zaopatrzenie;
   Begin
    e1:=7;
    tm[1]:=7; tm[2]:=7; tm[3]:=2; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=7;
   Window(14, 2, 38, 12 );
    TextColor(0);
    TextBackground(7);
    WriteLn(' ษออออออออออออออออออป ');
    TextBackground(7);
    Write(' ');
    TextBackground(g[1]);
    Write('บ Farmy            บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Kopalnie         บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Fabryki paliw    บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[4]);
    Write('บ Fabryki S.M      บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[5]);
    Write('บ Fabryki T.B.     บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[6]);
    Write('บ Fabryki zywnosci บ');
    TextBackground(7);
    WriteLn(' ');
    WriteLn(' บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ ');
    Write(' ');
    TextBackground(g[7]);
    Write('บ Elektrownie      บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('ศออออออออออออออออออผ ');
    Schowaj_kursor;
   End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Zaloga;
   Begin
    e1:=3;
    tm[1]:=7; tm[2]:=7; tm[3]:=7; tm[4]:=2; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=7;
   Window(28, 2, 49, 7 );
    TextColor(0);
    TextBackground(7);
    Write(' ษอออออออออออออออออป');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[1]);
    Write('บ Szkolenie       บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Pensje          บ');
    TextBackground(7);
    WriteLn(' ');
    WriteLn(' บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Transfer        บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ศอออออออออออออออออผ ');

   Schowaj_kursor;

   End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Nauka;
   Begin

    e1:=3;
    tm[1]:=7; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=2; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=7;

   Window(36, 2, 59, 7 );
    TextColor(0);
    TextBackground(7);
    WriteLn(' ษอออออออออออออออออออป ');
    Write(' ');
    TextBackground(g[1]);
    Write('บ Wyslij ekspedycje บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Wyslij sonde      บ');
    TextBackground(7);
    WriteLn(' ');
    WriteLn(' บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Badania naukowe   บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ศอออออออออออออออออออผ ');
    Schowaj_kursor;

   End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Port;
   Begin
    e1:=4;
    tm[1]:=7; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=2; tm[7]:=7; tm[8]:=7; tm[9]:=7;
   Window(43, 2, 66, 9 );
    TextColor(0);
    TextBackground(7);
    WriteLn(' ษอออออออออออออออออออป ');
    TextBackground(7);
    Write(' ');
    TextBackground(g[1]);
    Write('บ Kupno             บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Sprzedarz         บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Transakcje        บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[4]);
    Write('บ Zaloga            บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('ศอออออออออออออออออออผ ');


   Schowaj_kursor;

   End;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Bazy;
   Begin
    e1:=4;
    tm[1]:=7; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=2; tm[8]:=7; tm[9]:=7;
  Window(49, 2, 73, 9);
    TextColor(0);
    TextBackground(7);
    Write(' ษออออออออออออออออออออป');
    WriteLn(' ');
    Write(' ');
    TextBackground(g[1]);
    Write('บ Buduj nowa baze   บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Zburz baze        บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Wyslij transport  บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[4]);
    Write('บ Bazy              บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    Write('ศออออออออออออออออออออผ ');

   Schowaj_kursor;

   End;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}

  procedure m_Resorty;
   Begin
    e1:=3;
    tm[1]:=7; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=2; tm[9]:=7;
  Window(55, 2, 76, 6 );
    TextColor(0);
    TextBackground(7);
    Write(' ษอออออออออออออออออป');
    WriteLn(' ');
    Write(' ');
    TextBackground(g[1]);
    Write('บ Wojsko          บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Sluzba porzadku บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Czerwony krzyz  บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    Write('ศอออออออออออออออออผ ');

   Schowaj_kursor;

   End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure m_Informacje;
   Begin
   e1:=3;
   tm[1]:=7; tm[2]:=7; tm[3]:=7; tm[4]:=7; tm[5]:=7; tm[6]:=7; tm[7]:=7; tm[8]:=7; tm[9]:=2;
   Window(56, 2, 76, 7 );
    TextColor(0);
    TextBackground(7);
    WriteLn(' ษออออออออออออออออป ');
    Write(' ');
    TextBackground(g[1]);
    Write('บ Statystyka     บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[2]);
    Write('บ Raport         บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(7);
    Write('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ');
    TextBackground(g[3]);
    Write('บ Informacje     บ');
    TextBackground(7);
    WriteLn(' ');
    Write(' ศออออออออออออออออผ ');
    Schowaj_kursor;
    End;
{----------------------------------------------------------------------------}
  procedure p_nr1;
   begin
    g[1]:=2; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;

    end;
{----------------------------------------------------------------------------}
  procedure p_nr2;
   begin
    g[1]:=7; g[2]:=2; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;

    end;
{----------------------------------------------------------------------------}
  procedure p_nr3;
   begin
    g[1]:=7; g[2]:=7; g[3]:=2; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;

   end;
{----------------------------------------------------------------------------}
  procedure p_nr4;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=2; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;

   end;
{----------------------------------------------------------------------------}
 procedure p_nr5;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=2; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;

   end;
{----------------------------------------------------------------------------}
 procedure p_nr6;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=2; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=7;
   end;
{----------------------------------------------------------------------------}
 procedure p_nr7;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=2; g[8]:=7; g[9]:=7; g[10]:=7;

   end;
{----------------------------------------------------------------------------}
 procedure p_nr8;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=2; g[9]:=7; g[10]:=7;

   end;
{----------------------------------------------------------------------------}
 procedure p_nr9;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=2; g[10]:=7;

   end;
{----------------------------------------------------------------------------}
 procedure p_nr10;
   begin
    g[1]:=7; g[2]:=7; g[3]:=7; g[4]:=7; g[5]:=7; g[6]:=7; g[7]:=7; g[8]:=7; g[9]:=7; g[10]:=2;

   end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure gp_nr1;
  begin
  Window(3, 3, 26, 8);
  TextColor(0);
  TextBackground(7);
  WriteLn(' ษอ[ NOWA GRA ]ออออออป ');
  WriteLn(' บ                   บ ');
  WriteLn(' บ  Jestes pewien ?  บ ');
  WriteLn(' บ       (T/N)       บ ');
  WriteLn(' บ                   บ ');
  Write(' ศอออออออออออออออออออผ ');
  Schowaj_kursor;
  kl[3]:=readkey;
  if kl[3]='t' then Nowa_gra;
  if kl[3]<>'t' then main_menu;
  if kl[3]<>'t' then m_gra;
  end;
{----------------------------------------------------------------------------}
 procedure gp_nr2;
  begin
  Window(3, 3, 26, 8);
  TextColor(0);
  TextBackground(7);
  WriteLn(' ษอ[ KONIEC GRY ]ออออป ');
  WriteLn(' บ                   บ ');
  WriteLn(' บ  Jestes pewien ?  บ ');
  WriteLn(' บ       (T/N)       บ ');
  WriteLn(' บ                   บ ');
  Write(' ศอออออออออออออออออออผ ');
  Schowaj_kursor;
  kl[3]:=readkey;
  if kl[3]='t' then klaw_koncowe;
  if kl[3]='t' then Halt;
  if kl[3]='T' then Halt;
  Main_Menu;
  if r1[1]=1 then m_gra;
  if r1[1]=2 then m_budowa;
  if r1[1]=3 then m_zaopatrzenie;
  if r1[1]=4 then m_zaloga;
  if r1[1]=5 then m_nauka;
  if r1[1]=6 then m_port;
  if r1[1]=7 then m_bazy;
  if r1[1]=8 then m_resorty;
  if r1[1]=9 then m_informacje;
  end;
{----------------------------------------------------------------------------}
 procedure gp_nr3;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure gp_nr4;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure gp_nr5;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure gp_nr6;
  begin
  end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
   procedure bp_fabryki_broni;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......FABRYKA BRONI                                         ');
   WriteLn(' FUNKCJA...........produkcja roznego rodzaju broni                       ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 20  T stopow metali                    ');
   WriteLn('    - 10  T tworzywa bakteryjnego            ');
   WriteLn('    - 10  szt. maszyn fabrycznych            ');
   WriteLn('    - 5   MW energii elektrycznej            ');
   WriteLn('                                             ');
   WriteLn(' Potrzebny personel:                         ');
   WriteLn('    - 30  robotnikow                         ');
   WriteLn('    - 15  inzynierow                         ');
   WriteLn('    - 20  naukowcow                          ');
   WriteLn('    - 40  zolniezy                           ');
   WriteLn('                                            ');
   WriteLn(' Koszt budowy:  150 @                        ');
   WriteLn('                                            ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_fabryki_SM;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......FABRYKA STOPOW METALI                                 ');
   WriteLn(' FUNKCJA...........wytop stopow metali, potrzebnych do prod. roznych art.');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 25  T stopow metali                               ');
   WriteLn('    - 10  T tworzywa bakteryjnego                       ');
   WriteLn('    - 10  szt. maszyn fabrycznych                       ');
   WriteLn('    - 30  MW energii elektrycznej                       ');
   WriteLn('                                                        ');
   WriteLn(' Potrzebny personel:                                    ');
   WriteLn('    - 40  robotnikow                                    ');
   WriteLn('    - 10  inzynierow                                    ');
   WriteLn('    - 10  naukowcow                                     ');
   WriteLn('    - 5   zolniezy                                      ');
   WriteLn('                                                        ');
   WriteLn(' Koszt budowy:  140 @                                   ');
   WriteLn('                                                        ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_fabryki_TB;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......FABRYKA TWORZYWA BAKTERYJNEGO                         ');
   WriteLn(' FUNKCJA...........wyrob tworzywa z naturalnych wydzielin bakterii TC-89 ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 15  T stopow metali                               ');
   WriteLn('    - 5   T tworzywa bakteryjnego                       ');
   WriteLn('    - 10  szt. maszyn fabrycznych                       ');
   WriteLn('    - 20  MW energii elektrycznej                       ');
   WriteLn('                                                        ');
   WriteLn(' Potrzebny personel:                                    ');
   WriteLn('    - 25  robotnikow                                     ');
   WriteLn('    - 15  inzynierow                                     ');
   WriteLn('    - 30  naukowcow                                      ');
   WriteLn('    - 5   zolniezy                                       ');
   WriteLn('                                                                         ');
   WriteLn(' Koszt budowy:  125 @                                   ');
   WriteLn('                                                        ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_fabryki_paliw;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......FABRYKA PALIW                                         ');
   WriteLn(' FUNKCJA...........wytwarzanie paliw z mineralow i odpadkow              ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 30  T stopow metali                                ');
   WriteLn('    - 10  T tworzywa bakteryjnego                        ');
   WriteLn('    - 40  szt. maszyn fabrycznych                        ');
   WriteLn('    - 10  MW energii elektrycznej                        ');
   WriteLn('                                                        ');
   WriteLn(' Potrzebny personel:                                    ');
   WriteLn('    - 40  robotnikow                                     ');
   WriteLn('    - 10  inzynierow                                     ');
   WriteLn('    - 20  naukowcow                                      ');
   WriteLn('    - 5   zolniezy                                       ');
   WriteLn('                                                        ');
   WriteLn(' Koszt budowy:  165 @                                   ');
   WriteLn('                                                        ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_kopalnie;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......KOPALNIA                                              ');
   WriteLn(' FUNKCJA...........wydobywanie mineralow z wnetrza planety               ');
   WriteLn(' WYDAJNOSC.........100 ton mineralow na miasiac                          ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn(' Potrzebne surowce i maszyny:                           ');
   WriteLn('    - 20  T stopow metali                                ');
   WriteLn('    - 20  T tworzywa bakteryjnego                        ');
   WriteLn('    - 35  szt. maszyn kopalnianych                       ');
   WriteLn('    - 15  MW energii elektrycznej                        ');
   WriteLn('                                                        ');
   WriteLn(' Potrzebny personel:                                    ');
   WriteLn('    - 50  robotnikow                                     ');
   WriteLn('    - 10  inzynierow                                     ');
   WriteLn('    - 20  naukowcow                                      ');
   WriteLn('    - 5   zolniezy                                       ');
   WriteLn('                                                        ');
   WriteLn(' Koszt budowy:  175 @                                   ');
   WriteLn('                                                        ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_elektrownia;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......ELEKTROWNIA                                           ');
   WriteLn(' FUNKCJA...........uzyskiwanie energ. elektr. z baterii sloneczn         ');
   WriteLn(' WYDAJNOSC.........200 MW                                                ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn(' Potrzebne surowce i maszyny:                            ');
   WriteLn('    - 20  T stopow metali                                ');
   WriteLn('    - 20  T tworzywa bakteryjnego                        ');
   WriteLn('    - 100 szt. baterii slonecznych                       ');
   WriteLn('                                                         ');
   WriteLn('                                                         ');
   WriteLn(' Potrzebny personel:                                     ');
   WriteLn('    - 10  robotnikow                                     ');
   WriteLn('    - 10  inzynierow                                     ');
   WriteLn('    - 20  naukowcow                                      ');
   WriteLn('    - 5   zolnierzy                                      ');
   WriteLn('                                                         ');
   WriteLn(' Koszt budowy:  185 @                                    ');
   WriteLn('                                                         ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_stocznia;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......STOCZNIA                                              ');
   WriteLn(' FUNKCJA...........produkcja floty miedzygwiezdnej                       ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 25  T stopow metali                                                ');
   WriteLn('    - 30  T tworzywa bakteryjnego                                        ');
   WriteLn('    - 10  szt. maszyn fabrycznych                                        ');
   WriteLn('                                                                         ');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebny personel:                                                     ');
   WriteLn('    - 50  robotnikow                                                     ');
   WriteLn('    - 20  inzynierow                                                     ');
   WriteLn('    - 20  naukowcow                                                      ');
   WriteLn('    - 15  zolnierzy                                                      ');
   WriteLn('                                                                         ');
   WriteLn(' Koszt budowy:  170 @                                                    ');
   WriteLn('                                                                         ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_fabryki_robo;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......FABRYKA ROBOTOW I KOMPUTEROW                          ');
   WriteLn(' FUNKCJA...........produkcja robotow, komputerow i elementow elektron.   ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 40  T stopow metali                                                ');
   WriteLn('    - 40  T tworzywa bakteryjnego                                        ');
   WriteLn('    - 20  szt. maszyn fabrycznych                                        ');
   WriteLn('    - 30  MW                                                             ');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebny personel:                                                     ');
   WriteLn('    - 10  robotnikow                                                     ');
   WriteLn('    - 30  inzynierow                                                     ');
   WriteLn('    - 30  naukowcow                                                      ');
   WriteLn('    - 10  zolnierzy                                                      ');
   WriteLn('                                                                         ');
   WriteLn(' Koszt budowy:  210 @                                                    ');
   WriteLn('                                                                         ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   Procedure bp_fabryki_art_przem;
   begin
   Window(4,4,77,23);
   TextColor(0);
   TextBackGround(7);
   WriteLn(' NAZWA MODULU......FABRYKA  ARTYKOLOW PRZEMYSLOWYCH                      ');
   WriteLn(' FUNKCJA...........produkcja elementow wyposazenia, np. ekwipunku zoln.  ');
   WriteLn(' ------------------------------------------------------------------------');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebne surowce i maszyny:                                            ');
   WriteLn('    - 10  T stopow metali                                                ');
   WriteLn('    - 15  T tworzywa bakteryjnego                                        ');
   WriteLn('    - 15  szt. maszyn fabrycznych                                        ');
   WriteLn('    - 5   MW                                                             ');
   WriteLn('                                                                         ');
   WriteLn(' Potrzebny personel:                                                     ');
   WriteLn('    - 10  robotnikow                                                     ');
   WriteLn('    - 5   inzynierow                                                     ');
   WriteLn('    - 5   naukowcow                                                      ');
   WriteLn('    - 5   zolnierzy                                                      ');
   WriteLn('                                                                         ');
   WriteLn(' Koszt budowy:   70 @                                                    ');
   WriteLn('                                                                         ');
   WriteLn(' ------------------------------------------------------------------------');
   Write('  Klawisze: strzalki kursora: wybor, ENTER: o.k. , ESC: powrot');
   Schowaj_kursor;
   end;
   procedure bp_nr1;
   begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA MODULOW PRZEMYSLOWYCH ]อออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   bp_fabryki_art_przem;
   repeat
   kl[4]:=Readkey;
   if kl[4]=#77 then poz[1]:=poz[1]+1;
   if kl[4]=#75 then poz[1]:=poz[1]-1;
   if poz[1]<0 then poz[1]:=8;
   if poz[1]>8 then poz[1]:=0;
   if poz[1]=0 then bp_fabryki_art_przem;
   if poz[1]=1 then bp_fabryki_TB;
   if poz[1]=2 then bp_fabryki_SM;
   if poz[1]=3 then bp_fabryki_broni;
   if poz[1]=4 then bp_stocznia;
   if poz[1]=5 then bp_fabryki_paliw;
   if poz[1]=6 then bp_kopalnie;
   if poz[1]=7 then bp_elektrownia;
   if poz[1]=8 then bp_fabryki_robo;
   until kl[4]=#27;
   Main_Menu;
   m_Budowa;
   End;
{----------------------------------------------------------------------------}
 procedure bp_nr2;
  begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA INFRASTRUKTURY BAZY ]อออออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   Readkey;
   Main_Menu;
   m_Budowa;
  end;
{----------------------------------------------------------------------------}
 Procedure bp_nr3;
  Begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA FLOTY ]อออออออออออออออออออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   Readkey;
   Main_Menu;
   m_Budowa;
End;
{----------------------------------------------------------------------------}
  procedure bp_nr4;
  begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA ROBOTOW I KOMPUTEROW ]ออออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   Readkey;
   Main_Menu;
   m_Budowa;
  end;
{----------------------------------------------------------------------------}
  procedure bp_nr5;
  begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA SILNIKOW I MASZYN ]อออออออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   Readkey;
   Main_Menu;
   m_Budowa;
  end;
{----------------------------------------------------------------------------}
 Procedure bp_nr6;
  Begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA UZBROJENIA ]ออออออออออออออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   Readkey;
   Main_Menu;
   m_Budowa;
End;
{----------------------------------------------------------------------------}
 Procedure bp_nr7;
  Begin
   Main_Menu;
   Window(2,3,79,24);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Write(' ษอ[ BUDOWA INNYCH ELEMENTOW ]ออออออออออออออออออออออออออออออออออออออออออออออป ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' บ                                                                          บ ');
   Write(' ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   Window(4,4,75,21);
   TextColor(0);
   TextBackGround(7);
   ClrScr;
   Schowaj_kursor;
   Readkey;
   Main_Menu;
   m_Budowa;
End;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure zp_nr1;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr3;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr4;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr5;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr6;
  begin
 end;
{----------------------------------------------------------------------------}
 procedure zp_nr7;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr8;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr9;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure zp_nr10;
  begin
  end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure z_nr1;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure z_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure z_nr3;
  begin
  end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure np_nr1;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure np_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure np_nr3;
  begin
  end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure pp_nr1;
  begin
 end;
{----------------------------------------------------------------------------}
 procedure pp_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure pp_nr3;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure pp_nr4;
  begin
  end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure b_nr1;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure b_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure b_nr3;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure b_nr4;
  begin
  end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure rp_nr1;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure rp_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure rp_nr3;
  begin
  end;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
 procedure ip_nr1;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure ip_nr2;
  begin
  end;
{----------------------------------------------------------------------------}
 procedure ip_nr3;
  begin
  Window(10,5,72,20);
  TextColor(0);
  TextBackground(7);
  ClrScr;
  Write(' ษอ[ INFORMACJE ]ออออออออออออออออออออออออออออออออออออออออออออป ');
  Write(' บ             GLOBTROTER v.1.0  - WERSJA TESTOWA            บ ');
  Write(' บ                                                           บ ');
  Write(' บ Jest to testowa wersja gry ekonomicznej GLOBTROTER. Wsze- บ ');
  Write(' บ lkie  uwagi  dotyczace dzialania programu prosze kierowac บ ');
  Write(' บ po adres:                                                 บ ');
  Write(' บ                     BOHDAN BOBROWSKI                      บ ');
  Write(' บ                     Gdansk- Wrzeszcz                      บ ');
  Write(' บ                     ul. Matejki 23 A                      บ ');
  Write(' บ                                                           บ ');
  Write(' บ Program  nalezy do kategorii FREEWARE, czyli mozna rozpo- บ ');
  Write(' บ wszechniac w oryginalnym stanie (!) w dowolnych ilosciach บ ');
  Write(' บ wszedzie na Swiecie. Istnieje mozliwosc uzyskania kodu... บ ');
  Write(' บ ...ale o tym, i o wielu innych rzeczach dowiesz sie prze- บ ');
  Write(' บ gladajac plik czytajto.txt....                            บ ');
  Write(' ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
  Schowaj_kursor;
  Readkey;
  Main_Menu;
  if r1[1]=1 then m_gra;
  if r1[1]=2 then m_budowa;
  if r1[1]=3 then m_zaopatrzenie;
  if r1[1]=4 then m_zaloga;
  if r1[1]=5 then m_nauka;
  if r1[1]=6 then m_port;
  if r1[1]=7 then m_bazy;
  if r1[1]=8 then m_resorty;
  if r1[1]=9 then m_informacje;
 End;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure wm_gra;
   begin
    if r1[2]=1 then gp_nr1;
    if r1[2]=2 then gp_nr2;
    if r1[2]=3 then gp_nr3;
    if r1[2]=4 then gp_nr4;
    if r1[2]=5 then gp_nr5;
    if r1[2]=6 then gp_nr6;
   end;
{----------------------------------------------------------------------------}
  procedure wm_budowa;
   begin
    if r1[2]=1 then bp_nr1;
    if r1[2]=2 then bp_nr2;
    if r1[2]=3 then bp_nr3;
    if r1[2]=4 then bp_nr4;
    if r1[2]=5 then bp_nr5;
    if r1[2]=6 then bp_nr6;
    if r1[2]=7 then bp_nr7;
   end;
{----------------------------------------------------------------------------}
  procedure wm_zaopatrzenie;
   begin
    if r1[2]=1 then zp_nr1;
    if r1[2]=2 then zp_nr2;
    if r1[2]=3 then zp_nr3;
    if r1[2]=4 then zp_nr4;
    if r1[2]=5 then zp_nr5;
    if r1[2]=6 then zp_nr6;
    if r1[2]=7 then zp_nr7;
    if r1[2]=8 then zp_nr8;
    if r1[2]=9 then zp_nr9;
    if r1[2]=10 then zp_nr10;
   end;
{----------------------------------------------------------------------------}
  procedure wm_zaloga;
   begin
    if r1[2]=1 then z_nr1;
    if r1[2]=2 then z_nr2;
    if r1[2]=3 then z_nr3;
   end;
{----------------------------------------------------------------------------}
  procedure wm_nauka;
   begin
    if r1[2]=1 then np_nr1;
    if r1[2]=2 then np_nr2;
    if r1[2]=3 then np_nr3;
   end;
{----------------------------------------------------------------------------}
  procedure wm_port;
   begin
    if r1[2]=1 then pp_nr1;
    if r1[2]=2 then pp_nr2;
    if r1[2]=3 then pp_nr3;
    if r1[2]=4 then pp_nr4;
   end;
{----------------------------------------------------------------------------}
  procedure wm_bazy;
   begin
    if r1[2]=1 then b_nr1;
    if r1[2]=2 then b_nr2;
    if r1[2]=3 then b_nr3;
    if r1[2]=4 then b_nr4;
   end;
{----------------------------------------------------------------------------}
  procedure wm_resorty;
   begin
    if r1[2]=1 then ip_nr1;
    if r1[2]=2 then ip_nr2;
    if r1[2]=3 then ip_nr3;
   end;
{----------------------------------------------------------------------------}
  procedure wm_informacje;
   begin
    if r1[2]=1 then ip_nr1;
    if r1[2]=2 then ip_nr2;
    if r1[2]=3 then ip_nr3;
   end;
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{--...SYTUACJA-PO-NACI—NIจCIU-ENTER------------------------------------------}
{----------------------------------------------------------------------------}
  procedure pod_menu_wybor;
   Begin
    if r1[1]=1 then wm_gra;
    if r1[1]=2 then wm_budowa;
    if r1[1]=3 then wm_zaopatrzenie;
    if r1[1]=4 then wm_zaloga;
    if r1[1]=5 then wm_nauka;
    if r1[1]=6 then wm_port;
    if r1[1]=7 then wm_bazy;
    if r1[1]=8 then wm_resorty;
    if r1[1]=9 then wm_informacje;
   End;

{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{--OBSUGA-MENU--------------------------------------------------------------}
{----------------------------------------------------------------------------}
  procedure menu_wybor;
   Begin
    if r1[2]<1 then r1[2]:=e1;
    if r1[2]>e1 then r1[2]:=1;
    if r1[2]=1 then p_nr1;
    if r1[2]=2 then p_nr2;
    if r1[2]=3 then p_nr3;
    if r1[2]=4 then p_nr4;
    if r1[2]=5 then p_nr5;
    if r1[2]=6 then p_nr6;
    if r1[2]=7 then p_nr7;
    if r1[2]=8 then p_nr8;
    if r1[2]=9 then p_nr9;
    if r1[2]=10 then p_nr10;
    if r1[1]<1 then r1[1]:=9;
    if r1[1]>9 then r1[1]:=1;
    if r1[1]=1 then m_gra;
    if r1[1]=2 then m_budowa;
    if r1[1]=3 then m_zaopatrzenie;
    if r1[1]=4 then m_zaloga;
    if r1[1]=5 then m_nauka;
    if r1[1]=6 then m_port;
    if r1[1]=7 then m_bazy;
    if r1[1]=8 then m_resorty;
    if r1[1]=9 then m_informacje;
  End;
{---------------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{----------------------------------------------------------------------------}
{--TU-ZACZYNA-SIจ-WA—CIWY-PROGRAM-------------------------------------------}
{----------------------------------------------------------------------------}
BEGIN
 klawisze;
 Nowa_gra;
 MAIN_MENU;
 m_Gra;
 Repeat
  kl[1]:=ReadKey;
  if kl[1]=#27 then gp_nr2;
  if kl[1]=#75 then r1[1]:=r1[1]-1;
  if kl[1]=#77 then r1[1]:=r1[1]+1;
  if kl[1]=#72 then r1[2]:=r1[2]-1;
  if kl[1]=#80 then r1[2]:=r1[2]+1;
  if kl[1]=#13 then pod_menu_wybor;
  if kl[1]=#75 then menu_wybor;
  if kl[1]=#77 then menu_wybor;
  if kl[1]=#72 then menu_wybor;
  if kl[1]=#80 then menu_wybor;
  if kl[1]=#75 then main_menu;
  if kl[1]=#77 then main_menu;
  if kl[1]=#75 then menu_wybor;
  if kl[1]=#77 then menu_wybor;
  if kl[1]=#72 then menu_wybor;
  if kl[1]=#80 then menu_wybor;
 Until kl[1]='q';
 Window(1, 1, 80, 25);
  TextColor(7);
  TextBackground(0);
  ClrScr;
  Write(' I co ?...')
END.


