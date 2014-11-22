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
%drawRectangles(I,Rectangles);

%le resultat attendu
Result=zeros(nbLignes*nbColonnes,1);
for i=0:9
    Result(i*nbColonnes+1:i*nbColonnes+nbColonnes)=i;
end

%m=2;
%n=3;

KPPV=zeros(nbLignes*nbColonnes,1);

i=1;
for m=0:10
    %for n=1:10
    n=m;
        Densites=seekDensities(I, nbLignes,nbColonnes, Rectangles, m, n,0);
        BaseApprentissage=apprentissageKPPV(m,n);
        for k=7:7
            %recuperation des vecteurs de densite pour chaque nombre
            %recuperation des KPPV
            Temp=seekKPPV(k,Densites,BaseApprentissage);
            KPPV(:,k)=seekClasse(Temp);
            taux(i)=(nbLignes*nbColonnes-nnz(Result-KPPV(:,k)))*100/(nbLignes*nbColonnes);
            
        end
        i=i+1;
   % end
end

figure
plot((0:10).^2,transpose(taux));
title({'Evolution du taux de reconnaissance en fonction de m*n'});
% Et on nomme les axes
xlabel('m*n nombre composantes du vecteur caractéristique');
ylabel('taux de reconnaissance des chiffres');



