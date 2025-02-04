function [fofmid,root,iters] = bisection(f, a, b, iter, TOLERANCE)
    fofmid = [];
    root = [];
    iters = [];
    fofa = f(a);
    for i = 1:iter
        root(i) = (a + b)*0.5;
        iters(i) = i;
        fofmid(i) = f(root(i));
        if(abs(fofmid(i)) < TOLERANCE)
            return
        elseif(xor(fofmid(i) < 0,  fofa < 0))
            b = root(i);

        else
            a = root(i);
            fofa = fofmid(i);
        endif
    endfor
endfunction


