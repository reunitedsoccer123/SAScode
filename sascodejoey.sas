data filename;
set filename;
format preproc1_pain
	postproc1_pain
	preproc2_pain
	postproc2_pain
	preproc3_pain
	postproc3_pain 3.1
    total_dose_strength 6.3 ;

	IF preproc1_score = 11 Then preproc1_pain = .5;
	Else IF preproc1_score = 12 Then preproc1_pain = 1.5;
	Else IF preproc1_score = 21 Then preproc1_pain = 3.5;
	Else IF preproc1_score = 13 Then preproc1_pain = 4.5;
	Else IF preproc1_score = 14 Then preproc1_pain = 5.5;
	Else IF preproc1_score = 15 Then preproc1_pain = 6.5;
	Else IF preproc1_score = 16 Then preproc1_pain = 7.5;
    Else IF preproc1_score = 17 Then preproc1_pain = 8.5;
	Else IF preproc1_score = 18 Then preproc1_pain = 9.5;
	Else preproc1_pain = preproc1_score;
    IF preproc2_score = 11 Then preproc2_pain = .5;
	Else IF preproc2_score = 12 Then preproc2_pain = 1.5;
	Else IF preproc2_score = 21 Then preproc2_pain = 3.5;
	Else IF preproc2_score = 13 Then preproc2_pain = 4.5;
	Else IF preproc2_score = 14 Then preproc2_pain = 5.5;
	Else IF preproc2_score = 15 Then preproc2_pain = 6.5;
	Else IF preproc2_score = 16 Then preproc2_pain = 7.5;
    Else IF preproc2_score = 17 Then preproc2_pain = 8.5;
	Else IF preproc2_score = 18 Then preproc2_pain = 9.5;
	Else preproc2_pain = preproc2_score;
*corrected below	IF preproc3_score = 11 Then preproc2_pain = .5;
	IF preproc3_score = 11 Then preproc3_pain = .5;
	Else IF preproc3_score = 12 Then preproc3_pain = 1.5;
	Else IF preproc3_score = 21 Then preproc3_pain = 3.5;
	Else IF preproc3_score = 13 Then preproc3_pain = 4.5;
	Else IF preproc3_score = 14 Then preproc3_pain = 5.5;
	Else IF preproc3_score = 15 Then preproc3_pain = 6.5;
	Else IF preproc3_score = 16 Then preproc3_pain = 7.5;
    Else IF preproc3_score = 17 Then preproc3_pain = 8.5;
	Else IF preproc3_score = 18 Then preproc3_pain = 9.5;
	Else preproc3_pain = preproc3_score;
*corrected above	Else preproc2_pain = preproc3_score;

    * post-procedure ;    
	IF postproc1_score = 11 Then postproc1_pain = .5;
	Else IF postproc1_score = 12 Then postproc1_pain = 1.5;
	Else IF postproc1_score = 21 Then postproc1_pain = 3.5;
	Else IF postproc1_score = 13 Then postproc1_pain = 4.5;
	Else IF postproc1_score = 14 Then postproc1_pain = 5.5;
	Else IF postproc1_score = 15 Then postproc1_pain = 6.5;
	Else IF postproc1_score = 16 Then postproc1_pain = 7.5;
    Else IF postproc1_score = 17 Then postproc1_pain = 8.5;
	Else IF postproc1_score = 18 Then postproc1_pain = 9.5;
	Else postproc1_pain = postproc1_score;
    IF postproc2_score = 11 Then postproc2_pain = .5;
	Else IF postproc2_score = 12 Then postproc2_pain = 1.5;
	Else IF postproc2_score = 21 Then postproc2_pain = 3.5;
	Else IF postproc2_score = 13 Then postproc2_pain = 4.5;
	Else IF postproc2_score = 14 Then postproc2_pain = 5.5;
	Else IF postproc2_score = 15 Then postproc2_pain = 6.5;
	Else IF postproc2_score = 16 Then postproc2_pain = 7.5;
    Else IF postproc2_score = 17 Then postproc2_pain = 8.5;
	Else IF postproc2_score = 18 Then postproc2_pain = 9.5;
	Else postproc2_pain = postproc2_score;
