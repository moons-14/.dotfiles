{ ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "jp";
        variant = "";
        options = "ctrl:nocaps";
      };
    };
  };
}