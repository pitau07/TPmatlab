clear

%-- Image Load --%
I=imread('app.tif');

%- Inversion de l'image -%
Ib= 255-I;

%-- Recherche des lignes --%
Lignes = seekLines(I);

%-- Recherche des colonnes --%
Colonnes = seekColumns(I, Lignes);

%-- Recherche des rectangles --%
Rectangles=seekRectangles(I,Lignes,Colonnes);
drawRectangles(I,Rectangles);
save('Rect.mat','Rectangles','-ascii');



 