function estimated_root = bisection(f, a, b, iter, TOLERANCE)
    fofa = f(a);
    for i = 1:iter
        estimated_root = (a + b)*0.5;
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


