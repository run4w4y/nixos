let
colors = {
    background = "#ffffff";
    backgroundAlt = "#ff8787";
    backgroundAlt1 = "#ffa5a5";
    foreground = "#6d6d6d";
    foregroundAlt = "#ffffff";
    foregroundAlt1 = "#ffb2b2";
    foregroundTrans = "#ffc9c9";
    urgent = "#bd2c40";
    white = "#ffffff";
    primary = "#ffb52a";
    secondary = "#e60053";
    underline = "#ec7285";
};
barHeight = 35;
scriptPath = scriptName: toString ./scripts + "/${scriptName}";
in
let
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
    font-0 = "Noto Sans:size=14:style=Regular;1";
    font-1 = "Noto Sans:size=20:style=Regular;3";
    font-2 = "Noto Sans:size=14:style=Regular;2";
    font-3 = "FontAwesome:size=12:style=Regular;1";
    wm-restack = "bspwm";
};
in
{
    "bar/left-bar" = baseBar // {
        width = "19.5%";
        offset-x = 10;
        modules-left = "wireless-network battery vpn language date hour";
    };

    "bar/right-bar" = baseBar // {
        width = "11.35%";
        offset-x = 1690;
        font-0 = "FontAwesome:size=15:style=Regular;1";
        font-1 = "FontAwesome:size=20:style=Regular;3";
        font-2 = "FontAwesome:size=20:style=Regular;2";
        font-3 = "Monospace:size=17:style=Regular;1";
        padding-right = "2.5";
        modules-right = "bspwm";
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
        format-background = colors.backgroundAlt1;
        format-foreground = colors.foregroundAlt;
        format-padding-left = 1;
        format-padding = 2;
        interval = 0;
    };

    "module/vpn" = {
        type = "custom/script";
        exec = scriptPath "vpn/get_state.sh";
        click-left = scriptPath "vpn/vpn_toggle.sh";
        tail = true;
        format-background = colors.backgroundAlt1;
        format-foreground = colors.foregroundAlt;
        format-padding = 2;
    };

    "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        full-at = 99;

        format-charging = "<animation-charging> <label-charging>";
        format-charging-underline = colors.underline;
        format-charging-background = colors.backgroundAlt;
        format-charging-foreground = colors.foregroundAlt;
        label-charging-foreground = colors.foregroundAlt;

        format-discharging = "<animation-discharging> <label-discharging>";
        format-discharging-background = colors.backgroundAlt;
        format-discharging-foreground = colors.foregroundAlt;
        label-discharging-foreground = colors.foregroundAlt;

        format-full-prefix = " ";
        format-full-prefix-foreground = colors.foregroundAlt;
        format-full-underline = colors.underline;
        format-full-background = colors.backgroundAlt;
        format-full-foreground = colors.foregroundAlt;

        format-full-padding = 1;
        format-discharging-padding = 1;
        format-charging-padding = 1;

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-foreground = colors.foregroundAlt;

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-foreground = colors.foregroundAlt;
        animation-charging-framerate = 750;

        animation-discharging-0 = "";
        animation-discharging-1 = "";
        animation-discharging-2 = "";
        animation-discharging-3 = "";
        animation-discharging-foreground = colors.foregroundAlt;
        animation-discharging-framerate = 750;
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