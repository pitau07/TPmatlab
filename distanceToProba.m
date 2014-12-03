function [Proba] = distanceToProba(Distances)
    class = 1;
    Proba = zeros(100,1);
    for i=1:100
        temp = 0;
        for j=1:10
            temp = temp + exp(-Distances(i,j));
        end
        Proba(i) = exp(-Distances(i,class)) * 100 / temp;
        if mod(i,10) == 0
            class = class + 1;
        end
    end
end

