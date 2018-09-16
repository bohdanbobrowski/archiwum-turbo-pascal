uses crt, interfac, kol_int, kol_zda;

{ zmienne obslugi programu }

var key: array[1..10] of char;
var tusz, tlo: array[1..20] of integer;
var pozmen: array[1..10] of integer;
var a, b, c: integer;

{----------------------------------------------------------------------------}
{ zmienne gry }

{ zmienne chwilowe }
var pr_m1, pr_m2, pr_m3, pr_r1, pr_r2, pr_r3: integer; { produkcja }
    cpr_m1, cpr_m2, cpr_m3, cpr_t1, cpr_r1, cpr_r2, cpr_r3: integer;
    bd_ft, bd_fa, bd_ko, bd_el, bd_ma, bd_mi, bd_ld, bd_lb: integer; { budowa }
    cbd_ft, cbd_fa, cbd_ko, cbd_el, cbd_ma, cbd_mi, cbd_ld, cbd_lb: integer;
    czas_wyp, nauk_wyp, kolon_wyp, zoln_wyp: longint;
    atak, a_zoln, a_r3, a_m1, a_m2, a_m3: longint;

{ standardowe zmienne }
var imie: string;
    kasa, dlug, punkty: longint;
    miesiac, rok, technologia, morale, pensja, sila: integer;

{ zmienne okreslajace obcych }
var technologia_o, sila_o: longint;

{ o planecie }
var powierzchnia, odkrycie_pl, zloza_mineralow, zloza_zelaza: integer;

{ surowce }
var zelazo, uran, tworzywo, zywnosc: longint;


{ sprzet }
var M1, M2, M3: longint; { mysliwce }
    R1, R2, R3: longint; { roboty }

{ budynki }
var fabryki, kopalnie, elektrownie, magazyny, mieszkania: longint;
    ladowiska, laboratoria, farmy, fabryki_TB: longint;

{ ludzie }
var kolon, nauk, zoln: longint;
    p_kol, p_nauk, p_zoln: longint;

{ do menu budowa }
var  p_zel, p_tb, p_uran, p_el, p_prz, cz_budowy, il_bud, koszt, cz_bud: longint;
     nazwa_w: string;
{----------------------------------------------------------------------------}

procedure kolory_poczatkowe;
begin
 tusz[1]:=15; tusz[2]:=15; tusz[3]:=15; tusz[4]:=15; tusz[5]:=15;
 tusz[6]:=15; tusz[7]:=15; tusz[8]:=15; tusz[9]:=15; tusz[10]:=15;
 tusz[11]:=15; tusz[12]:=15; tusz[13]:=15; tusz[14]:=15; tusz[15]:=15;
 tusz[16]:=15; tusz[17]:=15; tusz[18]:=15; tusz[19]:=15; tusz[20]:=15;
 tlo[1]:=0; tlo[2]:=0; tlo[3]:=0; tlo[4]:=0; tlo[5]:=0;
 tlo[6]:=0; tlo[7]:=0; tlo[8]:=0; tlo[9]:=0; tlo[10]:=0;
 tlo[11]:=0; tlo[12]:=0; tlo[13]:=0; tlo[14]:=0; tlo[15]:=0;
 tlo[16]:=0; tlo[17]:=0; tlo[18]:=0; tlo[19]:=0; tlo[20]:=0;
end;

procedure zmien_kolory;
begin
 kolory_poczatkowe;
 tusz[pozmen[1]]:=0;
 tlo[pozmen[1]]:=15;
end;

{----------------------------------------------------------------------------}

procedure main_logo_screen;
begin
 Window(1,1,80,25);
 TextColor(15);
 TextBackground(0);
 ClrScr;
 TextColor(0);
 TextBackground(7);
 Write(' by BOHDAN BOBROWSKI                                                            ');
 TextColor(15);
 TextBackground(0);
 Write('                                                                                ');
 Write(' $$$   $$$$$$ $$$$$$$$$$$$ $$$       $$$$$$$$$$$$ $$$$$$$$$$$$ $$$ $$$$$$$$$$$$ ');
 Write(' $$$   $$$    $$$      $$$ $$$       $$$      $$$ $$$      $$$ $$$          $$$ ');
 Write(' $$$$$$$$$$$$ $$$      $$$ $$$       $$$      $$$ $$$      $$$ $$$ $$$$$$$$$$$$ ');
 Write(' $$$      $$$ $$$      $$$ $$$       $$$      $$$ $$$      $$$ $$$ $$$      $$$ ');
 Write(' $$$      $$$ $$$$$$$$$$$$ $$$$$$$$$ $$$$$$$$$$$$ $$$      $$$ $$$ $$$$$$$$$$$$ ');
 Write('                                                                                ');
 TextColor(0);
 TextBackground(7);
 Write(' GRA STRATEGICZNO-EKONOMICZNA, WERSJA TESTOWA                                   ');
