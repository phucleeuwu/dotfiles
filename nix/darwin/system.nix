{ config, pkgs, ... }:

{
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
      autohide = true;
      mru-spaces = false;
      static-only = true;
      tilesize = 40;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      magnification = true;
      largesize = 80;
      showhidden = true;
      show-recents = false;
    };

    finder = {
      FXPreferredViewStyle = "clmv";
      ShowStatusBar = true;
      ShowPathbar = true;
      FXRemoveOldTrashItems = true;
      FXDefaultSearchScope = "SCcf";
      CreateDesktop = false;
      NewWindowTarget = "Home";
    };

    NSGlobalDomain = {
      _HIHideMenuBar = true;
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      AppleInterfaceStyle = "Dark";
      AppleKeyboardUIMode = 3;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      "com.apple.sound.beep.volume" = 0.6065307;
      "com.apple.trackpad.scaling" = 3.0;
      "com.apple.swipescrolldirection" = false;
    };
  };
    # services = {
    #   karabiner-elements.enable = true;
    # };
}
