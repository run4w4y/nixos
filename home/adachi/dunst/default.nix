let
    colors = {
        background = "#ffffff";
        foreground = "#6d6d6d";
        frame_color = "#4a4a4a";
    };
in
{
    global = colors // {
        monitor = 0;
        follow = "mouse";
        geometry = "340x10-12+55";
        indicate_hidden = true;
        shrink = false;
        transaprency = 0; 
        notification_height = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 3;
        separator_color = "frame";
        sort = true;
        idle_threshold = 120;
        font = "Noto Sans 9";
        line_height = 0;
        markup = "full";
        format = "%s\\n%b";
        alignment = "center";
        show_age_threshold = 60;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "off";
        sticky_history = true;
        history_length = 1;
        startup_notification = false;
        timeout = 5;
    };

    shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
    };

    urgency_low = colors // {
        timeout = 3;
    };

    urgency_normal = colors // {
        timeout = 10;
    };

    urgency_critical = colors // {
        frame_color = "#ff0000";
        timeout = 0;
    };

    volume = colors // {
        appname = "changeVolume";
        foreground = colors.frame_color;
        timeout = 3;
        history_ignore = true;
        format = "<span font='FontAwesome 13'></span>   <span font='Noto Sans 11' letter_spacing='3096'>%b</span>";
    };

    brightness = colors // {
        appname = "changeBrightness";
        foreground = colors.frame_color;
        timeout = 3;
        history_ignore = true;
        format = "<span font='FontAwesome 13'></span>   <span font='Noto Sans 11' letter_spacing='3096'>%b</span>";
    };

    vpn = colors // {
        appname = "VPN";
        foreground = colors.frame_color;
        timeout = 3;
        history_ignore = true;
        format = "<span font='Noto Sans 13' letter_spacing='3096'>%b</span>";
    };
}