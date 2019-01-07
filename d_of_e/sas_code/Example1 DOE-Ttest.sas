***POWER AND SAMPLE SIZE ANALYSIS FOR ONE SAMPLE T-TEST***;
***This file does example 1 and 2 in the class; 
/*EXAMPLE 1*/ 

*WE WANT TO SEE IF THE MARKETING EXPERIMENT WOULD 
*INCREASE SPENDING FROM $200 TO $225 FOR 
*THE AVERAGE CONSUMER;
PROC POWER;
	ONESAMPLEMEANS TEST=t
	NULLMEAN=200 /*current spending*/
	MEAN=225     /*sucessful effect size is $25*/
	STDDEV=20    /*current known std dev of spending*/ 
	ALPHA=0.05
	POWER=0.9
	NTOTAL=.;
RUN;

*NOW WE DON'T KNOW WHAT THE STANDARD DEVIATION IS*
*SO WE PUT IT IN A RANGE*; 
PROC POWER;
	ONESAMPLEMEANS TEST=t
	NULLMEAN=200 /*current mean*/
	MEAN=225     /*sucessful effect size is $25*/
	STDDEV= 10 to 50 by 5    /*change the  std dev of spending*/ 
	ALPHA=0.05
	POWER=0.9
	NTOTAL=.;
RUN;

*NOW WE ONLY HAVE 20 PEOPLE
*WOULD OUR TEST HAVE ENOUGH POWER?;
PROC POWER;
	ONESAMPLEMEANS TEST=t
	NULLMEAN=200 /*current mean*/
	MEAN=225     /*sucessful effect size is $25*/
	STDDEV= 10 to 50 by 5    /*current known std dev of spending*/ 
	ALPHA=0.05
	POWER=.
	NTOTAL=20;
RUN;

*EXAMPLE 2 SIMPLE WEB SITE;
*CONVERSION RATE;
*DO A PLOT OVER THE RANGE OF POSSIBLE VALUES;
PROC POWER;
	ONESAMPLEFREQ 
	NULLP=0.05
	P=0.075 TO 0.1 BY 0.005 /*VARY THE CRITICAL EFFECT FROM
							  0.075 TO 0.1*/ 
	ALPHA=0.05
	POWER= .
	NTOTAL= 900;
	PLOT X=N min=10 max=1000 yopts = (ref=0.90 crossref=yes)
			;*PLOT THE POWER FROM 10 TO 1000; 
RUN;



