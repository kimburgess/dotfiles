{ config, lib, pkgs, ... }:

{
  hardware.pulseaudio =
    { enable = true;
      package = pkgs.pulseaudioFull;
    };

  hardware.bluetooth.extraConfig = "
      [General]
      Enable=Source,Sink,Media,Socket
    ";

  environment.systemPackages = with pkgs;
    [ audacity
      ffmpeg
      gimp
      puredata
      pavucontrol
      vlc
    ];
}
