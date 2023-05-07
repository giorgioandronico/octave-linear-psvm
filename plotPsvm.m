function plotPsvm(XFirstLevelTrain, yFirstLevelTrain, vStar, gammaStar, foldIndex)

	clf;
	% Plotting the points of the sets
	hold on;
	[numRows, numColumns] = size(XFirstLevelTrain);
	positiveSet = [];
	negativeSet = [];

	for i = 1: numRows
	   if yFirstLevelTrain(i) == 1
		 positiveSet = [positiveSet; XFirstLevelTrain(i,:)];
	   else
		 negativeSet = [negativeSet; XFirstLevelTrain(i,:)];
	   endif
	end

	xxMin = min(XFirstLevelTrain(:,1));
	xxMax = max(XFirstLevelTrain(:,1));
	yyMin = min(XFirstLevelTrain(:,2));
	yyMax = max(XFirstLevelTrain(:,2));
	axis([xxMin xxMax yyMin yyMax]);
	scatter(positiveSet(:,1), positiveSet(:,2), 'b', 'o', 'filled');
	scatter(negativeSet(:,1), negativeSet(:,2), 'r', 'o', 'filled');

	% Plotting H
	abscissa = -10:1:110;
	ordinate = (gammaStar - vStar(1)* abscissa)/vStar(2);
	plot(abscissa, ordinate, 'k');
	
	% Plotting H+;
	gammaPlus = gammaStar + 1;
	ordinate = (gammaPlus - vStar(1)* abscissa)/vStar(2);
	plot(abscissa, ordinate, 'b');
	
	% Plotting H-;
	gammaMinus = gammaStar - 1;
	ordinate = (gammaMinus - vStar(1)* abscissa)/vStar(2);
	plot(abscissa, ordinate, 'r');
	
	legend('H+','H-','H','Location','northwestoutside');
	
	fig = strcat("fold_", num2str(foldIndex));
	print("-djpg", fig);
	
endfunction