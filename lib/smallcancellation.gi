########################################################################################
##  
##  smallcancellation.gi   	 SmallCancellation Package		     Iván Sadofschi Costa
##  

InstallGlobalFunction(WordRotations, function(w)
	# unused
	local rotations,l,i,wr;
	wr:=CyclicallyReducedWord(w);
	rotations:=[wr];
	l:=Length(wr);
	for i in [ 1 .. (l-1) ] do
		Add(rotations, Subword(wr,i+1,l)*Subword(wr,1,i) );
	od;
	return Set(rotations);
end );

InstallGlobalFunction(SymmetrizedRelationSet, function(G)
	local externalProgram;
	externalProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "smallcancellation");
	if externalProgram=fail then
		return SymmetrizedRelationSetInternal(G);
	else
		return SymmetrizedRelationSetExternal(G);
	fi;
end );

InstallGlobalFunction(PiecesOfGroup, function(G)
	local externalProgram;
	externalProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "smallcancellation");
	if externalProgram=fail then
		return PiecesOfGroupInternal(G);
	else
		return PiecesOfGroupExternal(G);
	fi;
end );

InstallGlobalFunction(PiecesOfPresentation, function(P)
	return PiecesOfGroup(FpGroupPresentation(P));
end );

InstallGlobalFunction(GroupSatisfiesCPrime, function(G,lambda,explain...)
	local externalProgram;
	explain:= (explain=[true]);
	externalProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "smallcancellation");
	if externalProgram=fail or explain or (IsRat(lambda) and DenominatorRat(lambda)>10000) then # to avoid possible overflow
		return GroupSatisfiesCPrimeInternal(G,lambda,explain);
	else
		return GroupSatisfiesCPrimeExternal(G,lambda);
	fi;
end );


InstallGlobalFunction(PresentationSatisfiesCPrime, function(P,lambda,explain...)
	explain:= (explain=[true]);
	return GroupSatisfiesCPrime(FpGroupPresentation(P),lambda,explain);
end );


InstallGlobalFunction(GroupSatisfiesC, function(G,p,explain...)
	local externalProgram;
	explain:= (explain=[true]);
	externalProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "smallcancellation");
	if externalProgram=fail or explain then
		return GroupSatisfiesCInternal(G,p,explain);
	else
		return GroupSatisfiesCExternal(G,p);
	fi;
end );


InstallGlobalFunction(PresentationSatisfiesC, function(P,p,explain...)
	explain:=(explain=[true]);
	return GroupSatisfiesC(FpGroupPresentation(P),p,explain);
end );

InstallGlobalFunction(ExponentMatrixOfGroup, function(G)
	local gens,rels,M,i,j;
	gens:=GeneratorsOfGroup(FreeGroupOfFpGroup(G));;
	rels:=RelatorsOfFpGroup(G);;
	M:=NullMat(Size(rels),Size(gens));;
	for i in [1..Size(rels)] do
		for j in [1..Size(gens)] do
			M[i][j]:=ExponentSumWord(rels[i],gens[j]);
		od;
	od;
	return M;
end );

InstallGlobalFunction(ExponentMatrixOfPresentation, function(P)
	return ExponentMatrixOfGroup(FpGroupPresentation(P));
end );

InstallGlobalFunction(InfinityNorm, function(M)
	M:=List(M, x->List(x,AbsInt));
	M:=List(M, x-> Sum(x));
	return Maximum(M);
end );

InstallGlobalFunction(LowerBoundMaximumAreaOfAGenerator, function(G)
	# G has to be a perfect group given by a balanced presentation
	# returns a number m such that there is a generator x such that any
	#  Van Kampen diagram with boundary x needs at least m 2-cells
	return InfinityNorm(Inverse(ExponentMatrixOfGroup(G)));
end );


InstallGlobalFunction(GraphFromAdjacencyMatrix, function(A)
	# simple and directed
	return Graph( Group(()), [1..Size(A)], OnPoints, function(x,y) return A[x][y]>0; end, true );
end);

InstallGlobalFunction(WhiteheadGraphAdjacencyMatrix, function(G)
	local F,R,vertices,M,r,l,v,w;
	F:=FreeGroupOfFpGroup(G);
	R:=SymmetrizedRelationSet(G);
	vertices:=Union( GeneratorsOfGroup(F), List(GeneratorsOfGroup(F),x->x^-1));
	M:=NullMat(Size(vertices),Size(vertices));;
	for r in R do
		l:=Length(r);
		v:=Subword(r,1,1);
		w:=Subword(r,l,l)^-1;
		M[Position(vertices,v)][Position(vertices,w)]:=M[Position(vertices,v)][Position(vertices,w)]+1;
	od;
	return M;
end );

InstallGlobalFunction(GroupSatisfiesT, function(G,q)
	local M,Gamma,m;
	if q<=3 then return true; fi;
	M:=WhiteheadGraphAdjacencyMatrix(G);
	if q>4 and Maximum(List(M, x->Maximum(x))) > 1 then
		# the Whitehead graph is not simple and q>4. Thus G does not satisfy T(q)
		return false;
	else
		# the Whitehead graph is not simple or q=4
		M:=List(M, v-> List(v, a-> Minimum(a,1))); 
		Gamma:=GraphFromAdjacencyMatrix(M); # Simplified Whitehead graph
		m:=Girth(Gamma);
		if m=-1 or q<=m  then
			return true;
		else
			return false;	
		fi;
	fi;


end );

InstallGlobalFunction(PresentationSatisfiesT, function(P,q)
	return GroupSatisfiesT(FpGroupPresentation(P),q);
end );


