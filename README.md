# dotfiles

This repo is managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Setup

Initialize chezmoi with dotfiles repo:

``` shell
chezmoi init https://github.com/poiuy17/dotfiles.git
```

See what changes chezmoi would make:

``` shell
chezmoi diff
```

Apply the changes:

``` shell
chezmoi apply -v
```