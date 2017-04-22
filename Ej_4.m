fun = @(t,x)5*x-3*x^2;
fun1 = @(x,t)5*x-3*x^2;
interval = [0, 20];
y0 = 1/2;
h1 = 1/2;
n1 = h_to_n(h1,interval);

[Tn1, Wn1] = mEulerImplicit(fun, y0, interval ,n1);

h2 = 1/6;
n2 = h_to_n(h2,interval);
[Tn2, Wn2] = mEuler(fun, y0, interval ,n2);

h3 = 1/5;
n3 = h_to_n(h3,interval);
[Tn3, Wn3] = mEuler(fun, y0, interval ,n3);

h4 = 1/4;
n4 = h_to_n(h4,interval);
[Tn4, Wn4] = mEuler(fun, y0, interval ,n4);

h5 = 1/2;
n5 = h_to_n(h5,interval);
[Tn5, Wn5] = mEuler(fun, y0, interval ,n5);

Wn1(41)
Wn2(41)
Wn3(41)
Wn4(41)
Wn5(41)
