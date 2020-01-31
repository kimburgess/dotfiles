{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages = with pkgs;
    [ arduino
      atom
      bundler
      docker_compose
      ghc
      gitAndTools.gitFull
      git-lfs
      httpie
      (liblapack.override { shared = true; })
      nix-prefetch-git
      ngrok
      nodejs
      nodePackages.textlint
      nodePackages.write-good
      rubocop
      ruby
      teleport
      unstable.crystal
      unstable.shards
      vagrant
      vimHugeX
      wireshark
    ];

  fonts.fonts = with pkgs;
    [ fira-code
      iosevka
      powerline-fonts
    ];
}
