function [ Distances ] = distanceManhattan( Profils,Centre,d,nbClasses,nbColonnes )
    [l,c]=size(Profils);
    p=1;
    Distances=zeros(nbColonnes*nbClasses,nbClasses);% Distances size=[200][10]
    
    % chgt de chiffre toutes les d*2 lignes
   for i=0:2*d:l-2*d
          % pour les c nombres que contient une ligne
        for j=1:c
            %pour les 10 classes
            for k=1:nbClasses
                v=Profils(i+1:i+2*d,j)-Centre(1:2*d,k);
                Distances(p,k)=sum(abs(v));
            end 
            p=p+1;
        end
    end
end

