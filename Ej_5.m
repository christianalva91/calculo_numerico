clc;
format long;
e = exp(1);
fun = @(t,x)2*(t+1)*x;
sol = @(t,x) e^(t*t+2*t);
I = [0,2];
y0 = 1;
h = [1/50, 1/100, 1/200];

n(1) = h_to_n(h(1), I);
n(2) = h_to_n(h(2), I);
n(3) = h_to_n(h(3), I);

t50 = h(1);
for i = 1:n(1)+1
    res50(i) = feval(sol, t50*(i-1),1);
  end

t100 = h(2);
for i = 1:n(2)+1
    res100(i) =feval(sol, t100*(i-1),1);
end

t200 = h(3);
for i = 1:n(3)+1
    res200(i) =feval(sol, t200*(i-1),1);
end

[TnE1, WnE1] = mEuler(fun, y0, I ,n(1));
[TnE2, WnE2] = mEuler(fun, y0, I ,n(2));
[TnE3, WnE3] = mEuler(fun, y0, I ,n(3));

[TnT1, WnT1] = mTrapecio(fun, y0, I, n(1));
[TnT2, WnT2] = mTrapecio(fun, y0, I, n(2));
[TnT3, WnT3] = mTrapecio(fun, y0, I, n(3));

[TnPM1, WnPM1] = mPMedio(fun, y0, I, n(1));
[TnPM2, WnPM2] = mPMedio(fun, y0, I, n(2));
[TnPM3, WnPM3] = mPMedio(fun, y0, I, n(3));

[TnRK1, WnRK1] = mRK4(fun, y0, I, n(1));
[TnRK2, WnRK2] = mRK4(fun, y0, I, n(2));
[TnRK3, WnRK3] = mRK4(fun, y0, I, n(3));

err50E = abs(res50-WnE1);
err50T  = abs(res50-WnT1);
err50PM = abs(res50-WnPM1);
err50RK = abs(res50-WnRK1);

err100E = abs(res100-WnE2);
err100T  = abs(res100-WnT2);
err100PM = abs(res100-WnPM2);
err100RK = abs(res100-WnRK2);

err200E = abs(res200-WnE3);
err200T  = abs(res200-WnT3);
err200PM = abs(res200-WnPM3);
err200RK = abs(res200-WnRK3);

% Euler = [err50E(50); err100E(100); err200E(200)];
% Trapecio = [err50T(50); err100T(100); err200T(200)];
% PM = [err50PM(50); err100PM(100); err200PM(200)];
% RK4 = [err50RK(50); err100RK(100); err200RK(200)];
stp = 100;
Euler = [err50E(stp); err100E(2*stp); err200E(4*stp)];
Trapecio = [err50T(stp); err100T(2*stp); err200T(4*stp)];
PM = [err50PM(stp); err100PM(2*stp); err200PM(4*stp)];
RK4 = [err50RK(stp); err100RK(2*stp); err200RK(4*stp)];
Step = {'h=1/50'; 'h=1/100'; 'h=1/200'};

T = table(Euler,Trapecio,PM,RK4,'RowNames', Step);
disp(T)

% pE = log(err50E(81)/err50E(80))/log((81/50)/(80/50))

figure
lim = 100;
loglog(TnE1(1:lim), err50E(1:lim), TnT1(1:lim), err50T(1:lim), TnPM1(1:lim),err50PM(1:lim), TnRK1(1:lim), err50RK(1:lim))

% figure
% lim = 30;
% plot(TnE1(1:lim), err50E(1:lim), TnT1(1:lim), err50T(1:lim), TnPM1(1:lim),err50PM(1:lim))

% figure
% lim = 50;
% plot(TnE1(1:lim), err50E(1:lim), TnE1(1:lim), err100E(1:lim), TnE1(1:lim), err200E(1:lim))
% figure
% plot(TnT1(1:lim), err50T(1:lim), TnT1(1:lim), err100T(1:lim), TnT1(1:lim), err200T(1:lim))
