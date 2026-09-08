{ ... }:

{
  perSystem = { pkgs, ... }: {
    packages.positron-bin = pkgs.positron-bin.overrideAttrs (old: {
      # Undeclared `dlopen`, buildInputs can't see it
      runtimeDependencies = (old.runtimeDependencies or [ ]) ++ [
        (pkgs.lib.getLib pkgs.libsecret)
      ];

      # Use Posit's CLI shim
      postInstall = (old.postInstall or "") + /*bash*/ ''
        ln -sf "$out/share/positron/bin/positron" "$out/bin/positron"
      '';

      postFixup = (old.postFixup or "") + /*bash*/ ''
        # Else Node.js parses the flag as its own and bails
        substituteInPlace $out/share/positron/positron \
          --replace-fail ' --disable-updates "$@"' ' "$@" --disable-updates'

        # So desktop entry launches bin/positron with wrapped env vars
        substituteInPlace $out/share/applications/positron.desktop \
          --replace-fail "$out/share/positron/.positron-wrapped" "$out/bin/positron"
      '';
    });
  };
}
