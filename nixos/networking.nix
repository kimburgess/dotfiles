{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "portal";

    networkmanager.enable = true;

    usePredictableInterfaceNames = false;

    firewall =
      { enable = true;
        allowPing = true;
        allowedTCPPorts = [ 80 443 ];
      };

      nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  # FIXME: there seems to be some issues with stability of this
  # services.dnscrypt-proxy.enable = true;

  environment.systemPackages = with pkgs;
    [
      wirelesstools
      openconnect
    ];

  services.openssh.enable = true;

  programs.mosh.enable = true;

  services.zerotierone =
    { enable = true;
      joinNetworks = [ "a0cbf4b62a4feda5" ];
      port = 9993;
    };
}
