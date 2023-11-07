{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      oxen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configurations/oxen
          {
            nix.registry.nixpkgs.flake = nixpkgs;
            nix.nixPath = ["nixpkgs=flake:nixpkgs"];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.cam = ./home/configurations/oxen;
              extraSpecialArgs = {inherit inputs;};
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
        ];
      };
    };
  };
}