clc
close all

%parametres
fileName='test.tif';
d=5;

m=3;
n=4;
k=7;

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
Profils = SeekProfiles(I,d,Rectangles,nbLignes,nbColonnes);
ProfilsMoyen=load('centre.mat','-ascii');

%le resultat attentu
Result=zeros(nbLignes*nbColonnes,1);
for i=0:9
    Result(i*nbColonnes+1:i*nbColonnes+nbColonnes)=i;
end

%-- calculer distance euclidienne entre ces vecteurs et ceux des centres
Distances=distEuclidienne(Profils,ProfilsMoyen,d,nbLignes,nbColonnes);
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
 
%Densites=zeros(nbLignes*nbColonnes,m*n);
%for i=1:nbLignes*nbColonnes
%    Densites(i,:)=seekDensity(I(Rectangles(i,2):Rectangles(i,4),(Rectangles(i,1):Rectangles(i,3))),m,n);
%end

Densities = seekDensities(I, nbLignes,nbColonnes, Rectangles, m, n);


BaseApprentissage=load('densite.mat','-ascii');
%-- recuperation des KPPV
Temp=seekKPPV(k,Densities,BaseApprentissage);
KPPV=seekClasse(Temp);

%-- statistique de reconnaissance 
drawStat(k,m,n,Result,KPPV,nbColonnes,nbLignes);


