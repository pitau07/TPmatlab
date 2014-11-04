clc
close all

%-- Image Load --%
I=imread('app.tif');

%-- Recherche des lignes --%
Lignes = seekLines(I);

%-- Recherche des colonnes --%
Colonnes = seekColumns(I, Lignes);

%-- Recherche des rectangles --%
Rectangles=seekRectangles(I,Lignes,Colonnes);
drawRectangles(I,Rectangles);
save('Rect.mat','Rectangles','-ascii');

%-- Recherche des profils --%
Profils = SeekProfiles(I,5,Rectangles);

ProfilsMoyen=meanProfiles(Vecteur);


%-- calculer distance euclidienne entre ces vecteurs et ceux des centres
Distances=distEuclidienne(Vecteur,ProfilsMoyen,5);
%-- determination de la classe = indice-1 de la distance min 
[Min,Classes]= min(Distances,[],2);
Classes=Classes-1;