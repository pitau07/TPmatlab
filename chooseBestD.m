function chooseBestD( Result,Classes,Classes2 )
    
    t=size(Result,1);
    taux=zeros(15,1);
    taux2=zeros(15,1);
    for d=1:15
        taux(d)=(t-nnz(Result-Classes(:,d)))*100/t;
        taux2(d)=(t-nnz(Result-Classes2(:,d)))*100/t;
        
    end

    figure
    plot(1:15,transpose(taux),1:15,transpose(taux2));
    
    title({'Evolution du taux de reconnaissance en fonction de d'});
    % Et on nomme les axes
    xlabel('d nombre composantes du vecteur caractéristique');
    ylabel('taux de reconnaissance des chiffres');
    legend('Euclidienne','Manhattan')
end

