gap> # Pieces for some presentation of the Mathieu group M23
gap> F:=FreeGroup( "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10" );;
gap> g:= GeneratorsOfGroup(F);;
gap> F1:=g[1];; F2:=g[2];; F3:=g[3];; F4:=g[4];; F5:=g[5];; F6:=g[6];; F7:=g[7];; F8:=g[8];; F9:=g[9];; F10:=g[10];;
gap> R:=[ F2^2, F3^3, F1^3, F7^-1*F6^-1*F5*F2, (F6^-1*F2)^2, (F1*F3^-1)^2, F4^4, 
>  F5^-1*F1^-1*F4*F1^-1, F2*F1*F3^-1*F2*F3*F1^-1, (F2*F1^-1*F3)^2, 
>  F10^-1*F6^-1*F2*F10*F4^2, F4*F5^-1*F1*F2*F4*F3, F4*F10*F2*F10^-1*F3^-1*F2, 
>  (F1^-1*F2)^3, (F8*F3^-1*F4)^2, F10*F1^-1*F10^-1*F2*F3^-1*F1^-1, 
>  F8*F4^2*F8^-1*F1*F2*F3^-1, F8^-1*F6^-1*F8^-1*F2*F3*F6*F4^-1, 
>  F4^-1*F1^-1*F3^-1*F4*F3^-1*F1^-1*F2, F4*F3*F1^-1*F5^-1*F4^-1*F3*F2*F3, 
>  F10*F3^-1*F10^-1*F1^-1*F2*F3^-1*F4^2, 
>  F10^-1*F7^-1*F6^-1*F10*F3^-1*F2*F1^-1*F3^-1, 
>  F4^-1*F2*F4^-1*F1^-1*F4^-1*F10*F3*F10^-1, 
>  F10*F4^-1*F10^-1*F1*F4*F2*F6^-1*F1*F3, 
>  F9^-1*F1^-1*F8*F3*F6^-1*F1^-1*F5*F2*F1^-1, 
>  F8^-1*F1*F3^-1*F8*F2*F3*F4^-1*F1^-1*F3^-1, F6^-1*F3^-1*F2*F6*F1*F4*F3*F2*F3,
>  F2*(F6*F1^-1)^2*F2*F3^-1*F4^-1*F6^-1, F8*F1^-1*F2*F8^-1*F4*F6*F5^-2*F1, 
>  F8^-1*F2*F8*F1*F2*F4^-1*F1^-1*F2*F1^-1*F3^-1, 
>  F6*F4^2*F1^-1*F6^-1*F4^-1*F3^-1*F4^-1*F1^-1*F3^-1, 
>  F10^-1*F1^-1*F9^-1*F10*F4*F6^-1*F1*F4*F5^-1*F3^-1, 
>  F8*F6^-1*F8^-2*F3^-1*F1^-1*F2*F3^-1*F6^-1*F1^-1, 
>  F10*F8*F5*F10*F8*F1*F6*F4^-1*F2*F1*F3^-1, 
>  F10^-1*F2*F9*F10*F4^-1*F2*F6*F4*F1*F2*F3, 
>  F10^-1*F8*F1*F8^-1*F10^-1*F6*F8^-1*F4^-1*F10*F1*F10^-1*F3^-1, 
>  F10*F8*F6^-1*F10*F1^-1*F4^-1*F8*F1*F4^-2*F2*F1, 
>  F10*F6^-1*F10^-1*F8^-1*F1^-1*F6*F2*F4*F10*F1*F10^-1*F3, 
>  F2*F3*F8^-1*F10^-1*F3*F2*F4^-2*F6^-1*F1^-1*F8^-1*F10^-1, 
>  F10^-1*F3^-1*F10^2*F2*F1^-1*F4^-1*F3^-1*F6^-1*F4^-1*F1^-1*F8*F3, 
>  F10*F8*F7^-1*F10*F4*F3*F8^-1*F4*F6^2*F3*F6*F3^-1 ];;
gap> G:=F/R;;
gap> PiecesOfGroup(G);
[ F1^-1, F1, F2^-1, F2, F3^-1, F3, F4^-1, F4, F5^-1, F5, F6^-1, F6, F7^-1, 
  F7, F8^-1, F8, F9^-1, F9, F10^-1, F10, F1^-1*F2^-1, F1^-1*F2, F1^-1*F3^-1, 
  F1^-1*F3, F1^-1*F4^-1, F1^-1*F5^-1, F1^-1*F5, F1^-1*F6^-1, F1^-1*F6, 
  F1^-1*F8^-1, F1^-1*F8, F1^-1*F9^-1, F1^-1*F10^-1, F1^-1*F10, F1*F2^-1, 
  F1*F2, F1*F3^-1, F1*F3, F1*F4^-1, F1*F4, F1*F6^-1, F1*F6, F1*F8^-1, F1*F8, 
  F1*F10^-1, F1*F10, F2^-1*F1^-1, F2^-1*F1, F2^-1*F3^-1, F2^-1*F3, F2^-1*F4, 
  F2^-1*F5^-1, F2^-1*F6, F2^-1*F8, F2^-1*F10^-1, F2^-1*F10, F2*F1^-1, F2*F1, 
  F2*F3^-1, F2*F3, F2*F4^-1, F2*F4, F2*F6^-1, F2*F6, F3^-1*F1^-1, F3^-1*F1, 
  F3^-1*F2^-1, F3^-1*F2, F3^-1*F4^-1, F3^-1*F4, F3^-1*F6^-1, F3^-1*F8^-1, 
  F3^-1*F8, F3^-1*F10^-1, F3^-1*F10, F3*F1^-1, F3*F1, F3*F2^-1, F3*F2, 
  F3*F4^-1, F3*F4, F3*F6^-1, F3*F6, F3*F8^-1, F3*F10^-1, F3*F10, F4^-1*F1^-1, 
  F4^-1*F2^-1, F4^-1*F2, F4^-1*F3^-1, F4^-1*F3, F4^-2, F4^-1*F6^-1, 
  F4^-1*F8^-1, F4^-1*F8, F4^-1*F10^-1, F4^-1*F10, F4*F1^-1, F4*F1, F4*F2^-1, 
  F4*F3^-1, F4*F3, F4^2, F4*F5^-1, F4*F6^-1, F4*F6, F4*F8, F4*F10^-1, F4*F10, 
  F5^-1*F1, F5*F1, F5*F2, F5*F4^-1, F6^-1*F1^-1, F6^-1*F1, F6^-1*F2^-1, 
  F6^-1*F2, F6^-1*F3^-1, F6^-1*F4^-1, F6^-1*F8^-1, F6^-1*F10, F6*F1^-1, 
  F6*F1, F6*F2^-1, F6*F3^-1, F6*F3, F6*F4^-1, F6*F4, F6*F7, F6*F8^-1, 
  F7^-1*F6^-1, F8^-1*F1^-1, F8^-1*F1, F8^-1*F2, F8^-1*F3, F8^-1*F4^-1, 
  F8^-1*F4, F8^-1*F10^-1, F8*F1^-1, F8*F1, F8*F3^-1, F8*F3, F8*F4, F8*F6^-1, 
  F8*F6, F9*F1, F10^-1*F1^-1, F10^-1*F1, F10^-1*F2, F10^-1*F3^-1, F10^-1*F3, 
  F10^-1*F4^-1, F10^-1*F4, F10^-1*F6, F10*F1^-1, F10*F1, F10*F2, F10*F3^-1, 
  F10*F3, F10*F4^-1, F10*F4, F10*F8, F1^-1*F2^-1*F4, F1^-1*F2*F1^-1, 
  F1^-1*F2*F3^-1, F1^-1*F3^-1*F8^-1, F1^-1*F8^-1*F10^-1, F1^-1*F8*F3, 
  F1*F2^-1*F1, F1*F4^-2, F1*F4*F2^-1, F1*F4*F3, F1*F10*F3, F2^-1*F1*F3, 
  F2*F1^-1*F3^-1, F2*F1*F3^-1, F2*F4^-1*F1^-1, F2*F4*F10, F3^-1*F1^-1*F2, 
  F3^-1*F2^-1*F3^-1, F3^-1*F4^-1*F1^-1, F3^-1*F8^-1*F1, F3^-1*F10^-1*F1^-1, 
  F3^-1*F10*F8, F3*F1^-1*F2^-1, F3*F1*F2^-1, F3*F1*F4, F3*F2^-1*F1, F3*F2*F3, 
  F3*F6^-1*F3^-1, F3*F6*F3^-1, F3*F10^-1*F4^-1, F4^-1*F1^-1*F3^-1, 
  F4^-1*F2*F1, F4^-1*F3^-1*F4^-1, F4^-2*F6^-1, F4*F3*F4, F4^2*F1^-1, 
  F4*F10*F3^-1, F6^-1*F1^-1*F8^-1, F6^-1*F4^-1*F8, F6*F4^2, F8^-1*F4*F6, 
  F8^-1*F10^-1*F3, F8*F1*F6, F8*F3*F1, F8*F6^-1*F10, F10^-1*F3^-1*F10, 
  F10^-1*F3*F10, F10^-1*F4^-1*F2^-1, F10^-1*F6*F8^-1, F10*F1^-1*F10^-1, 
  F10*F1*F10^-1, F10*F3^-1*F10^-1, F10*F3*F10^-1, F10*F8*F1, 
  F4*F10*F3^-1*F10^-1, F6^-1*F1^-1*F8^-1*F10^-1, F10*F3*F10^-1*F4^-1, 
  F10*F8*F1*F6 ]
gap> PiecesOfGroupInternal(G)=PiecesOfGroupExternal(G);
true
gap> GroupSatisfiesC(G,4);
false
gap> GroupSatisfiesT(G,4);
false
