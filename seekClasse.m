function [ KPPV ] = seekClasse( Vecteur )
    nbLignes=size(Vecteur,1);
    KPPV=zeros(nbLignes,1);
    for i=1:nbLignes
        %recupere une instance de tous les nombres differents dans la ligne
        U=round(unique(Vecteur(i,:)));
        %compte combien de fois chq nb est present
        N=histc(Vecteur(i,:),U);
        [~,index]=max(N);
        %KPPV est celui le plus present
        KPPV(i)=U(index);
    end
end

