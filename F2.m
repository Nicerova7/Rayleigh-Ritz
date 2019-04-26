function y = F2(ii,xx) %fun puede ser q(x) p(x) f(x)
	global x; %el global es para el xi-esimo
    global q;
	y = (xx-x(ii)).^2.*q(xx);
end