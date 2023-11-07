{pkgs, ...}: {
  # Audio
  sound.enable = true;
  security.rtkit.enable = true;
  environment.systemPackages = with pkgs; [
    pulseaudio
    pavucontrol
    pamixer
  ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Kernel
  boot = {
    kernelParams = ["fbcon=nodefer" "bgrt_disable" "quiet" "systemd.show_status=false" "rd.udev.log_level=0" "vt.global_cursor_default=0"];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.timeout = 5;
  environment.etc = {
    "issue" = {
      text = "[?12l[?25h";
      mode = "0444";
    };
  };

  # Networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.network.wait-online.enable = false;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22 80 443]; # SSH, HTTP, HTTPS
  };
}
