{ stdenv, stackProject', recurseIntoAttrs, testSrc, compiler-nix-name, evalPackages }:

let
  project = stackProject' {
    src = testSrc "stack-source-repo";
    inherit evalPackages;
  };
  packages = project.hsPkgs;

in recurseIntoAttrs {
  meta.disabled = compiler-nix-name != "ghc984" || stdenv.hostPlatform.isGhcjs;
  ifdInputs = {
    inherit (project) stack-nix;
  };
  inherit (packages.stack-source-repo.components) library;
}
