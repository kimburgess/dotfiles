{ config, pkgs, ... }:

{
  imports =
    [ ./hardware.nix
      ./system.nix
      ./locale.nix
      ./users.nix
      ./networking.nix
      ./shell.nix
      ./desktop.nix
      ./devtools.nix
      ./media.nix
      ./yubikey-gpg.nix
      ./gaming.nix
#      ./egpu.nix
    ];
}
