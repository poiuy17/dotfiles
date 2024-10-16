# dotfiles

This repo is managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Installation

on Windows
``` shell
scoop install chezmoi
```

on Linux
``` shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
```

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
