```
nix-shell

nixops create requirements.nix virtualbox-spec.nix -d nix-php-simple
nixops deploy -d nix-php-simple
```
