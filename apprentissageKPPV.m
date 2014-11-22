function [ densites ] = apprentissageKPPV(m,n)

    %apprentissage --> construire vecteur densite pour chaque chiffre
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
    save('Rect.mat','Rectangles','-ascii');

    %-- Recherche des vecteurs caracterisqtiques --%

    densites=seekDensities(I, nbLignes,nbColonnes, Rectangles, m, n,0);
    save('densite.mat','densites','-ascii');
    
end