{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages = with pkgs;
    let
      editors = [ atom vim ];
      nix = [ cabal2nix nix-repl ];
      haskell = [ ghc cabal-install haskellPackages.ghc-mod ];
      ruby_ = [ ruby rubocop ];
      node = [ nodejs ];
      env = [ docker_compose vagrant ];
      tools = [ gitAndTools.gitFull git-lfs wireshark unstable.teleport ];
    in editors ++ nix ++ haskell ++ ruby_ ++ node ++ env ++ tools;

  fonts.fonts = with pkgs;
    [ fira-code
      iosevka
      powerline-fonts
    ];
}
