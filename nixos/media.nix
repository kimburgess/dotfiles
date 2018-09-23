{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [ audacity
      ffmpeg
      gimp
      puredata
      pavucontrol
      vlc
    ];
}
