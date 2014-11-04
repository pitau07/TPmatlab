function [ Retour ] = SeekProfiles( I, d, Rectangles)
    
	figure
    imshow(I);
    hold on

	for g=0:2*d:90 
		disnumberprofile = zeros(d*2,20);
		Line = Rectangles(2*g+1:2*g+20,1:4);
		%pour toute la ligne de chiffres
	    for i=1:20
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
	            plot([Line(i,1),gauche],[pts(j),pts(j)],'Color','r','LineWidth',2);
	            
	            
	            %profil droit
	            k=Line(i,3);
	            while k >= Line(i,1) && I(pts(j),k)~= 0
	                k=k-1;
	            end
	            droite=k;
	           
	            % dessin
	            plot([Line(i,3),droite],[pts(j),pts(j)],'Color','b','LineWidth',2);
	            
	            disnumberprofile(j,i)=(gauche-Line(i,1))/w;
	            disnumberprofile(j+d,i)=(Line(i,3)-droite)/w;
	        end
	    end

	    Retour(g+1:g+10,1:20) = disnumberprofile;

	end	

	hold off
end

