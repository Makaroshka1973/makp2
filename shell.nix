with import <nixpkgs> {
  crossSystem = {
    config = "riscv32-none-elf";
    rustc.config = "riscv32imac-unknown-none-elf";

    gcc = {
      arch = "rv32i";
      abi = "ilp32";
    };
  };
};
mkShell {
  nativeBuildInputs = [
    buildPackages.meson buildPackages.ninja buildPackages.pkg-config
  ];
}
