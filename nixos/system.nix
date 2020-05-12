{ config, lib, pkgs, ... }:

{
  system.stateVersion = "18.09";

  system.autoUpgrade.enable = true;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.packageOverrides = pkgs:
    { # Latest and greatest
      unstable = import <nixos-unstable>
        {
            # pass the nixpkgs config to the unstable alias
            # to ensure `allowUnfree` is propagated:
            config = config.nixpkgs.config;
        };
    };
}
