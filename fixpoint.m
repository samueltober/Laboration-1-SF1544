function z = fixpoint(z0,x0,prevCar,h)
    z = z0; %Inital guess
    tol = 10^-6; %Convergence tolerence
    err = 1;
    
    while err >= tol %Loop until convergence
        ztemp = x0 + h * f(prevCar-z); %Fixpoint iteration
        err = abs(ztemp - z);  %Difference between iterations
        disp(err);
        z = ztemp;
        clc
    end
end




