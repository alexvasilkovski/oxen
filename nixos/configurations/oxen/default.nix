{lib, ...}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./hardware.nix
    ../../modules/desktop.nix
    ../../modules/system.nix
  ];

  # Hostname
  networking.hostName = "oxen";

  # User
  users.users.cam = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "video"];
    hashedPassword = "$6$eaEntkZ64ZkbRAHl$9T1.reJNPf9DzqdQmFq0yCQ1n/pmnL5x7d7iDBfxuWqiE4u8amVlQ6uGgvaa9Yno6lb.CNwbOjcEP22krl2TF1";
  };

  # No DM
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';

  # Logrotate Bug Workaround
  services.logrotate.enable = false;
  services.logrotate.checkConfig = false;

  # System State Version
  system.stateVersion = mkDefault "23.05";

  # Allow Unfree Software
  nixpkgs.config.allowUnfree = mkDefault true;

  # Nix Settings & Experimental Features
  nix.settings = {
    experimental-features = mkDefault [
      "nix-command"
      "flakes"
    ];
    keep-derivations = mkDefault true;
    keep-outputs = mkDefault true;
  };

  # Locale
  time.timeZone = mkDefault "Europe/London";
  i18n.defaultLocale = mkDefault "en_GB.UTF-8";
}
