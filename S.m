function z = S(x)
    if x <= -2
        z = zeros([length(x),1]);
    elseif x <= -1
        z = (1/4)*(2+x).^(3) ;
    elseif x <= 0
        z = (1/4)*(2+x).^(3) - 1*(1+x).^(3);
    elseif x <= 1
        z = (1/4)*(2-x).^(3) - 1*(1-x).^(3);
    elseif x <= 2
        z = (1/4)*(2-x).^(3) ;
    else z = zeros([length(x),1]);
    end
end