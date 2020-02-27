# Test 5
gap> F:=FreeGroup(2);;
gap> a:=GeneratorsOfGroup(F)[1];;b:=GeneratorsOfGroup(F)[2];;
gap> r:=Identity(F);;
gap> for i in [1..10] do r:=r* a*b^i; od;
gap> GroupSatisfiesCExternal(F/[r],30);;
gap> GroupSatisfiesCInternal(F/[r],30);;
gap> SymmetrizedRelationSetInternal(F/[r])=SymmetrizedRelationSetExternal(F/[r]);
true
gap> GroupSatisfiesCPrimeExternal(F/[r],0.32123123123);
true
gap> GroupSatisfiesCPrimeExternal(F/[r],0.22123123123);
false
gap> GroupSatisfiesCPrimeInternal(F/[r],0.22123123123,true);
[ false, (f2^-6*f1^-1*f2^-2)^2*(f2^-5*f1^-1*f2^-1)^2*(f2^-4*f1^-1)^2*f2^-1*(f2^-2*f1^-1)^2*f2^-1*f1^-1*f2^-10*f1^-1*f2^-3, " starts with a piece of length ", 15 ]
gap> GroupSatisfiesCInternal(F/[r],30,true);
[ false, f1^-1*f2^-1*f1^-1*f2^-10*f1^-1*f2^-1*(f2^-8*f1^-1)^2*f2^-1*(f2^-6*f1^-1)^2*f2^-1*(f2^-4*f1^-1)^2*f2^-3*f1^-1*f2^-2, " is the product of pieces of the following lengths: ", [ 2, 10, 11, 9, 8, 7, 6, 5, 4, 3 ] ]

