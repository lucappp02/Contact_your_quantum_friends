function y = ham_six_switch_B( phi)

a = zeros(13,13);
for i= 2:7
    if i ==2
    a(1,i) = exp(-1i*phi(i-1)/3)*exp(1i*phi(6)/3);
    else
     a(1,i) = exp(1i*phi(i-2)/3)*exp(-1i*phi(i-1)/3);
    end

    a(i, i+6) = 1;
    if i <7
        a(i,i+1) = exp(-1i*phi(i-1)/3);
    else
        a(2,i) = exp(1i*phi(i-1)/3);
    end
end
a = a+a';
y = a;

