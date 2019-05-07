{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages = with pkgs;
    let

      # See https://github.com/NixOS/nixpkgs/issues/36880
      vagrant = (import <nixpkgs> {
        overlays = [
          (self: super: {
            bundler = super.bundler.overrideAttrs (old: {
              name = "bundler-1.16.1";
              src = super.fetchurl {
                url = "https://rubygems.org/gems/bundler-1.16.1.gem";
                sha256 = "1s2nq4qnffxg3kwrk7cnwxcvfihlhxm9absl2l6d3qckf3sy1f22";
              };
            });
          })
        ];
      }).vagrant;

      editors = [ atom vim ];
      crystal = [ unstable.crystal unstable.shards ];
      nix = [ cabal2nix ];
      haskell = [ ghc cabal-install ];
      ruby_ = [ ruby rubocop ];
      node = [ nodejs ];
      env = [ docker_compose vagrant ];
      tools = [ gitAndTools.gitFull git-lfs wireshark teleport httpie ];
    in editors ++ crystal ++ nix ++ haskell ++ ruby_ ++ node ++ env ++ tools;

  fonts.fonts = with pkgs;
    [ fira-code
      iosevka
      powerline-fonts
    ];
}
