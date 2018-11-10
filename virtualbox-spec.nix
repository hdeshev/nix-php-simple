{
  appserver = { config, pkgs, ... }:
  {
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.memorySize = 1024;
    deployment.virtualbox.headless = true;
  };
}
