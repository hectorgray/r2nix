{ ... }:

{
  perSystem = { pkgs, lib, ... }: {
    packages.data-dict = pkgs.rustPlatform.buildRustPackage rec {
      pname = "data-dict";
      version = "0.0.3";
      doCheck = false;

      src = pkgs.fetchFromGitHub {
        owner = "tidyverse";
        repo = "data-dict";
        rev = "v${version}";
        hash = "sha256-QR86IsG5O+1wrfARTmTPHnYUFFLQeMnnFXfjCtz2K1s=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";

        outputHashes = {
          "quarto-yaml-0.1.1" = "sha256-T9eqBdw51n89BFf26sXc1VvYkj8amtGeT7TuP5uh+E4=";
        };
      };

      meta = {
        mainProgram = "data-dict";
        description = "A data dictionary your data can't disagree with";
        license = lib.licenses.mit;
      };
    };
  };
}
