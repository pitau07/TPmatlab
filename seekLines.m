function [ Lignes ] = seekLines( I )
    line = size(I,1);
    
    %-- Recherche des lignes --%
    S = sum(I<50,2);
  
    %-- Recherche des paliers --%
    Lignes = zeros(10,2);
    p = 1;
    
    i=1;

    %-- Indice lignes stockees dans Lignes --%
    while i <= line
        
         if S(i) ~= 0 
            Lignes(p,1) = i;

            while ( i<= line && S(i) ~= 0 ) 
               i=i+1;
            end

            if i<= line 
                Lignes(p,2) = i;
                p = p+1;
            end
         end

         i= i +1;
    end
    
end

