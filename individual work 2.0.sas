Libname User 'M:\SAS project file';

/*-----------------------------start of group project's codes---------------*/
/*set marco to import the data that we need*/
%Macro Import_Macro (x=,y=);
proc import datafile = &x dbms = xlsx out = &y;
Run;
%Mend Import_Macro;

/*testing the macro to check if it works*/
%Import_Macro(x="M:\SAS project file\sas work hospitalization.xlsx",y=hospitalization);
%Import_Macro(x="M:\SAS project file\sas work inflation.xlsx",y=inflation);
%Import_Macro(x="M:\SAS project file\sas work new cases.xlsx",y=new_cases);
%Import_Macro(x="M:\SAS project file\sas work new deaths.xlsx",y=new_deaths);
%Import_Macro(x="M:\SAS project file\sas work share price.xlsx",y=share_price);
%Import_Macro(x="M:\SAS project file\sas work unemployment rate.xlsx",y=unemployment_rate);

/*macro to print the data with the title to show*/
%MACRO printingdata(dataname);
title "covid-19 realted health indicators and economics indicators of some of OECD countries";
proc print data=&dataname;
run;
%MEND printingdata; 

/*check if the macro properly workes*/
%printingdata(dataname=hospitalization);
%printingdata(dataname=inflation);
%printingdata(dataname=new_cases);
%printingdata(dataname=new_deaths);
%printingdata(dataname=share_price);
%printingdata(dataname=unemployment_rate);

/*merge the data to have one dataset to use*/
data merge1;
merge hospitalization inflation new_cases new_deaths share_price unemployment_rate;
run;

/*label the names for clear understanding*/
Data merge1;
set merge1;
label hosp_patients= 'average number of hospitalized covid-19 patients';
label inflation= 'inflation rate (CPI)';
label new_cases= 'average number of covid-19 new cases';
label new_deaths= 'average number of deaths by covid-19';
run;

/*print the data out to see the full lists of values and check if the previous steps properly worked*/
%printingdata(dataname=merge1);
proc contents;
run;

/*since we found some blanks in the dataset, cut all the blank columns*/
data final_draft;
set merge1;
drop C D E F G H I J K L M;
RUN;

/* to check if the previous step worked*/
%printingdata(dataname=final_draft);
proc contents;
run;

/*cut all the blank rows*/
OPTIONS missing = ' ';
data FINAL;
    SET FINAL_DRAFT;
    IF missing(cats(of _all_)) 
    THEN DELETE;
run;

/*to check if the previous step worked*/
%printingdata(dataname=final);
proc contents;
run;

/*export the table to MS-Word format for the report */
ods rtf file="FINAL.rtf"; /* MS-Word format */
Title "covid-19 realted health indicators and economics indicators of some OECD countries"; 
PROC PRINT DATA=FINAL;
RUN;
ods RTF close;

/*set macro to check correlation coefficient for each selected variables*/
%macro corr_macro(data=, var1=, var2=);
* Generate standard results for Pearson correlation ;
proc corr data = &data;
 var &var1 &var2;
 %mend corr_macro;

 /*testing the macro and check the result*/
 %corr_macro (data=merge1, var1=inflation, var2=new_deaths);
 %corr_macro (data=merge1, var1=unemployment_rate, var2=new_cases);

/*running the correlation graph to see if both variables are correlated*/
proc sgplot data=merge1;
   title "Correlation between unemployment rate and average number of covid-19 new cases from 03-2020 to 12-2020";
   reg X=unemployment_rate Y=new_cases;
   inset "=0.09344" / 
         border title="Correlation Coefficent" position=topleft;
run;

proc sgplot data=merge1;
   title "Correlation between inflation rate and average number of deaths by covid-19 from 03-2020 to 12-2020";
   reg X=inflation Y=new_deaths;
   inset "=0.05539" / 
         border title="Correlation Coefficient" position=topleft;
run;

/*-----------------------------end of group project's codes---------------*/




/*-----------------------------start of indiviual work--------------------*/

Libname User 'M:\SAS project file';

/*import the data to use for the report*/ /*using macro that was already set for the group project*/
%Import_Macro(x="M:\SAS project file\OECD continents.xlsx",y=continents);

/*print out the data to check if the previous step worked*/
%printingdata(dataname=continents);

