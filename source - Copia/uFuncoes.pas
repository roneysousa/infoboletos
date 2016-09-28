unit uFuncoes;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, StdCtrls, Mask,
ExtCtrls, DateUtils;


function StrZero(Zeros:string;Quant:integer):String;
function Empty(inString:String): Boolean;
function RemoveChar(Const Texto:String):String;
Function Acrescentar_Dias_Data(M_DATA : TDate) : TDate;
function FormataCep(M_NUNCEP : string) : String;
function FormataCPF(cTexto : String) : String;
function FormataCNPJ(CNPJ: string): string;
function FormataFONE(sFONE: string): string;
function FormataPlaca(sPlaca: string): string;
function RetirarCarecterAtalho(const texto : string) : string;
function PadC(S:string;Len:byte):string;
function Gerapercentual(valor:real;Percent:Real):real;
function Arredondar(Valor: Double; Dec: Integer): Double;
function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
function AnsiToAscii ( str: String ): String;
function Data_Juliana (Data_Atual: TDateTime): String;
function extenso (valor: real): string;
Function Alltrim(const Search: string): string;
Function Replicate( Caracter:String; Quant:Integer ): String;
Function ContaCaracs(Edit:String): integer;
Function Codifica( const Str1: string): String;
function FileExistsNew(const FileName: string): Boolean;


implementation

Function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
End;

