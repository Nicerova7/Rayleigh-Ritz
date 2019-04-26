function y = F3(ii,xx) %fun puede ser q(x) p(x) f(x)
	global x; %el global es para el xi-esimo
    global q;
	y = (x(ii+2)-xx).^2.*q(xx);
end