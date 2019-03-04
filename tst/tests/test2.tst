# Test 2
gap> F:=FreeGroup(2);;
gap> a:=GeneratorsOfGroup(F)[1];;b:=GeneratorsOfGroup(F)[2];;
gap> GroupSatisfiesC(F/[a^10],6);
true
