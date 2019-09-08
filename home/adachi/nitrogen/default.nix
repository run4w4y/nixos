{
    bg-saved = 
    let
        bgFile = ./bg.jpg;
    in
        ''
        [xin_-1]
        file=${bgFile}
        mode=2
        bgcolor=#000000
        '';
    config = 
    with rec {
        h = 1080;
        w = 1920;
    };
    ''
        [geometry]
        posx=0
        posy=0
        sizex=${toString w}
        sizey=${toString h}

        [nitrogen]
        view=icon
        recurse=true
        sort=alpha
        icon_caps=false
    '';
}