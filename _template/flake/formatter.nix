{ inputs, ... }:

{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = { pkgs, ... }: {
    treefmt.settings.formatter = {
      air = {
        command = "${pkgs.air-formatter}/bin/air";
        includes = [ "*.R" "*.r" ];
        options = [ "format" ];
      };

      panache = let
        cfg = pkgs.writers.writeTOML "panache.toml" {
          formatters.r = "air";
          formatters.air.cmd = "${pkgs.air-formatter}/bin/air";
        };
      in {
        command = "${pkgs.panache}/bin/panache";
        includes = [ "*.md" "*.qmd" "*.Rmd" ];
        options = [ "format" "--config" "${cfg}" ];
      };
    };
  };
}

# Tracking:
# https://github.com/numtide/treefmt-nix/pull/522
# https://github.com/numtide/treefmt-nix/pull/503
# https://github.com/posit-dev/air/issues/111
