{
  description = "A statically typed, interpreted language";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default =
      pkgs.mkShell {
        packages = with pkgs; [
          clang-tools
          codespell
          cmake
          gnumake
          cppcheck
          gtest
        ];

        DEV_SHELL_ACTIVE = "simmer";
      };
  };
}
