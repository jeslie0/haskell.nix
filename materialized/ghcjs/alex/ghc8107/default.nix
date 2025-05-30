{
  pkgs = hackage:
    {
      packages = {
        ghc-prim.revision = hackage.ghc-prim."0.6.1".revisions.default;
        alex.revision = import ./cabal-files/alex.nix;
        alex.flags.small_base = true;
        time.revision = hackage.time."1.9.3".revisions.default;
        base.revision = hackage.base."4.14.3.0".revisions.default;
        unix.revision = hackage.unix."2.7.2.2".revisions.default;
        deepseq.revision = hackage.deepseq."1.4.4.0".revisions.default;
        integer-gmp.revision = hackage.integer-gmp."1.0.3.0".revisions.default;
        containers.revision = hackage.containers."0.6.5.1".revisions.default;
        array.revision = hackage.array."0.5.4.0".revisions.default;
        bytestring.revision = hackage.bytestring."0.10.12.0".revisions.default;
        directory.revision = hackage.directory."1.3.6.0".revisions.default;
        filepath.revision = hackage.filepath."1.4.2.1".revisions.default;
      };
      compiler = {
        version = "8.10.7";
        nix-name = "ghc8107";
        packages = {
          "unix" = "2.7.2.2";
          "filepath" = "1.4.2.1";
          "bytestring" = "0.10.12.0";
          "containers" = "0.6.5.1";
          "ghc-prim" = "0.6.1";
          "base" = "4.14.3.0";
          "time" = "1.9.3";
          "directory" = "1.3.6.0";
          "integer-gmp" = "1.0.3.0";
          "deepseq" = "1.4.4.0";
          "array" = "0.5.4.0";
        };
      };
    };
  extras = hackage:
    { packages = {}; };
  modules = [
    {
      preExistingPkgs = [
        "ghc-prim"
        "time"
        "base"
        "unix"
        "deepseq"
        "integer-gmp"
        "containers"
        "array"
        "bytestring"
        "directory"
        "filepath"
      ];
    }
    ({ lib, ... }:
      { packages = {}; })
    ({ lib, ... }:
      {
        packages = {
          "directory".components.library.planned = lib.mkOverride 900 true;
          "deepseq".components.library.planned = lib.mkOverride 900 true;
          "base".components.library.planned = lib.mkOverride 900 true;
          "integer-gmp".components.library.planned = lib.mkOverride 900 true;
          "filepath".components.library.planned = lib.mkOverride 900 true;
          "containers".components.library.planned = lib.mkOverride 900 true;
          "ghc-prim".components.library.planned = lib.mkOverride 900 true;
          "bytestring".components.library.planned = lib.mkOverride 900 true;
          "time".components.library.planned = lib.mkOverride 900 true;
          "alex".components.exes."alex".planned = lib.mkOverride 900 true;
          "array".components.library.planned = lib.mkOverride 900 true;
          "unix".components.library.planned = lib.mkOverride 900 true;
        };
      })
  ];
}