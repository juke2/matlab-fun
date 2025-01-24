1; #needed so it can be run (otherwise considered a function file)

function estimated_root = bisection(f, a, b, iter, TOLERANCE)
    fofa = f(a);
    for i = 1:iter
        estimated_root = (a + b)/2;
        fofmid = f(estimated_root);
        if(abs(fofmid) < TOLERANCE)
            return
        elseif(xor(fofmid < 0,  fofa < 0))
            b = estimated_root;
        else
            a = estimated_root;
            fofa = fofmid;
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
    bisection(@test_f,2.92332,0.613213123,10,eps)
    bisection(@f,2,4,100,eps)
    bisection(@f,5,7,100,eps) 
    
endfunction

main;