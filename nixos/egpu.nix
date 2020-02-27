{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];

  services.hardware.bolt.enable = true;

  hardware.opengl =
    { extraPackages =
        [ pkgs.libGL_driver
          pkgs.linuxPackages.nvidia_x11.out
          pkgs.vaapiIntel
          pkgs.vaapiVdpau
          pkgs.libvdpau-va-gl
        ];
      driSupport = true;
      driSupport32Bit = true;
    };

  hardware.nvidia =
     { modesetting.enable = true;
       optimus_prime =
        { enable = true;
          nvidiaBusId = "PCI:7:0:0";
          intelBusId = "PCI:0:2:0";
          allowExternalGpu = true;
        };
    };

  virtualisation.docker.enableNvidia = true;

  environment.systemPackages = with pkgs;
    [ cudatoolkit
      glxinfo
      nvtop
      pciutils
    ];

  systemd.services.nvidia-control-devices =
    { wantedBy = [ "multi-user.target" ];
      serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11.bin}/bin/nvidia-smi";
    };
}
