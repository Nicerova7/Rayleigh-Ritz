%F4 no es necesario tan solo integrar p(x)
function y = F5(ii,xx) %fun puede ser q(x) p(x) f(x)
    global f;
    global x;
	y = (xx-x(ii)).*f(xx);
end