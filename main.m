clc
close all

%parametres
fileName='test.tif';
d=5; %remplir avec chooseBestD ?

%apprentissage
%si le fichier centre n'existe pas, il faut le creer
if exist('centre.mat', 'file')~=2
   apprentissage;
end


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

%statistique de reconnaissance 
drawStat(d,Result,Classe,nbColonnes,nbLignes);



