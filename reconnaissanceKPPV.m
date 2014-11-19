clc
clear all
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
drawRectangles(I,Rectangles);

%-- Recherche des profils --%

%le resultat attentu
Result=zeros(nbLignes*nbColonnes,1);
for i=0:9
    Result(i*nbColonnes+1:i*nbColonnes+nbColonnes)=i;
end

m=2;
n=3;

KPPV=zeros(nbLignes*nbColonnes,15);
Densites=zeros(nbLignes*nbColonnes,m*n);

for i=1:nbLignes*nbColonnes
   Densites(i,:)=seekDensity(I(Rectangles(i,2):Rectangles(i,4),(Rectangles(i,1):Rectangles(i,3))),m,n);
end

BaseApprentissage=apprentissageKPPV(m,n);
for k=1:15
    %recuperation des vecteurs de densite pour chaque nombre
    %recuperation des KPPV
    Temp=seekKPPV(k,Densites,BaseApprentissage);
    KPPV(:,k)=seekClasse(Temp);
end



