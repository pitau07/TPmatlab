function [ Profils ] = seek_LandR_Profiles( I,d, Line ) 
%retourne 1 colonne par chiffre
%ligne 1 à d profil gauche,reste profil droit

    Profils = zeros(d*2,20);
    %pour toute la ligne de chiffres
    for i=1:20
        w = Line(i,3) - Line(i,1);
        pts = floor(linspace(Line(i,2), Line(i,4),d));
        %pour chaque chiffre, on le divise en d parties
        for j=1:d
            %profil gauche
            k=Line(i,1);
            while k <= Line(i,3) && I(pts(j),k)~= 0
                k=k+1;
            end
            gauche=k;
            
            %profil droit
            k=Line(i,3);
            while k >= Line(i,1) && I(pts(j),k)~= 0
                k=k-1;
            end
            droite=k;
           
            Profils(j,i)=(gauche-Line(i,1))/w;
            Profils(j+d,i)=(Line(i,3)-droite)/w;
        end
    end
    
    
end

