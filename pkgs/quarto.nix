{ ... }:

{
  perSystem = { pkgs, ... }: {
    packages.quarto = pkgs.quarto.overrideAttrs (old: {
      postPatch = (old.postPatch or "") + /*bash*/ ''
        substituteInPlace bin/quarto.js \
          --replace-fail "syntax-highlighting" "highlight-style"
      '';
    });
  };
}

# Tracking + credits @aaronchall:
# https://github.com/nixos/nixpkgs/issues/519484
