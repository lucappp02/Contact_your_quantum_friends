function y = ham_four_switch_A( phi)
a = zeros(8,8);
a(1,2) = exp(-1i*phi(1)/3);
a(2,3) = exp(-1i*phi(2)/3);
a(3,4) = exp(-1i*phi(2)/3);
a(4,1) = exp(-1i*phi(1)/3);
a(2,4) = exp(-1i*phi(1)/3)*exp(+1i*phi(2)/3);
a(1,5) = 1;
a(2,6) = 1;
a(3,7) = 1;
a(4,8) = 1;


a = a+a';
y = a;