/*set macro to merge the data*/
%macro merge_macro (data=, x=, y=,);
data &data;
merge &x &y;
run;
%mend merge_macro;

/* merge the dataset from the group project with another file that includes continents*/
%merge_macro (data=merge2, x=final, y=continents);

/*check if the previous stop properly worked, and merge the previous */
%printingdata(dataname=merge2);


/*set different macro to print the data with the different title to show*/
%MACRO printdataindividual(dataname);
title "covid-19 realted health indicators and economics indicators of some of OECD countries by continents";
proc print data=&dataname;
run;
%MEND printdataindividual; 

/*check if the macro properly works*/
%printdataindividual(dataname=merge2);

/* sort the data by continent*/
proc sort data=merge2;
by continent;
run;

/*check if the previous step properly worked*/
%printdataindividual(dataname=merge2);

/* import the data to use*/ /*using the macro set from the group project*/
%Import_Macro(x="M:\SAS project file\population.xlsx",y=population);

/*print the data out if the previous step properly worked*/
%printdataindividual(dataname=population);

/* merge the previous test with another file that includes continents*/
%merge_macro(data=merge5, x=merge2, y=population);

/*print the data out if the previous step properly worked*/
%printingdata(dataname=merge5);

/*then, we want to choose which continents is the most interesting to look at*/

/*make dataset only for NA*/
data NA;
set merge5;
if CONTINENT = 'NA';
run;

/*check if the previous step properly worked*/
%printingdata(dataname=na);

/*make dataset only for AS*/
data as;
set merge5;
if continent = 'AS';
run;

/*check if the previous step properly worked*/
%printingdata(dataname=as);

/*make dataset only for EU*/
data eu;
set merge5;
if continent = 'EU';
run;

/*check if the previous step properly worked*/
%printingdata(dataname=eu);

/*check correlation coefficient for each continents*/
%CORR_MACRO (DATA=AS, VAR1=UNEMPLOYMENT_RATE, VAR2=NEW_CASES);
%CORR_MACRO (DATA=NA, VAR1=UNEMPLOYMENT_RATE, VAR2=NEW_CASES);
%CORR_MACRO (DATA=EU, VAR1=UNEMPLOYMENT_RATE, VAR2=NEW_CASES);

/*macro to make graphs to show*/
%MACRO mygraphic(SoFoption=0);
   %put Option is &SoFoption.;
   %IF &SoFoption=0 %THEN %DO;
   proc sgplot data=as;
   title "Correlation between unemployment rate and average number of covid-19 new cases from 03-2020 to 12-2020 in Asian countries (selected samples)";
   reg X=unemployment_rate Y=new_cases;
   inset "=0.99977" / 
         border title="Correlation Coefficient" position=topleft;
run;
	  %END;
	  %ELSE %IF &SoFoption=1 %THEN %DO;
	 proc sgplot data=na;
   title "Correlation between unemployment rate and average number of covid-19 new cases from 03-2020 to 12-2020 in North America countries (selected samples)";
   reg X=unemployment_rate Y=new_cases;
   inset "=0.07145" / 
         border title="Correlation Coefficient" position=topleft;
run;
	  %END;
%ELSE %IF &SoFoption=2 %THEN %DO;
	  proc sgplot data=eu;
   title "Correlation between unemployment rate and average number of covid-19 new cases from 03-2020 to 12-2020 in European countries (selected samples from OECD)";
   reg X=unemployment_rate Y=new_cases;
   inset "=0.21913" / 
         border title="Correlation Coefficient" position=topleft;
run;
 %END;
	  %ELSE %put Option is &SoFoption. It is not 0,1 or 2.;
   %MEND mygraphic;

/*testing the macro to make graphs*/
%mygraphic(SoFoption=0);
%mygraphic(SoFoption=1);
%mygraphic(SoFoption=2);
%mygraphic(SoFoption=3);

/*from the samples, we found that EU is the best to test the correlation test*/
/*here, we want to look at the trend of european countries within OECD*/
/*Then, we are going to take account of the rate for the number of deaths per the nunmer of cases to see the trend*/

/*set the macro to export the file*/
%Macro Export_Macro (x=,y=);
Libname User 'M:\SAS project file';
proc export data = &x dbms = xlsx outfile = &y;
Run;
%Mend Export_Macro;

