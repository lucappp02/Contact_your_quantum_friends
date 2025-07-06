function y = ham_four_switch_B( phi)
a = zeros(9,9);
a(1,2) = exp(-1i*phi(1)/3);
a(2,3) = exp(-1i*phi(1)/3);
a(3,1) = exp(-1i*phi(1)/3);

a(1,4) = exp(-1i*phi(2)/3);
a(4,5) = exp(-1i*phi(2)/3);
a(5,1) = exp(-1i*phi(2)/3);

a(5,9) = 1;
a(3,7) = 1;
a(4,8) = 1;
a(2,6) = 1;


a = a+a';
y = a;

%% molto meglio dell altoro, interessante che le fasi ottimali non sono sempre multipli di pi/2