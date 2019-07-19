{
    services = {
        flameshot.enable = true;

        dunst = {
            enable = true;
            settings = import ./dunst;
        };

        polybar = {
            enable = true;
            config = import ./polybar;
            script = "sleep 1";
        };

        mpd = {
            enable = true;
            musicDirectory = "/mnt/hdd/music";
        };
    };

    programs = {
        home-manager.enable = true;

        git = {
            enable = true;
            userName = "Vadim Makarov";
            userEmail = "add4che@gmail.com";
        };

        command-not-found.enable = true;

        vim = {
            enable = true;
            extraConfig = builtins.readFile vim/vimrc;
            settings = {
                relativenumber = true;
                number = true; 
            };
            plugins = [
                "idris-vim"
                "sensible"
                "vim-airline"
                "The_NERD_tree" # file system explorer
                "fugitive" "vim-gitgutter" # git 
                "rust-vim"
            ];
        };

        termite = {
            enable = true;
            allowBold = false;
            audibleBell = false;
            clickableUrl = true;
            mouseAutohide = true;
            scrollOnOutput = true;
            font = "Monospace 11";
            scrollbackLines = 10000;
            scrollbar = "right";
            colorsExtra = ''
                color0 = #ffffff
                color1 = #379bde
                color2 = #8fd99e
                color3 = #e84a4a
                color4 = #9263e8
                color5 = #f491ff
                color6 = #ec7285
                color7 = #2f2f2f
                color8 = #6d6d6d
                color9 = #e5dcdc
                color10 = #ff8787
                color11 = #6a1fdb
                color12 = #ffad42
                color13 = #eb3461
                color14 = #ffc6cf
                color15 = #a6a6a6
            '';
        };

        rofi = {
            enable = true;
            theme = ./rofi/arc-red.rasi;
        };
    };

    home = {
        packages = 
        with import <nixpkgs> {};
        with rec {
            makeVpnScript = import ./vpn;
            scriptPaths = import ./scripts;
            makeScript = 
                path: 
                with builtins;
                writeShellScriptBin (head (splitVersion (baseNameOf (toString path)))) (readFile path);
            vpn_start = writeShellScriptBin "vpn_start" (makeVpnScript "start" openvpn);
            vpn_stop = writeShellScriptBin "vpn_stop" (makeVpnScript "stop" killall);
            scriptsList = map makeScript scriptPaths; 
        };
        scriptsList ++ [
            vpn_start
            vpn_stop
        ];

        file = {
            ".config.ovpn".text = import vpn/config.nix;
            ".start_polybar.sh".source = polybar/scripts/start_polybar.sh;
        };
    };
}