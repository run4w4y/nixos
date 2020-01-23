{ config, lib, pkgs, ... }:

{
    imports = [
        # import results of the automatic hardware scan
        ./hardware-configuration.nix
    ];

    hardware = {
        # enbale pulseaudio
        pulseaudio = {
            enable = true;
            # extraModules = [ pkgs.pulseaudio-modules-bt ];
            # package = pkgs.pulseaudioFull;
            # configFile = pkgs.writeText "default.pa" ''
            #     load-module module-bluetooth-policy
            #     load-module modele-bluetooth-discover
            # '';
        };
        # enable bluetooth
        bluetooth = {
            enable = true;
            extraConfig = ''
                [General]
                Enable=Source,Sink,Media,Socket
            '';
        };

        # those lines are kinda sorta for the nvidia gpu
        # nvidia.optimus_prime.enable = true;
        # bumblebee.enable = true;
        # nvidiaOptimus.disable = true;

        # opengl stuff
        opengl = {
            # enable opengl
            enable = true;
            # needed for steam to work 
            driSupport32Bit = true;
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