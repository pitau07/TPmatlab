function [ Result ] = seekDensities( I,nbLignes,nbColonnes,Rectangles,m,n )
    close all
    Result=zeros(nbLignes*nbColonnes,m*n);
    figure
    

    for o=1:nbLignes*nbColonnes
        % Number Cube
        A= I(Rectangles(o,2):Rectangles(o,4),(Rectangles(o,1):Rectangles(o,3)));
        
        [l,c]=size(A);

        col=floor(linspace(1,c,m+1));
        lin=floor(linspace(1,l,n+1));

        finCol=size(col,2)-1;
        finLin=size(lin,2)-1;

        % Density Calculation
        k=1;
        Vecteur=ones(1,m*n);
     
        for i=1:finCol
            
            for j=1:finLin
                
                plot([Rectangles(o,1)+col(j),Rectangles(o,1)+col(j)],[Rectangles(o,2)+1,Rectangles(o,2)+l],'Color','r','LineWidth',2);
                plot([Rectangles(o,1)+1,Rectangles(o,1)+c],[Rectangles(o,2)+lin(i),Rectangles(o,2)+lin(i)],'Color','r','LineWidth',2);
             
                nbPix=(lin(j+1)-lin(j)+1)*(col(i+1)-col(i)+1);
                Vecteur(1,k)=(nbPix-nnz(A(lin(j):lin(j+1),col(i):col(i+1))))/nbPix;
                
                k=k+1;
            end
        end

        Result(o,:) = Vecteur;
    end

    imshow(I);
    hold on

    for o=1:nbLignes*nbColonnes
        A= I(Rectangles(o,2):Rectangles(o,4),(Rectangles(o,1):Rectangles(o,3)));
        
        [l,c]=size(A);

        col=floor(linspace(1,c,m+1));
        lin=floor(linspace(1,l,n+1));

        finCol=size(col,2)-1;
        finLin=size(lin,2)-1;

        % Density Calculation
        k=1;
        Vecteur=ones(1,m*n);
     
        for i=1:finCol+1
            for j=1:finLin
                
                plot([Rectangles(o,1)+col(j),Rectangles(o,1)+col(j)],[Rectangles(o,2)+1,Rectangles(o,2)+l],'Color','r','LineWidth',2);
                plot([Rectangles(o,1)+1,Rectangles(o,1)+c],[Rectangles(o,2)+lin(i),Rectangles(o,2)+lin(i)],'Color','r','LineWidth',2);
                   
             
            end
        end
    end

    hold off

end

