function y = ham_six_switch_A(phi)

a = zeros(18,18);
a(1,2) = exp(-1i*phi(1)/3);
a(1,3)  =exp(1i*phi(1)/3);
a(1,4) = 1;
a(2,3) = exp(-1i*phi(1)/3);
a(2,7) = 1;
a(3,10) = 1;

a(4,5) = exp(-1i*phi(2)/3);
a(4,6) = exp(1i*phi(2)/3);
a(5,6) = exp(-1i*phi(2)/3);
a(5,13) = 1;
a(6,14) = 1;

a(7,8) = exp(-1i*phi(3)/3);
a(7,9) = exp(1i*phi(3)/3);
a(8,9) = exp(-1i*phi(3)/3);
a(8,15) = 1;
a(9,16) = 1;

a(10,11) =exp(-1i*phi(4)/3);
a(10,12) = exp(1i*phi(4)/3);
a(11,12) =exp(-1i*phi(4)/3);
a(11,17) = 1;
a(12,18) = 1;
a = a+a';
y = a;

end


