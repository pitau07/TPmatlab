function [probability] = ptotal( pClass )
    total = 0;
    for i=1:10
       total = total + pClass(i);
    end
    %-- /10 *100 = *10
    probability = total * 10 ;
end

