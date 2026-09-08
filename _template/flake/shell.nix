{ ... }:

{
  perSystem = { pkgs, inputs', ... }: {
    devShells.default = pkgs.mkShell {
      packages = (with pkgs; [
        R
        air-formatter # inputs' dep.
      ]) ++ (with pkgs.rPackages; [
        # devtools
        # tidyverse
        languageserver
      ]) ++ (with inputs'.r2nix.packages; [
        arf
        positron-bin # launch with `positron .`
        quarto
      ]);
    };
  };
}
