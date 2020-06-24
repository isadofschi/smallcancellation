# Example 17
# Some cyclic presentations

gap> F:=FreeGroup(7);;
gap> f1:=F.1;;f2:=F.2;;f3:=F.3;;f4:=F.4;;f5:=F.5;;f6:=F.6;;f7:=F.7;;
gap> G:=F/[f4*f3^-1*f2*f4^-1*f3*f2^-1*f5^-1, f5*f4^-1*f3*f5^-1*f4*f3^-1*f6^-1, f6*f5^-1*f4*f6^-1*f5*f4^-1*f7^-1, 
>       f7*f6^-1*f5*f7^-1*f6*f5^-1*f1^-1, f1*f7^-1*f6*f1^-1*f7*f6^-1*f2^-1, f2*f1^-1*f7*f2^-1*f1*f7^-1*f3^-1, f3*f2^-1*f1*f3^-1*f2*f1^-1*f4^-1];;
gap> GroupSatisfiesTauPrime(G);
2.
gap> GroupSatisfiesC(G,3);
true
gap> GroupSatisfiesCPrime(G,1/2);
true
gap> GroupSatisfiesT(G,4);
false
gap> GroupSatisfiesC(G,6);
false

gap> F:=FreeGroup(5);;
gap> f1:=F.1;;f2:=F.2;;f3:=F.3;;f4:=F.4;;f5:=F.5;;
gap> G:=F/[ f3^-1*f5*f2*f1*f5^-1*f1^-1*f2^-2*f5, f4^-1*f1*f3*f2*f1^-1*f2^-1*f3^-2*f1, 
>    f5^-1*f2*f4*f3*f2^-1*f3^-1*f4^-2*f2, f1^-1*f3*f5*f4*f3^-1*f4^-1*f5^-2*f3, f2^-1*f4*f1*f5*f4^-1*f5^-1*f1^-2*f4 ];;
gap> GroupSatisfiesTauPrime(G);
2.11111

gap> G:=F/[f5^-1*f3^-1*f5*f1*f3^2*f4*f3^-1*f4^-1, f1^-1*f4^-1*f1*f2*f4^2*f5*f4^-1*f5^-1, 
>      f2^-1*f5^-1*f2*f3*f5^2*f1*f5^-1*f1^-1, f3^-1*f1^-1*f3*f4*f1^2*f2*f1^-1*f2^-1, 
>      f4^-1*f2^-1*f4*f5*f2^2*f3*f2^-1*f3^-1];;
gap> GroupSatisfiesTauPrime(G);
2.33333

gap> G:=F/[ f4^-1*f1^-1*f5^-1*(f4*f1)^2, f5^-1*f2^-1*f1^-1*(f5*f2)^2, 
>     f1^-1*f3^-1*f2^-1*(f1*f3)^2, f2^-1*f4^-1*f3^-1*(f2*f4)^2, 
>     f3^-1*f5^-1*f4^-1*(f3*f5)^2 ];;
gap> GroupSatisfiesTauPrime(G);
2.14286
gap> GroupSatisfiesC(G,6);
false
gap> GroupSatisfiesT(G,4);
false


