{ ... }:

{
  enable = true;
  extras = {
    coding = {
      mini-surround.enable = true;
      yanky.enable = true;
    };
    editor = {
      dial.enable = true;

      inc-rename.enable = true;
    };
    lang = {
      nix.enable = true;
    };
    test = {
      core.enable = true;
    };
    util = {
      dot.enable = true;
      mini-hipatterns.enable = true;
    };
    # ai = {
    #   copilot.enable = true;
    #   copilot-chat.enable = true;
    # };
  };
}
