{ inputs, ... }:

{
  imports = with inputs; [
    "${hm-src}/flake-module.nix"
    flake-parts.flakeModules.easyOverlay
    sugar.flakeModules.easyLib
  ];

  flake.templates.default = {
    path = ./_template;
    description = "Basic R environment";
  };

  perSystem = { config, system, ... }: {
    overlayAttrs = config.packages;

    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true; # positron
    };
  };
}
