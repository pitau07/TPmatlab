function [ Col ] = seekColumns( I, Lignes )

    col=size(I,2);
    lineI=size(Lignes,1);
   % Col = zeros(lineI,40);
    
    %- parcours des lignes de I detectées par seekLines
    for j=1:lineI 
 
         p = 1;
         % recuperation des pixels de la ligne j  
         IA = I(Lignes(j,1):Lignes(j,2), 1:col);
         % on compte le nb de pixels noirs sur chq colonne de l'image 
         S = sum(IA<50); 

         k=1;
         %-- Enregistre les indices des colonnes dans Col --%
         while k <= col 

             if S(k) ~= 0
                Col(j,p) = k;

                while ( k <= col && S(k) ~= 0 )
                    k = k+1;
                end

                if k <= col
                    p = p+1;
                    Col(j,p) =k;
                    p = p+1;
                end
             end

             k = k + 1;
         end
    end
end

