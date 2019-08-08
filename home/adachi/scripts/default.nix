let
    isFile = 
        {name, value}: 
        value == "regular";
    isScript = 
        {name, value}: 
        with rec {
            getLastElement = 
                list:
                with builtins;
                elemAt list (length list - 1);
            extension = with builtins; getLastElement (splitVersion (baseNameOf name));
        };
        extension == "sh";
    toNameValue = 
        { set, list ? null }:
        with builtins;
        let 
            attrList = if isNull list then attrNames set else list;
            current = [ rec { name = head attrList; value = getAttr name set; } ];
        in
            if length attrList == 1 then 
                current
            else
                current ++ toNameValue {
                    inherit set;
                    list = tail attrList;
                };
in
    with rec {
        dirFiles = 
            dir:
            with builtins;
            filter isFile (toNameValue { set = readDir dir; });
        
        dirScripts =
            dir:
            with builtins;
            filter isScript (dirFiles dir);
    };
    map (x: ./. + ("/" + x.name)) (dirScripts ./.)
