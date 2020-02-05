{ config, lib, pkgs, ... }:

{
  programs =
    { ssh.startAgent = false;
      gnupg.agent =
        { enable = true;
          enableSSHSupport = true;
        };
    };

  services.pcscd.enable = true;

  nixpkgs.config.allowBroken = true;

  environment.systemPackages = with pkgs;
    [ gnupg
      yubikey-manager
      yubikey-personalization
    ];

  environment.shellInit = ''
    export GPG_TTY="$(tty)"
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  '';

  services.udev.packages = [ pkgs.yubikey-personalization ];
}
