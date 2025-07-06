function y = custom_6(DIM,phi, nodes)

a = zeros(DIM, DIM);
for i= 2:7
    if i ==2
    a(nodes(1),nodes(i)) = exp(-1i*phi(i-1)/3)*exp(1i*phi(6)/3);
    else
     a(nodes(1),nodes(i)) = exp(1i*phi(i-2)/3)*exp(-1i*phi(i-1)/3);
    end

    a(nodes(i), nodes(i+6)) = 1;
    if i <7
        a(nodes(i),nodes(i+1)) = exp(-1i*phi(i-1)/3);
    else
        a(nodes(2),nodes(i)) = exp(1i*phi(i-1)/3);
    end
end
a = a+a';
y = a;
