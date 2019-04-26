function y = F1(ii,xx) %fun puede ser q(x) p(x) f(x)
	global x; %el global es para el xi-esimo
    global q;
	y = (x(ii+2) - xx).*(xx-x(ii+1)).*q(xx);
end