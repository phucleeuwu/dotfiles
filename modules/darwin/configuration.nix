{pkgs, ...}: {
  # essential macOs settings
  system.defaults = {
    CustomUserPreferences."com.apple.AdLib".allowApplePersonalizedAdvertising = false;
    LaunchServices.LSQuarantine = false;
    controlcenter.BatteryShowPercentage = true;
    ".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
    trackpad = {
      Clicking = true;
      ActuationStrength = 0;
      TrackpadThreeFingerDrag = true;
    };
    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };
    dock = {
      expose-group-apps = true;
      tilesize = 40;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      largesize = 80;
      mru-spaces = false;
      show-recents = false;
      magnification = true;
      showhidden = true;
      autohide = true;
      static-only = true;
    };
    finder = {
      FXPreferredViewStyle = "clmv";
      FXDefaultSearchScope = "SCcf";
      NewWindowTarget = "Home";
      CreateDesktop = false;
      ShowStatusBar = true;
      ShowPathbar = true;
      FXRemoveOldTrashItems = true;
    };
    NSGlobalDomain = {
      NSWindowShouldDragOnGesture = true;
      AppleInterfaceStyle = "Dark";
      InitialKeyRepeat = 15;
      AppleKeyboardUIMode = 3;
      KeyRepeat = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      _HIHideMenuBar = true;
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      "com.apple.sound.beep.volume" = 0.7788008;
      "com.apple.sound.beep.sound" = "funky";
      "com.apple.trackpad.scaling" = 3.0;
      "com.apple.swipescrolldirection" = false;
    };
  };
  networking = {
    knownNetworkServices = [
      "Wi-Fi"
      "Ethernet"
    ];
    dns = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };
  services = {
    # karabiner-elements.enable = true;
  };
  programs.fish.enable = true;
  environment.shells = [pkgs.fish pkgs.nushell];
}
