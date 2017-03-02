program le_21;

uses crt; 

const 
	max=21; 
var 
	cpt:integer;

	
function fin (var reste:integer):integer;


begin 
	if (reste=max) then 
		writeln('Perdu');
end;

function joueur_un():integer;
var
	nbjeu:integer;
begin 
	writeln (' joueur 1 un nb d''allumette entre 1 et 3');
	readln (nbjeu);
	while (nbjeu<1) or (nbjeu > 3) do 
	begin
		writeln('j''ai dis entre 1 et 3' ); 
		readln (nbjeu);
	end;
	
	EXIT(nbjeu);
end;

function joueur_2():integer;
var 

	nbjeu:integer;
begin 
	writeln (' joueur 2 un nb d''allumette entre 1 et 3');
	readln (nbjeu);
	while (nbjeu < 1) or (nbjeu > 3) do 
	begin
		writeln('j''ai dis entre 1 et 3' ); 
		readln (nbjeu);
	end;
	EXIT(nbjeu);
end;

var
	nbjeux:integer;
	dernierjoueur:integer;
begin
	nbjeux:=0;
	clrscr;
	repeat
		nbjeux := nbjeux + joueur_un();
		writeln('Vous avez piocher ' , nbjeux , 'batonnets');
		dernierjoueur:=2;
		if(nbjeux < max) then
		begin
			nbjeux := nbjeux + joueur_2();
			writeln('Vous avez piocher ',  nbjeux , 'batonnets');
			dernierjoueur:=1;
		end;
	until (nbjeux >= max);
	writeln('Le gagnant est le joueur ', dernierjoueur);
	readln;
end.