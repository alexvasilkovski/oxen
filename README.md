An experimental flake.

```
┌── flake.nix
├── flake.lock
├── home
│   ├── configurations
│   │   └── oxen
│   └── modules
└── nixos
    ├── configurations
    │   └── oxen
    └── modules
```
Installation:
```
sudo nixos-rebuild switch --flake github:alexvasilkovski/oxen#oxen
```
