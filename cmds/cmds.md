## CMDs

### Clear old generations but last one

```
nix-env --list-generations
nix-collect-garbage --delete-old
sudo nix-collect-garbage -d
sudo nixos-rebuild switch --flake nix-fwk-system/#fwk-nixos
```