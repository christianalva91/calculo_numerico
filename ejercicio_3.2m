e=exp(1);
fun= @(t,x) 2*(t+1)*x;
sol = @(t,x) e^(t*t+2*t);
y0=1;
h=1/10;
I=[0,1];
n=h_to_n(h,I);
h2=1/20;
n2=h_to_n(h2,I);

[Tn,Wn] = mTrapecio(fun, y0, I, n)

t10=h;
for i=1:n+1
    res10(i)=feval(sol,t10*(i-1));
end

errort10=abs(res10-Wn);
errort10(11)

[Tn2,Wn2] = mTrapecio(fun, y0, I, n2)

t20=h2;
for i=1:n2+1
    res20(i)=feval(sol,t20*(i-1));
end

errort20=abs(res20-Wn2)
errort20(21)

[Tnrk,Wnrk] = mRK4(fun, y0, I, n)

trk=h;
for i=1:n+1
    resrk(i)=feval(sol,trk*(i-1));
end

errortrk=abs(resrk-Wnrk);
errortrk(11)


Trapecio=[errort10(11);errort20(21)];
RK4=[errortrk(11);0];

Step={'h=1/10';'h=1/20'};
T=table(Trapecio,RK4,'RowNames',Step);
disp(T);















