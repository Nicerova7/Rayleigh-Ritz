function z=simpson22(f,fi,i,a,b,n) % fi es tracubico
  h=(b-a)/n;
  x=linspace(a,b,n+1);
  C=ones([n+1,1]);
  C(2:2:n)=4;
  C(3:2:n-1)=2;
  z = ((h/3)*( (f(x).*fi(@S,i,x)) * C)); 
           
end