program  Pendu;
uses crt;
procedure MotATrouver(var Mot:string);
begin
	repeat
		writeln('Veuillez entrer le mot que vous voulez faire chercher(10 lettres max)');
		readln(Mot); // Le mot a chercher
	Until (length(Mot)<=10); // On definit le nombre de charactere max a 10
end;
Function TailleDuMot(var Mot:string):integer;
begin
	TailleDuMot:=length(Mot);
end;
Type
	Tab1=Array [1..10] of char;
Procedure LettreCherchee(var Lettre:char;var T1:Tab1;var Mot:string;var Vie:integer;var Compteur:integer);
var
	i:integer;
	Total:integer;
	TotalWin:integer;
begin
	clrscr;
	Total:=0;
	Writeln('Veuillez entrer la lettre choisie: ');
	readln(Lettre);
	For i:=1 to TailleDuMot(Mot) do
		begin
			If Lettre=Mot[i] then
				begin
				T1[i]:=Lettre;
				Total:=Total+1;
				Compteur:=Compteur+1
				end
		end;
	If Total=0 then
		begin
			Vie:=Vie-1;
		end;
end;	
{Function NombredePV (var Lettre:char;Var Mot:string):integer;
var
	i:integer;
	Total:integer;
begin
	Total:=0;
	For i:=1 to TailleDuMot(Mot) do
		begin
			If Lettre=Mot[i] then
				begin
				Total:=total+1;
				end;
		end;
	If Total=0 then
		begin
			NombreDePV:=NombreDePV-1;
		end;
end;}
Procedure Affichage(var T1:Tab1;var Lettre:char;Var Mot:string;var Vie:integer);
var
	i:integer;
begin
	clrscr;
	writeln ('Vous avez ',Vie,' Vie');
	writeln('Lettres trouvees');
	For i:=1 to TailleDuMot(Mot) do
		begin
			If Mot[i]=T1[i] then
				write(T1[i]+' ')
			else
				write('- ')
		end;
	readln;
end;
	
	
	
VAR
	Mot:string;
	Lettre:char;
	T1:Array [1..10] of Char;
	Vie:integer;
	Compteur:integer;
BEGIN
	clrscr;
	Vie:=5;
	MotATrouver(Mot);
	writeln('Le mot a trouver fait ',length(Mot),' lettres');
	Repeat
		LettreCherchee(Lettre,T1,Mot,Vie,Compteur);
		Affichage(T1,Lettre,Mot,Vie);
	Until ((Vie=0) OR (Compteur=TailleDuMot(Mot)));
	readln;
	clrscr;
	If Vie=0 then
		begin
			writeln('Vous avez Perdu !');
			writeln('Le mot a trouve etait : ',Mot)
		end
	else
		writeln('Vous avez Gagne !');
	readln;
end.