function z=simpson2(f,a,b,n)
  h=(b-a)/n;
  x=linspace(a,b,n+1);
  C=ones([n+1,1]);
  C(2:2:n)=4;
  C(3:2:n-1)=2;
  if length(f(x)) == 1
  z = sum((h/3)*(f(x)*C));
  else z = (h/3)*dot(f(x),C);
  end
end