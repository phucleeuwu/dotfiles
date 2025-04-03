{
  installShellFiles,
  lib,
  stdenv,
  unzip,
  glibcLocalesUtf8,
}: let
  appName = "AeroSpace.app";
  version = "0.0.0-SNAPSHOT";
in
  stdenv.mkDerivation {
    pname = "aerospace-fork";

    inherit version;

    src = ./. + "/AeroSpace-v${version}.zip";

    nativeBuildInputs = [installShellFiles unzip glibcLocalesUtf8];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/Applications
      mv ${appName} $out/Applications
      cp -R bin $out
      mkdir -p $out/share
      runHook postInstall
    '';

    postInstall = ''
      installManPage manpage/*
      installShellCompletion --bash shell-completion/bash/aerospace
      installShellCompletion --fish shell-completion/fish/aerospace.fish
      installShellCompletion --zsh  shell-completion/zsh/_aerospace
    '';

    meta = {
      license = lib.licenses.mit;
      mainProgram = "aerospace";
      homepage = "https://github.com/nikitabobko/AeroSpace";
      description = "i3-like tiling window manager for macOS";
      platforms = lib.platforms.darwin;
      maintainers = with lib.maintainers; [alexandru0-dev];
      sourceProvenance = [lib.sourceTypes.binaryNativeCode];
    };
  }
