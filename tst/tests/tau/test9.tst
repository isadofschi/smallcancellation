# Example 9
# The presentation B in "Groups With Two Generators Having Unsolvable Word Problem and Presentations of Mihailova Subgroups"
# by Wang, Li, Yang and Lin
# Comm. Algebra, 2016

# As expected the number is less than 2 (note that Presentation A is a subpresentation of Presentation B)

gap> F:=FreeGroup("c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","u","v","t");;
gap> c1:=F.1;;c2:=F.2;;c3:=F.3;;c4:=F.4;;c5:=F.5;;c6:=F.6;;c7:=F.7;;c8:=F.8;;c9:=F.9;;c10:=F.10;;u:=F.11;;v:=F.12;;t:=F.13;;
gap> R:=[
> #
> v*(t^-1*u*t)^-1,
> (t^-1*v^-1*u*v*t)*(c1*u^-1*v*u)^-1,
> (t^-1*v^-2*u*v^2*t)*(c2*u^-2*v*u^2)^-1,
> (t^-1*v^-3*u*v^3*t)*(c3*u^-3*v*u^3)^-1,
> (t^-1*v^-4*u*v^4*t)*(c4*u^-4*v*u^4)^-1,
> (t^-1*v^-5*u*v^5*t)*(c5*u^-5*v*u^5)^-1,
> (t^-1*v^-6*u*v^6*t)*(c6*u^-6*v*u^6)^-1,
> (t^-1*v^-7*u*v^7*t)*(c7*u^-7*v*u^7)^-1,
> (t^-1*v^-8*u*v^8*t)*(c8*u^-8*v*u^8)^-1,
> (t^-1*v^-9*u*v^9*t)*(c9*u^-9*v*u^9)^-1,
> (t^-1*v^-10*u*v^10*t)*(c10*u^-10*v*u^10)^-1,
> ## Relaciones de la presentacion A
> #renglon1
> c1^-1*c7^10*c1*c7^-1,
> c2^-1*c7^10*c2*c7^-1,
> c3^-1*c7^10*c3*c7^-1,
> c4^-1*c7^10*c4*c7^-1,
> c5^-1*c7^10*c5*c7^-1,
> #renglon2
> c1^-1*c8*c1*c8^-10,
> c2^-1*c8*c2*c8^-10, 
> c3^-1*c8*c3*c8^-10,
> c4^-1*c8*c4*c8^-10,
> c5^-1*c8*c5*c8^-10,
> #renglon3
> c9^-1*c1*c9*c1^-1,
> c9^-1*c2*c9*c2^-1,
> c9^-1*c3*c9*c3^-1,
> c9^-1*c4*c9*c4^-1,
> c9^-1*c5*c9*c5^-1,
> #renglon4
> c10^-1*c7*c10*c7^-1,
> c10^-1*c8*c10*c8^-1,
> c6^-1*c1^-3*c10*c1^3*c6*(c1^-3*c10*c1^3)^-1,
> #renglon5
> (c9^-1*c7*c1*c3*c8*c9)*(c7*c3*c1*c8)^-1,
> (c9^-1*c7^2*c1*c4*c8^2*c9)*(c7^2*c4*c1*c8^2)^-1,
> (c9^1*c7^3*c2*c3*c8^3*c9)*(c7^3*c3*c2*c8^3)^-1,
> #renglon6
> (c9^-1*c7^4*c2*c4*c8^4*c9)*(c7^4*c4*c2*c8^4)^-1,
> (c9^-1*c7^5*c3*c5*c8^5*c9)*(c7^5*c5*c3*c1*c8^5)^-1,
> (c9^-1*c7^6*c4*c5*c8^6*c9)*(c7^6*c5*c4*c2*c8^6)^-1,
> #renglon7
> (c9^-1*c7^7*c3*c4*c3*c8^7*c9)*(c7^7*c3*c4*c3*c5*c8^7)^-1,
> (c9^-1*c7^8*c3*c1^3*c8^8*c9)*(c7^8*c1^3*c8^8)^-1,
> (c9^-1*c7^9*c4*c1^3*c8^9*c9)*(c7^9*c1^3*c8^9)^-1
> ];;
gap> G := F/R;;
gap> GroupSatisfiesTauPrime(G);
0.615385



