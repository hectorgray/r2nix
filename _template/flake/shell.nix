{ ... }:

{
  perSystem = { pkgs, inputs', ... }: {
    devShells.default = pkgs.mkShell {
      packages = (with pkgs.rPackages; [
        languageserver
        # devtools
        # tidyverse
      ]) ++ (with inputs'.r2nix.packages; [
        arf
        data-dict
        positron-bin # launch with `positron .`
        quarto
      ]) ++ (with pkgs; [
        R
        air-formatter # inputs' dep.
      ]);
    };
  };
}
