proc print data= sashelp.Orsales;
	var product_Group Quantity Total_Retail_Price;
	sum Total_Retail_Price;
run;
proc print data= sashelp.Orsales;
	var product_Group Quantity Profit;
	where Profit >2000 ;
run;
proc print data= sashelp.Orsales noobs;
	var product_Group Quantity Profit;
	where Profit >2000 ;
proc print data= sashelp.Orsales noobs;
	where Quarter= '2000Q1' and Profit >2000 ;
	where same and Product_Category = 'Clothes';
run;

proc print data= sashelp.Orsales noobs;
	where Quarter= '2000Q1' ;
	id Year;
	var product_Group Quantity Profit;
run;
proc sort data= sashelp.Orsales;
	by Profit;
run;


proc sort data= sashelp.Orsales;
	by Year descending Profit;
run;

proc sort data= sashelp.Orsales;
	by Year; 
	sum Profit;
	var Quarter Total_Retail_Price;
run;
proc sort data= sashelp.Orsales;
	by Year descending Profit;
	/*where Total_Retail_Sales >40000*/
run;

title1 'Orion Star Report';
title2 'Profit Report';
footnote1 'confidential';

proc print data= sashelp.Orsales label;
	var Year product_Group Quantity Profit Total_Retail_Price;
	label product_group='Product'
			Total_Retail_Price='Total Retail Price';
run;

title;
footnote;


