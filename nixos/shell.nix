{ config, lib, pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;

  programs = {
    fish.enable = true;

    vim.defaultEditor = true;

    tmux =
      { enable = true;
        keyMode = "vi";
        extraTmuxConf = ''
          set -g mouse on
          set -g history-limit 30000
        '';
      };
  };

  environment.systemPackages = with pkgs;
    [ alacritty
      htop
      openssl
      pmutils
      psmisc
      stow
      sudo
      upower
      wget
      which
    ];

  fonts.fonts = with pkgs; [ terminus_font inconsolata ];
  fonts.fontconfig.defaultFonts.monospace = [ "Inconsolata" ];

  environment.shellAliases = {
    ".."   = "cd ..";
    "..."  = "cd ../..";
    "...." = "cd ../../..";
    "gs" = "git status";
    "gc" = "git commit";
    "ga" = "git add";
  };
}
