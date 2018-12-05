clear all
clc

h = 1; %Time step
T = 40; %Maximum time
N = T/h; %Number of Euler iterations
M = 10; %Number of cars
v_m = 25; %Speed limit
brake = false; %Brake boolean

x = zeros(M, N+1);

if brake == true
    k = 75;
    g = 5;
else
    k = 10;
    g = v_m;
end

%Set the initial values of each car
for i = 1:M
    x(i,1) = k*i;
end

%Explicit Euler method
for t = 1:h:N
    for i = 1:M
        if i < M
            x(i,t+1) = x(i,t) + h.*f(x(i+1,t)-x(i,t));
        elseif i == M
            x(i,t+1) = x(i,t) + h.*g;
        end
    end
end

%Plot
figure(10)

subplot(1,3,1)
hold on
t = 1:N+1;
for j = 1:M
    plot(t, x(j,:));
end
title('Explicit Euler')


%Visuals
% for n=1:N
%     plot(x(:,n),zeros(M,1),'r*');
%     axis([0 1000 -1 1])
%     pause(0.1)
%     hold off
%     drawnow
% end


%%

% clear all

h = 2; %Time step
T = 40; %Maximum time
N = T/h; %Number of Euler iterations
M = 10; %Number of cars
v_m = 25; %Speed limit
brake = false; %Brake boolean
x_1 = 0; %Reference to x(1, 40) calculated explicitly

x = zeros(M, N+1);

if brake == true
    k = 75;
    g = 5;
else
    k = 10;
    g = v_m;
end

%Set the initial values of each car
for i = 1:M
    x(i,1) = k*i;
end

%Calculate X(1,40) for reference
for t = 1:N
    for i = M:1:1
        if i == M
            x(i,t+1) = x(i,t) + h.*g;
        else
            x(i,t+1) = (3*x(i,t)+h*x(i+1,t+1))/(3+h);            
        end
        x_1 = x(1, 40);
    end
end

%Implicit Euler method with fixpoint
for t = 1:N
    for i = M:-1:1
        if i == M
            x(i,t+1) = x(i,t) + h.*g;
        else
            z0 = x(i+1,t);
            if t == 39 && i == 1
                x(i,t+1) = fixpoint_plot(z0,x(i,t),x(i+1,t+1),h, x_1);
            else
                x(i,t+1) = fixpoint(z0,x(i,t),x(i+1,t+1),h);     
            end             
        end
    end
end

figure(10)
subplot(1,3,2)
hold on

%Plot
t = 1:N+1;
for j = 1:M
    plot(t, x(j,:));
end

title('Implicit Euler with fixpoint')

%%

clear all

h = 1; %Time step
T = 40; %Maximum time
N = T/h; %Number of Euler iterations
M = 10; %Number of cars
v_m = 25; %Speed limit
brake = false; %Brake boolean

x = zeros(M, N+1);

if brake == true
    k = 75;
    g = 5;
else
    k = 10;
    g = v_m;
end

%Set the initial values of each car
for i = 1:M
    x(i,1) = k*i;
end

%Implicit Euler method without fixpoint
for t = 1:N
    for i = M:-1:1
        if i == M
            x(i,t+1) = x(i,t) + h.*g;
        else
            x(i,t+1) = (3*x(i,t)+h*x(i+1,t+1))/(3+h);            
        end
    end
end

figure(10)
subplot(1,3,3)
hold on

%Plot
t = 1:N+1;
for j = 1:M
    plot(t, x(j,:));
end

title('Implicit Euler without fixpoint')