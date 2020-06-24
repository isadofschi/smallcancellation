########################################################################################
##  
##  ttilde.gi 	 SmallCancellation Package      Iván Sadofschi Costa
##  

SaveGraphToFile:=function(n,edges,filename)
	# n is the number of vertices
    # vertices are numbered from 1 to n
	# each edge in edges is represented as a list [source, target, cost]
	local m,f,e;
	m:=Length(edges);
	f := IO_File(filename,"w");
	IO_Write(f, n);
	IO_Write(f, " ");
	IO_Write(f, m);
	IO_Write(f, "\n");
	for e in edges do
		IO_Write(f, e[1]); IO_Write(f, " "); IO_Write(f, e[2]); IO_Write(f, " "); IO_Write(f, e[3]); IO_Write(f, "\n");
	od;
	IO_Flush(f);
	IO_Close(f);
end;;

ReadFloat:=function(filename)
	local file,f;
	file := IO_File(filename,"r");
	f := Float(Chomp(IO_ReadLine(file)));
	IO_Close(file);
	return f;
end;;


InstallGlobalFunction(GroupSatisfiesTauPrime, function(G)
	# Esta funcion da el minimo de d-dtilde para el grupo G
	# el grupo cumple TTilde si devuelve >=2
	local P,R_star,vertices,T,isPiece,
	d_pieces,d_relations,d_vertices,
	n_pieces,n_relations,n_vertices,
	p,q,r,l,i,i0,i1,j,j0,j1,j2,j0rot,k,v,s,t,
	ocurrences,
	trick_k,M1,n_vertices_1,
	e,edges,M,INF,girth,
	next,
	filename_in,filename_out,tmpdir,tTildeProgram,result;

	R_star:=SymmetrizedRelationSet(G);
	n_relations:= Length(R_star);
	T:=TrieOfPieces(G);;
	isPiece:=T[4];;
	P:=PiecesOfGroup(G);
	n_pieces := Length(P);
	INF := 10000;
	if n_pieces = 0 then # no pieces, we return INF
		Print("# The presentation has no pieces.\n");
		return INF; 
	fi;
	d_pieces:=NewDictionary(P[1],true);
	for i in [1..n_pieces] do
		AddDictionary(d_pieces,P[i],i);
	od;
	d_relations:=NewDictionary(R_star[1],true);
	for j in [1..n_relations] do
		AddDictionary(d_relations,R_star[j],j);
	od;
	ocurrences:=List([1..n_pieces], j-> []);
	for j in [1..n_relations] do
		r:=R_star[j];
		for t in [1..Length(r)] do
			p:=Subword(r,1,t);
			if isPiece(LetterRepAssocWord(p)) then
				Add(ocurrences[LookupDictionary(d_pieces,p)],j);
			fi;
		od;
	od;
	edges:=[];
	for r in R_star do
		l:=Length(r);
		j0:=LookupDictionary(d_relations,r);
		for s in [1..l] do
			p:=Subword(r,1,s);
			if isPiece(LetterRepAssocWord(p)) then
				i0:=LookupDictionary(d_pieces,p);
				for t in [1..l-s] do
					q:=Subword(r,s+1,s+t);
					if isPiece(LetterRepAssocWord(q)) then
						i1:=LookupDictionary(d_pieces,q^-1);
						j0rot:=LookupDictionary(d_relations, (p*q)^-1*r^-1*(p*q));
						for j1 in ocurrences[LookupDictionary(d_pieces,q^-1)] do
							if j1<>j0rot then 
								Add(edges, [
									[j0,i0],
									[j1,i1],
									1-((Length(p)+Length(q))/l) ]);
							fi;
						od;
					fi;
				od;
			fi;
		od;
	od;
	vertices := Set( Concatenation(List(edges, e->e[1]), List(edges,e->e[2])));
	d_vertices:=NewDictionary(vertices[1],true);
	n_vertices:=Length(vertices);
	for i in [1..n_vertices] do
		AddDictionary(d_vertices,vertices[i],i);
	od;
	# por ahora no nos preocupamos por el error numerico
	edges:=List(edges, e-> [ LookupDictionary(d_vertices,e[1]), LookupDictionary(d_vertices,e[2]), Float(e[3]) ] ); 

    tTildeProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "tauexternal");

	tmpdir := DirectoryTemporary();;
	filename_in:=Filename( tmpdir , "tmpIn" );
	filename_out:=Filename( tmpdir , "tmpOut" );
	
	SaveGraphToFile(n_vertices,edges,filename_in);
	Exec(Concatenation(tTildeProgram," ", filename_in , " " , filename_out));
	result:= ReadFloat(filename_out);
	Exec(Concatenation("rm ",filename_in));
	Exec(Concatenation("rm ",filename_out));

	return result;
end );
