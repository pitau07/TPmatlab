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

%-- Dist Euclidienne minimum --%
for i=0:10:90 
    Vecteur(i+1:i+10,1:20) = seek_LandR_Profiles( I,5, Rectangles(2*i+1:2*i+20,1:4) );
end
ProfilsMoyen=meanProfiles(Vecteur);
