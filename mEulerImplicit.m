function [ Tn, Wn ] = mEulerImplicit( f, y0, I, n )
    w(1) = y0;
    t(1) = I(1);
    h = (I(2) - I(1))/n;

    for i = 1:n
       oldt = t(i);
       oldy = w(i);
       t(i+1) = oldt +h;
       w(i+1) = fzero(@(y) y -h*feval(f,t(i+1),y)-oldy, y);
       
    end

    Tn = t;
    Wn = w;

end

