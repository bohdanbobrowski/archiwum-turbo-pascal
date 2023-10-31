uses Crt ;

{----------------------------------------------------------------------------}
{ Zmienne uzyte w programie }

var okna , kolor , pozmen , zmienna , kasa : array[1..20] of integer;
    opcje_str , mapa_str : file of string;
    opcje_int , mapa_int : file of integer;
    plansza : file of char;
    dane : file of integer;
    zn : char;
    runda , runda_2 , pkolor : longint;
    wojska : array[1..2 , 1..15] of longint;
    haslo , pl_mapy , pl_mapy_2 , pl_mapy_3 , pl_mapy_4 , pl_edycji : string;
    imiona : array[1..10] of string;
    czy_uruch , atakowany , rejestracja , KP , wystaw , los , lokien , lgraczy , lpol ,
                        I , J , K , F , G , H , Z , SP , kolejka: integer;
    klawisz : array[1..10] of char;
    sasiedzi : array[1..15,1..15] of integer;
    pol_X , pol_Y , il_s , podatki : array[1..15] of integer;
    Font_R :array[0..4095] of byte;
    zycie , Z1 , Z2 , Z3 : integer;

{----------------------------------------------------------------------------}
  Procedure schowaj_kursor;
  begin
   Window(80,25,80,25);
   TextColor(0);
   TextBackground(0);
   ClrScr;
  end;

  Procedure skur;
  begin
   Window(80,25,80,25);
   If kolejka=1 then TextColor(1);
   If kolejka=2 then TextColor(2);
   If kolejka=3 then TextColor(3);
   If kolejka=4 then TextColor(4);
   If kolejka=5 then TextColor(5);
   If kolejka=6 then TextColor(6);
   If kolejka=1 then TextBackground(1);
   If kolejka=2 then TextBackground(2);
   If kolejka=3 then TextBackground(3);
   If kolejka=4 then TextBackground(4);
   If kolejka=5 then TextBackground(5);
   If kolejka=6 then TextBackground(6);
   ClrScr;
  end;

  Procedure Czysc_ekran;
  begin
   window(1,15,80,25);
   TextColor(7);
   TextBackground(0);
   ClrScr;
  end;

{----------------------------------------------------------------------------}
{ Zapis danych opcjii }

  Procedure zapisz_imiona;
  begin
  Assign( Opcje_str , 'dane\dane_1.dta' );
  Rewrite(opcje_str);
  Write( opcje_str , imiona[1] );
  Write( opcje_str , imiona[2] );
  Write( opcje_str , imiona[3] );
  Write( opcje_str , imiona[4] );
  Write( opcje_str , imiona[5] );
  Write( opcje_str , imiona[6] );
  Write( opcje_str, pl_mapy );
  Close( opcje_str );
  end;

  Procedure zapisz_liczby;
  begin
   Assign( Opcje_int , 'dane\dane_2.dta' );
   Rewrite( Opcje_int );
   Write( Opcje_int , lgraczy );
   Write( Opcje_int , rejestracja );
   Close( opcje_int );
  end;

{----------------------------------------------------------------------------}
{ Odczyt danych menu }

  Procedure wczytaj_imiona;
  begin
   Assign( Opcje_str , 'dane\dane_1.dta' );
   Reset(opcje_str);
   Read( opcje_str , imiona[1] );
   Read( opcje_str , imiona[2] );
   Read( opcje_str , imiona[3] );
   Read( opcje_str , imiona[4] );
   Read( opcje_str , imiona[5] );
   Read( opcje_str , imiona[6] );
   Read( opcje_str , pl_mapy );
   Close( Opcje_str );
  end;

  Procedure wczytaj_liczby;
  begin
   Assign( Opcje_int , 'dane\dane_2.dta' );
   Reset( Opcje_int );
   Read( Opcje_int , lgraczy );
   Read( Opcje_int , rejestracja );
   Close( Opcje_int );
  end;

