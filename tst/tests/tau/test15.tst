# Example 15
gap> F:=FreeGroup("a","b");;
gap> a:=F.1;; b:=F.2;;

gap> G:=F/[a^3*b^4*a^3*(b^4*a^3*b^4)^-1];;
gap> GroupSatisfiesTauPrime(G);
1.90476

gap> G:=F/[ a^3*b^4*a^3*b^4*(b^4*a^3*b^4*a^3)^-1];;
gap> GroupSatisfiesTauPrime(G);
2.
gap> GroupSatisfiesT(G,4);
false
gap> GroupSatisfiesC(G,6);
false

gap> G:=F/[ (a^3*b^4*a^3*b^4*a^3)* (b^4*a^3*b^4*a^3*b^4)^-1  ];;
gap> GroupSatisfiesTauPrime(G);
1.94286
