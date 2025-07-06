function y = sum_prob(tau,in,nodes,fun,phi,n)
U = expm(-1i*tau*n*fun(phi));
y = sum(abs(U(nodes,in)).^2);