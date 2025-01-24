function x falseposition(f, a, b, iter, TOLERANCE)
    fofa = f(a);
    fofb = f(b);
    for i = 1:iter
        estimated_root = (b * f_a - a * f_b) / (f_a = f_b);
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