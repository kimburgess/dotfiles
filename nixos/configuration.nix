{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
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
    consoleKeyMap = "us";
    defaultLocale = "en_AU.UTF-8";
  };

  time.timeZone = "Australia/Brisbane";

  services = {
    pcscd.enable = true;

    # dnscrypt-proxy.enable = true;

    xserver = {
      enable = true;
      dpi = 144;
      layout = "us";
      xkbOptions = "eurosign:e";
      libinput.enable = true;

      displayManager.lightdm.enable = true;
      desktopManager.default = "none";
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };

    redshift = {
      enable = true;
      latitude = "-27.4698";
      longitude = "153.0251";
      temperature.day = 6500;
      temperature.night = 2700;
    };
  };

  programs = {
    fish.enable = true;
    vim.defaultEditor = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # system
    alacritty
    busybox
    dmenu
    feh
    htop
    lightdm
    nix-repl
    openconnect
    psmisc
    stow
    sudo
    tmux
    upower
    wget
    which
    xclip
    xorg.xbacklight

    # crypto
    gnupg
    pinentry_ncurses
    yubikey-manager
    yubikey-personalization

    # dev
    atom
    cabal-install
    cabal2nix
    ghc
    gitAndTools.gitFull
    nodejs
    rubocop
    ruby
    vim
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
        extraGroups = [ "wheel" "networkmanager" ];
        hashedPassword = "$6$LG/3rGeWt$ngPvaxukpTybvpaIIDCoXZEjpupaWqsXHZolXNkS.LhbNX3PH6U7SebWjWtF09oKfWWO.oy4EeXF.fHAI768B.";
      };
    };
  };
}
