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

ProfilsMoyen=meanProfiles(Profils,5);

