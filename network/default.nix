{ config, lib, pkgs, ... }:

{
    networking = {
        # hostname of the system
        hostName = "nixos";
        # enable NetworkManager (instead of wpa_supplicant)
        networkmanager.enable = true;
        # enable the firewall
        firewall.enable = true;
    };
}