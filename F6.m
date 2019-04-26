function y = F6(ii,xx) %fun puede ser q(x) p(x) f(x)
	global x; %el global es para el xi-esimo
    global f;
	y = (x(ii+2)-xx).*f(xx);
end