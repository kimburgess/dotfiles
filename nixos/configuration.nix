{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./locale.nix
      ./yubikey-gpg.nix
    ];

  boot = {
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices =
      [
        {
          name = "root";
          device = "/dev/disk/by-uuid/a2a77d48-f0b3-4425-bfab-038204dbe5fc";
          preLVM = true;
          allowDiscards = true;
        }
      ];
  };

  # Get a little more life from the SSD
  # Security warning for anyone using this: discard on a LUKS device will leak
  # some info past the disk encyption (which blocks are unused). Personally the
  # trade off is worth it but YMMV.
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  system = {
    stateVersion = "17.09";
    autoUpgrade.enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "12:30";
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    bluetooth.enable = true;
    pulseaudio.enable = true;
  };

  networking = {
    hostName = "portal";

    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 80 443 ];
    };

    # nameservers = [ "127.0.0.1" ];
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
  };

  services = {
    # dnscrypt-proxy.enable = true;

    xserver = {
      enable = true;
      dpi = 144;
      libinput.enable = true;

      displayManager.lightdm.enable = true;
      desktopManager.default = "none";
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };

    logind.lidSwitch = "ignore";

    redshift = {
      enable = true;
      temperature.day = 6500;
      temperature.night = 2700;
    };

    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
  };

  virtualisation = {
    virtualbox.host.enable = true;
    docker.enable = true;
  };

  programs = {
    fish.enable = true;
    vim.defaultEditor = true;
    tmux = {
      enable = true;
      keyMode = "vi";
      extraTmuxConf = ''
        set -g mouse on
        set -g history-limit 30000
      '';
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # system
    alacritty
    busybox
    dmenu
    feh
    haskellPackages.xmobar
    htop
    lightdm
    nix-repl
    openconnect
    pmutils
    psmisc
    stow
    sudo
    upower
    wget
    which
    xclip
    xorg.xbacklight
    xorg.xrandr

    # dev
    atom
    cabal-install
    cabal2nix
    docker_compose
    ghc
    gitAndTools.gitFull
    nodejs
    rubocop
    ruby
    vagrant
    wireshark

    # browser
    firefox
    chromium
  ];

  fonts = {
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      powerline-fonts
      iosevka
      hasklig
      source-code-pro
      source-sans-pro
      source-serif-pro
      ubuntu_font_family
      terminus_font
      inconsolata
      font-awesome-ttf
      fira-code
    ];
    fontconfig = {
      enable = true;
      dpi = 144;
      ultimate.enable = true;
      defaultFonts = {
        # monospace = [ "Iosevka" ];
      };
    };
  };

  environment.shellAliases = {
    ".."   = "cd ..";
    "..."  = "cd ../..";
    "...." = "cd ../../..";
    "gs" = "git status";
    "gc" = "git commit";
    "ga" = "git add";
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  users = {
    mutableUsers = false;

    defaultUserShell = pkgs.fish;

    extraUsers = {
      root.hashedPassword = "$6$3ZxeOlaJ$XkBx0r1XVMnsV2bNgGKXk1yZxIKMH6OI/vuBd.EWhVxCmVHHTAH6HeCE5lTtX0DDyBfsDnAsWzn8Pz2ylxNNM0";

      kim = {
        isNormalUser = true;
        home = "/home/kim";
        description = "Kim Burgess";
        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "vboxusers"
          "audio"
        ];
        hashedPassword = "$6$LG/3rGeWt$ngPvaxukpTybvpaIIDCoXZEjpupaWqsXHZolXNkS.LhbNX3PH6U7SebWjWtF09oKfWWO.oy4EeXF.fHAI768B.";
      };
    };
  };
}
