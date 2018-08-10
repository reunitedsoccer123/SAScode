data orion.country;
      Outdated='N';
   output;
   if Country_FormerName ne ' ' then do;
      Country_Name=Country_FormerName;
         Outdated='Y';
         output;
   end;
   drop Country_FormerName Population;
run;

title 'Current and Outdated Country Name Data';
proc print data=work.lookup;
run;
title;


title 'All discount ranges with the Happy Holidays promotion';
proc print data=work.extended;
run;
title;
