clc
close all

%parametres
fileName='test.tif';
d=6;

m=5;
n=5;
k=2;

%apprentissage
%si le fichier centre n'existe pas, il faut le creer
%if exist('centre.mat', 'file')~=2
   apprentissage(d);
%end


%-- Image Load --%
I=imread(fileName);

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
Profils = SeekProfiles(I,d,Rectangles,nbColonnes,1);
ProfilsMoyen=load('centre.mat','-ascii');

%le resultat attendu
Result=zeros(nbLignes*nbColonnes,1);
for i=0:9
    Result(i*nbColonnes+1:i*nbColonnes+nbColonnes)=i;
end

%-- calculer distance euclidienne entre ces vecteurs et ceux des centres
Distances=distEuclidienne(Profils,ProfilsMoyen,d,nbLignes,nbColonnes);

%-- calcul des probabilitÚs d'appartenance aux classes
Proba1 = distanceToProba(Distances);

%-- determination de la classe de chaque chiffre = indice-1 de la distance min 
[~,index]= min(Distances,[],2);
Classe=zeros(nbLignes*nbColonnes,1);
Classe(1:nbLignes*nbColonnes)=index-1;

%-- statistique de reconnaissance 
drawStat(d,0,0,Result,Classe,nbColonnes,nbLignes);

%-- KPPV
%apprentissage
%if exist('densite.mat', 'file')~=2
   apprentissageKPPV(m,n);
%end

%-- recuperation des vecteurs de densite pour chaque nombre
Densities = seekDensities(I, nbLignes,nbColonnes, Rectangles, m, n,1);

BaseApprentissage=load('densite.mat','-ascii');

%-- recuperation des KPPV
Temp=seekKPPV(k,Densities,BaseApprentissage);
KPPV=seekClasse(Temp);

%-- Calcul des probabilitÚs
Proba2 = computeProbaKPPV(Temp,k);

%-- statistique de reconnaissance 
drawStat(k,m,n,Result,KPPV,nbColonnes,nbLignes);

%-- Combinaison de classifieurs

somme=Proba1+Proba2;
prod=Proba1.*Proba2;

[~,resultSomme]=max(somme,[],2);
[~,resultProd]=max(prod,[],2);

resultSomme=resultSomme-1;
drawStat(k,m,n,Result,resultSomme,nbColonnes,nbLignes);
resultProd=resultProd-1;
drawStat(k,m,n,Result,resultProd,nbColonnes,nbLignes);

 
    
    
    
    