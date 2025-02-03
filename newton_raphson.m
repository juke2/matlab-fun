function [x,fx,iters] =  newton_raphson(f, fd, x0, iter, TOLERANCE)
    x(1) = x0;
    fx(1) = f(x0);
    iters(1) = 1;
    for i = 1:iter
        x(i+1) = x(i) - fx(i)/fd(x(i));
        iters(i+1) = i+1;
        fx(i+1) = f(x(i+1));
        if(fx(i+1) <= abs(TOLERANCE))
            break;
        endif
    endfor      
endfunction