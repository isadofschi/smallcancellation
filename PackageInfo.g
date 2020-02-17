#############################################################################
##  
##  PackageInfo.g for the package `SmallCancellation'             Iván Sadofschi Costa
##  
##  


SetPackageInfo( rec(

PackageName := "SmallCancellation",


Subtitle := "SmallCancellation/metric and nonmetric conditions",


Version := "1.0.3",

Date := "04/03/2019",

PackageWWWHome :=
  Concatenation( "https://github.com/isadofschi/", LowercaseString( ~.PackageName ) ),



SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/isadofschi/", LowercaseString( ~.PackageName ) ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "isadofschi@dm.uba.ar",

ArchiveURL := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

Persons := [
  rec( 
    LastName      := "Sadofschi Costa",
    FirstNames    := "Iván",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "isadofschi@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~isadofschi",
    PostalAddress := Concatenation( [
                       "Pabellón I - Ciudad Universitaria (1428)\n",
                       "Buenos Aires\n",
                       "Argentina" ] ),
    Place         := "Buenos Aires",
    Institution   := "University of Buenos Aires"
  ),
  
],

Status := "dev",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
  "Metric and nonmetric small cancellation conditions for group presentations and finitely presented groups.",

PackageDoc := rec(
  BookName  := ~.PackageName,
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle :=  ~.Subtitle,
),



Dependencies := rec(
  GAP := "4.8",
  NeededOtherPackages := [["GAPDoc", "1.5"], ["grape", "4.7"]],
  SuggestedOtherPackages := [],
  ExternalConditions := []
),

##  Provide a test function for the availability of this package.
##  For packages containing nothing but GAP code, just say 'ReturnTrue' here.
##  For packages which may not work or will have only partial functionality,
##  use 'LogPackageLoadingMessage( PACKAGE_WARNING, ... )' statements to
##  store messages which may be viewed later with `DisplayPackageLoadingLog'.
##  Do not call `Print' or `Info' in the `AvailabilityTest' function of the 
##  package.
##
##  With the package loading mechanism of GAP >=4.4, the availability
##  tests of other packages, as given under .Dependencies above, will be 
##  done automatically and need not be included in this function.
##
AvailabilityTest := ReturnTrue,
#AvailabilityTest := function()
#  local path, file;
#    # test for existence of the compiled binary
#    path:= DirectoriesPackagePrograms( "example" );
#    file:= Filename( path, "hello" );
#    if file = fail then
#      LogPackageLoadingMessage( PACKAGE_WARNING,
#          [ "The program `hello' is not compiled,",
#            "`HelloWorld()' is thus unavailable.",
#            "See the installation instructions;",
#            "type: ?Installing the Example package" ] );
#    fi;
#    # if the hello binary was vital to the package we would return
#    # the following ...
#    # return file <> fail;
#    # since the hello binary is not vital we return ...
#    return true;
#  end,

BannerString := Concatenation( 
    "----------------------------------------------------------------\n",
    "Loading  SmallCancellation ", ~.Version, "\n",
    "by ",
    JoinStringsWithSeparator( List( Filtered( ~.Persons, r -> r.IsAuthor ),
                                    r -> Concatenation(
        r.FirstNames, " ", r.LastName, " (", r.WWWHome, ")\n" ) ), "   " ),
    "For help, type: ?SmallCancellation \n",
    "----------------------------------------------------------------\n" ),

TestFile := "tst/testall.g",

Keywords := ["package SmallCancellation", "pieces", "C", "C'", "T"]

));