end;

procedure menu_poczatkowe;
begin
 textcolor(15);
 textbackground(0);
 window(30, 11, 50, 25);
 TextColor(tusz[1]);
 TextBackground(tlo[1]);
 WriteLn(' NOWA GRA  ');
 TextColor(tusz[2]);
 TextBackground(tlo[2]);
 WriteLn(' KONTYNUUJ ');
 TextColor(tusz[3]);
 TextBackground(tlo[3]);
 WriteLn(' LISTA NAJLEPSZYCH ');
 TextColor(tusz[4]);
 TextBackground(tlo[4]);
 WriteLn(' INFORMACJE ');
 TextColor(tusz[5]);
 TextBackground(tlo[5]);
 WriteLn;
 WriteLn(' POWROT DO SYSTEMU ');
 kurs(0);
end;

{----------------------------------------------------------------------------}

procedure info_bar;
begin
 textcolor(0);
 TextBackground(7);
 window(1,1,80,1);
 clrscr;
 window(1,1,40,1);
 write(' PUNKTY: ',punkty);
 a:=Length(imie);
 a:=a+1;
 window(80-a,1,80,1);
 write(imie);
 Window(1,25,80,25);
 clrScr;
 write(' KONTO: ',kasa,' @');
 window( 67,25,80,25);
 write('DATA: ');
 if miesiac<10 then write(' ');
 write( miesiac,'.',rok);
end;

procedure game_screen;
begin
 window(1,1,80,25);
 textcolor(7);
 TextBackground(0);
 clrscr;
 textcolor(0);
 TextBackground(7);
end;

{----------------------------------------------------------------------------}

