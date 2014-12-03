function [ Result ] = neighToProba( KPPV, k)
    class = 0;
    Proba = zeros(100,1);
    for i=1:100
        occ = 0;
        for j=1:3
            if(KPPV(i,j) == class)
              occ = occ + 1;
            end
        end
        Proba(i) = occ / k;
        if mod(i,10) == 0
            class = class + 1;
        end
    end
    
    Result = zeros(10,1);
 
    
    a = -9;
    b = 0;
    
    for i=1:10    
        a = a + 10;
        b = b + 10;
        Result(i) = mean(Proba([a,b]));
    end
end

