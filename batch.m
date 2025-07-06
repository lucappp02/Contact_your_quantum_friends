%% parameters
np = 5000;
pe= 0.05;
k = 20;
pm = 0.5;
P_infection = 0.3;
Perc_infected = 0.1;
alpha = 0.05;
maxit = 30;
n_bins = 10;


%%% some example of usage of the genetic algorithm

%%%%% 4 router single excitation

tau = 5.77;
 nphases = 2;
internal_nodes = [1:5];
tmin = 1;
tmax = 4;
in = 6;
fin = 7;
par = GA_single_excitation(nphases,@ham_four_switch_B,in,fin, np,pe, k, pm,P_infection, Perc_infected,maxit,tmin,tmax,internal_nodes, alpha);
fplot(@(x) prob(x,in,fin,@ham_four_switch_B,par(2:end),tau), [0 2])




%%%%% 4 router superposition
 n_nodes = 9;
init = [6,7];
fin = [8,9];
tmin = 1;
tmax = 4;

figure
par = GA_superpositions( nphases,n_nodes,@ham_four_switch_B, init,fin, np,pe, k, pm, P_infection, Perc_infected,maxit,tmin, tmax, internal_nodes, alpha,n_bins);
fplot(@(x) prob_superp(par(1),init,fin, x,@ham_four_switch_B,par(2:end), n_nodes), [-pi pi]);





%%%%% 6 router single excitation
IN = 8;
FIN = 9;
 nphases = 6;
 n_nodes = 13;

internal_nodes = [1:7];
tmin = 15;
tmax = 30;
tau = 1.71;

 par = GA_single_excitation(nphases,@ham_six_switch_B,IN,FIN, np,pe, k, pm,P_infection, Perc_infected,maxit,tmin,tmax,internal_nodes, alpha);
  figure
fplot(@(x) prob(x,IN,FIN,@ham_six_switch_B,par(2:end),tau), [0 20])


%%%%% 6 router superposition
init = [8,9];
fin = [12,11];
tmin = 10;
tmax = 20;
 par = GA_superpositions( nphases,n_nodes,@ham_six_switch_B, init,fin, np,pe, k, pm, P_infection, Perc_infected,tmin, tmax,maxit, internal_nodes, alpha,n_bins);
 figure
fplot(@(x) prob_superp(par(1),init,fin, x,@ham_six_switch_B,par(2:end), n_nodes,1), [-pi pi]);





%%%%% random network single excitation
initial = 9;
final = 31;
tmin = 15;
tmax = 25;
nphases = 13;
tau = 1.86;
internal_nodes = [1,2,3,4,5,6,7,8,11,12,13,14,15,16,17,19,21,22,25,26,27,28,32,33,36,37];


figure
par = GA_single_excitation(nphases,@ham_random_network_A,initial,final, np,pe, k, pm,P_infection, Perc_infected,tmin,tmax,maxit,internal_nodes,alpha);
 fplot(@(n) prob(n,initial,final,@ham_random_network_A,par(2:end),tau) ,[0 100])



 %%%%% random network superposition
 tmin = 0;
 tmax = 50;
 init = [9,10];
fin = [35,34];
n_nodes = 39;
figure
 par = GA_superpositions( nphases,n_nodes,@ham_random_network_A, init,fin, np,pe, k, pm, P_infection, Perc_infected,tmin, tmax,maxit, internal_nodes, alpha,n_bins);
fplot(@(x) prob_superp(par(1),init,fin, x,@ham_random_network_A,par(2:end), n_nodes,1), [-pi pi]);
