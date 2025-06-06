{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = { need-atomic = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "ghc-prim"; version = "0.12.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "libraries@haskell.org";
      author = "";
      homepage = "";
      url = "";
      synopsis = "GHC primitives";
      description = "This package contains the primitive types and operations supplied by GHC.\nIt is an internal package, only for the use of GHC developers.\nGHC users should not use it!  If you do use it then expect\nbreaking changes at any time without warning.  You should prefer\nto import @GHC.Exts@ from the @base@ package instead.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.process or (pkgs.pkgsBuildBuild.process or (errorHandler.setupDepError "process")))
        (hsPkgs.pkgsBuildBuild.filepath or (pkgs.pkgsBuildBuild.filepath or (errorHandler.setupDepError "filepath")))
        (hsPkgs.pkgsBuildBuild.directory or (pkgs.pkgsBuildBuild.directory or (errorHandler.setupDepError "directory")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
      ];
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."rts" or (errorHandler.buildDepError "rts")) ];
        libs = (pkgs.lib.optionals (system.isWindows) [
          (pkgs."user32" or (errorHandler.sysDepError "user32"))
          (pkgs."mingw32" or (errorHandler.sysDepError "mingw32"))
          (pkgs."mingwex" or (errorHandler.sysDepError "mingwex"))
          (pkgs."ucrt" or (errorHandler.sysDepError "ucrt"))
        ] ++ pkgs.lib.optionals (system.isLinux) [
          (pkgs."c" or (errorHandler.sysDepError "c"))
          (pkgs."m" or (errorHandler.sysDepError "m"))
        ]) ++ pkgs.lib.optional (flags.need-atomic) (pkgs."atomic" or (errorHandler.sysDepError "atomic"));
        buildable = true;
      };
    };
  } // rec { src = pkgs.lib.mkDefault ./.; }
