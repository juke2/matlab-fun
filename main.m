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

function err =  abs_percent_error(x, expected)
    err = abs((x - expected)./expected.*100)
endfunction

function main ()
    % test_f(2)
    % test_f(-1)
    [fofmid,root,iters] = bisection(@test_f,2.92332,0.613213123,10,eps)
    [fofmid,root,iters] = bisection(@f,2,4,100,eps)
    [fofmid,root,iters] = bisection(@f,5,7,100,eps) 
    [fofmid,root,iters] = falseposition(@test_f,2.92332,0.613213123,10,eps)
    [fofmid,root,iters] = falseposition(@f,2,4,100,eps)
    [fofmid,root,iters] = falseposition(@f,5,7,100,eps) 
    [fofmid,root,iters] = modified_falseposition(@test_f,2.92332,0.613213123,10,eps)
    [fofmid,root,iters] = modified_falseposition(@f,2,4,100,eps)
    [fofmid,root,iters] = modified_falseposition(@f,5,7,100,eps) 
    [x,fx,iters] = newton_raphson(@test_f,@d_test_f,1,100,eps)

    [fofmid,root,iters] = bisection(@f,2,4,100,eps);
    semilogy(iters,abs_percent_error(fofmid,eps));
    hold on; 
    [fofmid,root,iters] = falseposition(@f,2,4,100,eps);
    semilogy(iters, abs_percent_error(fofmid,eps));
    hold on;
    [fofmid,root,iters] = modified_falseposition(@f,2,4,100,eps);
    semilogy(iters, abs_percent_error(fofmid,eps));

    title('Numerical Root Solving Methods\'' accuracy vs iteration count');
    xlabel('Number of Iterations');
    ylabel('Accuracy of Approximation (percent error)');
    legend('Bisection','Falseposition','Modified Falseposition');

    pause(50)


endfunction



main;