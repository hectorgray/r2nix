{ ... }:

{
  perSystem = { pkgs, lib, ... }: {
    packages.arf = pkgs.rustPlatform.buildRustPackage rec {
      pname = "arf-console";
      version = "0.6.0";
      doCheck = false;

      src = pkgs.fetchFromGitHub {
        owner = "eitsupi";
        repo = "arf";
        rev = "v${version}";
        hash = "sha256-eMmuk4g7+vVFa2VuvbsEuRAGpPzh/hv016hz3rHBnmc=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";

        outputHashes = {
          "crossterm-0.29.0" = "sha256-r2Xsxw8+eqESsJKaax5pb/rIWshkoqi5E81Dkh8snZ8=";
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
