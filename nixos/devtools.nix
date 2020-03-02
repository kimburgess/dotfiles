{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages = with pkgs;
    [ arduino
      atom
      awscli
      bind
      bundler
      calc
      ctop
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
      pcalc
      postman
      rubocop
      ruby
      teleconsole
      teleport
      unstable.crystal
      old.shards
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
