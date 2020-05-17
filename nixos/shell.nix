{ config, lib, pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;

  programs = {
    fish.enable = true;

    thefuck.enable = true;

    vim.defaultEditor = true;

    tmux =
      { enable = true;
        keyMode = "vi";
        extraConfig = ''
          set -g mouse on
          set -g history-limit 30000
        '';
      };
  };

  environment.systemPackages = with pkgs;
    [ alacritty
      bat
      drive
      gitAndTools.diff-so-fancy
      htop
      jq
      openssl
      pmutils
      unstable.prettyping
      psmisc
      stow
      sudo
      telnet
      tldr
      tree
      unzip
      upower
      wget
      which
    ];

  fonts.fonts = with pkgs; [ terminus_font inconsolata ];
  fonts.fontconfig.defaultFonts.monospace = [ "Inconsolata" ];

  environment.homeBinInPath = true;

  environment.shellAliases = {
    ".."   = "cd ..";
    "..."  = "cd ../..";
    "...." = "cd ../../..";

    "gs" = "git status";
    "gc" = "git commit";
    "ga" = "git add";
    "gd" = "git diff";

    "cat" = "bat";
    "ping" = "prettyping";

    "tmux" = "tmux -2";
  };
}
