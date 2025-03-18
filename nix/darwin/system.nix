_: {
  system.defaults = {
    LaunchServices.LSQuarantine = false;
    controlcenter.BatteryShowPercentage = true;

    trackpad = {
      Clicking = true;
      ActuationStrength = 0;
    };

    loginwindow = {
      GuestEnabled = false;
      ShutDownDisabled = true;
      SleepDisabled = true;
      RestartDisabled = true;
      ShutDownDisabledWhileLoggedIn = true;
      PowerOffDisabledWhileLoggedIn = true;
      RestartDisabledWhileLoggedIn = true;
      DisableConsoleAccess = true;
    };

    dock = {
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
      "com.apple.sound.beep.volume" = 0.6065307;
      "com.apple.trackpad.scaling" = 3.0;
      "com.apple.swipescrolldirection" = false;
    };
  };

  services = {
    # karabiner-elements.enable = true;
  };
}
