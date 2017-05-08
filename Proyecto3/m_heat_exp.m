function W = m_heat_exp(Ix, It, M, N)
% In : Ix ... space interval [a, b]
% It ... time interval [t0, t0 + T]
% M ... number of space steps
% N ... number of time steps
%
% Out: W ... numerical solution
f=@(x) cos(pi*x);
l=@(t) exp(-pi*t);
r=@(t) -exp(-pi*t);
D=1/pi;

xl=Ix(1); xr=Ix(2); yb=It(1); yt=It(2);
h=(xr-xl)/M; k=(yt-yb)/N; m=M-1; n=N;
sigma=D*k/(h*h);

a=diag(1-2*sigma*ones(m,1))+diag(sigma*ones(m-1,1),1);
a=a+diag(sigma*ones(m-1,1),-1); 

lside=l(yb+(0:n)*k); rside=r(yb+(0:n)*k);

W(:,1)=f(xl+(1:m)*h)'; % initial conditions
for j=1:n
W(:,j+1)=a*W(:,j)+sigma*[lside(j);zeros(m-2,1);rside(j)];
end

W=[lside;W;rside]; % attach boundary conds

end


