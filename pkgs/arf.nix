{ ... }:

{
  perSystem = { pkgs, lib, ... }: {
    packages.arf = pkgs.rustPlatform.buildRustPackage rec {
      pname = "arf-console";
      version = "0.5.3";
      doCheck = false;

      src = pkgs.fetchFromGitHub {
        owner = "eitsupi";
        repo = "arf";
        rev = "v${version}";
        hash = "sha256-Ema0s5whJwYY9Bg3HSKf1XFWqANzuoJgpqSVsVKBoWg=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";

        outputHashes = {
          "crossterm-0.29.0" = "sha256-fHHE9Uf6PlFcasFSBVIuIh2hhpFjJW0/z9F0zTvc38Q=";
        };
      };

      meta = {
        mainProgram = "arf";
        description = "Alternative R Frontend — a modern R console written in Rust";
        license = lib.licenses.mit;
      };
    };
  };
}

# Related:
# https://github.com/NixOS/nixpkgs/pull/507808
