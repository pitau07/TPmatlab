function [  ] = drawRectangles( I,Rectangles )
    figure
    imshow(I);
    % Garde l'image actuelle afin d'y ajouter les rectangles
    hold on;

    nbRect = size(Rectangles,1);
    
    for i = 1:nbRect
        %- calcul de l'hauteur et largeur
        w = Rectangles(i,3)-Rectangles(i,1);
        h = Rectangles(i,4)-Rectangles(i,2);
        % On ajoute le rectangles à l'image
        rectangle('position',[Rectangles(i,1),Rectangles(i,2),w,h],'Edgecolor','g');
    end

    hold off;



end

