{
  network.description = "Nix PHP Simple Site";

  appserver = { stdenv, config, pkgs, ... }:
    let
      siteContent = import ./application.nix;
    in {
      boot.kernelPackages = pkgs.linuxPackages_4_4;

      environment.systemPackages = [
        pkgs.apacheHttpd
        siteContent
      ];

      networking.firewall.allowedTCPPorts = [22 80];

      services.openssh.enable = true;

      services.httpd.enable       = true;
      services.httpd.enablePHP    = true;
      services.httpd.adminAddr    = "webmaster@example.com";
      services.httpd.documentRoot = "${siteContent}/web";

      users.extraUsers.root.openssh.authorizedKeys.keys = [
"ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0VLHLGykWFaQts820P1vbOqftmn1fmwfb354ceEyTekgfTShUtFP51sfNd0E2mzClBYzdJiPCcaRtrHBrzSxk+tcYiEN2NAGe4LuHtABb3Dn7fRFc1LA6bcHA4/Yt7ztdAY4D6NdVk8v8c9RHKmywT8oNnWheb8o5e3Inr4MUuXAw5uxwE6jWIYTcMRk1CeZBfAqiF5gnoZ1JYieAA0gCytPOFDdKaUZs2rsKZoXtzbrY9i5EhHQ4UiVYu8gv9gvrS2vB1tGBillF8eAyUD1XnlDRD2LnXZgcFtYekfMe0m+lMcdnZFvnMaq7L4kUSu4yhvEeiXs/ijbI/znBr9kpw== blahblah@gmail.com"
      ];
    };
}
