function [ Classes ] = seekKPPV( k,Vecteur,Base )
    l = size(Vecteur,1);
    lBase = size(Base,1);
    Distances=zeros(l,lBase);
    
    for i=1:l
        for j=1:lBase
            v=Vecteur(i,:)-Base(j,:);
            Distances(i,j) = sqrt(sum(v.^2));
        end
    end
    
    Classes=zeros(l,k);
    %recherche des k plus petites distances
    for i=1:l
        for j=1:k
            [~,index] = min(Distances(i,:));
            Classes(i,j)=floor((index-1)/20);
            %permet de ne plus prendre en compte ce min
            Distances(i,index) = 1000;
        end
    end
  
end

