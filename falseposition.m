function [fofmid,root,iters] = falseposition(f, a, b, iter, TOLERANCE)
    fofa = f(a);
    fofb = f(b);
    fofmid = [];
    root = [];
    iters = [];
    for i = 1:iter
        root(i) = (b * fofa - a * fofb) / (fofa - fofb);
        fofmid(i) = f(root(i));
        iters(i) = i;
        if(abs(fofmid(i)) < TOLERANCE)
            return
        elseif(xor(fofmid(i) < 0,  fofa < 0))
            b = root(i);
            fofb = fofmid(i);
        else
            a = root(i);
            fofa = fofmid(i);
        endif
    endfor

endfunction