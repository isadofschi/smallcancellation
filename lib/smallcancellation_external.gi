########################################################################################
##  
##  smallcancellation_external.gi 	 SmallCancellation Package      Iván Sadofschi Costa
##  
InstallGlobalFunction( PrintPresentationToFile, function(G,filename)
	# prints the presentation of an FpGroup G to filename
	# but first it cyclically reduces every relator
	local rels,num_gen, w,x,f;
	rels:=List(RelatorsOfFpGroup(G),w -> LetterRepAssocWord(CyclicallyReducedWord(w)) );
	num_gen:=Size(GeneratorsOfGroup(G));
	f := IO_File(filename,"w");
	IO_Write(f, num_gen);
	IO_Write(f, " ");
	IO_Write(f, Size(rels));
	IO_Write(f, "\n\n");
	for w in rels do
		IO_Write(f, Size(w));
		IO_Write(f, "\n");
		for x in w do
			IO_Write(f, x);
			IO_Write(f, " ");	
		od;
		IO_Write(f,"\n");
	od;
	IO_Flush(f);
	IO_Close(f);
end );


InstallGlobalFunction( CallExternalSmallCancellationProgram, function(G, order)
	local smallCancellationProgram,command,tmpdir,filename_in,filename_out,f,output;

    smallCancellationProgram := Filename(DirectoriesPackagePrograms("smallcancellation"), "smallcancellation");

	tmpdir := DirectoryTemporary();;
	filename_in:=Filename( tmpdir , "tmpIn" );
	filename_out:=Filename( tmpdir , "tmpOut" );
	
	PrintPresentationToFile(G,filename_in);

    command := Concatenation([smallCancellationProgram, " ", filename_in, " ", order , " > ", filename_out]);
    #Print(command,"\n\n");
    Exec(command);
	f:=IO_File(filename_out,"r");
	output:=IO_ReadLines(f);
	IO_Close(f);
	Exec(Concatenation("rm ",filename_in));
	Exec(Concatenation("rm ",filename_out));
	return output;
end );

InstallGlobalFunction(WordsFromOutput, function(G,output)
	# output is the result of calling IO_ReadLines on a file
	local num_words,words,i,l,sw,w,a,line_number;
	if output=fail then return fail; fi;
	line_number:=1;
	num_words:=Int(Chomp( output[line_number] ));
	line_number:=line_number+1;
	# (read empty line)
	line_number:=line_number+1;
	words:=[];
	for i in [1..num_words] do
		#l:=Int(Chomp(output[line_number]));
		line_number:=line_number+1;
		sw:=SplitString(output[line_number], " ", "\n");
		line_number:=line_number+1;
		Add(words,List(sw, Int ));
	od;
	a:=GeneratorsOfGroup(FreeGroupOfFpGroup(G))[1];
	words:=List(words, w->AssocWordByLetterRep(FamilyObj(a),w));
	return Set(words);
end );

InstallGlobalFunction( GetBoolFromOutput, function(output)
	# output is the result of calling IO_ReadLines on a file
	if output <> fail then
		return Int(Chomp( output[1] ))=1;
	else
		return fail;
	fi;
end );


InstallGlobalFunction(PiecesOfGroupExternal, function(G)
	local output;
	output:= CallExternalSmallCancellationProgram(G,"Pieces");
	return WordsFromOutput(G,output);
end );

InstallGlobalFunction(GroupSatisfiesCExternal, function(G,p)
	local output;
	output:= CallExternalSmallCancellationProgram(G, Concatenation("C ",String(p)) );
	return GetBoolFromOutput(output);
end );

InstallGlobalFunction(GroupSatisfiesCPrimeExternal, function(G,lambda)
	local output,order;
	if IsRat(lambda) then
		order:= Concatenation("CPrimeRationalLambda ",String(NumeratorRat(lambda))," ",String(DenominatorRat(lambda)));
	else
		order:= Concatenation("CPrime ",String(Float(lambda)));
	fi;
	output:= CallExternalSmallCancellationProgram(G, order);
	return GetBoolFromOutput(output);
end );

InstallGlobalFunction(SymmetrizedRelationSetExternal, function(G)
	local output;
	output:= CallExternalSmallCancellationProgram(G, "SymmetrizedRelationSet" );
	return WordsFromOutput(G,output);
end );


