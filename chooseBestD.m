function chooseBestD( Result,Classes )
    
    t=size(Result,1);
    taux=zeros();
    for d=1:15
        taux(d)=(t-nnz(Result-Classes(:,d)))*100/t;
    end

    figure
    plot(1:15,transpose(taux));
    title({'Evolution du taux de reconnaissance en fonction de d'});
    % Et on nomme les axes
    xlabel('d nombre composantes du vecteur caractéristique');
    ylabel('taux de reconnaissance des chiffres');
   
end

