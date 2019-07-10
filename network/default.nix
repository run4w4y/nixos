{ config, lib, pkgs, ... }:

{
    networking = {
        # hostname of the system
        hostName = "nixos";
        # enable NetworkManager (instead of wpa_supplicant)
        networkmanager.enable = true;
        # disable the firewall
        firewall.enable = false;
    };
}