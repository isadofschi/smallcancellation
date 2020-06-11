# Example 11
# We consider some groups defined in
# "Isoperimetric inequalities and the homology of groups"
# by Baumslag, Miller and Short
# Invent. Math. (1993)

gap> group_Gc:=function(c)
>       local gens,F,rels,i,j,t;
>       gens := List([1..c], x-> Concatenation("a_",String(x)));
>       Add(gens,"t");
>       F:=FreeGroup(gens);
>       rels := [];
>       gens := GeneratorsOfGroup(F);
>       t:=gens[c+1];
>       for i in [1..c] do
>               for j in [i+1..c] do
>                       Add(rels, Comm(gens[i],gens[j]));
>               od;
>       od;
>       for i in [1..c-1] do
>               Add(rels, t^-1*gens[i]*t*(gens[i]*gens[i+1])^-1);
>       od;
>       Add(rels, Comm(t,gens[c]));
>       return F/rels;
> end;;
gap> 
gap> group_M_c_d:=function(c,d)
>       # The group in Lemma 11 of [BMS93]
>       local gens, gens_c,gens_d,F,rels,i,j,t,s;
>       gens_c := List([1..c], x-> Concatenation("a_",String(x)));
>       gens_d := List([1..d], x-> Concatenation("b_",String(x)));
>       gens:=Concatenation(gens_c,gens_d,["t"],["s"]);
>       F:=FreeGroup(gens);
>       rels := [];
>       gens:=GeneratorsOfGroup(F);
>       gens_c := gens{[1..c]};
>       gens_d := gens{[c+2..c+d+1]};
>       t:=gens[c+1];
>       s:=gens[c+d+2];
>       # parte Gc
>       for i in [1..c] do
>               for j in [i+1..c] do
>                       Add(rels, Comm(gens_c[i],gens_c[j]));
>               od;
>       od;
>       for i in [1..c-1] do
>               Add(rels, t^-1*gens_c[i]*t*(gens_c[i]*gens_c[i+1])^-1);
>       od;
>       Add(rels, Comm(t,gens_c[c]));
> 
>       # parte Gd
>       for i in [1..d] do
>               for j in [i+1..d] do
>                       Add(rels, Comm(gens_d[i],gens_d[j]));
>               od;
>       od;
>       for i in [1..d-1] do
>               Add(rels, s^-1*gens_d[i]*s*(gens_d[i]*gens_d[i+1])^-1);
>       od;
>       Add(rels, Comm(s,gens_d[d]));
>       # rels M
>       Add(rels, Comm(gens_c[c],gens_d[d]));
>       return F/rels;
> end;;
gap> ## M_cd has dehn n^{c+d}
gap> G:=group_M_c_d(3,4); # dehn n^7
<fp group on the generators [ a_1, a_2, a_3, b_1, b_2, b_3, b_4, t, s ]>
gap> GroupSatisfiesTauPrime(G);
1.15
gap> G:=group_M_c_d(4,4); # dehn n^8
<fp group on the generators [ a_1, a_2, a_3, a_4, b_1, b_2, b_3, b_4, t, s ]>
gap> GroupSatisfiesTauPrime(G);
1.15
gap> # Example immediately after Corollary 22
gap> # the group has Dehn 2^n
gap> F:=FreeGroup("b","s","t");
<free group on the generators [ b, s, t ]>
gap> b:=F.1;; s:=F.2;; t:=F.3;;
gap> G:=F/[s^-1*b*s*b^-2, t^-1*b*t*b^-1];
<fp group of size infinity on the generators [ b, s, t ]>
gap> GroupSatisfiesTauPrime(G);
1.6
