with rec {
    colors = {
        background = "#ffffff";
        backgroundAlt = "#778ac9";
        backgroundAlt1 = "#97acf0";
        foreground = "#496269";
        foregroundAlt = "#ffffff";
        foregroundAlt1 = "#97acf0";
        foregroundTrans = "#b0c0f5";
        urgent = "#bd2c40";
        white = "#ffffff";
        primary = "#ffb52a";
        secondary = "#e60053";
        underline = "#ec7285";
    };

    barHeight = 35;

    scriptPath = scriptName: toString ./scripts + "/${scriptName}";

    baseBar = {
        monitor = "eDP-1";
        offset-y = 10;
        height = barHeight;
        fixed-center = true;
        bottom = false;
        background = colors.background;
        foreground = colors.foreground;
        line-size = 0;
        padding-left = 0;
        padding-right = 0;
        module-margin-left = 0; 
        module-margin-right = 0;
        font-0 = "Noto Sans:size=13:style=Regular;1";
        font-1 = "Noto Sans:size=20:style=Regular;3";
        font-2 = "Noto Sans:size=13:style=Regular;2";
        font-3 = "FontAwesome:pixelsize=13:style=Regular;1";
        wm-restack = "bspwm";
    };

    makeIcon = 
        icon:
        {
            type = "custom/text";
            content = icon;
            content-padding = 2;
            content-background = colors.backgroundAlt;
            content-foreground = colors.foregroundAlt;
            label-font = 3;
        };
};
{
    "bar/wlan-bar" = baseBar // {
        width = 40;
        offset-x = 10;
        modules-center = "wireless-network";
        background = colors.backgroundAlt;
    };

    "bar/vpn-bar" = baseBar // {
        width = 40;
        offset-x = 70;
        modules-center = "vpn";
        background = colors.backgroundAlt;
    };

    "bar/battery-bar" = baseBar // {
        width = 100;
        offset-x = 130;
        modules-left = "battery_icon battery";
    };

    "bar/language-bar" = baseBar // {
        width = 80;
        offset-x = 250;
        modules-left = "language_icon language";
    };

    "bar/date-bar" = baseBar // {
        width = 215;
        offset-x = 350;
        modules-left = "date_icon date hour";
    };

    "bar/name-bar" = baseBar // {
        width = "16%";
        offset-x = 806;
        modules-center = "username";
    };

    "bar/right-bar" = baseBar // {
        width = 217;
        offset-x = 1693;
        font-0 = "FontAwesome:size=15:style=Regular;1";
        font-1 = "FontAwesome:size=20:style=Regular;3";
        font-2 = "FontAwesome:size=20:style=Regular;2";
        font-3 = "Monospace:size=17:style=Regular;1";
        padding-right = "2.5";
        modules-right = "bspwm";
    };

    "module/battery_icon" = makeIcon "";

    "module/vpn_icon" = makeIcon "";

    "module/language_icon" = makeIcon "" // { 
        content-padding = 3;
    };

    "module/date_icon" = makeIcon "" // { 
        content-padding = 3;
    };

    "module/username" = {
        type = "custom/text";
        content = "adachi@nixos";
        content-background = colors.background;
        content-foreground = colors.foreground;
    };

    "module/bspwm" = {
        type = "internal/bspwm";
        pin-workspaces = true;
        ws-icon-0 = "□";
        ws-icon-1 = "□";
        ws-icon-2 = "□";
        ws-icon-3 = "□";
        ws-icon-4 = "□";
        ws-icon-5 = "□";
        ws-icon-6 = "□";
        ws-icon-7 = "□";
        ws-icon-8 = "□";
        ws-icon-9 = "□";
        format = "<label-state>";

        label-focused = "■";
        label-focused-font = 3;
        label-focused-background = colors.background;
        label-focused-foreground = colors.backgroundAlt;
        label-focused-underline= colors.underline;
        label-focused-padding-right = 1;

        label-occupied = "■";
        label-occupied-font = 3;
        label-occupied-background = colors.background;
        label-occupied-foreground = colors.foregroundAlt1;
        label-occupied-padding-right = 1;
        
        label-urgent = "□";
        label-urgent-font = 3;
        label-urgent-background = colors.background;
        label-urgent-foreground = colors.backgroundAlt1;

        label-empty = "□";
        label-empty-font = 3;
        label-empty-background = colors.background;
        label-empty-foreground = colors.foregroundAlt1;
        label-empty-padding-right = 1;
    };

    "module/hour" = {
        type = "custom/script";
        exec = scriptPath "get_time.sh";
        click-left = scriptPath "calendar-popup.sh";
        interval = 1;
    };

    "module/date" = {
        type = "internal/date";
        interval = 5;
        click-left = scriptPath "calendar-popup.sh";
        label-background = colors.background;
        label-foreground = colors.foreground;
        date = "%d %b %Y ";
        label = "  %date%";
        format-padding-right = 1;
    };

    "module/language" = {
        type = "custom/script";
        exec = scriptPath "ibus_language.sh";
        tail = true;
        format-background = colors.background;
        format-foreground = colors.foreground;
        format-padding-left = 1;
        format-padding = 2;
        interval = 0;
    };

    "module/vpn" = {
        type = "custom/script";
        exec = scriptPath "vpn/get_state.sh";
        click-left = scriptPath "vpn/vpn_toggle.sh";
        tail = true;
        format-background = colors.backgroundAlt;
        format-foreground = colors.foregroundAlt;
        format-padding = 2;
    };

    "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        full-at = 99;

        format-charging = "<label-charging>";
        format-charging-underline = colors.underline;
        format-charging-background = colors.background;
        format-charging-foreground = colors.foreground;
        label-charging-foreground = colors.foreground;

        format-discharging = "<label-discharging>";
        format-discharging-background = colors.background;
        format-discharging-foreground = colors.foreground;
        label-discharging-foreground = colors.foreground;

        format-full-prefix-foreground = colors.foreground;
        format-full-underline = colors.underline;
        format-full-background = colors.background;
        format-full-foreground = colors.foreground;

        format-full-padding = 2;
        format-discharging-padding = 2;
        format-charging-padding = 2;
    };

    "module/wireless-network" = {
        type = "internal/network";
        interface = "wlp60s0";
        interval = 3;

        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        format-connected-background = colors.backgroundAlt;
        format-disconnected-background = colors.backgroundAlt;

        label-connected-foreground = colors.foregroundAlt;
        label-connected-padding = 2;
        label-connected = "%{A1:${scriptPath "networks-popup.sh"} &:}%{A}";
        label-connected-padding-left = 2;
        label-disconnected-foreground = colors.foregroundTrans;
        label-disconnected-padding = 2;
        label-disconnected = "%{A1:${scriptPath "networks-popup.sh"} &:}%{A}";
        label-disconnected-padding-left = 2;
    };
}