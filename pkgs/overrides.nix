{ config, lib, pkgs, ... }:

{
    nixpkgs.config = {
        packageOverrides = pkgs:
        let 
            customExtensions = import ./vscode_marketplace.nix;
        in 
        with pkgs; {
            dunst = dunst.override { dunstify = true; };
            vaapiIntel = vaapiIntel.override { enableHybridCodec = true; };
            mycode = vscode-with-extensions.override {
                vscodeExtensions = with vscode-extensions; [
                    # default extensions 
                    ms-vscode.cpptools # support for c++
                    ms-python.python # support for python
                    justusadam.language-haskell # support for haskell
                    bbenoist.Nix # support for nix
                ] # then download other extensions from the marketplace 
                ++ vscode-utils.extensionsFromVscodeMarketplace customExtensions;
            };
            unstable = import <nixos-unstable> {
                config = config.nixpkgs.config;
            };
        };
    };
}

