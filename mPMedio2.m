function [ Tn,W1,W2 ] = mPMedio2(f1,f2, wi_1, wi_2, ti, h)
     Tn = ti + h;
     W1 = wi_1 + (h*(feval(f1,ti+(h/2),wi_1+ (h/2)*feval(f1,ti,wi_1),wi_2+ (h/2)*feval(f2,ti,wi_2))));
     W2 = wi_2 + (h*(feval(f2,ti+(h/2),wi_1+ (h/2)*feval(f1,ti,wi_1),wi_2+ (h/2)*feval(f2,ti,wi_2))));

end

