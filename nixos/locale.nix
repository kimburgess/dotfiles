{ config, pkgs, ... }:

{
    i18n = {
      consoleKeyMap = "us";
      defaultLocale = "en_AU.UTF-8";
    };

    services.xserver.layout = "us";

    time.timeZone = "Australia/Brisbane";

    redshift = {
      latitude = "-27.4698";
      longitude = "153.0251";
    };
}
