clear;
Ix=[0,1];
It=[0,1];
delta_x=1/10; 
delta_t=1/100;
M=delta_to_steps(Ix,delta_x);
N=delta_to_steps(It,delta_t);

u = @(x,t) exp(-pi*t)*cos(pi*x);
    
W=m_heat_exp(Ix,It,M,N);

err=abs(W(4,101)-u(3/10,1)); %error en en (x,t)=(3/10,1)
disp('error en (x,t)=(3/10,1)')
disp(err)

gridSpace = linspace(Ix(1), Ix(2), M+1);
gridTime = linspace(It(1), It(2), N+1);
mesh(gridTime, gridSpace, W, 'LineWidth',1.5);
title('Ecuación de Calor');
xlabel('Tiempo');
ylabel('Espacio');
zlabel('Temperatura');
