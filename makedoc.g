LoadPackage( "AutoDoc" );
LoadPackage("SmallCancellation");
AutoDoc( rec( scaffold := true,
              autodoc  := rec( files := [ "doc/chapters.autodoc" ])
));
QUIT;

