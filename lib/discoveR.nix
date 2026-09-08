{ lib, ... }:

{
  flake.lib.discoveR = packages:
    packages
    |> lib.closePropagation
    |> map (p: "${p}/library")
    |> lib.concatStringsSep ":";
}
