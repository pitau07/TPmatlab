clc
close all

%-- Image Load --%
I=imread('app.tif');

%-- Recherche des lignes --%
Lignes = seekLines(I);
nbLignes = size(Lignes,1);

%-- Recherche des colonnes --%
Colonnes = seekColumns(I, Lignes);
nbColonnes = size(Colonnes,2)/2;

%-- Recherche des rectangles --%
Rectangles=seekRectangles(I,Lignes,Colonnes);
drawRectangles(I,Rectangles);
save('Rect.mat','Rectangles','-ascii');

%-- Recherche des profils --%
d=8;
Profils = SeekProfiles(I,d,Rectangles,nbLignes,nbColonnes);
ProfilsMoyen=meanProfiles(Profils,d,nbLignes);
save('centre.mat','ProfilsMoyen','-ascii');

%-- calculer distance euclidienne entre ces vecteurs et ceux des centres
Distances=distEuclidienne(Profils,ProfilsMoyen,d,nbLignes,nbColonnes);
%-- determination de la classe de chaque chiffre = indice-1 de la distance min 
[~,Classes]= min(Distances,[],2);
Classes=Classes-1;
