clear;

Ix=[0,1];
It=[0,1];
delta_x10=1/10; 
delta_t10=1/10;
M10=delta_to_steps(Ix,delta_x10);
N10=delta_to_steps(It,delta_t10);

u = @(x,t) exp(-pi*t)*cos(pi*x);
    
W1=m_heat_imp(Ix,It,M10,N10);

%Parte 1
gridSpace = linspace(Ix(1), Ix(2), M10+1);
gridTime = linspace(It(1), It(2), N10+1);
mesh(gridTime, gridSpace, W1, 'LineWidth',1.5);
title('Ecuación de calor');
xlabel('Tiempo');
ylabel('Espacio');
zlabel('Temperatura');

%Parte 2

%Para delta_t = 1/25
delta_t25=1/25;
N25=delta_to_steps(It,delta_t25);
W25=m_heat_imp(Ix,It,M10,N25);

%Para delta_t = 1/50
delta_t50=1/50;
N50=delta_to_steps(It,delta_t50);
W50=m_heat_imp(Ix,It,M10,N50);

%Para delta_t = 1/100
delta_t100=1/100;
N100=delta_to_steps(It,delta_t100);
W100=m_heat_imp(Ix,It,M10,N100);

%Para delta_t = 1/200
delta_t200=1/200;
N200=delta_to_steps(It,delta_t200);
W200=m_heat_imp(Ix,It,M10,N200);

%Valor aproximado en (x,t)=(3/10,1)
ap25=W25(4,26);
ap50=W50(4,51);
ap100=W100(4,101);
ap200=W200(4,201);

ap=[ap25;ap50;ap100;ap200];

for i=1:4
    res(i,1)=u(3/10,1);
    err(i,1)=abs(res(i)-ap(i));
end
Delta_T ={'1/25';'1/50';'1/100';'1/200'};
T=table(res,ap,err,'RowNames',Delta_T);
disp(T)

%Parte 3

%Para delta_x = 1/10
delta_x10=1/10;
M10=delta_to_steps(It,delta_x10);
W10=m_heat_imp(Ix,It,M10,N10);

%Para delta_x = 1/20
delta_x20=1/20;
M20=delta_to_steps(It,delta_x20);
W20=m_heat_imp(Ix,It,M20,N10);

%Para delta_x = 1/40
delta_x40=1/40;
M40=delta_to_steps(It,delta_x40);
W40=m_heat_imp(Ix,It,M40,N10);

%Valor aproximado en (x,t)=(3/10,1)
ap10=W10(4,11);
ap20=W20(7,11);
ap40=W40(13,11);

ap2=[ap10;ap20;ap40];

for i=1:3
    res2(i,1)=u(3/10,1);
    err2(i,1)=abs(res2(i)-ap2(i));
end
Delta_X ={'1/10';'1/20';'1/40'};
T=table(res2,ap2,err2,'RowNames',Delta_X);
disp(T)