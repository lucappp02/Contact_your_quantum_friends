function y = GA_superpositions( nphases,n_nodes,Ham, init,fin, np,pe, k, pm, P_infection, Perc_infected,t0,t1,maxit, internal_nodes, weight,n_bins)

step = 2*pi/n_bins;

IN= zeros( n_nodes,n_bins+1) ;
IN( init(1),:)= 1;
FIN= zeros( n_nodes,n_bins+1) ;
FIN( fin(1),:)= 1;
IN = IN./sqrt(2);

FIN = FIN./sqrt(2);
for i= 0:n_bins

IN( init(2),i+1)= exp(1i*-pi+step*i);
FIN( fin(2),i+1)= exp(1i*-pi+step*i);
end

% random generation

    
    lambda = zeros(nphases+1,np);
   
    for i = 1:np
       
     lambda(1,i) = t0+(t1-t0)*rand;
    lambda(2:nphases+1,i) =-pi+ 2*pi*rand( nphases,1);
    
    end

    for flg = 1:maxit
%fitness evaluation
        
        fitness_score = zeros(np,1);
        
        for i = 1:np
            
            U = expm(-1i *lambda(1,i)*Ham( lambda(2:nphases+1,i)));
        
            for j = 1 : n_bins+1
            fitness_score(i)=fitness_score(i)+ 1- abs(FIN(:,j)'*U*IN(:,j))^2-weight*sum(abs(U(internal_nodes,:)*IN(:,j)).^2);
            end
        end

%sorting

        [fitness_score, ind] = sort(fitness_score);
        lambda = lambda(:,ind);


        N_elite = floor(pe*np);
        child = zeros(nphases+1,np);
        child(:,1: N_elite)= lambda(:,1: N_elite);
        
   
       
        

        for i = N_elite+1:np

            %%TOURNAMENT
         r1 = min(randi([1,np], 1,k));
            r2 = min(randi([1,np], 1,k));
            
                  %crossover

                for l = 1:nphases+1
                    
                    x = randi([0 1]);
                    if x
                        child(l,i) = lambda(l,r1);
                    else
                        child(l,i) = lambda(l,r2);
                    end
                end   
        end

         %%% mutation
         fitness_score = zeros(np,1);
        
        for i = N_elite+1:np
            U = expm(-1i *child(1,i)*Ham( child(2 :nphases+1,i)));
            for j = 1 : n_bins+1
            fitness_score(i)=fitness_score(i)+ 1- abs(FIN(:,j)'*U*IN(:,j))^2-weight*sum(abs(U(internal_nodes,:)*IN(:,j)).^2);
            end
        end

        N_infected = floor(Perc_infected*np);
        for i = N_elite+1:np
            x = rand;
              if x < pm*fitness_score(i)
                   
                  child(1,i) = child(1, i)+((t1-t0)/10)*fitness_score(i)*randn(1);
                   child(2: nphases+1,i) =  child(2 :nphases+1, i)+pi./5.*fitness_score(i).*randn(nphases,1);
                   if child(1,i) <0
                       child(1,i) =t0+(t1-t0)*rand;
                   end
              end
                 child(2 :nphases+1,i) = mod(child(2: nphases+1,i),2*pi);
                 for it= 2:nphases+1
                    if child(it,i)> pi
                        child(it,i) = child(it,i)-2*pi;
                    end
                 end

                 %%%infection
                 if i >np-N_infected
                     y = rand;
                     if y < P_infection

                        child(1,i) =t0+(t1-t0)*rand;
                         child(2:nphases+1,i) =-pi+ 2*pi*rand( nphases,1);
                     end
                 end
              
       end
        
   
    lambda = child;
     
   
    end
    
    
   
    
 y =child(:,1);

end
         
