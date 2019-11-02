{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages = with pkgs;
    let
      iot = [ arduino ];
      editors = [ atom vimHugeX ];
      crystal = [ unstable.crystal unstable.shards ];
      nix = [ nix-prefetch-git ];
      haskell = []; # ghc cabal-install ];
      ruby_ = [ ruby rubocop bundler ];
      node = [ nodejs ];
      env = [ docker_compose vagrant ];
      tools = [ gitAndTools.gitFull git-lfs wireshark teleport httpie ];
      lib = [ (liblapack.override { shared = true; }) ];
    in iot ++ editors ++ crystal ++ nix ++ haskell ++ ruby_ ++ node ++ env ++ tools ++ lib;

  fonts.fonts = with pkgs;
    [ fira-code
      iosevka
      powerline-fonts
    ];
}
