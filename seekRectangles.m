function [ Rectangles ] = seekRectangles( I,Lignes,Colonnes )
    nbLignes=size(Lignes,1);
    nbCol=size(Colonnes,2);
    Rectangles=zeros(200,4);
    k=1;
    
    %- pour chaque chiffre detecte on va definir un rectangle l'englobant
    for i=1:nbLignes
       for j=1:2:nbCol-1
          
          L=seekLines(I(Lignes(i,1):Lignes(i,2),Colonnes(i,j):Colonnes(i,j+1)));
          Rectangles(k,1)=Colonnes(i,j);
          %- on reduit l'image donc penser à ajouter les pixels de la ligne à
          %la coordonnee en y
          Rectangles(k,2)=L(1,1)+Lignes(i,1);
          Rectangles(k,3)=Colonnes(i,j+1);
          Rectangles(k,4)=L(1,2)+Lignes(i,1);
          
          k=k+1;
       end
    end

end

