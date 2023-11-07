{pkgs, ...}: {
  imports = [
    ../../modules/waybar.nix
    ../../modules/alacritty.nix
  ];

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    nano
    bash
    neofetch
    discord
  ];

  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.vscode.enable = true;
}
