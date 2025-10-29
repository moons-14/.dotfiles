{ pkgs, ... }: {
  programs.regreet.enable = true;
  environment.systemPackages = with pkgs; [ cage ];

  environment.etc."regreet/config.ron".source = ./config.ron;

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.cage}/bin/cage -s -mlast -- regreet --config /etc/regreet/config.ron";
      };
    };
  };
}
