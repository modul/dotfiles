# Dotfiles
[![test status][pipeline]](https://gitlab.com/modulification/dotfiles)

These are my personal configuration files.

## Installation

I'm using [dotbot](https://github.com/anishathalye/dotbot) to install dotfiles. That 
makes the process as simple as:

```sh
git clone https://github.com/modul/dotfiles && cd dotfiles && ./install
```

or in fish:

```sh
git clone https://github.com/modul/dotfiles
and cd dotfiles
and ./install
```

## Testing

I set up a simple CI pipeline to test the installation process and warn me
about a broken dotbot configuration (missing files, typos). If the pipeline
passes (see above) everything seems to be working.


[pipeline]: https://gitlab.com/modulification/dotfiles/badges/master/pipeline.svg
