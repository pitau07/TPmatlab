function [ Retour ] = SeekProfiles( I, d, Rectangles,nbLignes,nbColonnes,plot)
    fin=size(Rectangles,1)-nbColonnes;
	
    if plot == 1
        figure
        imshow(I);
        hold on
    end

	for g=0:nbColonnes:fin 
		disnumberprofile = zeros(d*2,nbColonnes);
		Line = Rectangles(g+1:g+nbColonnes,1:4);
		%pour toute la ligne de chiffres
	    for i=1:nbColonnes
	        w = Line(i,3) - Line(i,1);
	        pts = floor(linspace(Line(i,2), Line(i,4),d));
	        %pour chaque chiffre, on le divise en d parties
	        for j=1:d
	            %profil gauche

	            % abscisse de départ
	            k=Line(i,1);
	            % Jusqu'à trouver du noir
	            while k <= Line(i,3) && I(pts(j),k)~= 0
	                k=k+1;
	            end
	            % abscisse de l'arrivée
	            gauche=k;
	            
	            % dessin
                if plot == 1
                    plot([Line(i,1),gauche],[pts(j),pts(j)],'Color','r','LineWidth',2);
                end
	            
	            %profil droit
	            k=Line(i,3);
	            while k >= Line(i,1) && I(pts(j),k)~= 0
	                k=k-1;
	            end
	            droite=k;
	           
	            % dessin
                if plot == 1
                    plot([Line(i,3),droite],[pts(j),pts(j)],'Color','b','LineWidth',2);
                end
	            
	            disnumberprofile(j,i)=(gauche-Line(i,1))/w;
	            disnumberprofile(j+d,i)=(Line(i,3)-droite)/w;
	        end
	    end

	    Retour(1+2*d*(g/nbColonnes):2*d+2*d*(g/nbColonnes),1:nbColonnes) = disnumberprofile;

	end	

	hold off
end

