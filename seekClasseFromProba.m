function [ Classes ] = seekClasseFromProba( Vecteur )
   %-- on garde la probabilit� la plus haute
   [~,Classes]=max(Vecteur,[],2);
   %-- on retire 1 car premiere classe commence � 0
   Classes=Classes-1;
end

