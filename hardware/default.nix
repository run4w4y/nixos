{ config, lib, pkgs, ... }:

{
    imports = [
        # import results of the automatic hardware scan
        ./hardware-configuration.nix
    ];

    hardware = {
        # enbale pulseaudio
        pulseaudio.enable = true;
        # enable bluetooth
        bluetooth.enable = true;

        # those lines are kinda sorta for the nvidia gpu
        # nvidia.optimus_prime.enable = true;
        # bumblebee.enable = true;    
        # nvidiaOptimus.disable = true;

        # opengl stuff
        opengl = {
            # enable opengl
            enable = true;
            # then get vaapi working
            extraPackages = with pkgs; [
                vaapiIntel
                vaapiVdpau
                libvdpau-va-gl
                intel-media-driver
            ];
        };
    };
}