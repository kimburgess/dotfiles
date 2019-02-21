{ config, lib, pkgs, ... }:

{
    users.users.kim.packages = [
      pkgs.steam
    ];
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;
}
