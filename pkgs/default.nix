{ config, lib, pkgs, ... }:

{
    imports = [
        ./overrides.nix
    ];

    # allow installing unfree packages
    nixpkgs.config.allowUnfree = true;

    # install packages declaratively
    environment.systemPackages = with pkgs; [
        bc
        htop
        wget
        curl
        file
        nmap
        neofetch
        nix-index
        screen
        chromium
        discord
        tdesktop
        python
        dunst # need it for dunstify to work cause home-manager is big dumb and doesnt let you override the package
        nitrogen
        polybar
        xst
        sxhkd
        mycode
        lxappearance
        ark
        killall
        glxinfo
        xorg.xdpyinfo
        openvpn
        gcc
        papirus-icon-theme
        materia-theme
        capitaine-cursors
        xorg.xbacklight
        vlc
        gparted
        qemu
        kvm
        aqemu
        jetbrains.pycharm-professional
        jetbrains.clion
        hashit
        cmake
        calcurse
        home-manager
        zip
        which
        unrar
        tree
        unzip
        p7zip 
        transmission-gtk
        go
        blueman
        cabal-install
        ghc
        okular
        xorg.xev
        # soulseekqt
        cuetools
        shntool
        split2flac
        fcrackzip
        hexchat
        ncmpcpp
        ranger
        python3
        appimage-run
        cloc
        python3Packages.ipython
        easytag
        flacon
        flac
        gdrivefs
        spek
        usbutils
        wireshark
        pciutils
        # quodlibet
    ];
}