function [ ProfilsMoyen ] = apprentissage(d)
    %apprentissage --> construire vecteur caracteristique pour chaque chiffre

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

    %-- Recherche des profils --%
    Profils = SeekProfiles(I,d,Rectangles,nbColonnes,0);
    ProfilsMoyen=meanProfiles(Profils,d,nbLignes);
    save('centre.mat','ProfilsMoyen','-ascii');
    
end
