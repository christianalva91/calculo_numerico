function [Tn,Wn] = mRK4(f, y0, I, n)
%
%

w(1) = y0;
t(1) = I(1);
h = (I(2) - I(1))/n;


for i = 1:n
    t(i+1) = t(i) + h;
    S1 = feval(f,t(i),w(i));
    S2 = feval(f,t(i)+(h/2),w(i) + (h/2)*S1);
    S3 = feval(f,t(i)+(h/2),w(i) + (h/2)*S2);
    S4 = feval(f,t(i)+h,w(i) + h*S3);
    z = S1 + 2*S2 + 2*S3 + S4;
    w(i+1) = w(i) + ((h/6)*z);
end

Tn = t;
Wn = w;

%     function z = RK(t ,w)
%     S1 = feval(f,t,w);
%     S2 = feval(f,t+(h/2),w + (h/2)*S1);
%     S3 = feval(f,t+(h/2),w + (h/2)*S2);
%     S4 = feval(f,t+h,w + h*S3);
% 
%     z = S1 + 2*S2 + 2*S3 + S4;
%     end


end


