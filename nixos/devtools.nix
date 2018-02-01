{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages =
    let
      editors = with pkgs; [ atom vim ];
      nix = with pkgs; [ cabal2nix nix-repl ];
      haskell = with pkgs; [ ghc cabal-install ];
      ruby_ = with pkgs; [ ruby rubocop ];
      node = with pkgs; [ nodejs ];
      env = with pkgs; [ docker_compose vagrant ];
      tools = with pkgs; [ gitAndTools.gitFull wireshark ];
    in editors ++ nix ++ haskell ++ ruby_ ++ node ++ env ++ tools;

  fonts.fonts = with pkgs;
    [ fira-code
      iosevka
      powerline-fonts
    ];
}
