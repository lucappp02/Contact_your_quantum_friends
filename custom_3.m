function y = custom_3(DIM,phi, nodes)
A = zeros(DIM, DIM);
A(nodes(1), nodes(2)) = exp(-1i*phi/3);
A(nodes(2), nodes(3)) = exp(-1i*phi/3);
A(nodes(3), nodes(1)) = exp(-1i*phi/3);
A(nodes(1), nodes(4)) = 1;
A(nodes(2), nodes(5)) = 1;
A(nodes(3), nodes(6)) = 1;
y = A+A';
end