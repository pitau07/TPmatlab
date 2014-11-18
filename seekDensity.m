function [ Vecteur ] = seekDensity( I,m,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    figure 
    imshow(I) 
    hold on

    [l,c]=size(I)
    col=floor(linspace(1,c,m+1))
    lin=floor(linspace(1,l,n+1))
    
    finCol=size(col,2)-1;
    finLin=size(lin,2)-1;
    
    k=1;
    
    Vecteur=zeros(1,m*n);
 
    for i=1:finCol
        for j=1:finLin
            plot([col(j),col(j)],[1,51],'Color','r','LineWidth',2);
            plot([1,56],[lin(i),lin(i)],'Color','r','LineWidth',2);
            nbPix=(lin(j+1)-lin(j)+1)*(col(i+1)-col(i)+1);
            Vecteur(1,k)=nbPix-nnz(I(lin(j):lin(j+1),col(i):col(i+1)));
            
            k=k+1;
        end
    end
    
    %hold off
end

