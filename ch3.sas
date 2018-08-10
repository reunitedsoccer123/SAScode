proc contents data=work.newsalesemps;
run;

proc contents data=orion._all_nods;
run;
libname, p103e01;
run;

data work.donations;
   infile "&path\donation.dat";
   input Employee_ID Qtr1 Qtr2 Qtr3 Qtr4;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
run;

proc contents data=work.donations;
run;

proc print data=work.donations;
run;

data work.newpacks;
   input Supplier_Name $ 1-20 Supplier_Country $ 23-24
         Product_Name $ 28-70;
   datalines;
Top Sports            DK   Black/Black
Top Sports            DK   X-Large Bottlegreen/Black
  ...
Miller Trading Inc    US   Sioux Men's Backpack 26 Litre.
;

proc contents data=work.newpacks;
run;

proc print data=work.newpacks noobs;
   var Product_Name Supplier_Name;
run;
