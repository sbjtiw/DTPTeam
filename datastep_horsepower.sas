proc sort data=sashelp.cars out=cars;
by make;
run;

data horsepower;
	set sashelp.cars(where=(cylinders eq 8)) nobs=numobs;
	format dollarsPerHorse dollar12.2 runningAveragehorsepower 6.1;
	retain runninghorses;
	by make;

	if _n_ eq 1 then
		runningHorses=0;
	else runninghorses=runninghorses+horsepower;
	runningaveragehorsepower=runningHorses/_n_;
	dollarsPerHorse=invoice/Horsepower;
run;

proc print;
run;