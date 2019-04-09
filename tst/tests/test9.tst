gap> F:=FreeGroup("f3", "f5", "f7", "f10", "f13", "f16","x","y","z");;
gap> g:= GeneratorsOfGroup(F);;
gap> f3:=g[1];; f5:=g[2];; f7:=g[3];; f10:=g[4];; f13:=g[5];; f16:=g[6];;
gap> R:=[ f10*f16^-1*f3*f5*f10*f7^-1*f5*f10*f16^-2*f5^2*f10*f16^-1*f13, 
>  f7^-1*f5*f13^-2*f7^-2*f5*f13^-1*f3^-1*f5*f13^-1*f16^-1*f7^-1*f5*f10, 
>  f5^-1*f3*f16^2*f5^-2*f3*f16*f7^-1*f3*f16*f10*f5^-1*f3*f13, 
>  f3^-1*f7*f10^-2*f3^-2*f7*f10^-1*f5^-1*f7*f10^-1*f13*f3^-1*f7*f16^-1, 
>  f13*f10*f7*f3*f13*f5^-1*f3*f13*f10^2*f3^2*f13*f10*f16^-1, 
>  f10^-1*f13^-1*f16*f7^-2*f13^-2*f16*f7^-1*f3*f16*f7^-1*f5^-1*f13^-1*f16 ];;
gap> G := F/R;;
gap> GroupSatisfiesC(G,7);
true
gap> GroupSatisfiesC(G,8);
false
