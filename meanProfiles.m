function [ profilsMoyen ] = meanProfiles( Profils ,d,nbClasses)
    t = size(Profils,1);   
    
    s = size(Profils,2);
    
    profilsMoyen=zeros(2*d,nbClasses);
   
    k = 1;
    j = 1;

    while(k < t)  
    
      for i=1:2*d
        profilsMoyen(i,j) = mean(Profils(k,1:s),2);
        k=k+1;
      end

      j=j+1;
    end
    
 
end

