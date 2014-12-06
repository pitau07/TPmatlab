function drawStat( d,m,n,operateur,Result,Classe,nbColonnes,nbLignes )
    t=size(Result,1);
    taux=zeros(nbLignes,1);
    for i=0:nbColonnes:t-nbColonnes
        taux((i/nbColonnes)+1)=(nbColonnes-nnz(Result(i+1:i+nbColonnes)-Classe(i+1:i+nbColonnes)))*100/nbColonnes;
    end
    
    figure
    bar(0:nbLignes-1,transpose(taux));
    if m==0
        title({['Taux de reconnaissance par chiffre avec d=',num2str(d)]});
    else
        if strcmp(operateur,'')   
            title({['Taux de reconnaissance par chiffre avec k=',num2str(d),', m=',num2str(m),', n=',num2str(n)]});
        else
            title({['Taux de reconnaissance par chiffre pour l''operateur ',operateur,' avec k=',num2str(d),', m=',num2str(m),', n=',num2str(n)]});
        end
    end
        
    % Et on nomme les axes
    xlabel('Chiffre à reconnaitre');
    ylabel('taux de reconnaissance des chiffres');
end

