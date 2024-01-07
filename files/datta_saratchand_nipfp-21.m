options = odeset('RelTol', 1e-8);
[t0,x0] = ode45(@newsirv1, [0 500], [0.9 0 0], options);
[t1,x1] = ode45(@newsirv1, [500 1000], [0.9 0.1 0], options);
[t2,x2] = ode45(@newsirv2, [1000 1500], [x1(141,:)], options);
[t3,x3] = ode45(@newsirv1, [1500 2000], [x2(153,:)], options);
[t4,x4] = ode45(@newsirv2, [2000 2500], [x3(137,:)], options);
[t5,x5] = ode45(@newsirv3, [2500 3500], [x4(153,:)], options);
t = [t0;t1;t2;t3;t4;t5];
x = [x0;x1;x2;x3;x4;x5];
set(gcf, 'Position', [5, 5, 700, 400]);
plot(t,x,'LineWidth',2)
xlabel1 = xlabel('Time');
set(xlabel1,'Interpreter','latex','FontSize',20); 
ylabel1 = ylabel('$y$, $i$, $r$');
set(ylabel1,'Interpreter','latex','FontSize',20);
title1 = title('Simulation under policy shocks');
set(title1,'Interpreter','latex','FontSize',20);
legend1 = legend('$y$', '$i$', '$r$');
set(legend1,'Interpreter','latex','FontSize',20);
saveas(gcf,'simpolshock','epsc');
%
function xdot = newsirv1(t,x)
eta = 1.1; b = 0.1; rho = 0.1; j = 0.1; psi = 0.01;  
h = 0.05; kappa = 0.5 ;
alpha = 0.1;
xdot = zeros(3,1) ; % initialize xdot matrix
xdot(1) = alpha*(1 - eta*x(1) - kappa*x(2))*(x(1)) ;
xdot(2) = b*(x(2))*( 1 - (x(2)) - (x(3))) - rho*(x(2)) + j*(x(2))*(x(1));
xdot(3) = psi*(1 - (x(2)) - (x(3))) + rho*(x(2)) - h*(x(3));
end
function xdot = newsirv2(t,x)
eta = 1.1; b = 0.1; rho = 0.1; j = 0.1; psi = 0.01; %kappa = 0.5; 
h = 0.05; kappa = 3 ;
alpha = 0.1;
xdot = zeros(3,1) ; % initialize xdot matrix
xdot(1) = alpha*(1 - eta*x(1) - kappa*x(2))*(x(1)) ;
xdot(2) = b*(x(2))*( 1 - (x(2)) - (x(3))) - rho*(x(2)) + j*(x(2))*(x(1));
xdot(3) = psi*(1 - (x(2)) - (x(3))) + rho*(x(2)) - h*(x(3));
end
function xdot = newsirv3(t,x)
eta = 1.1; b = 0.1; rho = 0.1; j = 0.1; psi = 0.4; kappa = 0.5; 
h = 0.05;
alpha = 0.1;
xdot = zeros(3,1) ; % initialize xdot matrix
xdot(1) = alpha*(1 - eta*x(1) - kappa*x(2))*(x(1)) ;
xdot(2) = b*(x(2))*( 1 - (x(2)) - (x(3))) - rho*(x(2)) + j*(x(2))*(x(1));
xdot(3) = psi*(1 - (x(2)) - (x(3))) + rho*(x(2)) - h*(x(3));
end
