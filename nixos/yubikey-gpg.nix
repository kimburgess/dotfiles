{ config, lib, pkgs, ... }:

{
  programs.ssh.startAgent = false;

  services.pcscd.enable = true;

  environment.systemPackages = with pkgs;
    [ gnupg
      yubikey-manager
      yubikey-personalization
    ];

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services.udev.packages = [ pkgs.yubikey-personalization ];
}
