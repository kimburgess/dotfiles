{ config, lib, pkgs, ... }:

{
  users.mutableUsers = false;

  security.sudo =
    { enable = true;
      wheelNeedsPassword = false;
    };

  users.extraUsers = {
    root.hashedPassword = "$6$3ZxeOlaJ$XkBx0r1XVMnsV2bNgGKXk1yZxIKMH6OI/vuBd.EWhVxCmVHHTAH6HeCE5lTtX0DDyBfsDnAsWzn8Pz2ylxNNM0";

    kim =
      { isNormalUser = true;
        home = "/home/kim";
        description = "Kim Burgess";
        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "vboxusers"
          "audio"
          "dialout"
          "video"
        ];
        hashedPassword = "$6$LG/3rGeWt$ngPvaxukpTybvpaIIDCoXZEjpupaWqsXHZolXNkS.LhbNX3PH6U7SebWjWtF09oKfWWO.oy4EeXF.fHAI768B.";
      };
  };
}
