{ inputs, ... }:

{
  flake.homeModules.positron = { ... }: {
    imports = [
      (import "${inputs.hm-src}/modules/programs/vscode/mkVscodeModule.nix" {
        modulePath = [ "programs" "positron" ];
        name = "Positron";
        packageName = "positron-bin";
        nameShort = "Positron";
        dataFolderName = ".positron";
        skipVersionCheck = true;
      })
    ];
  };
}

# Upstreamed:
# https://github.com/nix-community/home-manager/pull/9805