/*export the data for the calculation (deaths per cases)*/
%export_macro (x=eu, y="eu.xlsx");
ods excel file="eu.xlsx"; /* Excel format */ 
ods excel close;

/*import the new data (deaths per cases) to use*/
%Import_Macro(x="M:\SAS project file\deaths per cases.xlsx",y=deaths_per_cases);

/*print the data out to see if the previous step worked*/
%printingdata(dataname=deaths_per_cases);

/*merge the new data with the original dataset*/
%merge_macro (data=merge_dpc, x=eu, y=deaths_per_cases);

/*print the data out to see if the previous step worked*/
%printingdata(dataname=merge_dpc);

/*we want to re-group the samples*/
/*therefore, set the the unemployment rate to 6% to see how deaths per cases correlates with certain unemployment rate point*/
%let threshold=6;   /* define a macro variable */
data eu_over_6; /*make a new dataset with countries that had unemployment rate over 6%*/
   set merge_dpc;
   where unemployment_rate> &threshold; /* condition of samples (over 6%) */
run;

/*print the data out to see if the previous step worked*/
%printingdata(dataname=eu_over_6);

%let threshold=6;   /* define a macro variable */
data eu_below_6; /*make a new dataset with countries that had unemployment rate below 6%*/
   set merge_dpc;
   where unemployment_rate< &threshold; /* condition of the samples (below 6%) */
run;

/*print the data out to see if the previous step worked*/
%printingdata(dataname=eu_below_6);

/*check correlation coefficient for each dataset*/
%corr_macro(data=eu_below_6, var1=unemployment_rate, var2=deaths_per_cases);
%corr_macro(data=eu_over_6, var1=unemployment_rate, var2=deaths_per_cases);


/*set a macro to make regression graphs*/
%MACRO individualgraphic(SoFoption=0);
   %put Option is &SoFoption.;
   %IF &SoFoption=0 %THEN %DO;
   proc sgplot data=eu_below_6;
   title "Correlation between deaths per cases and unemployment rate (<&threshold) from 03-2020 to 12-2020 in European countries (selected sample from OECD)";
   reg X=unemployment_rate Y=deaths_per_cases;
   inset "=-0.12395" / 
         border title="Correlation Coefficient" position=topleft;
run;
	  %END;
	  %ELSE %IF &SoFoption=1 %THEN %DO;
	proc sgplot data=eu_over_6;
   title "Correlation between deaths per cases and unemployment rate (>&threshold) from 03-2020 to 12-2020 in European countries (selected sample from OECD)";
   reg X=unemployment_rate Y=deaths_per_cases;
   inset "=0.75413" / 
         border title="Correlation Coefficient" position=topleft;
run;
	  %END;
	  %ELSE %put Option is &SoFoption. It is not 0 or 1.;
   %MEND indvidualgraphic;

   /*check if macro was properly set*/
   %individualgraphic(sofoption=0);
    %individualgraphic(sofoption=1);
	 %individualgraphic(sofoption=2); /* test for no outcome*/


/*to make a one graph that shows two different groups, we need to make a dummy varialbe*/
/*import the data that includes dummy varialbe*/
%Import_Macro(x="M:\SAS project file\unemployment group.xlsx", y=unemployment_group);

/*merge with the original dataset*/
%merge_macro (data=merge_group, x=merge_dpc, y=unemployment_group);

/*print the data out to see if the previous step properly worked*/
%printdataindividual(dataname=merge_group);

/*make a regression graph for two different groups to see the trend*/
ods graphics on / attrpriority=none;
proc sgplot data=merge_group noautolegend;
   title 'Linear Regression of two groups set by unemployment rate';
   styleattrs datalinepatterns=(solid);
   reg y=deaths_per_cases x=unemployment_rate / group=unemployment_group;
   inset "countries below 6%=-0.12395    countreis over 6%=0.75413" / 
         border title="Correlation Coefficient" position=topleft;
run;

/*cut unnecessary columns to export for the report*/
data tableexport;
set merge_group;
drop hosp_patients inflation share_price population;
run;

/*export the data in an excel file*/
ods excel file="tableexport.xls"; /* MS-Word format */
PROC PRINT DATA=tableexport;
RUN;
ods excel close;





