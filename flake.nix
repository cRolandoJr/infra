{
  description = "Mi infraestructura declarativa -- Nix para DevOps";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Formateador del repo: `nix fmt` (nixfmt es el estilo oficial de nixpkgs).
      formatter.${system} = pkgs.nixfmt;

      # Herramientas del proyecto para quien clone el repo `nix develop`.
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.nixos-anywhere ];
      };

      # E1 colocar primer host: srv-01.
      nixosConfigurations = { };
    };
}
