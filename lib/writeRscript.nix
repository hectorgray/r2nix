{ ... }:

{
  flake.lib.writeRscript = pkgs: name: args@{
    libraries ? [ ],
    options ? [ ],
    doCheck ? true,
    ...
  }: let
    R = pkgs.rWrapper.override { packages = libraries; };
    rest = (removeAttrs args [ "libraries" "options" "doCheck" ]);

    rCheck = pkgs.writers.writeDash "rCheck" /*sh*/ ''
      exec ${pkgs.jarl}/bin/jarl check "$1"
    '';
  in
    pkgs.writers.makeScriptWriter (rest // {
      interpreter = toString ([ "${R}/bin/Rscript" ] ++ options);
      check = if doCheck then rCheck else "";
    }) name;
}

# Tracking:
# https://github.com/etiennebacher/jarl/issues/692
