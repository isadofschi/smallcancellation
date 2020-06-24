# Example 2
# Artin group, triangle with sides (2,3,2)
gap> F:=FreeGroup("x","y","z");
<free group on the generators [ x, y, z ]>
gap> x:=F.1;;y:=F.2;;z:=F.3;;
gap> R:=[x*y*x^-1*y^-1, x*z*x*z^-1*x^-1*z^-1, y*z*y^-1*z^-1];; 
gap> G:=F/R;;
gap> GroupSatisfiesTauPrime(G);
1.66667

