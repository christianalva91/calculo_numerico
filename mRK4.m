function [Tn,Wn] = mRK4(f, y0, I, n)
%
%

w(1) = y0;
t(1) = I(1);
h = (I(2) - I(1))/n;

for i = 1:n
    t(i+1) = t(i) + h;
    w(i+1) = w(i) + ((h/6)*RK(f, t(i),w(i)));
end

Tn = t;
Wn = w;

function [w] = RK(f, t ,w)
        S1 = feval(f,t,w);
        S2 = feval(f,t+(h/2),w + (h/2)*S1);
        S3 = feval(f,t+(h/2),w + (h/2)*S2);
        S4 = feval(f,t+h,w + h*S3);

        w = S1 + 2*S2 + 2*S3 + S4;
end


end


