{ stdenv, lib, haskellLib, project', recurseIntoAttrs, testSrc, compiler-nix-name, evalPackages, buildPackages }:

with lib;

let
  project = project' {
    inherit compiler-nix-name evalPackages;
    src = testSrc "plugin";
    cabalProjectLocal = builtins.readFile ../cabal.project.local + ''
      allow-newer: polysemy-plugin:containers, polysemy:containers
    '';
  };

  packages = project.hsPkgs;

in recurseIntoAttrs {
  ifdInputs = {
    inherit (project) plan-nix;
  };

  # Not sure why this breaks for ghc 8.10.7
  meta.disabled =
       builtins.elem compiler-nix-name [ "ghc91320250523" ]
    || stdenv.hostPlatform.isMusl
    || stdenv.hostPlatform.isGhcjs
    || stdenv.hostPlatform.isWindows
    || (haskellLib.isCrossHost && (stdenv.hostPlatform.isAarch64 || stdenv.hostPlatform.isAarch32));
  build = packages.test.components.library;
}
