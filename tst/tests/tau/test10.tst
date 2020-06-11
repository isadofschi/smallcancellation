# Example 10
# A relator from the presentation C in "Groups With Two Generators Having Unsolvable Word Problem and Presentations of Mihailova Subgroups"
# by Wang, Li, Yang and Lin
# Comm. Algebra, 2016

# This presentation has too many pieces!
gap> F:=FreeGroup("u","t");;
gap> u:=F.1;;t:=F.2;;
gap> R:=[
> # rel 1
> ( (t^-2*u^-7*t*u*t^-1*u^7*t^2*u^-7*t^-1*u^-1*t*u^7)^10*t^-2*u^-1*t*u*t^-1*u*t^2*u^-1*t^-1*u^-1*t*u )* ( t^-2*u^-1*t*u*t^-1*u*t^2*u^-1*t^-1*u^-1*t*u*t^-2*u^-7*t*u*t^-1*u^7*t^2*u^-7*t^-1*u^-1*t*u^7 )^-1
> ];;
gap> G := F/R;;
gap> Length(PiecesOfGroup(G)); # too many pieces to say something
24178
gap> G:=SimplifiedFpGroup(G); # Similar to presentations C and C'
<fp group of size infinity on the generators [ u, t ]>