Function ContaCaracs(Edit: String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
     Result := Length(Edit);
end;

Function Codifica( const Str1: string): String;
{Encripta uma string}
var
Mascara,Str2: String;
PonM, PonS: Byte;
begin
Mascara := '#$%$'#13#12;
Str2 := '';
PonM := 1;
for PonS:=1 to length(Str1) do
  begin
  AppendStr( Str2, Chr( Ord(Str1[PonS]) Xor Ord(Mascara[PonM])));
  Inc( PonM);
  if PonM>Length(Mascara) then
  begin
  PonM:=1;
  end;
  Result := Str2;
  end;
end;

function Replicate(Caracter: String; Quant: Integer): String;
{Repete o mesmo caractere várias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

function Empty(inString:String): Boolean;
{Testa se a variavel está vazia ou não}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;

function RemoveChar(Const Texto:String):String; 
// 
// Remove caracteres de uma string deixando apenas numeros 
// 
var 
I: integer; 
S: string; 
begin 
S := ''; 
for I := 1 To Length(Texto) Do 
begin 
if (Texto[I] in ['0'..'9']) then 
begin 
S := S + Copy(Texto, I, 1); 
end; 
end; 
result := S; 
end;

Function Acrescentar_Dias_Data(M_DATA : TDate) : TDate;
Var
   M_DIA, M_DIA_MES : Integer;
   Ano, Mes, Dia : word;
BEGIN
     DecodeDate (M_Data, Ano, Mes, Dia);
     //
     M_DIA := StrtoInt(Copy(DatetoStr(M_DATA),1,2));
     //
     M_Data := IncDay(M_Data, 10);
     //
     Result := M_Data;

End;

function FormataCep(M_NUNCEP : string) : String;
Begin
     Result := Copy(M_NUNCEP,1,5)+'-'+Copy(M_NUNCEP,6,3);
End;


function FormataCPF(cTexto : String) : String;
begin
     //  999.999.999-99
     result := Copy(cTexto,1,3)+'.'+
               Copy(cTexto,4,3)+'.'+
               Copy(cTexto,7,3)+'-'+
               Copy(cTexto,10,2);
end;

function FormataCNPJ(CNPJ: string): string;
begin
  Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+
    Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;

function FormataFONE(sFONE: string): string;
Begin
     // 99 9999 9999
     result := '('+Copy(sFONE,1,2)+')'
                  +Copy(sFONE,3,4)+'-'
                  +Copy(sFONE,7,4);
End;

function PadC(S:string;Len:byte):string;
// Centraliza uma string em um espaço determinado
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then
  begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do
  begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do
  begin
  str := str+s[L];
  end;
 Result := str;
end;

function RetirarCarecterAtalho(const texto : string) : string;
Var
  i, tamanho : integer;
begin
     tamanho := Length(texto);
     for i := 1 to tamanho do
      if texto[i] <> '&' then
        Result := Result + texto[i];
End;

function Gerapercentual(valor:real;Percent:Real):real;
// Retorna a porcentagem de um valor
begin
percent := percent / 100;
try
  valor := valor * Percent;
finally
  result := valor;
end;
end;

function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;


function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('¦','§','¬','¼','#','‚','%','¨','&','½',
                                     '¿','ß','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);   
   Result := xTexto;
end;

function AnsiToAscii ( str: String ): String; 
var 
i: Integer; 
begin 
for i := 1 to Length ( str ) do 
case str[i] of
'á': str[i] := 'a'; 
'é': str[i] := 'e'; 
'í': str[i] := 'i'; 
'ó': str[i] := 'o'; 
'ú': str[i] := 'u'; 
'à': str[i] := 'a'; 
'è': str[i] := 'e'; 
'ì': str[i] := 'i'; 
'ò': str[i] := 'o'; 
'ù': str[i] := 'u'; 
'â': str[i] := 'a'; 
'ê': str[i] := 'e'; 
'î': str[i] := 'i'; 
'ô': str[i] := 'o'; 
'û': str[i] := 'u'; 
'ä': str[i] := 'a'; 
'ë': str[i] := 'e'; 
'ï': str[i] := 'i'; 
'ö': str[i] := 'o'; 
'ü': str[i] := 'u'; 
'ã': str[i] := 'a'; 
'õ': str[i] := 'o'; 
'ñ': str[i] := 'n'; 
'ç': str[i] := 'c'; 
'Á': str[i] := 'A'; 
'É': str[i] := 'E'; 
'Í': str[i] := 'I'; 
'Ó': str[i] := 'O'; 
'Ú': str[i] := 'U'; 
'À': str[i] := 'A'; 
'È': str[i] := 'E'; 
'Ì': str[i] := 'I'; 
'Ò': str[i] := 'O'; 
'Ù': str[i] := 'U'; 
'Â': str[i] := 'A'; 
'Ê': str[i] := 'E'; 
'Î': str[i] := 'I'; 
'Ô': str[i] := 'O'; 
'Û': str[i] := 'U'; 
'Ä': str[i] := 'A'; 
'Ë': str[i] := 'E'; 
'Ï': str[i] := 'I'; 
'Ö': str[i] := 'O'; 
'Ü': str[i] := 'U'; 
'Ã': str[i] := 'A'; 
'Õ': str[i] := 'O'; 
'Ñ': str[i] := 'N'; 
'Ç': str[i] := 'C'; 
end; 
Result := str; 
end;

function Data_Juliana (Data_Atual: TDateTime): String;
var
    Ano, Mes, Dia: Word;
    Data_Final, Data_Inicial: String;
    Resultado: Real;
begin
    //DecodeDate (Date, Ano, Mes, Dia);
    DecodeDate (Data_Atual, Ano, Mes, Dia);
    Data_Final := DateToStr (Data_Atual);
    Data_Inicial := '31/12/' + IntToStr (Ano - 1);
    Resultado := StrToDate (Data_Final) - StrToDate (Data_Inicial);
    Result := FloatToStr (Resultado);
end;

function FormataPlaca(sPlaca: string): string;
begin
    Result := Copy(sPlaca, 1,3)+'-'+Copy(sPlaca, 4,4);
End;

function extenso (valor: real): string;
var
    Centavos, Centena, Milhar, Milhao, Texto, msg: string;
    const
        Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
        Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
        Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
        Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
        function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
        begin
                if Expressao then
                     Result:=CasoVerdadeiro
                else
                     Result:=CasoFalso;
        End;

        function MiniExtenso (trio: string): string;
        var
                Unidade, Dezena, Centena: string;
        begin
                Unidade:='';
                Dezena:='';
                Centena:='';
                if (trio[2]='1') and (trio[3]<>'0') then
                  begin
                       Unidade:=Dez[strtoint(trio[3])];
                       Dezena:='';
                  end
                  else
                  begin
                       if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
                         if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
                  end;
                if (trio[1]='1') and (Unidade='') and (Dezena='')
                 then Centena:='cem'
                else
                 if trio[1]<>'0'
                  then Centena:=Centenas[strtoint(trio[1])]
                  else Centena:='';
                 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
                  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
                end;
begin
      if (valor>999999.99) or (valor<0) then
       begin
              msg:='O valor está fora do intervalo permitido.';
              msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
              msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
              showmessage(msg);
              Result:='';
              exit;
       end;
      if valor=0 then
       begin
        Result:='';
        Exit;
       end;
      Texto:=formatfloat('000000.00',valor);
      Milhar:=MiniExtenso(Copy(Texto,1,3));
      Centena:=MiniExtenso(Copy(Texto,4,3));
      Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
      Result:=Milhar;
      if Milhar<>'' then
        if copy(texto,4,3)='000' then
              Result:=Result+' Mil Reais'
        else
              Result:=Result+' Mil, ';
      if (((copy(texto,4,2)='00') and (Milhar<>'')
        and (copy(texto,6,1)<>'0')) or (centavos=''))
        and (Centena<>'') then Result:=Result+' e ';
      if (Milhar+Centena <>'') then Result:=Result+Centena;
      if (Milhar='') and (copy(texto,4,3)='001') then
        Result:=Result+' Real'
       else
        if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
      if Centavos='' then
       begin
        Result:=Result+'.';
        Exit;
       end
      else
       begin
        if Milhar+Centena='' then
              Result:=Centavos
        else
              Result:=Result+', e '+Centavos;
        if (copy(texto,8,2)='01') and (Centavos<>'') then
        Result:=Result+' Centavo'
       else
        Result:=Result+' Centavos';
      end;
end;

function FileExistsNew(const FileName: string): Boolean;
{$IFDEF MSWINDOWS}
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(FileName));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
end;
{$ENDIF}
{$IFDEF LINUX}
begin
  Result := euidaccess(PChar(FileName), F_OK) = 0;
end;
{$ENDIF}

end.
