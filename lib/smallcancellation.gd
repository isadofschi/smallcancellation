########################################################################################
##  
##  smallcancellation.gd 	 SmallCancellation Package           Iván Sadofschi Costa
##  

#! @Chapter Small Cancellation Theory

#! @Section Introduction

#! A standard reference for Small Cancellation Theory is Lyndon-Schupp <Cite Key="LyndonSchupp" Where="Chapter V"/>. We review here some definitions and results. <P/> 

#! A subset <M>R</M> of a free group <M>F</M> is called <E>symmetrized</E> if all elements of <M>R</M> are cyclically reduced and for each <M>r</M> in <M>R</M> all cyclically reduced conjugates of <M>r</M> and <M>r^{-1}</M> are also in <M>R</M>. If the set <M>R</M> is not symmetrized we may work instead with the <E>symmetrization</E> <M>R^*</M> of <M>R</M> (the smallest symmetrized set containing <M>R</M>). <P/> 

#! A <E>piece</E> of <M>R</M> is a word that is a common prefix of two different words in the symmetrized set <M>R^*</M>. <P/> 

#! We say that a presentation <M>P=\langle X \mid R\rangle</M> <E>satisfies the small cancellation condition <M>C(p)</M></E> if no relator <M> r </M> in <M>R^*</M> is a product of fewer than <M>p</M> pieces. <P/>

#! We say that <M>P</M> <E>satisfies the small cancellation condition <M>C'(\lambda)</M></E>  if for all <M> r </M> in <M>R^*</M>, if <M>r=bc</M> and <M>b</M> is a piece then <M>|b| &lt; \lambda |r| </M>. <P/> 

#! We say that <M>P</M> <E>satisfies the small cancellation condition <M>T(q)</M></E> if for all <M>h</M> such that <M>3\leq h &lt; q</M> and for all elements <M>r_1,\ldots, r_h</M> in <M>R^*</M>, if no succesive elements <M>r_i,r_{i+1}</M> is an inverse pair, then at least one of the products <M>r_1r_2,\ldots r_{h-1}r_h, r_hr_1</M> is reduced without cancellation.

#! Condition <M>T(q)</M> may be rephrased in terms of the Whitehead graph of the presentation <M>P</M>. <P/>

#! If a group <M>G=\langle X \mid R\rangle</M> satisfies <M>C'(1/6)</M> then Dehn's algorithm (see  <Cite Key="LyndonSchupp" Where="Chapter V, Section 4"/>) solves the word problem for <M>G</M>.<P/>

#! If a group <M>G=\langle X \mid R\rangle</M> satisfies <M>C(6)</M> or <M>C(4)–T(4)</M> or <M>C(3)–T(6)</M> then <M>G</M> has solvable word problem and solvable conjugacy problem (see  <Cite Key="LyndonSchupp" Where="Chapter V, Sections 5 and 6"/>).<P/>

#! If a presentation <M>P=\langle X \mid R\rangle</M> satisfies <M>C(6)</M> and no relator of <M>P</M> is a proper power then the presentation complex of <M>P</M> is aspherical.<P/>

#! @Section Implementation details
#! Relators and their prefixes are stored in a data structure called trie <Cite Key="Trie" />.
#! This provides an efficient way to write a word as a product of pieces using the minimum possible number of pieces.

#! @Section Pieces

DeclareGlobalFunction("WordRotations");
DeclareGlobalFunction("SymmetrizedRelationSet");

#! @Arguments G
#! @Description Returns the set of pieces of the FpGroup <A>G</A>.
#! @BeginExampleSession
#! gap> F:=FreeGroup(["a","b"]);;
#! gap> AssignGeneratorVariables(F);;
#! #I  Assigned the global variables [ a, b ]
#! gap> r:=a*b*a*b^2*a*b^3;;
#! gap> G:=F/[r];;
#! gap> PiecesOfGroup(G);
#! [ a^-1, a, b^-1, b, a^-1*b^-1, a*b, b^-1*a^-1, b^-2, b*a, b^2, a^-1*b^-2, 
#!   a*b^2, b^-1*a^-1*b^-1, b^-2*a^-1, b*a*b, b^2*a, b^-1*a^-1*b^-2, 
#!   b^-2*a^-1*b^-1, b*a*b^2, b^2*a*b ]
#! @EndExampleSession
DeclareGlobalFunction("PiecesOfGroup");

#! @Arguments P
#! @Description Returns the set of pieces of the presentation <A>P</A>.
DeclareGlobalFunction("PiecesOfPresentation");

#! @Section Metric small cancellation conditions

#! @Arguments G,lambda[,explain]
#! @Description Returns <K>true</K> if the FpGroup <A>G</A> satisfies the small cancellation condition <A>C'(lambda)</A>, <K>false</K> otherwise. If the optional argument <A>explain</A> is <K>true</K> instead of returning <K>false</K> returns an explanation of this result.
#! @BeginExampleSession
#! gap> F:=FreeGroup(["a1","b1","a2","b2","a3","b3"]);;
#! gap> AssignGeneratorVariables(F);;
#! #I  Assigned the global variables [ a1, b1, a2, b2, a3, b3 ]
#! gap> r:=Comm(a1,b1)*Comm(a2,b2)*Comm(a3,b3);;
#! gap> G:=F/[r];;
#! gap> GroupSatisfiesCPrime(G,1/11);
#! true
#! gap> GroupSatisfiesCPrime(G,1/12);
#! false
#! gap> GroupSatisfiesCPrime(G,1/12,true);
#! [ false, a1^-1*b1^-1*a1*b1*a2^-1*b2^-1*a2*b2*a3^-1*b3^-1*a3*b3, 
#!   " starts with a piece of length ", 1 ]
#! @EndExampleSession
DeclareGlobalFunction("GroupSatisfiesCPrime");