*corrected below	IF postproc3_score = 11 Then postproc2_pain = .5;
	IF postproc3_score = 11 Then postproc3_pain = .5;
	Else IF postproc3_score = 12 Then postproc3_pain = 1.5;
	Else IF postproc3_score = 21 Then postproc3_pain = 3.5;
	Else IF postproc3_score = 13 Then postproc3_pain = 4.5;
	Else IF postproc3_score = 14 Then postproc3_pain = 5.5;
	Else IF postproc3_score = 15 Then postproc3_pain = 6.5;
	Else IF postproc3_score = 16 Then postproc3_pain = 7.5;
    Else IF postproc3_score = 17 Then postproc3_pain = 8.5;
	Else IF postproc3_score = 18 Then postproc3_pain = 9.5;
	Else postproc3_pain = postproc3_score;
	* corrected above  Else postproc2_pain = postproc3_score;


    * add field for dose*strength (regardless of lido, bupi);
    IF (drug=lido and strength=4%) THEN total_dose_strength= 0.04 * _ ;
    ELSE IF () THEN total_dose_strength= _*_;
    ELSE 
	run;


	data SPGlong ;
    set spg.SPG_N225_new ;
    format proc_date mmddyy10. preproc_pain postproc_pain pain_change 5.1  
           total_dose_strength 6.3 strength 5.3 drug $12. ;


    array dates(*) proc1_date proc2_date proc3_date ;
    array pre(*) preproc1_pain preproc2_pain preproc3_pain ;
    array post(*) postproc1_pain postproc2_pain postproc3_pain ;
	array ind(*) indication1 indication2 indication3;
	array bupi(*) bupi_strength1 bupi_strength2 bupi_strength3;
	array lido (*) lido_strength1 lido_strength2 lido_strength3;
    array dos(*) dose1 dose2 dose3;
    

    DO i=1 to dim(dates) WHILE (dates{i} ne .) ;
       proc_date=dates{i} ;
       preproc_pain=pre{i} ;
       postproc_pain=post{i} ;
       pain_change=post{i} - pre{i} ;
	   indication = ind{i};
	   bupi_strength = bupi{i};
       lido_strength = lido{i};
	   dose = dos{i};
	   visit=i;
       

    * add decimal field for strength ;
    * add character field for drug name ;
    IF lido_strength=1 THEN DO;
             strength=0.01;
             drug='lidocaine' ;
             END;
    ELSE IF lido_strength=2 THEN DO;
             strength=0.04;
             drug='lidocaine' ;
             END;
    ELSE IF lido_strength=3 THEN DO;
			strength=.03;
			drug='lidocaine';
			END;
	ELSE IF lido_strength=4 THEN DO;
			strength=.005;
			drug='lidocaine';
			END;
	ELSE IF lido_strength=5 THEN DO;
			strength=.02;
			drug='lidocaine';
			END;
    ELSE IF bupi_strength=1 THEN DO;
             strength=0.005;
             drug='bupivacaine' ;
             END;
    ELSE IF bupi_strength=2 THEN DO;
             strength=0.01;
             drug='bupivacaine' ;
             END;
	ELSE IF bupi_strength=3 THEN DO;
             strength=0.02;
             drug='bupivacaine' ;
             END;
    ELSE drug='error' ;


    * add field for dose*strength (regardless of lido, bupi);
    total_dose_strength= strength * dose ;

       output ;
    end ;


	proc transpose data=SPGlong out=SPGlong1 prefix=prepain_; var preproc_pain; by record_id; id visit; run;
 proc transpose data=SPGlong out=SPGlong2 prefix=postpain_; var postproc_pain; by record_id; id visit; run;
 proc transpose data=SPGlong out=SPGlong3 prefix=date_; var proc_date; by record_id; id visit; run;
 proc transpose data=SPGlong out=SPGlong4 prefix=Ind_; var indication; by record_id; id visit; run;
 proc transpose data=SPGlong out=SPGlong5 prefix=lido_; var lido_strength; by record_id; id visit; run;
 proc transpose data=SPGlong out=SPGlong6 prefix=bupi_; var bupi_strength; by record_id; id visit; run;
 proc transpose data=SPGlong out=SPGlong7 prefix=dose_; var dose; by record_id; id visit; run;

 data spglongt;
   merge SPGlong1 (in=in1) SPGlong2 (in=in2) SPGlong3 (in=in3) SPGlong4 (in=in4) SPGlong5 (in=in5) SPGlong6 (in=in6) SPGlong7 (in=in7);
   by record_id;

   ind=cats(in1,in2,in3,in4,in5,in6,in7);
