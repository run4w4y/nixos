{ config, lib, pkgs, ... }:

{
    boot = {
        # change ttl to 65 so my cellular provider wont complain
        kernel.sysctl."net.ipv4.ip_default_ttl" = 65;

        loader = {
            # Use the systemd-boot EFI boot loader.
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;

            # this shit lets grub detect other systems installed alongside
            grub = {
                enable = true;
                version = 2;
                devices = [ "nodev" ];
                efiSupport = true;
                useOSProber = true;
            };
        };

        supportedFilesystems = [ "ntfs" ];
    };
}