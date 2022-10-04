/* Fibonacci Sequence */
/* method 1*/
data fibonacci_sequence;
do i = 1 to 10;
    fib = sum(fib, lag(fib));
    if i eq 1 then fib = 1;
    output;
    end;
run;

/* Test */
proc print data=fibonacci_sequence; 
run;

/* method 2 */
/* from 0 */
data fibonacci_sequence;
do i = 0 to 10;
    fib = sum(fib, lag(fib));
    if i eq 1 then fib = 1;
    if i eq 0 then fib = 0;
    output;
    end;
run;

 /* test*/
proc print data=fibonacci_sequence; 
run;

/* Loop */
%macro fib_sec(n);

  %if &n < 0 %then %abort cancel;

  %if &n = 0 %then 
    0 
  ;
  %else 
  %if &n = 1 %then 
    1 
  ;
  %else %do;
   
    %eval (
      %fib(%eval(&n-1)) + %fib(%eval(&n-2))
    )
  %end;

%mend;

/* Loop_Test*/
%put %fib_sec(0);
%put %fib_sec(1);
%put %fib_sec(2);
%put %fib_sec(3);
%put %fib_sec(4);
%put %fib_sec(5);
%put %fib_sec(6);






    
