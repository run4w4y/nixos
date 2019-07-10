{ config, pkgs, ... }:

{
    # import shit
    imports = [
        # set up hardware shit
        ./hardware
        # packages management
        ./pkgs
        # setting up bootloader
        ./bootloader
        # set up networking
        ./network
        # set up services
        ./services
        # set up users
        ./users
        # environment stuff
        ./environment
        # home-manager
        ./home
    ];
    
    # time zone
    time.timeZone = "Europe/Moscow";

    # set the input method
    i18n.inputMethod = {
        enabled = "ibus";
    };

    # add some cool fonts so everything looks nice
    fonts.fonts = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts
        dina-font
        proggyfonts
        font-awesome-ttf
    ];

    # enable sound
    sound.enable = true;
    nixpkgs.config.pulseaudio = true;

    # instead of the sudoers file
    security.sudo = {
        enable = true;
        extraRules = [
            {
                # needs for the vpn to work (yes ik that its not the best way to implement it so what)
                groups = [ "vpnusers" ]; 
                commands = [
                    {
                    command = "${pkgs.openvpn}/bin/openvpn --config ~/.config.ovpn";
                    options = [ "NOPASSWD" ];
                    }
                    {
                    command = "${pkgs.killall}/bin/killall openvpn";
                    options = [ "NOPASSWD" ];
                    }
                ]; 
            }
        ];
    };

    # enable fish
    programs.fish.enable = true;
    
    # just dont fucking touch it
    system.stateVersion = "19.03"; # did you read the comment above?
}
