{ pkgs, username, ... }: {
  programs.regreet.enable = true;
  services.cage.enable = true;

  environment.etc."regreet/config.ron".source = ./config.ron;

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "greeter";
        command = "cage -s -mlast -- regreet";
      };
    };
  };
}
