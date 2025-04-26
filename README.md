# docker-pandoc-eisvogel-ja

![Build](https://github.com/petitstrawberry/docker-pandoc-eisvogel-ja/workflows/Build/badge.svg)

Pandoc docker image with [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template for Japanese.

## Usage

### Basic Usage

```console
$ docker run --rm -v $(pwd):/data petitstrawberry/pandoc-eisvogel-ja \
    -o doc.pdf \
    doc.md
```

### Fonts

The following Japanese fonts are supported.

- haranoaji (default)
- ipa
- ipaex

It can be specified with a `luatexjapresetoptions` variable.

```console
$ docker run --rm -v $(pwd):/data petitstrawberry/pandoc-eisvogel-ja \
    -V luatexjapresetoptions=ipaex \
    -o doc.pdf \
    doc.md
```

### PlantUML

The `plantuml` tag supports [PlantUML](https://plantuml.com/) using [timofurrer/pandoc-plantuml-filter](timofurrer/pandoc-plantuml-filter).

```console
$ docker run --rm -v $(pwd):/data petitstrawberry/pandoc-eisvogel-ja:plantuml \
    -o doc.pdf \
    doc.md
```

## Examples

See [examples](./examples) directory.

## License

roject is based on [frozenbonito/docker-pandoc-eisvogel-ja](https://github.com/frozenbonito/docker-pandoc-eisvogel-ja), which is licensed under the MIT License.

Modified by petitstrawberry in 2025.
