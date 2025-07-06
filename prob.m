function y= prob(tau,in,fin,fun,phi,n)
U = expm(-1i*n*tau*fun(phi));
y = abs(U(fin,in))^2;