f = @(t,y) 2*(t+1)*y;

I = [0,1]
y0 = 1;
t0 = I(1)
I = [0,1];
n = 10;

[Tn, Wn] = mEuler(f,y0, I, n);
Wn

yt = @(y0,t0,t) y0*exp(t^2 - t0 +2*( t -t0 ));

Eglobal = abs(Wn(length(Wn)) - yt(y0,Tn(1),1));
Eglobal

for i = 1:10
    Elocal(i) = abs (Wn(i+1) - yt(Wn(i),0,.1));
end

max(Elocal)

for i = 1:6
    h(i) = (.1*(2^(-(i-1))));
end
for i = 1:6
    step(i) = 1/h(i);
end

Tsol = zeros(max(step)+1,length(step)); Wsol = zeros(max(step)+1,length(step)); 

for j = 1:6
    [Taux, Waux] = mEuler(f,y0,I,step(j))
    for i = 1:length(Taux)
        Wsol(i,j) = Waux(i);
        Tsol(i,j) = Taux(i);
    end
    clearvars Taux Yaux
end

for i = 1:6
    ygraph(i) = Wsol(step(i)+1,i);
end

for i = 1:6
    Eglobal2(i) = abs(ygraph(i) - yt(y0,t0,1))
end 
   
plot(log(h),log(Eglobal2))
Elocal = zeros(max(step),length(step));

for j = 1:6
    for i = 1:step(j)
        Elocal(i,j) = abs (Wsol(i+1,j) - yt(Wsol(i,j),0,h(j)));
    end
    [maximo,paso] = max(Elocal(:,j));
    Elocalh(j) = maximo;
    maxstep(j) = paso;
end

Distancia = transpose(h);
Paso = transpose(maxstep);
Error_local = transpose(Elocalh);

T = table(Distancia, Paso, Error_local)
