{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs; [
    regreet
    cage
  ];

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.cage}/bin/cage -s -- ${pkgs.regreet}/bin/regreet --time --remember --cmd niri-session";
      };
    };
  };

  environment.etc."regreet/config.ron".source = ./config.ron;
}
