function z=simpson21(p,q,fi,i,j,a,b,n) % fi es tracubico
  h=(b-a)/n;
  dx = 0.00000001;
  x=linspace(a,b,n+1);
  C=ones([n+1,1]);
  C(2:2:n)=4;
  C(3:2:n-1)=2;
  z = ((h/3)*( (p(x).*((fi(@S,i,x+dx)-fi(@S,i,x))/dx).*((fi(@S,j,x+dx)-fi(@S,j,x))/dx) + q(x).*fi(@S,i,x).*fi(@S,j,x)) * C)); % .* pq hablamos de arrays
                % p(x)*fi_i'(x)*fi_j'(x)+q(x)*fi_i(x)*fi_j(x)   + q(x).*fi(@S,i,x).*fi(@S,j,x)
                % no agregamos sum pq como se multiplican matrices de  1xn
                % (primer miembro) con n*1 (C) te da una matriz de 1x1 osea suma automatica
end