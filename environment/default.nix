{ config, lib, pkgs, ... }:

{
    environment = {
        # aliases
        shellAliases = {
            ls = "ls --color=tty";
            ll = "ls -l";
            l = "ls -alh";
            chromium = "chromium-browser --force-device-scale-factor=1.25";
        };

        # set up session variables here
        sessionVariables = {
            XCURSOR_THEME = "Capitaine Cursors";
        };
    };
}