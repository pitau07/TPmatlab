function [Proba] = distanceToProba(Distances)
    [l,c]=size(Distances);
    Proba = zeros(l,c);
    for i=1:l
        denominateur = 0;
        numerateur=zeros(c,1);
        for j=1:c
                denominateur = denominateur + exp(-Distances(i,j));
                numerateur(j)=exp(-Distances(i,j));
        end
        for j=1:c
            Proba(i,j)=numerateur(j)/denominateur;
        end
    end
end

