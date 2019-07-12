{ config, lib, pkgs, ... }:

{
    services = {
        # enable printing
        printing.enable = true;
        # get the printer drivers here
        printing.drivers = [ 
            pkgs.hplip # driver for hp printers
        ];

        # enable avahi
        avahi = {
            enable = true;
            nssmdns = true;
            publish = {
                enable = true;
                addresses = true;
            };
        };

        # set up x
        xserver = {
            enable = true;
            autorun = true;
            layout = "us,ru";
            xkbOptions = "eurosign:e";

            # drivers for gpu
            videoDrivers = [ "intel" ];

            # set up DE here
            desktopManager = {
                default = "xfce";
                xterm.enable = false;
                xfce = {
                    # enable xfce
                    enable = true;
                    # and then take out all of the shit that we dont need
                    noDesktop = true;
                    enableXfwm = false;
                };
            };
            
            # set up VM here
            windowManager = {
                default = "bspwm";
                bspwm = {
                    # enable bspwm
                    enable = true;
                    # path to the bspwmrc
                    configFile = "/home/adachi/.config/bspwm/bspwmrc";
                };
            };
            
            # set up dm here (sddm sucks tbh)
            displayManager.lightdm = {
                enable = true;
            };

            # synaptics driver for the touchpad
            synaptics = {
                enable = true;
                vertTwoFingerScroll = true;
                # scrollDelta is less than zero to enable natural scrolling 
                scrollDelta = -75;
                minSpeed = "0.8";
                maxSpeed = "1.2";
                accelFactor = "0.0015";
                buttonsMap = [1 3 3];
            };

            # i personally use it for setting up dpi
            monitorSection = ''
                DisplaySize 406 228
            '';
        };

        # set up compton so everything looks cooler
        compton = {
            enable = true;
            # fades are gay
            fade = false;
            # shadows are not
            shadow = true;
            shadowOpacity = "0.4";
        };
    };
}