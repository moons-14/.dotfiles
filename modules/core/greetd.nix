{ pkgs, username, ... }: {
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri";
      };
    };
  };
}
