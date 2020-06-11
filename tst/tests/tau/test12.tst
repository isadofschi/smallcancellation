#Example 12 
# In page 26 of
# "Isoperimetric inequalities and the homology of groups"
# by Baumslag, Miller and Short
# Invent. Math. (1993)
# it is proved that for a Baumslag-Solitar group B(p,q) with |p| \neq |q| the Dehn function is exponential.
# Thus we expect that GroupSatisfiesTauPrime is less than 2 for these groups.

gap> BS := function(p,q)
>       local a,t;
>       F:=FreeGroup("a","t");
>       a:=F.1;t:=F.2;
>       return F/[t*a^p*t^-1*a^-q];
> end;;
gap> GroupSatisfiesTauPrime(BS(2,2));
2.
gap> GroupSatisfiesTauPrime(BS(3,3));
2.
gap> GroupSatisfiesTauPrime(BS(2,5));
1.66667
gap> GroupSatisfiesTauPrime(BS(2,3));
1.85714
gap> GroupSatisfiesTauPrime(BS(3,4));
1.88889
gap> GroupSatisfiesTauPrime(BS(10,11));
1.95652
gap> GroupSatisfiesTauPrime(BS(11,12));
1.96
gap> GroupSatisfiesTauPrime(BS(12,13));
1.96296
gap> GroupSatisfiesTauPrime(BS(13,14));
1.96552
gap> GroupSatisfiesTauPrime(BS(14,15));
1.96774
gap> GroupSatisfiesTauPrime(BS(15,16));
1.9697
gap> GroupSatisfiesTauPrime(BS(16,17));
1.97143
gap> GroupSatisfiesTauPrime(BS(17,18));
1.97297
gap> GroupSatisfiesTauPrime(BS(18,19));
1.97436
gap> GroupSatisfiesTauPrime(BS(19,20));
1.97561
gap> GroupSatisfiesTauPrime(BS(20,21));
1.97674
gap> GroupSatisfiesTauPrime(BS(21,22));
1.97778
gap> GroupSatisfiesTauPrime(BS(22,23));
1.97872
gap> GroupSatisfiesTauPrime(BS(23,24));
1.97959
gap> GroupSatisfiesTauPrime(BS(24,25));
1.98039
gap> GroupSatisfiesTauPrime(BS(25,26));
1.98113
gap> GroupSatisfiesTauPrime(BS(26,27));
1.98182
gap> GroupSatisfiesTauPrime(BS(27,28));
1.98246
