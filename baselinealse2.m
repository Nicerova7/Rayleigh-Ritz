function z = baselinealse2(i,xx)
    
    global x;
    global h;
    
    if xx <= x(i)
        z = 0;
    elseif xx <= x(i+1)
        z = (xx-x(i))/h(i) ;
    elseif xx <= x(i+1+1)
        z = (x(i+1+1)-xx)/h(i+1);
    else z = 0;
    end
    
end
