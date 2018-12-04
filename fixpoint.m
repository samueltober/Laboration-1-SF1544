function z = fixpoint(z0,x0,prevCar,h)
    z = z0;
    tol = 10^-6;
    err = 1;
    while err >= tol
        ztemp = x0 + h * f(prevCar-z);
        err = abs(ztemp - z);
        z = ztemp;
        disp(['Error = ' num2str(err)])
        clc
    end
end




