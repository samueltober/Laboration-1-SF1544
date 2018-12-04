function z = fixpoint_plot(z0,x0,prevCar,h, ref)
    z = z0;
    tol = 10^-6;
    err = 1;
    diff = []; 
    
    while err >= tol
        diff = [diff, abs(z-ref)]; 
        
        ztemp = x0 + h * f(prevCar-z);
        err = abs(ztemp - z);  
        z = ztemp;
    end
    counts = linspace(1, length(diff), length(diff));
    
    figure(666)  
    set(gca,'yscale','log')
    hold on
    semilogy(counts, diff);
    disp(diff);
    
end




