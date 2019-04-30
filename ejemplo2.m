format long

global p
p=@(x) 1;

global q
q=@(x) pi^(2);

global f
f=@(x) 2*pi^(2)*sin(pi*x);

global n;
n = 9;
a = 0;  b = 1;
global h
h = (b-a)/(n+1) ;

global x
x = zeros([n+2+2+2,1]); % +2 por 0 y n+1 ; +2 por x_-2,x_-1 ; +2 por x_n+2,x_n+3


% necesitamos x_-2 y x_-1 que seran x_1 y x_2 respectivamente 

x(1) = 0; x(2) = 0;

for i = 3:n+1+3 % + 1 porque es hasta n+1 y + 3 pq estamos corriendo por linea 14
   
    x(i) = (i-3)*h;
    
end

% tambien se necesita x_n+2 y x_n+3 que seran 2 valores más. 
% se agrega 1 porque x comienza en 1 no en 0
x(n+2+2+1) = 1 ; x(n+2+2+2) = 1; % se acaba en n+1+3 los siguientes serian 2+2+1 y 2+2+2

a = zeros([n+1,n+1]);
b = zeros([n+1,1]);

for i = 0:n+1 % aqui mantenemos original pq tenemos que pasarle estos parametros a tracubico 
              % no hay problema pq dentro de tracubico ya se arreglo los
              % indices
    for j = i:min(i+3,n+1)
        L = max(x(j+1),0);
        U = min(x(i+5),1);
        a(i+1,j+1) = simpson21(p,q,@tracubico,i,j,L,U,50); 
    end
    if i ~= j
        a(j+1,i+1) = a(i+1,j+1); % matriz A simetrica
    end
    if i >= 4
        for j = 0:i-4
            a(i+1,j+1) = 0;
        end
    end
    if i <= n-3
        for j = i+4:n+1
            a(i+1,j+1) = 0;
        end
    end
    L = max(x(i+1),0);
    U = min(x(i+5),1);
    b(i+1) = simpson22(f,@tracubico,i,L,U,50);
end

% resolver sistema Ac = b 
% luego paso 11 y fin