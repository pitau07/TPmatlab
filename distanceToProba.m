function [Proba] = distanceToProba(Distances)
    Proba = zeros(100,10);
    for i=1:100
        denominateur = 0;
        numerateur=zeros(10,1);
        for j=1:10
                denominateur = denominateur + exp(-Distances(i,j));
                numerateur(j)=exp(-Distances(i,j));
        end
        for j=1:10
            Proba(i,j)=numerateur(j)/denominateur;
        end
    end
end

