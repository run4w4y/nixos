{ lib, pkgs, ... }:

{
    imports = [
        "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-19.09.tar.gz}/nixos"
    ];

    home-manager.users.adachi = import ./adachi;
}