run;
*tables
%LET spgPath=%str(S:\Biostats\BIO-STAT\Radiology_Hill\SPGblockade_DeBacker) ;

OPTIONS MPRINT ls=110 ps=200 nodate nostimer ;
ods noproctitle ;
options topmargin=1in bottomMargin=1in leftmargin=1in rightmargin=1in ;
options center orientation=portrait number;
ods rtf file="&spgPath.\Results_output\SPG_Blockade_Descriptives.rtf"
    bodytitle style=journal ;
ODS STARTPAGE=NO;
proc contents data=spg.SPGwide;
quit;
Title1 'Demographics';
proc tabulate data=spg.SPGwide missing;
	format gender gender_. ethnicity ethnicity_. race race_. indication_1 indication1_. indication_2 indication1_. indication_3 indication1_.;
	class gender ethnicity race indication_1 indication_2 indication_3;
	var Age_Tx1 ;
	table all*N*(f=3.)
         gender='Gender'*(N*(f=3.) 
		 				colpctn*(f=5.1))
         ethnicity='Ethnicity'*(N*(f=3.)
						colpctn*(f=5.1))
         race='Race'*(N*(f=3.)
		 				colpctn*(f=5.1))
		 Age_Tx1='Age at Treatment1'*(N*(f=3.)
                  Min*(f=5.)
                  Median*(f=5.1)
                  Mean*(f=5.1)
                  std*(f=5.1)
                  Max*(f=5.))
         indication_1='Etiology at Treatment 1'*(N*(f=1.)
		 								colpctn*(f=5.1))
		 indication_2='Etiology at Treatment 2'*(N*(f=1.)
		 								colpctn*(f=5.1))
		 indication_3='Etiology at Treatment 3'*(N*(f=1.)
										colpctn*(f=5.1)), all / nocellmerge printmiss misstext='-'; 
run;            title1;



options orientation=landscape;
Title2 "Pre and Post Pain Scores";
proc tabulate data=spg.SPGwide missing;
var preproc_pain_1 postproc_pain_1 preproc_pain_2 postproc_pain_2 preproc_pain_3 postproc_pain_3;
table all*(N*(f=3.)
                    MIN*(f=5.)
                    P25='25th %tile'*(f=5.1)
                    MEDIAN*(f=5.1)
                    MEAN*(f=5.1)
                    STD*(f=5.1)
                    P75='75th %tile'*(f=5.1)
                    MAX*(f=5.)
                    )
 , preproc_pain_1  postproc_pain_1  preproc_pain_2  postproc_pain_2  
preproc_pain_3  postproc_pain_3  / printmiss misstext='-'  ;
run; title;


options orientation=portrait;
proc contents data=spg.SPGlong;
quit;
Title3 'Pre, Post, and Pain Change';
proc tabulate data=spg.SPGlong missing;
var preproc_pain postproc_pain pain_change;
table all*(N*(f=3.)
                    MIN*(f=5.)
                    P25='25th %tile'*(f=5.1)
                    MEDIAN*(f=5.1)
                    MEAN*(f=5.1)
                    STD*(f=5.1)
                    P75='75th %tile'*(f=5.1)
                    MAX*(f=5.)
                    )
 , preproc_pain postproc_pain pain_change / printmiss misstext='-'  ;
run; title;
ods rtf close; ods listing;

dm log clear
