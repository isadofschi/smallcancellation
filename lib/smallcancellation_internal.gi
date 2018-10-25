########################################################################################
##  
##  smallcancellation_internal.gi 	 SmallCancellation Package      Iván Sadofschi Costa
##  
InstallGlobalFunction(SymmetrizedRelationSetInternal, function(G)
	local R,R_inverse,R_star,r,l,i,w;
	R:=List(RelatorsOfFpGroup(G), CyclicallyReducedWord);
	R_inverse:=List(R, w->w^-1);
	R:= Union( R, R_inverse );
	R:= Set(R);
	R_star:=[];
	for r in R do
		l:=Length(r);
		Add(R_star,r);
		for i in [ 1 .. (l-1) ] do
			w:=Subword(r,i+1,l)*Subword(r,1,i);
			w:=CyclicallyReducedWord(w);
			Add(R_star, w);
		od;
	od;
	R_star:=Set(R_star);
	return R_star;
end );

InstallGlobalFunction(NewTrieOfPieces, function()
	# The trie is represented as a list of nodes
	# [node,piece,relation,children]
	# where node, piece, relation are bools
	# and children a list that indicates the indexes of the children
	# T[1] is the root, representing the empty word

	local N,T,
			_insert_relation,insert_relation,
			_is_piece,is_piece,
			_is_relation,is_relation,
			_max_piece,max_piece,
			_IsProductOfAtMostKPieces, IsProductOfAtMostKPieces,WriteAsProductOfAtMostKPieces;

	N:=1; # number of nodes in T
	T:=[ [true,false,false,NewDictionary(0,true)] ];

	_insert_relation:=function(w, pos,i)
		local x,d,i1;
		if T[i][1] then
			T[i][2]:=true;
		else
			T[i][1]:=true;
		fi;
		if not pos = Size(w) then
		    x:=w[pos+1];
			d:=T[i][4];
			i1:=LookupDictionary(d,x);
			if i1=fail  then
				N:=N+1;
				T[N]:= [false,false,false,NewDictionary(0,true)];
				AddDictionary(T[i][4],x,N);
				i1:=N;
			fi;
			_insert_relation(w,pos+1,i1);
		else
			T[i][3]:=true;
		fi;
    end;;
	insert_relation:=function(w)
		_insert_relation(w,0,1);
	end;;
	
    _is_piece := function(w, pos, i)
		local x, d, i1;
		if pos=Size(w) then
			return T[i][2];
		fi;
		x:=w[pos+1];
		d:=T[i][4];
		i1:=LookupDictionary(d,x);
		if not i1 = fail then
			return _is_piece(w,pos+1,i1);
		fi;
		return false;
    end;;
	is_piece := function(w)
		return _is_piece(w,0,1);	
	end;;

    _is_relation := function(w, pos, i)
		local x,d,i1;		
		if pos=Size(w) then
			return T[i][3];
		fi;
		x:=w[pos+1];
		d:=T[i][4];
		i1:=LookupDictionary(d,x);
		if not i1=fail then
			return _is_relation(w, pos+1,i1);
		fi;
		return false;
    end;;
	is_relation := function(w)
		return _is_relation(w,0,1);
	end;;

	_max_piece := function(w, pos, i)
		# length of the largest prefix of w' that is a piece
		# where w' is the subword of w that starts at pos
		local x,d,i1;
		if pos=Size(w) then
            return 0;
		fi;
        x:=w[pos+1];
		d:=T[i][4];
		i1:=LookupDictionary(d,x);
        if  (not i1=fail) and T[i1][2] then
            return 1 + _max_piece(w,pos+1,i1);
		fi;
        return 0;
	end;;
	max_piece:=function(w)
		return _max_piece(w,0,1);
	end;;

	_IsProductOfAtMostKPieces:=function(w, k, pos)
		# returns true iff the subword of w starting
		# from pos is a product of at most k pieces
		local m;
		if Size(w)=pos and k>=0 then
			return true;
		fi;
		if k<=0 then
			return false;
		fi;
		#we always use the longest possible piece (greedy)
		m := _max_piece(w,pos,1);
		return _IsProductOfAtMostKPieces(w, k-1, pos+m);
	end;;

	IsProductOfAtMostKPieces:=function(w,k)
		# returns true iff w is a product of at most k pieces
			return _IsProductOfAtMostKPieces(w,k,0);
	end;;

	WriteAsProductOfAtMostKPieces:=function(w,k,pos)
		# writes w as a product of at most k pieces
		# returns fail if it is not possible
		local m,l;
		if Size(w)=pos and k>=0 then
			return [];
		fi;
		if k<=0 then
			return fail;
		fi;
		#we always use the longest possible piece (greedy)
		m := _max_piece(w,pos,1);
		l:=WriteAsProductOfAtMostKPieces(w, k-1, pos+m);
		if l=fail then
			return fail;
		else
			return Concatenation([m],l);
		fi;
	end;;

	return [T,insert_relation,max_piece,is_piece,is_relation,IsProductOfAtMostKPieces,WriteAsProductOfAtMostKPieces];
end );
######################################################################################
InstallGlobalFunction(TrieOfPieces, function(G)
	local A,insert_relation,R,rels,r;
	A:=NewTrieOfPieces();
	insert_relation:=A[2];
	R:=SymmetrizedRelationSet(G);
	rels:=List(R,LetterRepAssocWord );
	for r in rels do
		insert_relation(r);
	od;
	return A;
end );

