{ config, lib, pkgs, ... }:

{
    imports = [
        ./overrides.nix
    ];

    # allow installing unfree packages
    nixpkgs.config.allowUnfree = true;

    # install packages declaratively
    environment.systemPackages = 
        with pkgs; 
        with rec { 
            pkgsPath = 
                <nixpkgs>;
            haxe4nix = 
                (import pkgsPath {}).fetchFromGitHub {
                    owner = "run4w4y";
                    repo = "haxe4nix";
                    rev = "caf2123e19d4252c3d4510470afcf4a8820404d1";
                    sha256 = "1f7nh7s9nsa7z428w41i7hmxzbyzh7d553m9pshm4yv9xphh3vdn";
                };
            pkgsOverlay = 
                import "${haxe4nix}/nixpkgs-overlay";
            mypkgs = 
                import pkgsPath { overlays = [ pkgsOverlay ]; };
        };
        [
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
            unstable.discord
            tdesktop
            python
            dunst # need it for dunstify to work cause home-manager is big dumb and doesnt let you override the package
            nitrogen
            polybar
            xst
            sxhkd
            # mycode
            vscode
            mypkgs.haxe
            lxappearance
            ark
            killall
            glxinfo
            xorg.xdpyinfo
            openvpn
            # gcc
            papirus-icon-theme
            materia-theme
            capitaine-cursors
            xorg.xbacklight
            vlc
            gparted
            # qemu
            # kvm
            # aqemu
            # jetbrains.pycharm-professional
            # jetbrains.clion
            # jetbrains.idea-community
            kotlin
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
            # go
            blueman
            # cabal-install
            # ghc
            okular
            xorg.xev
            # soulseekqt
            cuetools
            shntool
            split2flac
            # fcrackzip
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
            # gdrivefs
            spek
            usbutils
            wireshark
            pciutils
            # steam
            # quodlibet
            xclip
            piper
            rclone
            deluge
            thunderbird
        ];
}