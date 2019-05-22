format long

% Entradas %
a = 0; b = 1; n = 19; % n = 19 pero como comienza con 0 son 19+1 = 20 valores

global x
x = linspace(a,b,n+1+1); %+1 porque es 20  +1 porque es linspace

global p
p=@(x) exp(-x);

global q
q=@(x) exp(-x);

global f
f=@(x) x-1-exp(1-x).*(x+1);

% Fin de entradas $

global h;
h = (b-a)/(n+1);
%x(21) = x(20)+h;
Q = zeros(6,n+1); % el + 1 para Q4,n+1

for i = 1:n
    
    Q(1,i) = (1/h)^2*simpson(@F1,i,x(i+1),x(i+1+1),20); % cuando se pone @ se usa como parametro
    Q(2,i) = (1/h)^2*simpson(@F2,i,x(i-1+1),x(i+1),20);
    Q(3,i) = (1/h)^2*simpson(@F3,i,x(i+1),x(i+1+1),20);
    Q(4,i) = (1/h)^2*simpson2(p,x(i),x(i+1),20);
    Q(5,i) = (1/h)*simpson(@F5,i,x(i),x(i+1),20);
    Q(6,i) = (1/h)*simpson(@F6,i,x(i+1),x(i+2),20);
    
end

Q(4,n+1) = (1/h)^2*simpson2(p,x(n+1),x(n+2),20);

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

yy = zeros([n,1]);

puntos = linspace(0,1,n+2);
for i = 2:20
    for j = 1:19
    yy(j) = yy(j)+C(j)*baselinealse(j,puntos(i));
    end
end

plot(puntos(2:20),yy,'--')
xlabel('Xi valores')
ylabel('Yi(Xi)')
%legend('Base lineal malla uniforme')
hold on

