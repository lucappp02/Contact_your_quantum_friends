function y = custom_4(DIM,phi, nodes)
a = zeros(DIM,DIM);
a(nodes(1),nodes(2)) = exp(-1i*phi(1)/3);
a(nodes(2),nodes(3)) = exp(-1i*phi(1)/3);
a(nodes(3),nodes(1)) = exp(-1i*phi(1)/3);

a(nodes(1),nodes(4)) = exp(-1i*phi(2)/3);
a(nodes(4),nodes(5)) = exp(-1i*phi(2)/3);
a(nodes(5),nodes(1)) = exp(-1i*phi(2)/3);

a(nodes(5),nodes(9)) = 1;
a(nodes(3),nodes(7)) = 1;
a(nodes(4),nodes(8)) = 1;
a(nodes(2),nodes(6)) = 1;


a = a+a';
y = a;
