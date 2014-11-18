%apprentissage --> construire vecteur densite pour chaque chiffre
close all
clear all
clc

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

%-- Recherche des vecteurs caracterisqtiques --%
m=5;
n=5;
densites=zeros(nbLignes*nbColonnes,m*n);
for i=1:nbLignes*nbColonnes
    densites(i,:)=seekDensity(I(Rectangles(i,2):Rectangles(i,4),(Rectangles(i,1):Rectangles(i,3))),m,n);
end
save('densite.mat','densites','-ascii');