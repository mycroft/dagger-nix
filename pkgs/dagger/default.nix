# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    x86_64-linux = "06dr5p3v5kmkz6l0gl06jj0jw6xq6cg620ld7khp6awpw413y9bv";
    armv7l-linux = "1j3brk7xrq80hr560y09n0z6shd9ijcmbmr9nhsqp2hvm7arnlwh";
    aarch64-linux = "1blkijk3jznkplf2qxmb908x3l3g0bxmb4iaf591kn44b3xsrg1m";
    x86_64-darwin = "1zvw62qyv4zzz26ly197f008sw55y7j0m42hn20hwx3ix4g43zaq";
    aarch64-darwin = "1bwvpp4ay64z42i7qh3k9kbzl9gmrd8pri7g21919lf6sfg20xpb";
  };

  urlMap = {
    x86_64-linux = "https://dl.dagger.io/dagger/releases/0.11.3/dagger_v0.11.3_linux_amd64.tar.gz";
    armv7l-linux = "https://dl.dagger.io/dagger/releases/0.11.3/dagger_v0.11.3_linux_armv7.tar.gz";
    aarch64-linux = "https://dl.dagger.io/dagger/releases/0.11.3/dagger_v0.11.3_linux_arm64.tar.gz";
    x86_64-darwin = "https://dl.dagger.io/dagger/releases/0.11.3/dagger_v0.11.3_darwin_amd64.tar.gz";
    aarch64-darwin = "https://dl.dagger.io/dagger/releases/0.11.3/dagger_v0.11.3_darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "dagger";
  version = "0.11.3";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./dagger $out/bin/dagger
  '';
  postInstall = ''
    installShellCompletion --cmd dagger \
    --bash <($out/bin/dagger completion bash) \
    --fish <($out/bin/dagger completion fish) \
    --zsh <($out/bin/dagger completion zsh)
  '';

  system = system;

  meta = {
    description = "Dagger is an integrated platform to orchestrate the delivery of applications";
    homepage = "https://dagger.io";
    license = lib.licenses.asl20;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
