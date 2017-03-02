{ALGO: Allumettes1v1ou1vIA
BUT:Creer le jeu d'allumettes basiques
ENTREE:1v1ou1vIA;
SORTIE:Le jeu des allumettes basiques
CONST
	Min=1
	Max=3
Procedure Initialisation (var NbAll:ENTIER);
DEBUT
	NbALL<-21
FINProcedure


Fonction AllJ1(var NbJ1:ENTIER):Booleen
DEBUT
	Repeter
		ECRIRE ('Joueur 1: Entrer le nombre d''allumettes (1 a 3))
		LIRE (NbJ1)
		JUSQUA (NbJ1>0) ET (NbJ1<4)
	FINRepeter
FINFonction


Procedure Joueur1 (var NbAll:ENTIER;var NbJ1:ENTIER)*
DEBUT
	AllJ1(NbJ1)
	SI NbAll-NbJ1<= 1 Alors
		ECRIRE ('Victoire JOUEUR2')
		NbAll<-0
	SINON
		NbAll<- Nball-NbJ1
	FINSi
	SI NbAll>1 Alors
		ECRIRE ('Il reste : ',NbAll,' allumettes')
	FINSi
FINFonction


Fonction AllJ2(var NbJ2:ENTIER)
DEBUT
	Repeter
		ECRIRE ('JOUEUR 2 : Entrez le nombre d''allumette(s) (1 a 3)')
		LIRE (NbJ2)
		JUSQUA NbJ2>0 ET NbJ2<4
	FINRepeter
FINFonction
Procedure Joueur2 (var NbAll:ENTIER;var NbJ2:ENTIER)
DEBUT
	AllJ2(NbJ2)
	SI NbAll-NbJ2<= 1 Alors
		ECRIRE ('Victoire JOUEUR1')
		NbAll<-0
	SINON
		NbAll<-NbAll-NbJ2
	FINSi
	SI Nball>1 Alors
		ECRIRE ('Il reste : ',NbAll,' allumettes')
	FINSi
FINProcedure


Fonction AllIA (var NbIA:ENTIER; var NbAll:ENTIER): Booleen
DEBUT
	SI NbAll>4 alors
		Randomize;
		NbIA<-Random(Max-Min+1)+Min
	SINON
		CAS NbAll PARMIS
		2:NbIA<-1
		3:NbIA<-2
		4:NbIA<-3
	FINSi
	ECRIRE ('L''IA A JOUE ',NbIA)
FINFonction


Procedure IA (var NbAll:ENTIER;var NbIA:ENTIER)
DEBUT
	AllIA(NbIA,NbAll)
	SI NbAll-NbIA<= 1 Alors
		ECRIRE ('VICTOIRE IA')
		NbAll<-0
	SINON
		NbAll<-NbAll-NbIA
	FINSi
	SI NbAll>1 Alors
		ECRIRE ('Il reste : ',NbAll,' allumettes')
	FINSi
FINProcedure


Procedure Victoire (var NbAll:ENTIER;var NbJ1:ENTIER;var NbJ2:ENTIER;var test:ENTIER;var NbIA:ENTIER)
DEBUT
	Repeter
		ECRIRE ('Tapez 1 pour jouer contre un IA et 2 pour jouer a 2')
		LIRE (test)
		JUSQUA ((test=1) OU (test=2))
	FINRepeter
	Repeter
		Joueur1(NbAll,NbJ1)
		SI NbAll>1 Alors
			SI test=1 Alors
			IA(NbAll,NbIA)
		SINONSi test=2 then
			Joueur2(NbAll,NbJ2)
		FINSi
		JUSQUA NbAll<=1
	FINRepeter
FINProcedure

// programme principal 
VAR
	NbAll,NbJ1,NbJ2,NbIA:ENTIER
	test:ENTIER
DEBUT
	Initialisation(NbAll)
	Victoire(NbAll,NbJ1,NbJ2,test,NbIA)
FIN.
}
Program IA_Allumette;
uses crt;
CONST
    Min=1;
    Max=3;
Procedure initialisation (var NbAll:integer);
Begin
    NbAll:=21;
End;
// Le tour de jeu du joueur 1 
Function AllJ1(var NbJ1:integer):Boolean;
Begin
    Repeat
        Begin
            Writeln('JOUEUR 1 : Entrez le nombre d''allumette(s) (1 a 3)');
            Readln(NbJ1);
        End;
    Until (NbJ1>0) AND (NbJ1<4);
End;
// ce qui ce passe après le tour de jeu du jouer 1 
Procedure Joueur1 (var NbAll:integer; var NbJ1:integer);
Begin
    AllJ1(NbJ1);
    If NbAll-NbJ1 <= 1 then
    Begin
        Writeln('VICTOIRE JOUEUR 1');
        NbAll:=0;
    End
    Else
    NbAll:=NbAll-NbJ1;
    if NbAll>1 then
    Begin
        Writeln('Il reste : ',NbAll,' allumettes');
    End;
End;
// tour de jeu de l'ia 
Function AllIA (var NbIA:integer; var NbAll:integer):Boolean;
Begin
    If NbAll>4 then
        Begin
            Randomize;
            NbIA:=Random(Max-Min+1)+Min;
        End
    Else
    Begin
        Case NbAll of
            2:NbIA:=1;
            3:NbIA:=2;
            4:NbIA:=3;
        End;
    End;
    Writeln('L''IA A JOUE ',NbIA);
End;
// ce qui se passe après le tour de jeu de l'ia 
Procedure IA (var NbAll:integer; var NbIA:integer);
Begin
    AllIA(NbIA,NbAll);
    If NbAll-NbIA <= 1 then
    Begin
        Writeln('VICTOIRE IA');
        NbAll:=0;
    End
    Else
    NbAll:=NbAll-NbIA;
    if NbAll>1 then
    Begin
        Writeln('Il reste : ',NbAll,' allumettes');
    End;
End;
//condition de victoire 
Procedure Victoire (var NbAll:integer; var NbJ1:integer; var NbIA:integer);
Begin
    Repeat
        Begin
            Joueur1(NbAll,NbJ1);
            If NbAll>1 then
                IA(NbAll,NbIA)
            Else
        End;
    Until NbAll<=1;
End;
// programme principal 
VAR
    NbAll,NbJ1,NbIA:integer;
Begin
    Initialisation(NbAll);
    clrscr;
    Victoire(NbAll,NbJ1,NbIA);
    Readln;
END.