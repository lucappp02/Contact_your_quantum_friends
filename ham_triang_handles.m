function y = ham_triang_handles(phi)
n = 4;
Nsites = n*n+4*n-4;
count_hand= n*n+1;
A = zeros(Nsites, Nsites);
%Nphas = n^2+n-2;
 for j = 0: n-1
    for i = 1:n
           
        %%generate chains
       if i<n 
        A(j*n+i, j*n+i+1) =1 ;
       end
       if j ==0||j ==n-1 ||i==1||i==n
           A(j*n+i,count_hand)= 1;
           count_hand = count_hand+1;
       end

        %%% connect chains
        if j < n-1
            
            A(j*n+i,j*n+i+n ) =1;
            if i ~= n && i ~= 1
                A(j*n+i,j*n+i+n )=1;
                A(j*n+i,j*n+i+n )=1;
            elseif mod(j,2) ==0
                A(j*n+1,j*n+1+n )=1;
                A(j*n+n,j*n+n+n )=1;
            end

            if mod(j,2) ==0 && i ~= n
                A(j*n+i,j*n+i+n+1 ) = 1;
            elseif mod(j,2) ~=0 && i ~= 1
                 A(j*n+i,j*n+i+n-1 ) = 1;
            end
        end
        
        
   end
         
 end
 A = A+A';

  for j = 0: n-1
    for i = 1:n
        %%punta in alto
        if mod(j,2)==0 && i ~= n && j ~= n-1
            A=A.*triang(Nsites, j*n+i,j*n+i+n+1,j*n+i+n,phi((n+2)*j+i+n/2+1));
        elseif mod(j,2)==1 && i ~= 1 && j ~= n-1
            A=A.*triang(Nsites, j*n+i,j*n+i+n,j*n+i+n-1,phi((n+2)*j+n/2+i));
        end
       
        %%punta in basso
        if mod(j,2)==0 && i ~= n && j ~= 0
            A = A.*triang(Nsites, j*n+i,j*n+i-n,j*n+i-n+1,phi((n+2)*(j-1)+i));
        elseif mod(j,2)==1 && i ~= 1 && j ~= 0
            A = A.*triang(Nsites, j*n+i,j*n+i-n-1,j*n+i-n,phi((n+2)*(j-1)+i-1));
        end
        
    end
    
  end




y = A;
end