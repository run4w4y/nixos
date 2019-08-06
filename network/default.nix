{ config, lib, pkgs, ... }:

{
    networking = {
        sits = {
            wlan = {
                dev = "wlp60s0";
                ttl = 65;
            };
        };
        # hostname of the system
        hostName = "nixos";
        # enable NetworkManager (instead of wpa_supplicant)
        networkmanager.enable = true;
        # set up firewall
        firewall = {
            enable = true;
            allowedTCPPortRanges = [ { from = 1336; to = 1339; } ];
        };
    };
}