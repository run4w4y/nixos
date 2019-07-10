{ config, lib, pkgs, ... }:

{
    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # this shit lets grub detect other systems installed alongside
    boot.loader.grub.useOSProber = true;
}