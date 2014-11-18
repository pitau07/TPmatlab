function [ Vecteur ] = seekDensity( I,m,n )
    [l,c]=size(I);
    col=floor(linspace(1,c,m+1));
    lin=floor(linspace(1,l,n+1));
    
    finCol=size(col,2)-1;
    finLin=size(lin,2)-1;
    
    k=1;
    
    Vecteur=zeros(1,m*n);
 
    for i=1:finCol
        for j=1:finLin
            %plot([col(j),col(j)],[1,l],'Color','r','LineWidth',2);
            %plot([1,c],[lin(i),lin(i)],'Color','r','LineWidth',2);
            nbPix=(lin(j+1)-lin(j)+1)*(col(i+1)-col(i)+1);
            Vecteur(1,k)=(nbPix-nnz(I(lin(j):lin(j+1),col(i):col(i+1))))/nbPix;
            
            k=k+1;
        end
    end
 
end

