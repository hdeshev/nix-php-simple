Following [this post](http://www.foosoft.us/posts/2015-09-25-deploy-a-simple-nixops-website.html)
```
nix-shell

nixops create requirements.nix virtualbox-spec.nix -d nix-php-simple
nixops deploy -d nix-php-simple
```
