data work.admin work.stock work.purchasing;
   set orion.employee_organization;
   if Department='Administration' then output work.admin;
   else if Department='Stock & Shipping' then output work.stock;
   else if Department='Purchasing' then output work.purchasing;
run;


proc print data=work.admin;
run;
proc print data=work.stock;
run;
proc print data=work.purchasing;
run;
      
