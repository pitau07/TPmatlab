function [ Distances ] = distEuclidienne( Vecteur,Centre,d )
   % � tester avec Centre size=[d*2][10]
    n=size(Centre,1);
    c=size(Vecteur,2);
    p=1;
    Distances=zeros(c*2*d,n/(2*d));% Distances size=[200][10]
    
    % chgt de chiffre toutes les d*2 lignes
    for i=0:2*d:n-2*d
        % pour les c nombres que contient une ligne
        for j=1:c
            %pour les 10 classes
            for k=1:10
                v=Vecteur(2*i+1:i+2*d,j)-Centre(1:2*d,k);
                Distances(p,k)=sqrt(sum(v.^2));
            end 
            p=p+1;
        end
    end
end

