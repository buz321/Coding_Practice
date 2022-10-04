/* Fibonacci Sequence */
data fibonacci_sequence;
do i = 1 to 10;
    fib = sum(fib, lag(fib));
    if i eq 1 then fib = 1;
    output;
    end;
run;

/* Test */
proc print data=fibo; 
run;
