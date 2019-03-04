# Test 5
gap> F:=FreeGroup(2);;
gap> a:=GeneratorsOfGroup(F)[1];;b:=GeneratorsOfGroup(F)[2];;
gap> r:=Identity(F);;
gap> for i in [1..10] do r:=r* a*b^i; od;
gap> GroupSatisfiesCExternal(F/[r],30);;
gap> GroupSatisfiesCInternal(F/[r],30);;
