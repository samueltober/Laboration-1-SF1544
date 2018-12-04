function y = f(x)
    for i = 1:length(x)
        if x(i) <= 75
            y(i) = (1/3)*x(i);
        else
            y(i) = 25;
        end
    end
end


    