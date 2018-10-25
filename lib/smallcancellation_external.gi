########################################################################################
##  
##  smallcancellation_external.gi 	 SmallCancellation Package      Iván Sadofschi Costa
##  
InstallGlobalFunction( PrintPresentationToFile, function(G,filename)
	# prints the presentation of an FpGroup G to filename
	# but first it cyclically reduces every relator
	local rels,num_gen, w,x;
	rels:=List(RelatorsOfFpGroup(G),w -> LetterRepAssocWord(CyclicallyReducedWord(w)) );
	num_gen:=Size(GeneratorsOfGroup(G));
	AppendTo(filename, num_gen, " ", Size(rels), "\n\n");
	for w in rels do
		AppendTo(filename, Size(w));
		AppendTo(filename, "\n");
		for x in w do
			AppendTo(filename, x);
			AppendTo(filename, " ");	
		od;
		AppendTo(filename,"\n");
	od;

end );


InstallGlobalFunction( CallExternalSmallCancellationProgram, function(G, order)
	local smallCancellationProgram,command,tmpdir,filename_in,filename_out;

    smallCancellationProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "smallcancellation");

	tmpdir := DirectoryTemporary();;
	filename_in:=Filename( tmpdir , "tmpIn" );
	filename_out:=Filename( tmpdir , "tmpOut" );
	
	PrintPresentationToFile(G,filename_in);

    command := Concatenation([smallCancellationProgram, " ", filename_in, " ", order , " > ", filename_out]);
    #Print(command,"\n\n");
    Exec(command);
	return InputTextFile(filename_out);
end );

InstallGlobalFunction(WordsFromOutput, function(G,output)
	local num_words,words,i,l,sw,w,a;
	num_words:=Int(Chomp(ReadLine(output)));
	ReadLine(output);
	words:=[];
	for i in [1..num_words] do
		l:=Int(Chomp(ReadLine(output)));
		sw:=SplitString(ReadLine(output), " ");
		w:=List(sw, x->Int(Chomp(x)) );
		Add(words,StructuralCopy(w));
	od;
	a:=GeneratorsOfGroup(FreeGroupOfFpGroup(G))[1];
	words:=List(words, w->AssocWordByLetterRep(FamilyObj(a),w));
	return Set(words);
end );


InstallGlobalFunction(PiecesOfGroupExternal, function(G)
	local output;
	output:= CallExternalSmallCancellationProgram(G,"Pieces");
	return WordsFromOutput(G,output);
end );

InstallGlobalFunction(GroupSatisfiesCExternal, function(G,p)
	local output;
	output:= CallExternalSmallCancellationProgram(G, Concatenation("C ",String(p)) );
	return Int(Chomp(ReadLine(output)))=1;
end );

InstallGlobalFunction(GroupSatisfiesCPrimeExternal, function(G,lambda)
	local output,order;
	if IsRat(lambda) then
		order:= Concatenation("CPrimeRationalLambda ",String(NumeratorRat(lambda))," ",String(DenominatorRat(lambda)));
	else
		order:= Concatenation("CPrime ",String(Float(lambda)));
	fi;
	output:= CallExternalSmallCancellationProgram(G, order);
	return Int(Chomp(ReadLine(output)))=1;
end );

InstallGlobalFunction(SymmetrizedRelationSetExternal, function(G)
	local output;
	output:= CallExternalSmallCancellationProgram(G, "SymmetrizedRelationSet" );
	return WordsFromOutput(G,output);
end );


