# Contact Your Quantum Friends: Routing of Information via Chiral Quantum Walks

A crucial task for both classical and quantum networks is the routing of information.
However, the standard approach to quantum walks does not allow directional transport depending on any properties of the system because of the symmetries induced from the fact that the Hamiltonian is real.
These symmetries can be broken considering all possible complex Hamiltonians, that, in principle, can be simulated over a given network.
Indeed, the problem has been attacked exploiting CQW. 


In this work we will focus on the development of optimal many-outputs quantum routers in order to perform optimal directional transport over a random network. 
Recent works have pointed out that, in general, cycles formed by an even number of vertexes do not provide quantum advantage when coupled with a phase, due to symmetry reasons. 
Moreover $K_3$ has revealed to be the more versatile cycle for chiral directional transport, this, combined with the hypothesis of unweighted networks, brought us to focus on composition of equilateral triangles in order to develop optimal many-outputs routers.


The complexity of the task relies in the  fact that parameter space becomes rapidly huge, growing as the number of phases. To address this issue we chose to employ a Genetic Algorithm(GA).
GAs are a class of optimization algorithms based on biological evolution where a population of sets of parameters, called individuals, is randomly generated and then evoveld creating fitter generations through genetic functions each iteration, the output will be the fittest individual .
We focused on this method other than others optimization tecniques because GAs are known to be quite robust i.e. do not get easily stucked in local minima, which is basically is the reason why humanity will extinct quite soon. Indeed, the signature of quantum chaos have been individuated in phase dependence.
