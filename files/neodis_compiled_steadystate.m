clear; clc; tic;
syms A alpha delta n sigma rho phi theta k c lambda mu ; 
alpha = 0.5;
eqn1 = (((1 - lambda*(1 - alpha))/(k^(1 - alpha))) - (rho + delta + n)) ;
eqn2 = phi*(1 - lambda) - A*theta*(1 - alpha)*lambda*(k^ alpha) ;
SS1 = solve([eqn1 ==0, eqn2 ==0],[k,lambda],'returnconditions',true,'IgnoreAnalyticConstraints',true)
E1 = [SS1.k(1); SS1.lambda(1)]
E2 = [SS1.k(2); SS1.lambda(2)]
toc