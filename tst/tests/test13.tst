gap> F:=FreeGroup("x","y","z");
<free group on the generators [ x, y, z ]>
gap> x:=F.1;;y:=F.2;;z:=F.3;;
gap> R:=[x*y*z, x*y*(z*x)^3, x*y*(z*x*y)^10];
[ x*y*z, x*y*(z*x)^3, (x*y*z)^10*x*y ]
gap> GroupSatisfiesT(F/R,4);
true
gap> GroupSatisfiesT(F/R,5);
false
gap> GroupSatisfiesT(F/R,3);
true
gap> R:=[x^2, x^4, x^6];
[ x^2, x^4, x^6 ]
gap> GroupSatisfiesT(F/R,3);
true
gap> GroupSatisfiesT(F/R,4);
true
gap> GroupSatisfiesT(F/R,5);
false


