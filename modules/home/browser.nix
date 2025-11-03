{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [
    google-chrome
  ];

  xdg.desktopEntries."google-chrome" = {
    name = "Google Chrome";
    genericName = "Web Browser";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --enable-features=TouchpadOverscrollHistoryNavigation %U";
    terminal = false;
    icon = "google-chrome";
    categories = [ "Network" "WebBrowser" ];
    startupNotify = true;
    type = "Application";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = "google-chrome.desktop";
    "x-scheme-handler/http" = "google-chrome.desktop";
    "x-scheme-handler/https" = "google-chrome.desktop";
  };
}
