{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot = {
    loader =
      { systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

    kernelModules = [ "kvm-intel" ];

    extraModulePackages = [ ];

    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];

    initrd.luks.devices =
      [ {
          name = "root";
          device = "/dev/disk/by-uuid/a2a77d48-f0b3-4425-bfab-038204dbe5fc";
          preLVM = true;
          allowDiscards = true;
        }
      ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c454a2c5-b094-4e26-938a-7ea03da5e604";
      fsType = "ext4";
      # Security warning for anyone using this: discard on a LUKS device will leak
      # some info past the disk encyption (which blocks are unused). Personally the
      # trade off is worth it but YMMV.
      options = [ "noatime" "nodiratime" "discard" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/E10E-2351";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/bd2571b7-346d-4b6e-a049-706a5f108937"; }
    ];

  nix.maxJobs = lib.mkDefault 4;

  powerManagement.cpuFreqGovernor = "powersave";

  hardware =
    { cpu.intel.updateMicrocode = true;
      bluetooth.enable = true;
    };

  # Kill the internal webcam
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="579f", ATTR{authorized}="0"
  '';

  services.logind.lidSwitch = "ignore";

  services.printing =
    { enable = true;
      drivers = [ pkgs.gutenprint ];
    };
}
