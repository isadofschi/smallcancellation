# Test 1
gap> F:=FreeGroup(2);;
gap> a:=GeneratorsOfGroup(F)[1];;b:=GeneratorsOfGroup(F)[2];;
gap> GroupSatisfiesC(F/[a*b*a^-1*b^-1],4);
true
gap> GroupSatisfiesT(F/[a*b*a^-1*b^-1],4);
true
gap> r:=Identity(F);;
gap> for i in [1..20] do r:=r*a*b^i; od;
gap> GroupSatisfiesC(F/[r],20);
true
gap> GroupSatisfiesC(F/[r],21);
false
gap> r:=a*b*a;;n:=17;;
gap> GroupSatisfiesC(F/[r^n],2*n);
true
gap> GroupSatisfiesCPrime(F/[r^n],1/n);
true

