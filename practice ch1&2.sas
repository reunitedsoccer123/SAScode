data clinic.admit2;
	set clinic.admit;
	weight=round(weight)
run;


proc tabulate data=sasuser.admit;
class sex;
var height weight;
table sex*(height,weight), mean;
run;
proc copy in=sasuer out=work;
select admit;
run;





data work.newemps;
	infile "&path\newemps.csv" dlm=',';
	input First $ Last $ Title $Salary;
run;


data sashelp.cars;
	set sasuser.admit2;
	where invoice > 500;
run;

libname clinic 'c:\Users\Name\sasuser';
data clinic.admit2
	set clinic.admit


proc print data=work.newemps;
run;

data work.newsalesemps;
	length First_Name $ 12
		   Last_Name $ 18 Job_Title $25;
	infile "&path\newemps.csv" dlm=',';
	input First $ Last_Name $
	      Job_Title $ Salary;
run;

proc print data=work.newsemps;
run;

proc print data=work.newemps;
	var Salary;
run;

proc freq data=sashelp.cars;
table Model;
run;
*pg 26 print with conditions
proc print data=sashelp.prdsale;
data sashelp.cars;
	set sashelp.cars;
	where invoice> 20000;
run;
proc print data=sasuser.myproductsales;
run;
