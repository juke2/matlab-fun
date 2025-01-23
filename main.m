1; #needed so it can be run (otherwise considered a function file)

function estimated_root = bisection(f, a, b, iter)
    for i = 1:iter
        estimated_root = (a + b)/2;
        fofa = f(a);
        fofmid = f(estimated_root);
        if(not(xor(fofmid < 0,  fofa < 0)))
            a = estimated_root;
        else
            b = estimated_root;
        endif
    endfor
    
endfunction

function y = test_f(x)
    y = x^2 - 1*x -2;
endfunction

function y = f(x) # roots are pi and 2 pi at least
    y = exp(-x^3 - cos(x)) + sin(x)/x;
endfunction

function main ()
    test_f(2)
    test_f(-1)
    bisection(@test_f,2.92332,0.613213123,10)
    bisection(@f,2,4,100)
    bisection(@f,5,7,100) 
    
endfunction

main;