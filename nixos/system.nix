{ config, lib, pkgs, ... }:

{
  system.stateVersion = "17.09";
  system.autoUpgrade.enable = true;

  nix.gc.automatic = true;
  nix.gc.dates = "12:30";

  nixpkgs.config.allowUnfree = true;
}
