# r2nix

R toolkit for Nix.

> [!NOTE]
> Docs are a work in progress, but I use this flake daily and consider it stable.

## Requirements

Ensure the following are enabled in your Nix configuration:

```nix
nix.settings.experimental-features = [
  "flakes"
  "nix-command"
  "pipe-operators"
];
```

Then add to your inputs:

```nix
inputs.r2nix = {
  url = "github:hectorgray/r2nix";

  # Optional
  inputs = {
    nixpkgs.follows = "nixpkgs";
    flake-parts.follows = "flake-parts";
    sugar.follows = "sugar";
  };
};
```

## Archive

Files in `_archive/` are kept for reference and are not included in this
flake's outputs.
