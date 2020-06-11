########################################################################################
##  
##  ttilde.gd 	 SmallCancellation Package      Iván Sadofschi Costa
##  

#! @Chapter More small cancellation conditions
#! @Section Condition Tau'

#! Condition $\mathcal{T}'$ was introduced in <Cite Key="BMSC20" />.
#! We give here the definition in terms of van Kampen diagrams.
#! If $v$ is an interior vertex in a reduced diagram $D$, let $$d'_F(v)=\sum_{c\in v} \frac{\ell_1(c)+\ell_2(c)}{\ell_r(c)}$$ where the sum is over all corners at $v$, $\ell_r(c)$ is the length of the relator corresponding to the corner $c$ and $\ell_i(c)$ are the lenghts of the words written in the edges of the corner.
#! A presentation $P$ satisfies $\mathcal{T}'$ if $2\leq d(v)-d'_F(v)$ for every interior vertex $v$ in every reduced diagram $D$ over $P$.
#! If this inequality is strict we say that the presentation satisfies condition $\mathcal{T}'_{&lt;}$.
#! $$ $$
#! If $P$ satisfies $\mathcal{T}'_{&lt;}-C(3)$ then the group presented by $P$ is hyperbolic <Cite Key="BMSC20" Where="Theorem 3.3" />.
#! A finite presentation without proper powers which satisfies condition $\mathcal{T}'$ is diagrammatically reducible (DR) <Cite Key="BMSC20" Where="Theorem 3.2" />.
#! If $P$ satisfies $\mathcal{T'}-C'(\frac{1}{2})$ and the defining relators have the same length then $P$ satisfies a quadratic isoperimetric inequality and solvable word problem <Cite Key="BMSC20" Where="Theorem 4.2" />.

#! @Arguments G
#! @Description Given an FpGroup G gives the minimum of $d(v)-d'_F(v)$.
#! Thus if the function returns a number greater than or equal to $2$ the group presentation satisfies $\mathcal{T}'$ and if the number is greater than $2$ it satisfies $\mathcal{T}'_{&lt;}$.
#! This function implements the algorithm in <Cite Key="BMSC20" />. 
#! For the moment the computation is done numerically using floating point numbers (this may be modified in a future version to do the computation exactly with rational numbers). External binaries need to be compiled. 
#! @BeginExampleSession
#! @EndExampleSession
DeclareGlobalFunction("GroupSatisfiesTauPrime");

