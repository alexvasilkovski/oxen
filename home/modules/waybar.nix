{pkgs, ...}: {
  # Waybar Dependencies
  home.packages = with pkgs; [
    playerctl
  ];

  # Waybar Configuration
  programs.waybar = {
    enable = true;
    settings = [
      {
        height = 15;
        layer = "top";
        modules-left = ["sway/workspaces" "mpris"];
        modules-center = [];
        modules-right = ["network" "pulseaudio" "temperature" "cpu" "memory" "battery" "clock"];
        pulseaudio = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-icons = {
            default = ["" "" ""];
          };
        };
        battery = {
          format = "{icon} {}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-plugged = "󰂄";
          states = {
            critical = 10;
            warning = 20;
          };
          interval = 10;
        };
        mpris = {
          format = "{player_icon} {artist} - {title}";
          format-paused = "{status_icon} {artist} - {title}";
          player-icons = {
            default = "󰐊";
          };
          status-icons = {
            paused = "󰏤";
          };
        };
        network = {
          tooltip = false;
          format-wifi = " {essid}"; # 󱐋 {frequency}
          format-disconnected = " Disconnected";
          format-wifi-alt = "{ipaddr}";
          format-ethernet = "󰈁";
        };
        cpu = {
          tooltip = false;
          format = "󰘚 {}%";
        };
        memory = {
          tooltip = false;
          format = "󰍛 {}%";
        };
      }
    ];
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: FiraCode Nerd Font;
        font-size: 14px;
        min-height: 24px;
      }

      window#waybar {
        background: transparent;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #window {
        margin-top: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 5px;
        transition: none;
        color: transparent;
        background: transparent;
      }

      window#waybar.termite #window,
      window#waybar.Firefox #window,
      window#waybar.Navigator #window,
      window#waybar.PCSX2 #window {
          color: #000000;
        background: #ffffff;
      }

      #workspaces {
        margin-top: 8px;
        margin-left: 12px;
        margin-bottom: 0;
        border-radius: 5px;
        background: #000000;
        transition: none;
      }

      #workspaces button {
        transition: none;
        color: #ffffff;
        background: transparent;
        font-size: 16px;
      }

      #workspaces button.focused {
        color: #ffffff;
      }

      #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        color: #ffffff;
      }

      #mpris {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        background: #282a36;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #mpd.disconnected,
      #mpd.stopped {
        color: #ffffff;
        background: #000000;
      }

      #network {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #pulseaudio {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #temperature {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #cpu {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #memory {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #battery {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }

      #clock {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 5px;
        transition: none;
        color: #ffffff;
        background: #000000;
      }
    '';
  };
}
