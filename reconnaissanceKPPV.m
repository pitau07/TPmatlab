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

%le resultat attendu
Result=zeros(nbLignes*nbColonnes,1);
for i=0:9
    Result(i*nbColonnes+1:i*nbColonnes+nbColonnes)=i;
end

%m=2;
%n=3;

KPPV=zeros(nbLignes*nbColonnes,1);

i=2;
taux=zeros(11,1);
 

for m=5:5
    n=m;
    Densites=seekDensities(I, nbLignes,nbColonnes, Rectangles, m, n,0);
    BaseApprentissage=apprentissageKPPV(m,n);
    for k=1:10
        %recuperation des vecteurs de densite pour chaque nombre
        %recuperation des KPPV
        Temp=seekKPPV(k,Densites,BaseApprentissage);
        KPPV(:,k)=seekClasse(Temp);
        taux(i)=(nbLignes*nbColonnes-nnz(Result-KPPV(:,k)))*100/(nbLignes*nbColonnes);
        i=i+1;
    end
end

figure
plot((0:10),transpose(taux));
title({'Evolution du taux de reconnaissance en fonction de k avec m=n=5'});
% Et on nomme les axes
xlabel('nombre de k plus proches voisins');
ylabel('taux de reconnaissance des chiffres');



