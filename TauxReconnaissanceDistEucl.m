clc
close all

%-- Image Load --%
I=imread('test.tif');

%-- Recherche des lignes --%
Lignes = seekLines(I);
nbLignes = size(Lignes,1);

%-- Recherche des colonnes --%
Colonnes = seekColumns(I, Lignes);
nbColonnes = size(Colonnes,2)/2;

%-- Recherche des rectangles --%
Rectangles=seekRectangles(I,Lignes,Colonnes);

%-- Recherche des profils --%
Classes=zeros(nbLignes*nbColonnes,15);
Classes2=zeros(nbLignes*nbColonnes,15);
%le resultat attendu
Result=zeros(nbLignes*nbColonnes,1);
for i=0:9
    Result(i*nbColonnes+1:i*nbColonnes+nbColonnes)=i;
end

for d=1:15
    Profils = SeekProfiles(I,d,Rectangles,nbColonnes,0);
    ProfilsMoyen=apprentissage(d);

    %-- calculer distance euclidienne entre ces vecteurs et ceux des centres
    Distances=distEuclidienne(Profils,ProfilsMoyen,d,nbLignes,nbColonnes);
    %-- determination de la classe de chaque chiffre = indice-1 de la distance min 
    [~,index]= min(Distances,[],2);
    Classes(1:nbLignes*nbColonnes,d)=index-1;
end


%chooseBestD(Result,Classes);


for d=1:15
    Profils = SeekProfiles(I,d,Rectangles,nbColonnes,0);
    ProfilsMoyen=apprentissage(d);

    %-- calculer distance euclidienne entre ces vecteurs et ceux des centres
    Distances=distanceManhattan(Profils,ProfilsMoyen,d,nbLignes,nbColonnes);
    %-- determination de la classe de chaque chiffre = indice-1 de la distance min 
    [~,index]= min(Distances,[],2);
    Classes2(1:nbLignes*nbColonnes,d)=index-1;
end


chooseBestD(Result,Classes,Classes2);