#! @Arguments P,lambda[,explain]
#! @Description Returns <K>true</K> if the presentation <A>P</A> satisfies the small cancellation condition <A>C'(lambda)</A>, <K>false</K> otherwise. If the optional argument <A>explain</A> is <K>true</K> instead of returning <K>false</K> returns an explanation of this result.
DeclareGlobalFunction("PresentationSatisfiesCPrime");

#! @Section Non-metric small cancellation conditions

#! @Arguments G,p[,explain]
#! @Description Returns <K>true</K> if the FpGroup <A>G</A> satisfies the small cancellation condition <A>C(p)</A>, <K>false</K> otherwise. If the optional argument <A>explain</A> is <K>true</K> instead of returning <K>false</K> returns an explanation of this result.
#! @BeginExampleSession
#! gap> GroupSatisfiesC(G,12);
#! true
#! gap> GroupSatisfiesC(G,13);
#! false
#! gap> GroupSatisfiesC(G,13,true);
#! [ false, a1^-1*b1^-1*a1*b1*a2^-1*b2^-1*a2*b2*a3^-1*b3^-1*a3*b3, 
#!   " is the product of pieces of the following lengths: ", 
#!   [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ] ]
#! @EndExampleSession
DeclareGlobalFunction("GroupSatisfiesC");

#! @Arguments P,p,[explain]
#! @Description Returns <K>true</K> if the presentation <A>P</A> satisfies the small cancellation condition <A>C(p)</A>, <K>false</K> otherwise. If the optional argument <A>explain</A> is <K>true</K> instead of returning <K>false</K> returns an explanation of this result.
DeclareGlobalFunction("PresentationSatisfiesC");


LoadPackage("grape");


#! @Arguments G,q
#! @Description Returns <K>true</K> if the FpGroup <A>G</A> satisfies the small cancellation condition <A>T(q)</A>, <K>false</K> otherwise.
#! @BeginExampleSession
#! gap> GroupSatisfiesT(G,12);
#! true
#! gap> GroupSatisfiesT(G,13);
#! false
#! @EndExampleSession
DeclareGlobalFunction("GroupSatisfiesT");

#! @Arguments P,q
#! @Description Returns <K>true</K> if the presentation <A>P</A> satisfies the small cancellation condition <A>T(q)</A>, <K>false</K> otherwise.
DeclareGlobalFunction("PresentationSatisfiesT");



#! @Section Additional functions

#! @Arguments A
#! @Description If <A>A</A> is the adjacency matrix of a simple and directed graph, returns a <Package>Grape</Package> graph representing the graph with adjacency matrix <A>A</A>.
DeclareGlobalFunction("GraphFromAdjacencyMatrix");

#! @Arguments G
#! @Description Returns the adjacency matrix of the Whitehead graph of the FpGroup <A>G</A>. Note that the Whitehead graph may not be simple.
DeclareGlobalFunction("WhiteheadGraphAdjacencyMatrix");


#! @Arguments G
#! @Description If <A>G</A> is a group with <A>m</A> relators and <A>n</A> generators, it returns the <A>m</A> by <A>n</A> matrix <M>A</M> such that <M>A_{i,j}</M> is the total exponent of the generator <M>g_j</M> in the relator <M>r_i</M>.
DeclareGlobalFunction("ExponentMatrixOfGroup"); 

#! @Arguments P
#! @Description If <A>P</A> is a presentation with <A>m</A> relators and <A>n</A> generators, it returns the <A>m</A> by <A>n</A> matrix <M>A</M> such that <M>A_{i,j}</M> is the total exponent of the generator <M>g_j</M> in the relator <M>r_i</M>.
DeclareGlobalFunction("ExponentMatrixOfPresentation");

DeclareGlobalFunction("InfinityNorm");

DeclareGlobalFunction("LowerBoundMaximumAreaOfAGenerator");



#! @Chapter Installing and Loading the SmallCancellation Package
#! @Section Compiling Binaries of the SmallCancellation Package
#! After unpacking the archive, go to the newly created <F>smallcancellation</F>  directory
#! and call <C>./configure</C> to use the default <C>../..</C> path to the
#! &GAP; home directory or <C>./configure <A>path</A></C> where <A>path</A> is 
#! the path to the &GAP; home directory, if the package is being installed in a 
#! non-default location. So for example if you install the package in the
#! <F>~/.gap/pkg</F> directory and the &GAP; home directory is <F>~/gap4r5</F>
#! then you have to call
#! <P/>
#! <Log>
#! ./configure ../../../gap4r5/
#! </Log>
#! <P/>
#! This will fetch the architecture type for which &GAP; has been compiled last and create a <F>Makefile</F>. Now simply call <P/>
#! <Log>
#! make
#! </Log><P/>
#! to compile the binary and to install it in the appropriate place.<P/>
#! If &GAP; cannot find a working binary, some computations may take more time (specially for large presentations).
#! @Section Loading the SmallCancellation Package
#! To use the <Package>SmallCancellation</Package> Package you have to request it explicitly. This  is done by calling <Ref Func="LoadPackage" BookName="ref"/>: <P/>
#! <Example>
#! gap> LoadPackage("smallcancellation");
#! ----------------------------------------------------------------
#! Loading  SmallCancellation 1.0.2
#! by Iván Sadofschi Costa (http://mate.dm.uba.ar/~isadofschi)
#! For help, type: ?SmallCancellation 
#! ----------------------------------------------------------------
#! true
#! </Example><P/>
#! The <Package>SmallCancellation</Package> requires the <Package>Grape</Package> Package (version >=4.7).<P/>

