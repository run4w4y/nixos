{ config, lib, pkgs, ... }:

{
    users = {
        extraUsers.adachi = {
            # set fish as the default shell
            shell = "/run/current-system/sw/bin/fish";
        };

        # define user your user here
        users.adachi = {
            isNormalUser = true;
            extraGroups = [ "wheel" "vpnusers" ];
        };
    };
}