function [Tn,Wn] = mPMedio(f, y0, I, n)
%
%

w(1) = y0;
t(1) = I(1);
h = (I(2) - I(1))/n;

for i = 1:n
    t(i+1) = t(i) + h;
    w(i+1) = w(i) + (h*(feval(f,t(i)+(h/2),w(i)+ (h/2)*feval(f,t(i),w(i)))));
end

Tn = t;
Wn = w;

end

