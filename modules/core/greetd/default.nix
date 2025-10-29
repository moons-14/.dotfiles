{ pkgs, username, ... }: {
  programs.regreet.enable = true;
  programs.niri.enable = true;

  environment.etc."regreet/config.ron".source = ./config.ron;
  environment.etc."greetd/niri.kdl".source = ./niri.kdl;

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.niri}/bin/niri --config /etc/greetd/niri.kdl";
      };
    };
  };

  environment.etc."regreet/config.ron".source = ./config.ron;
}
