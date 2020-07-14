{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.xrandrHeads =
    [ { output = "eDP1";
        primary = true;
        monitorConfig = ''
          DisplaySize 3840 2160
        '';
      }
    ];

  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.displayManager.defaultSession = "none+xmonad";

  services.xserver.windowManager.xmonad =
    { enable = true;
      enableContribAndExtras = true;
    };

  services.xserver.videoDrivers = [ "intel" ];

  services.xserver.deviceSection = ''
    Option "Backlight" "intel_backlight"
  '';

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];
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
      font-awesome
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
    };
}
