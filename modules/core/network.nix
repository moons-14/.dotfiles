{ host, pkgs, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;

    nameservers = [ "127.0.0.1" "::1" ];
    networkmanager.dns = "none";
  };

  services.resolved.enable = false;

  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];
  programs.nm-applet.enable = true;

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      doh_servers = true;
      dnscrypt_servers = false;

      ipv6_servers = true;
      require_dnssec = true;
      require_nolog = true;
      require_nofilter = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      server_names = [ "cloudflare" "quad9-doh" ];

      listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];
    };
  };
}
