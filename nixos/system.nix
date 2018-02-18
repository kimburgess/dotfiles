{ config, lib, pkgs, ... }:

{
  system.stateVersion = "17.09";
  system.autoUpgrade.enable = true;

  nix.gc.automatic = true;
  nix.gc.dates = "12:30";

  nixpkgs.config.allowUnfree = true;

  # Enable pulling packages from the unstable branch via unstable.name
  nixpkgs.config.packageOverrides = pkgs:
    { unstable = import <nixos-unstable>
        {
            # pass the nixpkgs config to the unstable alias
            # to ensure `allowUnfree` is propagated:
            config = config.nixpkgs.config;
        };
    };
}
