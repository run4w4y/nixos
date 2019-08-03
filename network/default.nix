{ config, lib, pkgs, ... }:

{
    networking = {
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