LoadPackage( "smallcancellation" );

# Some of these tests require the external binary!

TestDirectory( DirectoriesPackageLibrary("smallcancellation","tst/tests"),
			   rec(exitGAP := true, testOptions := rec(compareFunction := "uptowhitespace") )

 );

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
