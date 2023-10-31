uses crt;
var slowa: file of string;
    cyfry: file of longint;
    imiona: array[1..10] of string;
    ruchy: array[1..10] of longint;
    A,B : INTEGER;

BEGIN
 assign (cyfry, 'ruchy.$$$');
 assign (slowa, 'imiona.$$$');
 rewrite(cyfry);
 rewrite(slowa);
 imiona[1]:='0BOHDAN';
 imiona[2]:='1BOHDAN';
 imiona[3]:='2BOHDAN';
 imiona[4]:='3BOHDAN';
 imiona[5]:='4BOHDAN';
 imiona[6]:='5BOHDAN';
 imiona[7]:='6BOHDAN';
 imiona[8]:='7BOHDAN';
 imiona[9]:='8BOHDAN';
 imiona[10]:='9BOHDAN';
 for a:=1 to 10 do;
 begin
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
 end;
 ruchy[1]:=10000000;
 ruchy[2]:=20000000;
 ruchy[3]:=30000000;
 ruchy[4]:=40000000;
 ruchy[5]:=50000000;
 ruchy[6]:=60000000;
 ruchy[7]:=70000000;
 ruchy[8]:=80000000;
 ruchy[9]:=90000000;
 ruchy[10]:=95000000;
 for b:=1 to 10 do;
 begin
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
END.
