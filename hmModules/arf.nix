{ ... }:

{
  flake.homeModules.arf = { config, pkgs, lib, ... }: let
    cfg = config.programs.arf;
    tomlFormat = pkgs.formats.toml { };
  in {
    options.programs.arf = {
      enable = lib.mkEnableOption "arf, a modern R console";
      package = lib.mkPackageOption pkgs "arf" { };

      settings = lib.mkOption {
        type = tomlFormat.type;
        default = { };
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages = [ cfg.package ];

      xdg.configFile."arf/arf.toml" = lib.mkIf (cfg.settings != { }) {
        source = tomlFormat.generate "arf.toml" cfg.settings;
      };
    };
  };
}
