function y = prob_superp(tau,init,fin,superp_phase,ham,phi, n_nodes,n)

IN= zeros( n_nodes,1) ;
IN( init(1))= 1;
FIN= zeros( n_nodes,1) ;
FIN( fin(1))= 1;



IN( init(2))= exp(1i*superp_phase);
FIN( fin(2))= exp(1i*superp_phase);
IN = IN./sqrt(2);

FIN = FIN./sqrt(2);


U = expm(-1i*tau*n*ham(phi));
y = abs(FIN'*U*IN)^2;