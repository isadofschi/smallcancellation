# Example 1
# Artin group, triangle with sides (8,6,infty)
gap> F:=FreeGroup("x","y","z");
<free group on the generators [ x, y, z ]>
gap> x:=F.1;;y:=F.2;;z:=F.3;;
gap> R:=[(x*y)^4*(y*x)^-4, (x*z)^3*(z*x)^-3];; 
gap> G:=F/R;;
gap> GroupSatisfiesTauPrime(G);
2.

