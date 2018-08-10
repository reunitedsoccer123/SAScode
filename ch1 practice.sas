data work.newemps;
	infile "&path\newemps.csv" dlm=',';
	input First $ Last $ Title $ Salaryl
run;

proc print data=work.newemps;
run;