procedure menu_glowne_gry;
begin
 textcolor(7);
 textbackground(0);
 window(1,2,20,20);
 TextColor(7);
 textbackground(0);
 writeln('ษออออออออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ BUDOWA         บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ ZAOPATRZENIE   บ');
 textcolor(tusz[3]);
 textbackground(tlo[3]);
 writeln('บ BANK           บ');
 textcolor(tusz[4]);
 textbackground(tlo[4]);
 writeln('บ ZALOGA         บ');
 textcolor(tusz[5]);
 textbackground(tlo[5]);
 writeln('บ NAUKA          บ');
 textcolor(7);
 textbackground(0);
 writeln('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
 textcolor(tusz[6]);
 textbackground(tlo[6]);
 writeln('บ PORT           บ');
 textcolor(tusz[7]);
 textbackground(tlo[7]);
 writeln('บ EKSPANSJA      บ');
 textcolor(7);
 textbackground(0);
 writeln('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
 textcolor(tusz[8]);
 textbackground(tlo[8]);
 writeln('บ DALEJ          บ');
 textcolor(tusz[9]);
 textbackground(tlo[9]);
 writeln('บ INFORMACJE     บ');
 textcolor(tusz[10]);
 textbackground(tlo[10]);
 writeln('บ RAPORT         บ');
 textcolor(7);
 textbackground(0);
 writeln('บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ');
 textcolor(tusz[11]);
 textbackground(tlo[11]);
 writeln('บ ZAPISZ         บ');
 textcolor(tusz[12]);
 textbackground(tlo[12]);
 writeln('บ KONIEC GRY     บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออออออออผ');
 kurs(7);
end;

procedure menu_budowa;
begin
 textcolor(7);
 textbackground(0);
 window(19,2,30,20);
 writeln('ษอออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ MASZYNY บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ MODULY  บ');
 textcolor(7);
 textbackground(0);
 write('ศอออออออออผ');
 kurs(7);
end;

procedure menu_zaopatrzenie;
begin
 textcolor(7);
 textbackground(0);
 window(19,3,39,20);
 writeln('ษออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ UPRAWY   บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ KOPALNIE บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออผ');
 kurs(7);
end;

procedure menu_bank;
begin
 textcolor(7);
 textbackground(0);
 window(19,4,40,20);
 writeln('ษออออออออออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ ZACIAGNIJ KREDYT บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ SPLAC KREDYT     บ');
 textcolor(tusz[3]);
 textbackground(tlo[3]);
 writeln('บ WPLAC NA KONTO   บ');
 textcolor(tusz[4]);
 textbackground(tlo[4]);
 writeln('บ POBIEZ Z KONTA   บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออออออออออผ');
 kurs(7);
end;

procedure menu_zaloga;
begin
 textcolor(7);
 textbackground(0);
 window(19,5,40,20);
 writeln('ษอออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ PENSJE    บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ SZKOLENIE บ');
 textcolor(7);
 textbackground(0);
 write('ศอออออออออออผ');
 kurs(7);
end;

procedure menu_nauka;
begin
 textcolor(7);
 textbackground(0);
 window(19,6,41,20);
 writeln('ษออออออออออออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ ROZPOCZNIJ BADANIA บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ PRZERWIJ BADANIA   บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออออออออออออผ');
 kurs(7);
end;

procedure menu_port;
begin
 textcolor(7);
 textbackground(0);
 window(19,8,40,20);
 writeln('ษออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ TRANSFER บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ HANDEL   บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออผ');
 kurs(7);
end;

procedure menu_ekspansja;
begin
 textcolor(7);
 textbackground(0);
 window(19,9,40,20);
 writeln('ษออออออออออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ WYPRAWA          บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ ATAK BAZY OBCYCH บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออออออออออผ');
 kurs(7);
end;

procedure menu_informacje;
begin
 textcolor(7);
 textbackground(0);
 window(19,12,40,20);
 writeln('ษออออออออออออออป');
 textcolor(tusz[1]);
 textbackground(tlo[1]);
 writeln('บ MASZYNY      บ');
 textcolor(tusz[2]);
 textbackground(tlo[2]);
 writeln('บ MODOLY       บ');
 textcolor(tusz[3]);
 textbackground(tlo[3]);
 writeln('บ ZAOPATRZENIE บ');
 textcolor(tusz[4]);
 textbackground(tlo[4]);
 writeln('บ ZALOGA       บ');
 textcolor(tusz[5]);
 textbackground(tlo[5]);
 writeln('บ INNE         บ');
 textcolor(7);
 textbackground(0);
 write('ศออออออออออออออผ');
 kurs(7);
end;


{----------------------------------------------------------------------------}

procedure Nowa_gra;
begin
 a:=0; b:=0; imie:='';
 czysc_ekran_menu;
 textcolor(7);
 okno( 1,11,80,3,' PODAJ SWOJE IMIE: ');
 write('  ');
  repeat;
  key[2]:=readkey;
  a:=0;
  if key[2]=#13 then a:=1;
  if key[2]=#27 then a:=1;
  if key[2]=' ' then a:=1;
  if key[2]=#72 then a:=2;
  if key[2]=#75 then a:=2;
  if key[2]=#77 then a:=2;
  if key[2]=#80 then a:=2;
  if a=0 then key[3]:=UpCase(key[2]) ;
  if a=0 then write(key[3]);
  if a=0 then imie:=imie+key[3];
  until a=1;
 if imie='' then imie:='ANONIM';
 textcolor(7);
 kasa:=100; dlug:=0; rok:=2540; miesiac:=1; pensja:=1; morale:=50;
 technologia:=1; punkty:=0;
 kolon:=10; nauk:=10; zoln:=10;
 fabryki:=1; ladowiska:=1; farmy:=1; mieszkania:=3; elektrownie:=1;
 laboratoria:=0; magazyny:=1;
end;

{----------------------------------------------------------------------------}

 procedure menu_budowa_maszyny;
 begin
  window(30,2,41,11);
  textColor(7);
  TextBackground(0);
  writeln('ษอออออออออป');
  textcolor(tusz[1]);
  textbackground(tlo[1]);
  writeln('บ PUMA    บ');
  textcolor(tusz[2]);
  textbackground(tlo[2]);
  writeln('บ ORZEL   บ');
  textcolor(tusz[3]);
  textbackground(tlo[3]);
  writeln('บ TYGRYS  บ');
  textcolor(tusz[4]);
  textbackground(tlo[4]);
  writeln('บ MAN-BOT บ');
  textcolor(tusz[5]);
  textbackground(tlo[5]);
  writeln('บ SCI-BOT บ');
  textcolor(tusz[6]);
  textbackground(tlo[6]);
  writeln('บ WAR-BOT บ');
  textColor(7);
  TextBackground(0);
  write('ศอออออออออผ');
  kurs(7);
 end;

 procedure  bm_1;
 begin
  p_tb:=il_bud*2;
  p_zel:=il_bud*1;
  p_uran:=il_bud*1;
  koszt:=il_bud*5;
  cz_bud:=il_bud*
 end;

 procedure pisz_potrzebne_masz;
 begin
  textColor(7);
  TextBackground(0);
  window( 42,3,79,13);
  writeln;
  writeln(' Ilosc.............',il_bud,' ');
  writeln(' -----------------------------------');
  writeln(' TB................',p_tb,' t. ');
  writeln(' Zelazo............',p_zel,' t. ');
  writeln(' Uran..............',p_uran,' t. ');
  writeln(' -----------------------------------');
  writeln(' Koszt budowy......',koszt,' @ ');
  writeln(' Czas budowy.......',cz_bud,' m-cy ');
  kurs(7);
 end;

 procedure w_budowie_masz;
 begin
 end;

 procedure budowa_rozpoczeta;
 begin
 end;

 procedure budowa_maszyny;
 begin
 end;

{----------------------------------------------------------------------------}

 procedure menu_budowa_moduly;
 begin
  window(30,2,47,14);
  textColor(7);
  TextBackground(0);
  writeln('ษออออออออออออออป');
  textcolor(tusz[1]);
  textbackground(tlo[1]);
  writeln('บ MIESZKANIE   บ');
  textcolor(tusz[2]);
  textbackground(tlo[2]);
  writeln('บ MAGAZYN      บ');
  textcolor(tusz[3]);
  textbackground(tlo[3]);
  writeln('บ LABORATORIUM บ');
  textcolor(tusz[4]);
  textbackground(tlo[4]);
  writeln('บ LADOWISKO    บ');
  textcolor(tusz[5]);
  textbackground(tlo[5]);
  writeln('บ FABRYKA      บ');
  textcolor(tusz[6]);
  textbackground(tlo[6]);
  writeln('บ FARMA        บ');
  textcolor(tusz[7]);
  textbackground(tlo[7]);
  writeln('บ KOPALNIA     บ');
  textcolor(tusz[8]);
  textbackground(tlo[8]);
  writeln('บ FABRYKA TB   บ');
  textcolor(tusz[9]);
  textbackground(tlo[9]);
  writeln('บ ELEKTROWNIA  บ');
  textColor(7);
  TextBackground(0);
  write('ศออออออออออออออผ');
  kurs(7);
 end;

 procedure pisz_potrzebne_moduly;
 begin
  textColor(7);
  TextBackground(0);
  window( 47,3,79,15);
  writeln;
  writeln(' POTRZEBNE SUROWCE:');
  writeln;
  writeln(' Ilosc.............',il_bud );
  writeln(' ------------------------------');
  writeln(' TB................',p_tb,' ton');
  writeln(' Zelazo............',p_zel,' ton');
  writeln(' Uran..............',p_uran,' ton');
  writeln(' ------------------------------');
  writeln(' Koszt budowy......',koszt,' @');
  writeln(' Czas budowy.......',cz_bud,' m-cy');
  kurs(7);
 end;

 procedure budowa_modoly;
 begin
  textColor(7);
  TextBackground(0);
  okno1(46,2,36,14,' STATYSTYKA ');
  pisz_potrzebne_moduly;
 end;

{----------------------------------------------------------------------------}

procedure info_flota;
begin
 czysc_ekran_gry(0);
 b:=1;
 TextColor(7);
 TextBackground(0);
 okno(19,2,62,13,' INFORMACJE: MASZYNY ');
 writeln;
 writeln('  Mysliwce:');
 writeln('  - Puma......................',m1,' szt.');
 writeln('  - Orzel.....................',m2,' szt.');
 writeln('  - Tygrys....................',m3,' szt.');
 writeln;
 writeln('  Roboty:');
 writeln('  - kolonista.................',r1,' szt.');
 writeln('  - naukowiec.................',r2,' szt.');
 writeln('  - zolniez...................',r3,' szt.');
 kurs(7);
  repeat
  until keypressed;
 czysc_ekran_gry(0);
 kurs(7);
end;

procedure info_moduly;
begin
 czysc_ekran_gry(0);
 b:=1;
 TextColor(7);
 TextBackground(0);
 okno(19,2,62,20,' INFORMACJE: MODULY ');
 writeln;
 writeln('  Mieszkania..................', mieszkania);
 writeln('  - laczna pojemnosc..........', mieszkania*10*technologia,' osob');
 writeln('  Magazyny....................', magazyny);
 writeln('  - laczna pojemnosc..........', magazyny*100*technologia,' ton');
 writeln('  Ladowiska...................', ladowiska);
 writeln('  Laboratoria.................', laboratoria);
 writeLn('  Fabryki.....................', fabryki);
 writeln;
 writeln('  Farmy.......................', farmy);
 writeln('  - laczna wydajnosc .........', farmy*10*technologia,' ton');
 writeln('  Kopalnie....................', kopalnie);
 writeln('  - laczna wydajnosc .........', kopalnie*10*technologia,' ton');
 writeln('  Fabryki TB..................', fabryki_TB);
 writeln('  - laczna wydajnosc .........', fabryki_TB*10*technologia,' ton');
 writeln('  Elektrownie.................', elektrownie);
 writeln('  - laczna wydajnosc..........', elektrownie*10*technologia,' MW');
 kurs(7);
  repeat
  until keypressed;
 czysc_ekran_gry(0);
 kurs(7);
end;

procedure info_zaopatrzenie;
begin
 czysc_ekran_gry(0);
 b:=1;
 TextColor(7);
 TextBackground(0);
 okno(19,2,62,8,' INFORMACJE: ZAOPATRZENIE ');
 writeln;
 writeln('  Zelazo......................',zelazo,' ton');
 writeln('  Tworzywo bakteryjne.........',tworzywo,' ton');
 writeln('  Uran........................',uran,' ton');
 writeln('  Zywnosc.....................',zywnosc,' racji');
 kurs(7);
  repeat
  until keypressed;
 czysc_ekran_gry(0);
 kurs(7);
end;

procedure info_zaloga;
begin
 czysc_ekran_gry(0);
 b:=1;
 TextColor(7);
 TextBackground(0);
 okno(19,2,62,9,' INFORMACJE: ZALOGA ');
 writeln;
 writeln('  Morale.......................',morale,' %');
 writeln('  Pensja.......................',pensja,' @');
 writeln('  Kolonisci....................',kolon,' os.');
 writeln('  Naukowcy.....................',nauk,' os.');
 writeln('  Zolnieze.....................',zoln,' os.');
 kurs(7);
  repeat
  until keypressed;
 czysc_ekran_gry(0);
 kurs(7);
end;

procedure info_inne;
begin
 czysc_ekran_gry(0);
 b:=1;
 TextColor(7);
 TextBackground(0);
 okno(19,2,62,16,' INFORMACJE: INNE ');
 writeln;
 writeln('  Baza:');
 writeln('  - technologia.................',technologia,' pkt.');
 writeln('  - sila........................',sila,' pkt.');
 writeln('  - dlug........................',dlug,' @');
 writeln;
 writeln('  Planeta:');
 writeln('  - poziom odkrycia.............',odkrycie_pl,' %');
 writeln('  - powierzchnia niezabudowana..',powierzchnia,' ha');
 writeln;
 writeln('  Obcy:');
 writeln('  - sila armii..................',sila_o,' pkt.');
 writeln('  - technologia.................',technologia_o,' pkt.');
 kurs(7);
  repeat
  until keypressed;
 czysc_ekran_gry(0);
 kurs(7);
end;

{----------------------------------------------------------------------------}

procedure raport;
begin
 TextColor(7);
 TextBackground(0);
 okno(19,2,62,23,' RAPORT ');
 kurs(7);
  repeat
  until keypressed;
 czysc_ekran_gry(0);
 kurs(7);
end;

procedure Nastepny_miesiac;
begin
 miesiac:=miesiac+1;
 if miesiac>12 then rok:=rok+1;
 if miesiac>12 then miesiac:=1;
 if kasa>pensja*zoln-pensja*nauk-pensja*kolon then kasa:=kasa-pensja*zoln-pensja*nauk-pensja*kolon else kasa:=0;
 if kasa<0 then kasa:=0;
 textcolor(7);
 TextBackground(0);
 if kasa=0 then brak_kasy;
 if kasa=0 then morale:=morale-10;
 if morale<0 then morale:=0;
 if kasa>99 then punkty:=punkty+1;
 if kasa>999 then punkty:=punkty+10;
 if kasa>999 then punkty:=punkty-1;
 if kasa>9999 then punkty:=punkty+100;
 if kasa>9999 then punkty:=punkty-11;
 Info_bar; kurs(7);
 textcolor(0);
 textbackground(7);
 okno(30, 10, 44, 5,' DALEJ ');
 writeln;
 writeln(' Minal miesiac. Nacisnij jakis klawisz.');
 kurs(7);
 readkey;
 raport;
end;

{----------------------------------------------------------------------------}

procedure czy_koniec;
begin
 textColor(0);
 TextBackground(7);
 okno(30, 10, 39, 6,' KONIEC GRY ');
 writeln;
 writeln(' CZY NA PRAWDE CHCESZ OPUSCIC GRE ');
 write('              (T/N)');
 kurs(7);
 key[3]:=readkey;
 if key[3]='T' then b:=1;
 if key[3]='t' then b:=1;
 czysc_ekran_gry(0);
 kurs(7);
end;

{----------------------------------------------------------------------------}

procedure rozdziel_13;
begin
end;

procedure wybor_13;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_budowa_moduly;
 budowa_modoly;
 repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_13;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_budowa_MODuLY;
  if key[3]=#80 then menu_budowa_MODuLY;
  if key[3]=#72 then pisz_potrzebne_moduly;
  if key[3]=#80 then pisz_potrzebne_moduly;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=10 then b:=1;
  until b=1;
 pozmen[1]:=1;
 zmien_kolory;
 b:=1;
end;

procedure rozdziel_12;
begin
end;

procedure wybor_12;
begin
 il_bud:=1;
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_budowa_maszyny;
 delay(100);
 textColor(7);
 TextBackground(0);
 okno1(41,2,41,12, ' STATYSTYKA ');
 pisz_potrzebne_masz;
 menu_budowa_maszyny;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#77 then il_bud:=il_bud+1;
  if key[3]=#75 then il_bud:=il_bud-1;
  if il_bud<1 then il_bud:=1;
  if key[3]=#13 then rozdziel_12;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then pisz_potrzebne_masz;
  if key[3]=#80 then pisz_potrzebne_masz;
  if key[3]=#75 then pisz_potrzebne_masz;
  if key[3]=#77 then pisz_potrzebne_masz;
  if key[3]=#72 then menu_budowa_maszyny;
  if key[3]=#80 then menu_budowa_maszyny;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=7 then b:=1;
  until b=1;
 pozmen[1]:=9;
 zmien_kolory;
 b:=1;
end;

procedure rozdziel_11;
begin
 if pozmen[1]=1 then info_flota;
 if pozmen[1]=2 then info_moduly;
 if pozmen[1]=3 then info_zaopatrzenie;
 if pozmen[1]=4 then info_zaloga;
 if pozmen[1]=5 then info_inne;
end;

procedure wybor_11;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_informacje;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_11;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_informacje;
  if key[3]=#80 then menu_informacje;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=6 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=9;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_10;
begin
end;

procedure wybor_10;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_ekspansja;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_10;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_ekspansja;
  if key[3]=#80 then menu_ekspansja;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=3 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=7;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_9;
begin
end;

procedure wybor_9;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_port;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_9;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_port;
  if key[3]=#80 then menu_port;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=3 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=6;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_8;
begin
end;

procedure wybor_8;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_nauka;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_8;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_nauka;
  if key[3]=#80 then menu_nauka;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=3 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=5;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_7;
begin
end;

procedure wybor_7;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_zaloga;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_7;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_zaloga;
  if key[3]=#80 then menu_zaloga;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=3 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=4;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_6;
begin
end;

procedure wybor_6;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_bank;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_6;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_bank;
  if key[3]=#80 then menu_bank;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=5 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=3;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_5;
begin
end;

procedure wybor_5;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_zaopatrzenie;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_5;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_zaopatrzenie;
  if key[3]=#80 then menu_zaopatrzenie;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=3 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=2;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
end;

procedure rozdziel_4;
begin
 if pozmen[1]=1 then wybor_12;
 if pozmen[1]=2 then wybor_13;
end;

procedure wybor_4;
begin
 b:=0;
 pozmen[1]:=1;
 zmien_kolory;
 menu_budowa;
  repeat
  key[3]:=readkey;
  if key[3]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[3]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[3]=#13 then rozdziel_4;
  if key[3]=#72 then zmien_kolory;
  if key[3]=#80 then zmien_kolory;
  if key[3]=#72 then menu_budowa;
  if key[3]=#80 then menu_budowa;
  if pozmen[1]=0 then b:=1;
  if pozmen[1]=3 then b:=1;
  until b=1;
 czysc_ekran_gry(0);
 pozmen[1]:=1;
 zmien_kolory;
 menu_glowne_gry;
 b:=0;
 key[2]:=#72;
end;

procedure rozdziel_3;
begin
 if pozmen[1]=1 then wybor_4;
 if pozmen[1]=2 then wybor_5;
 if pozmen[1]=3 then wybor_6;
 if pozmen[1]=4 then wybor_7;
 if pozmen[1]=5 then wybor_8;
 if pozmen[1]=6 then wybor_9;
 if pozmen[1]=7 then wybor_10;
 if pozmen[1]=8 then nastepny_miesiac;
 if pozmen[1]=9 then wybor_11;
 if pozmen[1]=10 then raport;
 if pozmen[1]=12 then czy_koniec;
end;

procedure wybor_3;
begin
 pozmen[1]:=1;
 b:=0;
 zmien_kolory;
 menu_glowne_gry;
  repeat
  key[2]:=readkey;
  if key[2]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[2]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[2]=#13 then rozdziel_3;
  if pozmen[1]<1 then pozmen[1]:=12;
  if pozmen[1]>12 then pozmen[1]:=1;
  if key[2]=#72 then zmien_kolory;
  if key[2]=#80 then zmien_kolory;
  if key[2]=#72 then menu_glowne_gry;
  if key[2]=#80 then menu_glowne_gry;
  if key[2]=#27 then czy_koniec;
  until b=1;
 pozmen[1]:=1;
 b:=0;
end;

procedure Real_game;
begin
 nowa_gra;
 game_screen;
 info_bar;
 menu_glowne_gry;
 wybor_3;
 pozmen[1]:=1;
 kolory_poczatkowe;
 ZMIEN_KOLORY;
 main_logo_screen;
 textbackground(0);
 czysc_ekran_menu;
 menu_poczatkowe;
end;

{----------------------------------------------------------------------------}

procedure informacje;
begin
 czysc_ekran_menu;
 textcolor(15);
 okno( 1,11,80,14,' INFORMACJE ');
 writeln;
 writeln(' Informacje  na temat programu, czyli takie tam bzdury ktorych itak sie nie');
 writeln(' czyta... ');
 kurs(0);
 readkey;
 czysc_ekran_menu;
 menu_poczatkowe;
end;

{----------------------------------------------------------------------------}

procedure rozdziel_1;
begin
 if pozmen[1]=1 then real_game;
 if pozmen[1]=4 then informacje;
 if pozmen[1]=5 then halt;
end;

procedure wybor_1;
begin
 pozmen[1]:=1;
 zmien_kolory;
 menu_poczatkowe;
  repeat
  key[1]:=readkey;
  if key[1]=#72 then pozmen[1]:=pozmen[1]-1;
  if key[1]=#80 then pozmen[1]:=pozmen[1]+1;
  if key[1]=#13 then rozdziel_1;
  if pozmen[1]<1 then pozmen[1]:=5;
  if pozmen[1]>5 then pozmen[1]:=1;
  if key[1]=#72 then zmien_kolory;
  if key[1]=#80 then zmien_kolory;
  if key[1]=#72 then menu_poczatkowe;
  if key[1]=#80 then menu_poczatkowe;
  until key[1]=#27;
end;

{----------------------------------------------------------------------------}

BEGIN
 kolory_poczatkowe;
 main_logo_screen;
 wybor_1;
END.