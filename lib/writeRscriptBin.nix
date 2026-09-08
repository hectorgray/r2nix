{ self, ... }:

{
  flake.lib.writeRscriptBin = pkgs: name:
    self.lib.writeRscript pkgs "/bin/${name}";
}
