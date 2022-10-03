Libname User 'M:\SAS project file'; 

/*import the data of indicators to merge*/
proc import 
     datafile='M:\SAS project file\sas work hospitalization.xlsx'
	 out=hospitalization
     dbms=xlsx
	 replace;
     run;

proc import 
     datafile='M:\SAS project file\sas work inflation.xlsx'
	 out=inflation
     dbms=xlsx
	 replace;
     run;

proc import 
     datafile='M:\SAS project file\sas work new cases.xlsx'
	 out=new_cases
     dbms=xlsx
	 replace;
     run;

proc import 
     datafile='M:\SAS project file\sas work new deaths.xlsx'
	 out=new_deaths
     dbms=xlsx
	 replace;
     run;

proc import 
     datafile='M:\SAS project file\sas work share price.xlsx'
	 out=share_price
     dbms=xlsx
	 replace;
     run;

proc import 
     datafile='M:\SAS project file\sas work unemployment rate.xlsx'
	 out=unemployment_rate
     dbms=xlsx
	 replace;
     run;

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
proc print data=merge1;
title "covid-19 realted health indicators and economics indicators of some OECD countries";
run;
proc contents;
run;

/*cut all the blank columns*/
data final_draft;
set merge1;
drop C D E F G H I J K L M;
RUN;

/* to check if the previous step worked*/
PROC PRINT DATA=FINAL_DRAFT;
RUN;
proc contents;
run;

/*cut all the blank rows*/
OPTIONS missing = ' ';
data FINAL_DRAFT;
    SET FINAL;
    IF missing(cats(of _all_)) 
    THEN DELETE;
run;

/*to check if the previous step worked*/
PROC PRINT DATA=FINAL_DRAFT;
RUN;
proc contents;
run;

/*export the table to MS-Word format for the report */
PROC PRINT DATA=FINAL_DRAFT;
RUN;
ods RTF close;

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
   inset "=0.17284" / 
         border title="Correlation Coefficient" position=topleft;
run;

/*checking correlation coefficient*/
PROC CORR DATA=merge1;
   VAR inflation new_deaths;
RUN;

PROC CORR DATA=merge1;
   VAR unemployment_rate new_cases;
RUN;