InstallGlobalFunction(PiecesOfGroupInternal, function(G)
	local pieces,A,T,dfs_pieces,a;
	pieces:=[];
	A:=TrieOfPieces(G);
	T:=A[1];

	dfs_pieces:=function(i, w)
		local d,xi,x,i1,w1;
		# if we are here then w is a piece that goes from the root of the trie to T.
		if Size(w)>0 then
			Add(pieces,w);
		fi;
		d:=T[i][4];
		for xi in d!.entries do
			x := xi[1];
			i1:= xi[2];
			if(T[i1][2]) then # T[i1] is a piece
				w1:=ShallowCopy(w);			
				Add(w1,x);
				dfs_pieces(i1,w1);
			fi;
		od;
	end;;
	dfs_pieces(1,[]);
	a:=GeneratorsOfGroup(FreeGroupOfFpGroup(G))[1];
	pieces:=List(pieces, w->AssocWordByLetterRep(FamilyObj(a),w));
	return Set(pieces);
end );

InstallGlobalFunction(GroupSatisfiesCPrimeInternal, function(G,lambda,explain...)
	# returns true if G satisfies C'(lambda), false otherwise
	local A,rels,max_piece,r,m,a,w;
	explain:=(explain=[true]);
	A:=TrieOfPieces(G);
	max_piece:=A[3];
	rels:=List(SymmetrizedRelationSet(G),LetterRepAssocWord);
	for r in rels do
		m:=max_piece(r);
		if not m < lambda * Size(r) then
			if explain then
				a:=GeneratorsOfGroup(FreeGroupOfFpGroup(G))[1];
				w:=AssocWordByLetterRep(FamilyObj(a),r);
				return [false, w, " starts with a piece of length ", m];
			else
				return false;
			fi;
		fi;
	od;
	return true;
end );

InstallGlobalFunction(GroupSatisfiesCInternal, function(G,p,explain...)
	local A,IsProductOfAtMostKPieces,WriteAsProductOfAtMostKPieces,rels,r,a,w;
	explain:= (explain=[true]);
	A:=TrieOfPieces(G);
	IsProductOfAtMostKPieces:=A[6];
	WriteAsProductOfAtMostKPieces:=A[7];
	rels:=List(SymmetrizedRelationSet(G),LetterRepAssocWord);
	for r in rels do
		if IsProductOfAtMostKPieces(r, p-1) then
			if explain then
				a:=GeneratorsOfGroup(FreeGroupOfFpGroup(G))[1];
				w:=AssocWordByLetterRep(FamilyObj(a),r);
				return Concatenation([false, w, " is the product of pieces of the following lengths: "], [WriteAsProductOfAtMostKPieces(r,p-1,0)]);
			else
				return false;
			fi;
		fi;
	od;
	return true;
end );

