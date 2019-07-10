{ lib, pkgs, ... }:

{
    imports = [
        "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    ];

    home-manager.users.adachi = import ./adachi;
}