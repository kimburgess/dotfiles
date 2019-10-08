{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.xrandrHeads =
    [ { output = "eDP-1";
        primary = true;
        monitorConfig = ''
          DisplaySize 3840 2160
          Option "Position" "0 1920"
        '';
      }
      { output = "DP-2";
        monitorConfig = ''
          DisplaySize 3840 2160
          Option "Position" "3840 0"
          Option "Rotate" "left"
        '';
      }
    ];

  services.xserver.libinput =
    { enable = true;
      disableWhileTyping = true;
    };

  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.desktopManager.default = "none";

  services.xserver.windowManager.xmonad =
    { enable = true;
      enableContribAndExtras = true;
    };

  services.xserver.videoDrivers = [ "intel" "modesetting" ];

  services.xserver.deviceSection = ''
    Option "Backlight" "intel_backlight"
  '';

  services.redshift = {
    enable = true;
    provider = "geoclue2";
    temperature.day = 6500;
    temperature.night = 2700;
  };

  services.unclutter-xfixes = {
    enable = true;
    extraOptions = [ "ignore-scrolling" ];
  };

  environment.systemPackages =
    let
      desktop = with pkgs; [ dmenu lightdm haskellPackages.xmobar ];
      x = with pkgs.xorg; [ xbacklight xrandr ];
      tools = with pkgs; [ feh xclip scrot ];
      browsers = with pkgs; [ chromium firefox ];
    in desktop ++ x ++ tools ++ browsers;

  fonts.fonts = with pkgs;
    [ corefonts
      dejavu_fonts
      font-awesome-ttf
      noto-fonts-cjk
      ubuntu_font_family
      source-code-pro
      source-sans-pro
      source-serif-pro
      unifont
    ];

  services.xserver.dpi = 144;

  fonts.fontconfig =
    { enable = true;
      dpi = 144;
      ultimate.enable = true;
    };
}
