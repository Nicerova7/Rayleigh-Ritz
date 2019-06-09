function z = tracubico2(f,i,xx)

    global h;
    global x;
    global n;
    
    if i == 0
        z = arrayfun(f,(xx./h(i+1))) - 4*arrayfun(f,(xx+h(i+1))./h(i+1)); %./ para multi y que conserve dimension
    elseif i == 1
        z = arrayfun(f,(xx-x(i+3))./h(i+1)) - arrayfun(f,(xx+h(i+1))./h(i+1));
    elseif i <= n-1
        z = arrayfun(f,((xx-x(i+3))./h(i+1)));
    elseif i == n
        z = arrayfun(f,(xx-x(i+3))./h(i+1)) - arrayfun(f,(xx-(n+2)*h(i+1))./h(i+1));
    else z = arrayfun(f,(xx-x(n+1+3))./h(i+1)) - 4*arrayfun(f,(xx-(n+2)*h(i+1))./h(i+1));
    end
    
end