format long

% ENTRADAS $

global x
x = [0 , 0.15 , 0.27, 0.50, 0.67, 0.86, 1];

n = length(x)-2; % x[6+1] = 1 pero 6 es porque array inicia en 1 entonces n = 5

global p
p=@(x) -1;

global q
q=@(x) pi^2/4;

global f
f=@(x) (pi^2/16)*cos((pi/4).*x);

% Fin de entradas $ 

h = zeros(1,n);

for i = 1:(n+1)
    h(i) = x(i+1)-x(i);
end

Q = zeros(6,n+1); % el + 1 para Q4,n+1

for i = 1:n
    
    Q(1,i) = ((1/h(i+1))^2)*simpson(@F1,i,x(i+1),x(i+1+1),20);
    Q(2,i) = ((1/h(i))^2)*simpson(@F2,i,x(i-1+1),x(i+1),20);
    Q(3,i) = ((1/h(i+1))^2)*simpson(@F3,i,x(i+1),x(i+1+1),20);
    Q(4,i) = ((1/h(i))^2)*simpson2(p,x(i),x(i+1),20);
    Q(5,i) = (1/h(i))*simpson(@F5,i,x(i),x(i+1),20);
    Q(6,i) = (1/h(i+1))*simpson(@F6,i,x(i+1),x(i+2),20);
    
end

Q(4,n+1) = (1/h(i))^2*simpson2(p,x(n+1),x(n+2),20);

alpha = zeros(1,n);
beta = zeros(1,n);
b = zeros(1,n);

for i= 1:n
    alpha(i) = Q(4,i) + Q(4,i+1)+Q(2,i)+Q(3,i);
    beta(i)  = Q(1,i) - Q(4,i+1);
    b(i)     = Q(5,i) + Q(6,i); % en el pdf esta menos pero no se nota bien es +
end

a = zeros(1,n);
zeta = zeros(1,n);
z = zeros(1,n);

a(1)    = alpha(1);
zeta(1) = beta(1)/a(1);
z(1)    = b(1)/a(1);

for i = 2:n-1
    a(i)    = alpha(i) - beta(i-1)*zeta(i-1); %en pdf esta / pero algoritmo es *
    zeta(i) = beta(i)  / a(i); % otra correccion aqui es a no alpha
    z(i)    = (b(i)    - beta(i-1)*z(i-1))/a(i);
end

a(n) = alpha(n) - beta(n-1)*zeta(n-1);
z(n) = (b(n)    - beta(n-1)*z(n-1))/a(n);

C = zeros(1,n);

C(n) = z(n);

for i = n-1:-1:1
    C(i) = z(i)-zeta(i)*C(i+1);
end

% d' = z
% c' = zeta
% c = beta
% b = alpha

