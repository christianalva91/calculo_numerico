function [ Tn, Wn ] = mEulerImplicit( f, y0, I, n )
    w(1) = y0;
    t(1) = I(1);
    h = (I(2) - I(1))/n;

    for i = 1:n
       t(i+1) = t(i) + h;
       faux = @(y) y - (w(i) + h*feval(f,t(i+1), y));
       wt = fzero(faux,0);
       w(i+1) = w(i)+ h*feval(f,t(i+1),wt);
      
    end

    Tn = t;
    Wn = w;

end

