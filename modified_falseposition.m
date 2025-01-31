function estimated_root =  modified_falseposition(f, a, b, iter, TOLERANCE)
    fofa = f(a);
    fofb = f(b);
    side = 0;
    for i = 1:iter
        estimated_root = (b * fofa * 0.5 - a * fofb) / (fofa * 0.5 - fofb);
        fofmid = f(estimated_root);
        if(abs(fofmid) < TOLERANCE)
            return
        elseif(fofb * fofmid > 0)
            b = estimated_root;
            fofb = fofmid;
            if(side == -1)
                fofa = fofa * 0.5;
            endif
            side = -1;
        elseif(fofa * fofmid > 0)
            a = estimated_root;
            fofa = fofmid;
            if(side == 1)
                fofb = fofb*0.5;
            endif
            side = 1;
        else
            estimated_root = NaN;
            return
        endif
    endfor

endfunction