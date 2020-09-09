{ config, lib, pkgs, ... }:

{
  virtualisation =
    { virtualbox.host.enable = true;
      docker.enable = true;
    };

  environment.systemPackages = with pkgs;
    [ ameba
      arduino
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
      google-cloud-sdk
      gnumake
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
