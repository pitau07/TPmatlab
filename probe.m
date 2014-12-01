function [ result ] = probe(Classe)
   i = 1;
   class = 0;
   count = 0;
   result = zeros(10,1);
   
   while i < 100
        for j = i:9+i
            if class == Classe(j)
                count = count + 1;
            end
        end
        result(class+1) = count/10;
        class = class + 1;
        count = 0;
        i = i +10;
   end
       
end

