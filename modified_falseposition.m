function [fofmid,root,iters] =  modified_falseposition(f, a, b, iter, TOLERANCE)
    fofa = f(a);
    fofb = f(b);
    fofmid = [];
    root = [];
    iters = [];
    side = 0;
    for i = 1:iter
        root(i) = (b * fofa * 0.5 - a * fofb)./(fofa * 0.5 - fofb);
        fofmid(i) = f(root(i));
        iters(i) = i;
        if(abs(fofmid(i)) < TOLERANCE)
            return
        elseif(fofb * fofmid(i) > 0)
            b = root(i);
            fofb = fofmid(i);
            if(side == -1)
                fofa = fofa * 0.5;
            endif
            side = -1;
        elseif(fofa * fofmid(i) > 0)
            a = root(i);
            fofa = fofmid(i);
            if(side == 1)
                fofb = fofb*0.5;
            endif
            side = 1;
        else
            root(i) = NaN;
            return
        endif
    endfor

endfunction