{----------------------------------------------------------------------------}
{ Zapis mapy przez edytor i odczyt danych mapy}

  Procedure zapisz_dane_mapy;
  begin
   Assign(mapa_int , pl_edycji );
   Rewrite(mapa_int);
   Write(mapa_int,lpol);

   For F:=1 to 15 do
   begin
   Write(mapa_int,pol_X[F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,pol_Y[F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[1,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[2,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[3,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[4,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[5,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[6,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[7,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[8,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[9,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[10,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[11,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[12,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[13,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[14,F]);
   end;

   For F:=1 to 15 do
   begin
   Write(mapa_int,sasiedzi[15,F]);
   end;

   Write(mapa_int,podatki[1]);
   Write(mapa_int,podatki[2]);
   Write(mapa_int,podatki[3]);
   Write(mapa_int,podatki[4]);
   Write(mapa_int,podatki[5]);
   Write(mapa_int,podatki[6]);
   Write(mapa_int,podatki[7]);
   Write(mapa_int,podatki[8]);
   Write(mapa_int,podatki[9]);
   Write(mapa_int,podatki[10]);
   Write(mapa_int,podatki[11]);
   Write(mapa_int,podatki[12]);
   Write(mapa_int,podatki[13]);
   Write(mapa_int,podatki[14]);
   Write(mapa_int,podatki[15]);
   Close(mapa_int);
  end;

  Procedure wczytaj_dane_mapy;
  begin
   pl_mapy_3:=pl_mapy+'.dna';
   Assign( mapa_int , pl_mapy_3 );
   Reset(mapa_int);
   read(mapa_int,lpol);

   For F:=1 to 15 do
   begin
   read(mapa_int,pol_X[F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,pol_Y[F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[1,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[2,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[3,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[4,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[5,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[6,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[7,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[8,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[9,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[10,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[11,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[12,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[13,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[14,F]);
   end;

   For F:=1 to 15 do
   begin
   read(mapa_int,sasiedzi[15,F]);
   end;

   Read( mapa_int , podatki[1] );
   Read( mapa_int , podatki[2] );
   Read( mapa_int , podatki[3] );
   Read( mapa_int , podatki[4] );
   Read( mapa_int , podatki[5] );
   Read( mapa_int , podatki[6] );
   Read( mapa_int , podatki[7] );
   Read( mapa_int , podatki[8] );
   Read( mapa_int , podatki[9] );
   Read( mapa_int , podatki[10] );
   Read( mapa_int , podatki[11] );
   Read( mapa_int , podatki[12] );
   Read( mapa_int , podatki[13] );
   Read( mapa_int , podatki[14] );
   Read( mapa_int , podatki[15] );
   Close(mapa_int);
  end;

{----------------------------------------------------------------------------}
{ Selekcja menu }

  Procedure variant_1;
  begin
   kolor[1]:=0; kolor[2]:=15; kolor[3]:=15; kolor[4]:=0; kolor[5]:=15; kolor[6]:=0; kolor[7]:=15; kolor[8]:=0;
   kolor[9]:=15; kolor[10]:=0; kolor[11]:=15; kolor[12]:=0; kolor[13]:=15; kolor[14]:=0;
  end;

  Procedure variant_2;
  begin
   kolor[1]:=15; kolor[2]:=0; kolor[3]:=0; kolor[4]:=15; kolor[5]:=15; kolor[6]:=0; kolor[7]:=15; kolor[8]:=0;
   kolor[9]:=15; kolor[10]:=0; kolor[11]:=15; kolor[12]:=0; kolor[13]:=15; kolor[14]:=0;
  end;

  procedure variant_3;
  begin
   kolor[1]:=15; kolor[2]:=0; kolor[3]:=15; kolor[4]:=0; kolor[5]:=0; kolor[6]:=15; kolor[7]:=15; kolor[8]:=0;
   kolor[9]:=15; kolor[10]:=0; kolor[11]:=15; kolor[12]:=0; kolor[13]:=15; kolor[14]:=0;
  end;

  procedure variant_4;
  begin
   kolor[1]:=15; kolor[2]:=0; kolor[3]:=15; kolor[4]:=0; kolor[5]:=15; kolor[6]:=0; kolor[7]:=0; kolor[8]:=15;
   kolor[9]:=15; kolor[10]:=0; kolor[11]:=15; kolor[12]:=0; kolor[13]:=15; kolor[14]:=0;
  end;

  procedure variant_5;
  begin
   kolor[1]:=15; kolor[2]:=0; kolor[3]:=15; kolor[4]:=0; kolor[5]:=15; kolor[6]:=0; kolor[7]:=15; kolor[8]:=0;
   kolor[9]:=0; kolor[10]:=15; kolor[11]:=15; kolor[12]:=0; kolor[13]:=15; kolor[14]:=0;
  end;

  procedure variant_6;
  begin
   kolor[1]:=15; kolor[2]:=0; kolor[3]:=15; kolor[4]:=0; kolor[5]:=15; kolor[6]:=0; kolor[7]:=15; kolor[8]:=0;
   kolor[9]:=15; kolor[10]:=0; kolor[11]:=0; kolor[12]:=15; kolor[13]:=15; kolor[14]:=0;
  end;

  procedure variant_7;
  begin
   kolor[1]:=15; kolor[2]:=0; kolor[3]:=15; kolor[4]:=0; kolor[5]:=15; kolor[6]:=0; kolor[7]:=15; kolor[8]:=0;
   kolor[9]:=15; kolor[10]:=0; kolor[11]:=15; kolor[12]:=0; kolor[13]:=0; kolor[14]:=15;
  end;

{----------------------------------------------------------------------------}
{ Tlo z logiem gry }

  Procedure logo_screen;
  begin
   Window(1,1,80,25);
   Textcolor(7);
   tEXTbACKGROUND(0);
   ClrScr;
   Textcolor(9);
   Write(' Copyright by BOHDAN BOBROWSKI 1998 , wersja 1.0.0 ');
   Textcolor(12);
   If rejestracja=0 then writeLn(', WERSJA NIEZAREJESTROWANA') else writeLn;
   Textcolor(14);
   Write('                                    SSSS                                        ');
   Write(' $$$$$$$$$   $$$  $$$$$$$ .pS$$$$$$ $$$$Sq.  $$$$$$$$$ $$$Sq.  $$$$$" $$$$$$$$  ');
   Write(' "$$$$$$$"  $$$$$ "$$$$$" $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$$S" $$$$$$$$$  ');
   Write('  $$$$$$$   $$$$$  $$$$$  $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$$S  $$$$$$$$$  ');
   Write('  "$$$$$$$ $$$$$$$ $$$$"  $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$S" $$$$$$$$"   ');
   Write('   $$$$$$$ $$$$$$$ $$$$   $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$" ,$$$$$$$$    ');
   Write('   "$$$$$$$ $$$$$$$ $$"   $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$     ,$$$$$$$$     ');
   Write('    $$$$$$$ $$$$$$$ $$    $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$     $$$$$$$$$     ');
   Write('    "$$$$$$$ $$$$$$$      $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$    ,$$$$$$$$  p$$ ');
   Write('     $$$$$$$ $$$$$$$      $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$    $$$$$$$$$  S$$ ');
   Write('     "$$$$$" "$$$$$"      $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$   $$$$$$$$$  p$$$ ');
   Write('      $$$$$   $$$$$       $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$   $$$$$$$$$ pS$$$ ');
   Write('      "$$$"   "$$$"        "S$$$$$$ $$$$S"   $$$$$$$$$ $$$S"   $$$$$$$$$ $$$$$$ ');
   Schowaj_kursor;
  end;

  Procedure slyde_in;
  begin
   Window(1,1,80,25);
   Textcolor(7);
   tEXTbACKGROUND(0);
   GotoXY(1,25);
   Textcolor(9);
   Write(' Copyright by BOHDAN BOBROWSKI 1998 , wersja 1.0.0 ');
   Textcolor(12);
   If rejestracja=0 then writeLn(', WERSJA NIEZAREJESTROWANA') else writeLn;
   Textcolor(14);
   Delay(30);
   Write('                                    SSSS                                        ');
   Delay(30);
   Write(' $$$$$$$$$   $$$  $$$$$$$ .pS$$$$$$ $$$$Sq.  $$$$$$$$$ $$$Sq.  $$$$$" $$$$$$$$  ');
   Delay(30);
   Write(' "$$$$$$$"  $$$$$ "$$$$$" $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$$S" $$$$$$$$$  ');
   Delay(30);
   Write('  $$$$$$$   $$$$$  $$$$$  $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$$S  $$$$$$$$$  ');
   Delay(35);
   Write('  "$$$$$$$ $$$$$$$ $$$$"  $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$S" $$$$$$$$"   ');
   Delay(35);
   Write('   $$$$$$$ $$$$$$$ $$$$   $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$  $$" ,$$$$$$$$    ');
   Delay(35);
   Write('   "$$$$$$$ $$$$$$$ $$"   $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$     ,$$$$$$$$     ');
   Delay(35);
   Write('    $$$$$$$ $$$$$$$ $$    $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$     $$$$$$$$$     ');
   Delay(40);
   Write('    "$$$$$$$ $$$$$$$      $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$    ,$$$$$$$$  p$$ ');
   Delay(40);
   Write('     $$$$$$$ $$$$$$$      $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$    $$$$$$$$$  S$$ ');
   Delay(40);
   Write('     "$$$$$" "$$$$$"      $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$   $$$$$$$$$  p$$$ ');
   Delay(40);
   Write('      $$$$$   $$$$$       $$$$$$$$   $$$$$$   $$$$$$$$  $$$$$   $$$$$$$$$ pS$$$ ');
   Delay(45);
   Write('      "$$$"   "$$$"        "S$$$$$$ $$$$S"   $$$$$$$$$ $$$S"   $$$$$$$$$ $$$$$$ ');
    For I:=1 to 10 do
    begin
    Delay(45);
    Write('                                                                                ');
    end;
   Schowaj_kursor;
   Delay(300);
  end;

{----------------------------------------------------------------------------}
{ procedury rysujace menu }

  Procedure main_menu;
  begin
   Window(31,17,50,24);
   TextColor(kolor[1]);
   TextBackground(kolor[2]);
   WriteLn('     START GRY     ');
   TextColor(kolor[3]);
   TextBackground(kolor[4]);
   WriteLn('       OPCJE       ');
   TextColor(kolor[5]);
   TextBackground(kolor[6]);
   WriteLn('    EDYTOR  MAP    ');
   TextColor(kolor[7]);
   TextBackground(kolor[8]);
   WriteLn('       INFO        ');
   TextColor(kolor[9]);
   TextBackground(kolor[10]);
   Write(' POWROT DO SYSTEMU ');
   Schowaj_kursor;
  end;

  Procedure Opcje;
  begin
   window(1,15,80,25);
   Window(31,17,50,24);
   TextColor(kolor[1]);
   TextBackground(kolor[2]);
   WriteLn('      POWROT       ');
   TextColor(kolor[3]);
   TextBackground(kolor[4]);
   WriteLn('   LICZBA GRACZY   ');
   TextColor(kolor[5]);
   TextBackground(kolor[6]);
   WriteLn('   IMIONA GRACZY   ');
   TextColor(kolor[7]);
   TextBackground(kolor[8]);
   WriteLn('    WYBOR MAPY     ');
   Schowaj_kursor;
  end;

  Procedure Edytor;
  begin
   Window(30,17,55,24);
   TextColor(kolor[1]);
   TextBackground(kolor[2]);
   WriteLn('        POWROT        ');
   TextColor(kolor[3]);
   TextBackground(kolor[4]);
   WriteLn('      USTAW PLIK      ');
   TextColor(kolor[5]);
   TextBackground(kolor[6]);
   WriteLn('   USTAW LICZBE POL   ');
   TextColor(kolor[7]);
   TextBackground(kolor[8]);
   WriteLn('     ROZMIESC POLA    ');
   TextColor(kolor[9]);
   TextBackground(kolor[10]);
   WriteLn('  PRZYDZIEL SASIADOW  ');
   TextColor(kolor[11]);
   TextBackground(kolor[12]);
   Write('     USTAW PODATKI    ');
   Schowaj_kursor;
  end;

{----------------------------------------------------------------------------}
{ procedury oblugujace rozne opcje menu "OPCJE" }

  procedure imiona_graczy;
  begin
   imiona[1]:='';
   imiona[2]:='';
   imiona[3]:='';
   imiona[4]:='';
   imiona[5]:='';
   imiona[6]:='';
   window(10,15,70,25);
   TextColor(7);
   TextBackground(0);
   ClrScr;
   WriteLn;
   For I:=1 to lgraczy do
   begin
    WriteLn('Podaj imie GrAcZa nR. ',I);
    WriteLn;
    TextColor(15);
    zmienna[1]:=0;
    repeat
     Klawisz[2]:=readkey;
     If klawisz[2]=#27 then zmienna[1]:=1;
     If klawisz[2]=#13 then zmienna[1]:=1;
     If zmienna[1]<>1 then write( klawisz[2] );
     If zmienna[1]<>1 then imiona[I]:=imiona[I]+klawisz[2];
    until zmienna[1]=1;
    WriteLn;
    zmienna[1]:=0;
    WriteLn;
  end;
  zapisz_imiona;
  Schowaj_kursor;
  ReadKey;
  Czysc_ekran;
  Opcje;
  end;

  procedure liczba_graczy;
  begin
   window(10,15,70,25);
   TextColor(7);
   TextBackground(0);
   ClrScr;
   WriteLn;
   WriteLn;
   WriteLn(' Podaj liczbe graczy ( 2-6 ) ');
   Klawisz[2]:=readkey;
   if klawisz[2]='2' then lgraczy:=2;
   if klawisz[2]='3' then lgraczy:=3;
   if klawisz[2]='4' then lgraczy:=4;
   if klawisz[2]='5' then lgraczy:=5;
   if klawisz[2]='6' then lgraczy:=6;
   WriteLn;
   WriteLn(' Wybrales ',lgraczy);
   Schowaj_kursor;
   Readkey;
   Zapisz_liczby;
   Czysc_ekran;
   Opcje;
  end;

  procedure wybor_mapy;
  begin
   window(10,15,70,25);
   TextColor(7);
   TextBackground(0);
   pl_mapy:='MAPY\';
   ClrScr;
   WriteLn;
   WriteLn('Podaj nazwe pliku mapy ( bez rozszerzenia ! )...');
   WriteLn;
   TextColor(15);
   I:=0;
   repeat
    I:=I+1;
    Klawisz[2]:=readkey;
    If klawisz[2]=#27 then zmienna[1]:=1;
    If klawisz[2]=#13 then zmienna[1]:=1;
    If I>8 then zmienna[1]:=1;
    If zmienna[1]<>1 then write( klawisz[2] );
    If zmienna[1]<>1 then pl_mapy:=pl_mapy+klawisz[2];
   until zmienna[1]=1;
   if pl_mapy='MAPY\' then pl_mapy:='MAPY\test';
   writeLn;
   WriteLn('Wybrales plik ',pl_mapy,'.*');
   Schowaj_kursor;
   Readkey;
   Zapisz_imiona;
   Czysc_ekran;
   Opcje;
  end;

{----------------------------------------------------------------------------}
{ Procedury obslugujace menu "edytor" }

  Procedure Ustaw_plik;
  begin
   window(10,15,70,25);
   TextColor(7);
   TextBackground(0);
   ClrScr;
   WriteLn;
   WriteLn('Podaj nazwe pliku do edycji ( bez rozszerzenia ! )...');
   WriteLn;
   TextColor(15);
   pl_edycji:='MAPY\';
   I:=0;
   repeat
    I:=I+1;
    Klawisz[2]:=readkey;
    If klawisz[2]=#27 then zmienna[1]:=1;
    If klawisz[2]=#13 then zmienna[1]:=1;
    If I>8 then zmienna[1]:=1;
    If zmienna[1]<>1 then write( klawisz[2] );
    If zmienna[1]<>1 then pl_edycji:=pl_edycji+klawisz[2];
   until zmienna[1]=1;
   if pl_edycji='MAPY\' then pl_edycji:='MAPY\test';
   writeLn;
   WriteLn('Wybrales plik ',pl_edycji,'.*');
   pl_edycji:=pl_edycji+'.dna';
   Zapisz_dane_mapy;
   Schowaj_kursor;
   Readkey;
   Czysc_ekran;
   Edytor;
  end;

  Procedure liczba_pol;
  begin;
   czysc_ekran;
   WriteLn;
   WriteLn('Podaj liczbe pol ( 1-F ) ');
   Klawisz[2]:=readkey;
   lpol:=1;
   if klawisz[2]='1' then lpol:=1;
   if klawisz[2]='2' then lpol:=2;
   if klawisz[2]='3' then lpol:=3;
   if klawisz[2]='4' then lpol:=4;
   if klawisz[2]='5' then lpol:=5;
   if klawisz[2]='6' then lpol:=6;
   if klawisz[2]='7' then lpol:=7;
   if klawisz[2]='8' then lpol:=8;
   if klawisz[2]='9' then lpol:=9;
   if klawisz[2]='a' then lpol:=10;
   if klawisz[2]='A' then lpol:=10;
   if klawisz[2]='b' then lpol:=11;
   if klawisz[2]='B' then lpol:=11;
   if klawisz[2]='c' then lpol:=12;
   if klawisz[2]='C' then lpol:=12;
   if klawisz[2]='d' then lpol:=13;
   if klawisz[2]='D' then lpol:=13;
   if klawisz[2]='e' then lpol:=14;
   if klawisz[2]='E' then lpol:=14;
   if klawisz[2]='f' then lpol:=15;
   if klawisz[2]='F' then lpol:=15;
   WriteLn;
   WriteLn('Wybrales ',lpol);
   Readkey;
   zapisz_dane_mapy;
   czysc_ekran;
   variant_3;
   edytor;
  End;

  Procedure wspol_pol;
  begin
   Window(10,18,70,25);
   TextColor(7);
   TextBackground(0);
   WriteLn;
   WriteLn(' Okno nr ',I);
   WriteLn;
   WriteLn('X: ', pol_X[I],'  ');
   WriteLn;
   WriteLn('Y: ', pol_Y[I],'  ');
   Schowaj_kursor;
  end;

  Procedure ustaw_pola;
  begin
   if pol_X[I]<1 then pol_X[I]:=1;
   if pol_X[I]>80 then pol_X[I]:=80;
   if pol_Y[I]<2 then pol_Y[I]:=2;
   if pol_Y[I]>24 then pol_Y[I]:=24;
   Czysc_ekran;
   WriteLn;
   WriteLn('Ustaw wspolzendne pol ( X: `+` i `-`, Y: `]` i `[` )');
   WriteLn;
   I:=0;
   repeat
    If lpol=0 then break;
    I:=I+1;
    pol_x[i]:=1;
    pol_y[i]:=1;
    wspol_pol;
    repeat
     If lpol=0 then break;
     klawisz[3]:=readkey;
     If klawisz[3]='+' then pol_X[I]:=pol_X[I]+1;
     If klawisz[3]='-' then pol_X[I]:=pol_X[I]-1;
     If klawisz[3]=']' then pol_Y[I]:=pol_Y[I]+1;
     If klawisz[3]='[' then pol_Y[I]:=pol_Y[I]-1;
     if pol_X[I]<1 then pol_X[I]:=1;
     if pol_X[I]>80 then pol_X[I]:=80;
     if pol_Y[I]<2 then pol_Y[I]:=2;
     if pol_Y[I]>24 then pol_Y[I]:=24;
     if klawisz[3]='+' then wspol_pol;
     if klawisz[3]='-' then wspol_pol;
     if klawisz[3]=']' then wspol_pol;
     if klawisz[3]='[' then wspol_pol;
     until klawisz[3]=#13;
   Until I=lpol;
   zapisz_dane_mapy;
   Czysc_ekran;
   Variant_4;
   Edytor;
  end;

  Procedure przydziel_s;
  begin
   Czysc_ekran;
   WriteLn;
   WriteLn('PRZYDZIEL SASIADOW... ( nacisnij klawisz `T` lub `N`)');
   I:=1;
    Repeat;
    If lpol=0 then break;
    WriteLn;
    WriteLn('Czy chcesz aby pole nr ',I,' sasiadowalo z polem nr...');
    J:=1;
     Repeat;
     Write(' - ',J,'... ');
     Klawisz[4]:=readkey;
     K:=0;
      Repeat
      If Klawisz[4]='T' then sasiedzi[I,J]:=1;
      If Klawisz[4]='t' then sasiedzi[I,J]:=1;
      If Klawisz[4]='N' then sasiedzi[I,J]:=0;
      If Klawisz[4]='n' then sasiedzi[I,J]:=0;
      If Klawisz[4]='T' then K:=1;
      If Klawisz[4]='t' then K:=1;
      If Klawisz[4]='N' then K:=1;
      If Klawisz[4]='n' then K:=1;
      Until K>0;
     WriteLn(Klawisz[4]);
     J:=J+1;
     Until J>lpol;
    I:=I+1;
    Until I>lpol;
   zapisz_dane_mapy;
   czysc_ekran;
   variant_5;
   edytor;
  end;

  Procedure ustal_podatki;
  begin
  Czysc_ekran;
  WriteLn;
  WriteLn('Podaj zamoznosc poszczegolnych prowincji ( 1..a ) ');
  WriteLn;
  i:=0;
   Repeat
   If lpol=0 then break;
   i:=i+1;
   podatki[i]:=1;
   Write('...prowincji nr ',I);
   klawisz[3]:=readkey;
   if klawisz[3]='1' then podatki[i]:=1;
   if klawisz[3]='2' then podatki[i]:=2;
   if klawisz[3]='3' then podatki[i]:=3;
   if klawisz[3]='4' then podatki[i]:=4;
   if klawisz[3]='5' then podatki[i]:=5;
   if klawisz[3]='6' then podatki[i]:=6;
   if klawisz[3]='7' then podatki[i]:=7;
   if klawisz[3]='8' then podatki[i]:=8;
   if klawisz[3]='9' then podatki[i]:=9;
   if klawisz[3]='a' then podatki[i]:=10;
   WriteLn(' ... wybrales ',podatki[i]);
   Until i=lpol;
   zapisz_dane_mapy;
   czysc_ekran;
   variant_6;
   edytor;
  end;

{----------------------------------------------------------------------------}
{ Procedury glowne gry }

  Procedure Game_menu_bar;
  begin
   Window(1,1,80,2);
   If kolejka=1 then TextBackground(1);
   If kolejka=2 then TextBackground(2);
   If kolejka=3 then TextBackground(3);
   If kolejka=4 then TextBackground(4);
   If kolejka=5 then TextBackground(5);
   If kolejka=6 then TextBackground(6);
   Write(' F1-AtAk  F2-MaNeWr  F3-WzMaCnIaNiE  F4-OpUsC kOlEjKe  Esc\F10-KoNiEc GrY       ');
  end;

  Procedure Rysuj_plansze;
  begin
   k:=0;
   Window(1,2,80,24);
   TextColor(10);
   TextBackground(0);
   ClrScr;
   pl_mapy_2:=pl_mapy+'.map';
   Assign(plansza,pl_mapy_2);
   Reset(plansza);
    Repeat
    TextColor(15);
    Read(plansza,zn);
    if zn='~' then textcolor(9);
    if zn='_' then textcolor(9);
    if zn='L' then textcolor(14);
    if zn='-' then textcolor(14);
    if zn='¦' then textcolor(14);
    if zn='=' then textcolor(14);
    if zn='¬' then textcolor(14);
    if zn='-' then textcolor(14);
   {if zn=' ' then textcolor(14);
    if zn=' ' then textcolor(14);}
    wRITE(ZN);
    Until(Eof(plansza));
  end;

  Procedure Pisz_about;
  begin
   k:=0;
   Window(1,2,80,24);
   TextColor(10);
   TextBackground(0);
   ClrScr;
   pl_mapy_4:=pl_mapy+'.not';
   Assign(plansza,pl_mapy_4);
   Reset(plansza);
    Repeat
    Read(plansza,zn);
    Write(zn);
    Until(Eof(plansza));
  end;

  Procedure wygral_bar;
  begin
   Window(1,25,80,25);
   TextColor(0);
   If kolejka=1 then TextBackground(1);
   If kolejka=2 then TextBackground(2);
   If kolejka=3 then TextBackground(3);
   If kolejka=4 then TextBackground(4);
   If kolejka=5 then TextBackground(5);
   If kolejka=6 then TextBackground(6);
   clrScr;
   Write(' ',imiona[kolejka],' wygral(a) ten pojedynek...    [klawisz]');
   skur;
   Readkey;
   klawisz[3]:=#27;
   I:=1;
  end;

  Procedure smierc_bar;
  begin
   Window(1,25,80,25);
   TextColor(0);
   If kolejka=1 then TextBackground(1);
   If kolejka=2 then TextBackground(2);
   If kolejka=3 then TextBackground(3);
   If kolejka=4 then TextBackground(4);
   If kolejka=5 then TextBackground(5);
   If kolejka=6 then TextBackground(6);
   clrScr;
   Write(' Ostatnie pole ktore posiadal ',Imiona[j],' zostalo zdobyte...    [klawisz]');
   skur;
   Readkey;
   KP:=KP+1;
   If KP=lgraczy-1 then wygral_bar;
  end;

  Procedure Sprawdz_zycie_1;
  Begin
   SP:=0;
   I:=0;
   For i:=0 to lpol do
   begin
    If Wojska[2,I]=atakowany then SP:=SP+1;
   end;
   If SP=0 then smierc_bar;
  End;

  Procedure sprawdz_zycie_2;
  begin
   SP:=0;
   I:=0;
    Repeat
    I:=I+1;
    If Wojska[2,I]=kolejka then SP:=SP+1;
    Until I=lpol;
  end;

  Procedure Main_Status_Bar;
  begin
   Window(1,25,80,25);
   If kolejka=1 then TextBackground(1);
   If kolejka=2 then TextBackground(2);
   If kolejka=3 then TextBackground(3);
   If kolejka=4 then TextBackground(4);
   If kolejka=5 then TextBackground(5);
   If kolejka=6 then TextBackground(6);
   TextColor(0);
   clrScr;
   Write(' KoLeJ mA: ');
   Write(imiona[kolejka],'                         ');
   Window(30,25,80,25);
   Write('StAn KoNtA: ',kasa[kolejka],' $      ');
   Window(65,25,80,25);
   Write('RuNdA: ',runda);
   skur;
  end;

  Procedure About_Status_Bar;
  begin
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   Write(' ...iNfO...NaCiSnIj JaKiS KlAwIsZ...                                           ');
   skur;
  end;

  Procedure pisz_pola;
  begin
   If J<10 then write(J);
   If J=10 then write('A');
   If J=11 then write('B');
   If J=12 then write('C');
   If J=13 then write('D');
   If J=14 then write('E');
   If J=15 then write('F');
 end;

  Procedure Rysuj_pola;
  begin
   J:=0;
    Repeat
    J:=J+1;
    Window(pol_X[J],pol_Y[J],pol_X[J]+8,pol_Y[J]);
    TextColor(14);
    TextBackground(0);
    ClrScr;
    If wojska[2,J]=1 then TextBackground(1);
    If wojska[2,J]=2 then TextBackground(2);
    If wojska[2,J]=3 then TextBackground(3);
    If wojska[2,J]=4 then TextBackground(4);
    If wojska[2,J]=5 then TextBackground(5);
    If wojska[2,J]=6 then TextBackground(6);
    pisz_pola;
    TextColor(14);
    TextBackground(0);
    If Wojska[1,I]<0 then Wojska[1,I]:=0;
    Write(':',Wojska[1,J]);
    Until J=lpol;
  end;

  Procedure dodaj_podatek;
  begin
   I:=0;
   Repeat
   I:=I+1;
   If Wojska[2,I]=kolejka then kasa[kolejka]:=kasa[kolejka]+podatki[I];
   Until I=lpol;
  end;


  Procedure nastepny_w_kolejce;
  begin
    dodaj_podatek;
    Repeat
    kolejka:=kolejka+1;
    if kolejka>lgraczy then kolejka:=1;
    runda_2:=runda_2+1;
    if runda_2=lgraczy then runda:=runda+1;
    if runda_2=lgraczy then runda_2:=0;
    sprawdz_zycie_2;
    Until SP>0;
   Main_Status_BAr;
  end;

  Procedure Pisz_wzm;
  begin
   Window(46,25,80,25);
   TextColor(0);
   TextBackground(15);
   Write(I,'     ');
   skur;
  end;

  Procedure Atak_wygrany;
  begin
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Udalo ci sie! Zdobyles pole przeciwnika...     [ klawisz ]');
   skur;
   readkey;
   Wojska[2,J]:=kolejka;
   Wojska[1,J]:=I+F;
   Sprawdz_zycie_1;
  end;

  Procedure Atak_przegrany;
  begin
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Nie udalo ci sie zdobyc atakowanego pola... [klawisz]');
   Wojska[1,G]:=Wojska[1,G]+I;
   skur;
   Readkey;
  end;

  procedure atak_real_2;
  begin
   Wojska[1,G]:=Wojska[1,G]-I;
   I:=Random(I)+1;
   K:=0; F:=0;
   F:=random(Wojska[1,J]);
   If I>F then Wojska[1,J]:=Wojska[1,J]-I;
   If Wojska[1,J]<1 then atak_wygrany else atak_przegrany;
  end;

  Procedure nicz_zd;
  begin
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Zajales pole niezajmowane przez nikogo...    [klawisz] ');
   Wojska[2,J]:=kolejka;
   Wojska[1,J]:=I;
   Wojska[1,G]:=Wojska[1,G]-I;
   skur;
   Readkey;
 end;

  Procedure pisz_ATA;
  begin
   If I<10 then write(I,', ');
   If I=10 then write('A, ');
   If I=11 then write('B, ');
   If I=12 then write('C, ');
   If I=13 then write('D, ');
   If I=14 then write('E, ');
   If I=15 then write('F, ');
  end;

  procedure atak_real;
  begin
   If wojska[2,J]>0 then atak_real_2;
   If wojska[2,J]=0 then nicz_zd;
   rysuj_pola;
   nastepny_w_kolejce;
  end;

  Procedure Atak;
  begin
   I:=0; J:=0; G:=0; K:=0;
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Z jakiego pola atakujesz? Wybieraj: ');
    Repeat
    I:=I+1;
    If wojska[2,I]=kolejka then pisz_ata;
    Until I=lpol;
    Repeat
    skur;
    Klawisz[5]:=readkey;
    if klawisz[5]='1' then G:=1;
    if klawisz[5]='2' then G:=2;
    if klawisz[5]='3' then G:=3;
    if klawisz[5]='4' then G:=4;
    if klawisz[5]='5' then G:=5;
    if klawisz[5]='6' then G:=6;
    if klawisz[5]='7' then G:=7;
    if klawisz[5]='8' then G:=8;
    if klawisz[5]='9' then G:=9;
    if klawisz[5]='a' then G:=10;
    if klawisz[5]='b' then G:=11;
    if klawisz[5]='c' then G:=12;
    if klawisz[5]='d' then G:=13;
    if klawisz[5]='e' then G:=14;
    if klawisz[5]='f' then G:=15;
    if klawisz[5]='A' then G:=10;
    if klawisz[5]='B' then G:=11;
    if klawisz[5]='C' then G:=12;
    if klawisz[5]='D' then G:=13;
    if klawisz[5]='E' then G:=14;
    if klawisz[5]='F' then G:=15;
    if klawisz[5]=#27 then break;
    If Wojska[2,G]=kolejka then K:=g;
    Until K>0;
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Jakie pole atakujesz? Wybieraj: ');
   I:=0; J:=0; K:=0; F:=0;
    Repeat
    I:=I+1;
    If sasiedzi[G,I]>0 then pisz_ata;
    Until I=lpol;
    Repeat
    skur;
    Klawisz[5]:=readkey;
    if klawisz[5]='1' then J:=1;
    if klawisz[5]='2' then J:=2;
    if klawisz[5]='3' then J:=3;
    if klawisz[5]='4' then J:=4;
    if klawisz[5]='5' then J:=5;
    if klawisz[5]='6' then J:=6;
    if klawisz[5]='7' then J:=7;
    if klawisz[5]='8' then J:=8;
    if klawisz[5]='9' then J:=9;
    if klawisz[5]='a' then J:=10;
    if klawisz[5]='b' then J:=11;
    if klawisz[5]='c' then J:=12;
    if klawisz[5]='d' then J:=13;
    if klawisz[5]='e' then J:=14;
    if klawisz[5]='f' then J:=15;
    if klawisz[5]='A' then J:=10;
    if klawisz[5]='B' then J:=11;
    if klawisz[5]='C' then J:=12;
    if klawisz[5]='D' then J:=13;
    if klawisz[5]='E' then J:=14;
    if klawisz[5]='F' then J:=15;
    if klawisz[5]=#27 then break;
    if Sasiedzi[G,J]>0 then K:=1;
    Until K>0;
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Ilu zolniezy wystawiasz ? ( +/- ) : ');
   I:=0;
   skur;
   pisz_wzm;
    Repeat
    Klawisz[5]:=readkey;
    If klawisz[5]='+' then I:=I+1;
    If klawisz[5]='-' then I:=I-1;
    If I>Wojska[1,G]-1 then I:=Wojska[1,G]-1;
    If I<0 then I:=0;
    If klawisz[5]='+' then pisz_wzm;
    If klawisz[5]='-' then pisz_wzm;
    if klawisz[5]=#27 then break;
    Until klawisz[5]=#13;
   If I>0 then atak_real;
   Main_status_bar;
  end;

  Procedure pisz_MAN;
  begin
   If J<10 then write(J,', ');
   If J=10 then write('A, ');
   If J=11 then write('B, ');
   If J=12 then write('C, ');
   If J=13 then write('D, ');
   If J=14 then write('E, ');
   If J=15 then write('F, ');
  end;

  Procedure sortuj_man;
  begin
   If sasiedzi[G,J]=kolejka then pisz_man;
  end;

  Procedure spr_wzm;
  begin
   If sasiedzi[G,K]=kolejka then H:=1;
  end;

  Procedure Manewr_real;
  begin
   Wojska[1,G]:=Wojska[1,G]-I;
   Wojska[1,K]:=Wojska[1,K]+I;
   rysuj_pola;
   nastepny_w_kolejce;
  end;

  Procedure Manewr;
  begin
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Z jakiego pola chcesz przemiscic wojsko? Wybieraj: ');
   I:=0; J:=0; G:=0; K:=0; H:=0; Z:=0;
    Repeat
    J:=J+1;
    If wojska[2,J]=kolejka then pisz_man;
    Until J=lpol;
    Repeat
    skur;
    Klawisz[5]:=readkey;
    if klawisz[5]=#27 then break;
    if klawisz[5]='1' then G:=1;
    if klawisz[5]='2' then G:=2;
    if klawisz[5]='3' then G:=3;
    if klawisz[5]='4' then G:=4;
    if klawisz[5]='5' then G:=5;
    if klawisz[5]='6' then G:=6;
    if klawisz[5]='7' then G:=7;
    if klawisz[5]='8' then G:=8;
    if klawisz[5]='9' then G:=9;
    if klawisz[5]='a' then G:=10;
    if klawisz[5]='b' then G:=11;
    if klawisz[5]='c' then G:=12;
    if klawisz[5]='d' then G:=13;
    if klawisz[5]='e' then G:=14;
    if klawisz[5]='f' then G:=15;
    if klawisz[5]='A' then G:=10;
    if klawisz[5]='B' then G:=11;
    if klawisz[5]='C' then G:=12;
    if klawisz[5]='D' then G:=13;
    if klawisz[5]='E' then G:=14;
    if klawisz[5]='F' then G:=15;
    If Wojska[2,G]=kolejka then I:=1;
    Until I=1;
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Do jakiego pola chcesz przemiescic swoje wojsko? Wybieraj: ');
   J:=0; H:=0; K:=0; F:=0;
    Repeat
    J:=J+1;
    If sasiedzi[G,J]>0 then Sortuj_man;
    Until J=lpol;
    Repeat
    skur;
    Klawisz[5]:=readkey;
    if klawisz[5]=#27 then break;
    if klawisz[5]='1' then K:=1;
    if klawisz[5]='2' then K:=2;
    if klawisz[5]='3' then K:=3;
    if klawisz[5]='4' then K:=4;
    if klawisz[5]='5' then K:=5;
    if klawisz[5]='6' then K:=6;
    if klawisz[5]='7' then K:=7;
    if klawisz[5]='8' then K:=8;
    if klawisz[5]='9' then K:=9;
    if klawisz[5]='a' then K:=10;
    if klawisz[5]='b' then K:=11;
    if klawisz[5]='c' then K:=12;
    if klawisz[5]='d' then K:=13;
    if klawisz[5]='e' then K:=14;
    if klawisz[5]='f' then K:=15;
    if klawisz[5]='A' then K:=10;
    if klawisz[5]='B' then K:=11;
    if klawisz[5]='C' then K:=12;
    if klawisz[5]='D' then K:=13;
    if klawisz[5]='E' then K:=14;
    if klawisz[5]='F' then K:=15;
    if Sasiedzi[G,J]>0 then spr_wzm;
    Until H=1;
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Ilu zolniezy przenosisz? ( +/- ) : ');
   I:=0;
   pisz_wzm;
    Repeat
    skur;
    Klawisz[5]:=readkey;
    If klawisz[5]='+' then I:=I+1;
    If klawisz[5]='-' then I:=I-1;
    If I>Wojska[1,G]-1 then I:=Wojska[1,G]-1;
    If I<0 then I:=0;
    if klawisz[5]=#27 then break;
    If klawisz[5]='+' then pisz_wzm;
    If klawisz[5]='-' then pisz_wzm;
    Until klawisz[5]=#13;
   If J=0 then I:=0;
   If I>0 then manewr_real;
   Main_status_bar;
  end;

  Procedure Wzmacnianie_real;
  begin
  end;

  Procedure Wzmacnianie;
  begin
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Jakie pole chcesz wzmocnic, wybieraj: ');
   I:=0; J:=0;
    Repeat
    I:=I+1;
    If Wojska[2,I]=kolejka then Write(I,', ');
    Until I=lpol;
   G:=0;
    Repeat
    skur;
    klawisz[5]:=readkey;
    if klawisz[5]=#27 then break;
    if klawisz[5]='1' then G:=1;
    if klawisz[5]='2' then G:=2;
    if klawisz[5]='3' then G:=3;
    if klawisz[5]='4' then G:=4;
    if klawisz[5]='5' then G:=5;
    if klawisz[5]='6' then G:=6;
    if klawisz[5]='7' then G:=7;
    if klawisz[5]='8' then G:=8;
    if klawisz[5]='9' then G:=9;
    if klawisz[5]='a' then G:=10;
    if klawisz[5]='b' then G:=11;
    if klawisz[5]='c' then G:=12;
    if klawisz[5]='d' then G:=13;
    if klawisz[5]='e' then G:=14;
    if klawisz[5]='f' then G:=15;
    if klawisz[5]='A' then G:=10;
    if klawisz[5]='B' then G:=11;
    if klawisz[5]='C' then G:=12;
    if klawisz[5]='D' then G:=13;
    if klawisz[5]='E' then G:=14;
    if klawisz[5]='F' then G:=15;
    If Wojska[2,G]=kolejka then j:=g;
    Until J>0;
   Window(1,25,80,25);
   TextColor(14);
   TextBackground(1);
   ClrScr;
   Write(' Ilu zolnierzy chcesz wynajac ( +/- ) : ');
   I:=0;
    Repeat
    pisz_wzm;
    Klawisz[5]:=readkey;
    if klawisz[5]=#27 then break;
    If klawisz[5]='+' then I:=I+1;
    If klawisz[5]='-' then I:=I-1;
    if I>kasa[kolejka] then I:=kasa[kolejka];
    If I<0 then I:=0;
    If klawisz[5]='+' then pisz_wzm;
    If klawisz[5]='-' then pisz_wzm;
    Until klawisz[5]=#13;
   Wojska[1,J]:=Wojska[1,J]+I;
   Kasa[kolejka]:=kasa[kolejka]-I;
   rysuj_pola;
   if I>0 then nastepny_w_kolejce;
   Main_status_bar;
  end;

  Procedure The_game;
  begin;
   Wczytaj_dane_mapy;
   kolejka:=1; runda_2:=0; runda:=1;
   Kasa[1]:=50; Kasa[2]:=50; Kasa[3]:=50; Kasa[4]:=50; Kasa[5]:=50; Kasa[6]:=50;
   Wojska[2,1]:=0; Wojska[2,2]:=0; Wojska[2,3]:=0; Wojska[2,4]:=0; Wojska[2,5]:=0;
   Wojska[2,6]:=0; Wojska[2,7]:=0; Wojska[2,8]:=0; Wojska[2,9]:=0; Wojska[2,10]:=0;
   Wojska[2,11]:=0; Wojska[2,12]:=0; Wojska[2,13]:=0; Wojska[2,14]:=0; Wojska[2,15]:=0;
   Wojska[1,1]:=0; Wojska[1,2]:=0; Wojska[1,3]:=0; Wojska[1,4]:=0; Wojska[1,5]:=0;
   Wojska[1,6]:=0; Wojska[1,7]:=0; Wojska[1,8]:=0; Wojska[1,9]:=0; Wojska[1,10]:=0;
   Wojska[1,11]:=0; Wojska[1,12]:=0; Wojska[1,13]:=0; Wojska[1,14]:=0; Wojska[1,15]:=0;
   Game_menu_bar;
   Pisz_about;
   About_Status_BAr;
   Readkey;
   Rysuj_plansze;
   I:=0;

    Repeat
    los:=random(lpol);
    los:=los+1;
    if wojska[2,los]=0 then I:=I+1;
    if wojska[2,los]=0 then wojska[1,los]:=100;
    if wojska[2,los]=0 then wojska[2,los]:=I;
    Until I=lgraczy;

   i:=0;
   Rysuj_pola;
   TextBackground(15);
   Window(1,25,80,25);
   ClrScr;
   Main_Status_BAr;

    Repeat
    klawisz[4]:=readkey;
    If klawisz[4]=#59 then Atak;
    If klawisz[4]=#60 then Manewr;
    If klawisz[4]=#61 then Wzmacnianie;
    If klawisz[4]=#62 then nastepny_w_kolejce;
    if klawisz[4]=#27 then klawisz[4]:=#68;
    Until Klawisz[4]=#68;
   logo_screen;
   variant_1;
   Main_menu;
  end;

{----------------------------------------------------------------------------}

  Procedure Info;
  Begin
   Window(10,5,73,20);
   TextColor(14);
   TextBackground(1);
   WriteLn(' -=[ INFO ]============================================[?]===¬ ');
   WriteLn(' ¦                        WODZ v.1.0                         ¦ ');
   WriteLn(' ¦                                                           ¦ ');
   WriteLn(' ¦ Wodz 1.0 jest prosta gra  strategiczna  przeznaczona  dla ¦ ');
   WriteLn(' ¦ 2 - 6 graczy. Program mozna rozprowadzac na zasadach fre- ¦ ');
   WriteLn(' ¦ eware , to znaczy w takiej postaci jak sie program otrzy- ¦ ');
   WriteLn(' ¦ malo  ( bez zmienionej  zawartosci oryginalnych plikow ), ¦ ');
   WriteLn(' ¦ ew.  z  dolaczonymi  wlasnymi  mapami. Jezeli chcesz uzy- ¦ ');
   WriteLn(' ¦ wac program dluzej niz 30 dni musisz go uprzednio zareje- ¦ ');
   WriteLn(' ¦ strowac... jesli tego nie uczynisz dalsze uzywanie  jest  ¦ ');
   WriteLn(' ¦ NIELEGALNE!!!...                                          ¦ ');
   WriteLn(' ¦                                                           ¦ ');
   WriteLn(' ¦   * reszte informacji znajdziesz w pliku czytajto.txt *   ¦ ');
   WriteLn(' ¦                                                           ¦ ');
   WriteLn(' ¦                                  ...MILEJ ZABAWY!!!       ¦ ');
   Write(' L===========================================================- ');
   Schowaj_kursor;
   Readkey;
   if czy_uruch=1 then variant_4;
   if czy_uruch=1 then pozmen[1]:=3;
   if czy_uruch=1 then logo_screen;
   if czy_uruch=1 then main_menu;
  END;

{----------------------------------------------------------------------------}

  procedure rozdziel_3;
  begin
   if pozmen[2]=0 then zmienna[2]:=1;
   if pozmen[2]=1 then ustaw_plik;
   if pozmen[2]=2 then liczba_pol;
   if pozmen[2]=3 then ustaw_pola;
   if pozmen[2]=4 then przydziel_s;
   if pozmen[2]=5 then ustal_podatki;
  end;

  procedure przewijanie_3;
  begin
   pozmen[2]:=0;
   variant_1;
   Czysc_ekran;
   Edytor;
   zmienna[2]:=0;
   repeat;
    klawisz[1]:=readkey;
    if klawisz[1]=#72 then zmienna[1]:=1;
    if klawisz[1]=#80 then zmienna[1]:=1;
    if klawisz[1]=#80 then pozmen[2]:=pozmen[2]+1;
    if klawisz[1]=#72 then pozmen[2]:=pozmen[2]-1;
    if klawisz[1]=#13 then rozdziel_3;
    if klawisz[1]=#27 then zmienna[2]:=1;
    if pozmen[2]<0 then pozmen[2]:=5;
    if pozmen[2]>5 then pozmen[2]:=0;
    if pozmen[2]=0 then variant_1;
    if pozmen[2]=1 then variant_2;
    if pozmen[2]=2 then variant_3;
    if pozmen[2]=3 then variant_4;
    if pozmen[2]=4 then variant_5;
    if pozmen[2]=5 then variant_6;
    if zmienna[1]=1 then edytor;
    zmienna[1]:=0;
   until zmienna[2]=1;
   zmienna[2]:=0;
   Czysc_ekran;
   variant_3;
   main_menu;
  end;


  { Obsloga menu "OPCJE" }

  procedure rozdziel_2;
  begin
   if pozmen[2]=0 then zmienna[2]:=1;
   if pozmen[2]=1 then liczba_graczy;
   if pozmen[2]=2 then imiona_graczy;
   if pozmen[2]=3 then wybor_mapy;
  end;

  procedure przewijanie_2;
  begin
   pozmen[2]:=0;
   variant_1;
   Czysc_ekran;
   opcje;
   zmienna[2]:=0;
   repeat;
    klawisz[1]:=readkey;
    if klawisz[1]=#72 then zmienna[1]:=1;
    if klawisz[1]=#80 then zmienna[1]:=1;
    if klawisz[1]=#80 then pozmen[2]:=pozmen[2]+1;
    if klawisz[1]=#72 then pozmen[2]:=pozmen[2]-1;
    if klawisz[1]=#13 then rozdziel_2;
    if klawisz[1]=#27 then zmienna[2]:=1;
    if pozmen[2]<0 then pozmen[2]:=3;
    if pozmen[2]>3 then pozmen[2]:=0;
    if pozmen[2]=0 then variant_1;
    if pozmen[2]=1 then variant_2;
    if pozmen[2]=2 then variant_3;
    if pozmen[2]=3 then variant_4;
    if zmienna[1]=1 then opcje;
    zmienna[1]:=0;
   until zmienna[2]=1;
   zmienna[2]:=0;
   variant_2;
   czysc_ekran;
   main_menu;
  end;

  { Obsluga menu glownego }

  procedure rozdziel_1;
  begin
   if pozmen[1]=0 then The_game;
   if pozmen[1]=1 then przewijanie_2;
   if pozmen[1]=2 then przewijanie_3;
   if pozmen[1]=3 then info;
   if pozmen[1]=3 then logo_screen;
   if pozmen[1]=3 then main_menu;
   if pozmen[1]=4 then halt;
  end;

  procedure przewijanie_1;
  begin
   repeat;
    klawisz[1]:=readkey;
     if klawisz[1]=#72 then zmienna[1]:=1;
     if klawisz[1]=#80 then zmienna[1]:=1;
     if klawisz[1]=#80 then pozmen[1]:=pozmen[1]+1;
     if klawisz[1]=#72 then pozmen[1]:=pozmen[1]-1;
     if klawisz[1]=#13 then rozdziel_1;
     if pozmen[1]<0 then pozmen[1]:=4;
     if pozmen[1]>4 then pozmen[1]:=0;
     if pozmen[1]=0 then variant_1;
     if pozmen[1]=1 then variant_2;
     if pozmen[1]=2 then variant_3;
     if pozmen[1]=3 then variant_4;
     if pozmen[1]=4 then variant_5;
     if zmienna[1]=1 then main_menu;
     zmienna[1]:=0;
    until klawisz[1]=#27;
   end;

{----------------------------------------------------------------------------}
{ Tu zaczyna sie prawdziwy program }
{----------------------------------------------------------------------------}

BEGIN
randomize;
czy_uruch:=0;
info;
czy_uruch:=1;
wczytaj_imiona;
wczytaj_liczby;
Slyde_in;
Czysc_ekran;
variant_1;
pozmen[1]:=0;
Main_menu;
if pl_mapy='' then pl_mapy:='MAPY\polska_p';
przewijanie_1;
END.

{----------------------------------------------------------------------------}
{ definitywny koniec kodu.... }
{----------------------------------------------------------------------------}
