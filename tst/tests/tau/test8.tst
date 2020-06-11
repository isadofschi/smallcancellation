# Example 8.
# The presentation A in "Groups With Two Generators Having Unsolvable Word Problem and Presentations of Mihailova Subgroups"
# by Wang, Li, Yang and Lin
# Comm. Algebra, 2016

# As expected the number is less than 2

gap> F:=FreeGroup(10);;
gap> c1:=F.1;;c2:=F.2;;c3:=F.3;;c4:=F.4;;c5:=F.5;;c6:=F.6;;c7:=F.7;;c8:=F.8;;c9:=F.9;;c10:=F.10;;
gap> R:=[
> 
> c1^-1*c7^10*c1*c7^-1,
> c2^-1*c7^10*c2*c7^-1,
> c3^-1*c7^10*c3*c7^-1,
> c4^-1*c7^10*c4*c7^-1,
> c5^-1*c7^10*c5*c7^-1,
> 
> c1^-1*c8*c1*c8^-10,
> c2^-1*c8*c2*c8^-10, 
> c3^-1*c8*c3*c8^-10,
> c4^-1*c8*c4*c8^-10,
> c5^-1*c8*c5*c8^-10,
> 
> c9^-1*c1*c9*c1^-1,
> c9^-1*c2*c9*c2^-1,
> c9^-1*c3*c9*c3^-1,
> c9^-1*c4*c9*c4^-1,
> c9^-1*c5*c9*c5^-1,
> 
> c10^-1*c7*c10*c7^-1,
> c10^-1*c8*c10*c8^-1,
> c6^-1*c1^-3*c10*c1^3*c6*(c1^-3*c10*c1^3)^-1,
> 
> (c9^-1*c7*c1*c3*c8*c9)*(c7*c3*c1*c8)^-1,
> (c9^-1*c7^2*c1*c4*c8^2*c9)*(c7^2*c4*c1*c8^2)^-1,
> (c9^1*c7^3*c2*c3*c8^3*c9)*(c7^3*c3*c2*c8^3)^-1,
> 
> (c9^-1*c7^4*c2*c4*c8^4*c9)*(c7^4*c4*c2*c8^4)^-1,
> (c9^-1*c7^5*c3*c5*c8^5*c9)*(c7^5*c5*c3*c1*c8^5)^-1,
> (c9^-1*c7^6*c4*c5*c8^6*c9)*(c7^6*c5*c4*c2*c8^6)^-1,
> 
> (c9^-1*c7^7*c3*c4*c3*c8^7*c9)*(c7^7*c3*c4*c3*c5*c8^7)^-1,
> (c9^-1*c7^8*c3*c1^3*c8^8*c9)*(c7^8*c1^3*c8^8)^-1,
> (c9^-1*c7^9*c4*c1^3*c8^9*c9)*(c7^9*c1^3*c8^9)^-1
> ];;
gap> G := F/R;;
gap> GroupSatisfiesTauPrime(G);
0.615385

