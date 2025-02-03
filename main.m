1; #needed so it can be run (otherwise considered a function file)

function y = test_f(x)
    y = x.^2.- x - 2;
endfunction

function dy_dx = d_test_f(x)
    dy_dx = 2 .* x - 1;
endfunction

function y = f(x) # roots are pi and 2 pi at least
    y = exp(-x.^3.- cos(x)) + sin(x)./x;
endfunction

function main ()
    test_f(2)
    test_f(-1)
    bisection(@test_f,2.92332,0.613213123,10,eps)
    bisection(@f,2,4,100,eps)
    bisection(@f,5,7,100,eps) 
    falseposition(@test_f,2.92332,0.613213123,10,eps)
    falseposition(@f,2,4,100,eps)
    falseposition(@f,5,7,100,eps) 
    [fofmid,root,iters] = modified_falseposition(@test_f,2.92332,0.613213123,10,eps)
    [fofmid,root,iters] = modified_falseposition(@f,2,4,100,eps)
    [fofmid,root,iters] = modified_falseposition(@f,5,7,100,eps) 
    [x,fx,iters] = newton_raphson(@test_f,@d_test_f,1,100,eps)

endfunction

main;