format long

% Caso no necesariamente simetrico spline cubico malla no uniforme %

% ENTRADAS $

global n;
n = 19;

global p
p=@(x) exp(-x);

global q
q=@(x) exp(-x);

global f
f=@(x) x-1-exp(1-x).*(x+1);



global x
x = zeros([n+2+2+2,1]); % +2 por 0 y n+1 ; +2 por x_-2,x_-1 ; +2 por x_n+2,x_n+3


% necesitamos x_-2 y x_-1 que seran x_1 y x_2 respectivamente 

x(1) = 0; x(2) = 0;

% tambien se necesita x_n+2 y x_n+3 que seran 2 valores más. 
% se agrega 1 porque x comienza en 1 no en 0
x(n+2+2+1) = 1 ; x(n+2+2+2) = 1; % si acaba en n+1+3 los siguientes serian 2+2+1 y 2+2+2
% Fin de las entradas $

x(3:n+1+3) = [0 , 0.07, 0.15, 0.17, 0.21, 0.27, 0.33, 0.35, 0.42, 0.46, 0.52, 0.56, 0.62,..., 
    0.66, 0.72, 0.76, 0.83, 0.87, 0.90, 0.97, 0.99];

global h

for i = 3:(n+1+3)
    h(i-2) = x(i+1)-x(i);
end


a = zeros([n+2,n+2]); % si se llena todo de 0 se omite paso 7 y 8
b = zeros([n+2,1]);

for i = 0:n+1 % aqui mantenemos original pq tenemos que pasarle estos parametros a tracubico 
              % no hay problema pq dentro de tracubico ya se arreglo los
              % indices
    for j = i:min(i+3,n+1)
        L = max(x(j+1),0);
        U = min(x(i+5),1);
        a(i+1,j+1) = simpson21(p,q,@tracubico2,i,j,L,U,50);
        if i ~= j
        a(j+1,i+1) = a(i+1,j+1); % matriz A simetrica
        end
    end
  
    L = max(x(i+1),0);
    U = min(x(i+5),1);
    b(i+1) = simpson22(f,@tracubico2,i,L,U,50);
end
    
% resolver sistema Ac = b

c = linsolve(a,b);
% luego paso 11 y fin


yy = zeros([n+2,1]); % En este método tenemos 2 más de salida

puntos = linspace(0,1,n+2);

for i = 1:n+2
    for j = 1:n+2
    yy(i) = yy(i)+c(j)*tracubico2(@S,j-1,puntos(i)); %tracubico != base lineal
    end
end

plot(puntos,yy,':')
%legend('Base Spline malla uniforme')


