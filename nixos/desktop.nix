{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.libinput.enable = true;

  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.desktopManager.default = "none";

  services.xserver.windowManager.xmonad =
    { enable = true;
      enableContribAndExtras = true;
    };

  services.redshift = {
    enable = true;
    provider = "geoclue2";
    temperature.day = 6500;
    temperature.night = 2700;
  };

  environment.systemPackages =
    let
      desktop = with pkgs; [ dmenu lightdm haskellPackages.xmobar ];
      x = with pkgs.xorg; [ xbacklight xrandr ];
      tools = with pkgs; [ feh xclip ];
      browsers = with pkgs; [ chromium firefox ];
    in desktop ++ x ++ tools ++ browsers;

  fonts.fonts = with pkgs;
    [ corefonts
      dejavu_fonts
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
