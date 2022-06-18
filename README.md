# fish-exa

## ✅ Requirements
- [Fisher](https://github.com/jorgebucaran/fisher) 4.0+

## 🚀 Install

Install using Fisher:

```console
fisher install gazorby/fish-exa
```

## 🔧 Usage

### Base aliases
| alias            | default options                                                            |
| ---------------- | -------------------------------------------------------------------------- |
| `l`              | `exa`                                                                      |
| `ll`             | `exa --group --header --group-directories-first --long`                    |
| `ll` in git repo | `exa --group --header --group-directories-first --long --git`              |
| `lg`             | `exa --group --header --group-directories-first --long --git --git-ignore` |
| `le`             | `exa --group --header --group-directories-first --long --extended`         |
| `lt`             | `exa --group --header --group-directories-first --tree --level LEVEL`      |
| `lc`             | `exa --group --header --group-directories-first --across`                  |
| `lo`             | `exa --group --header --group-directories-first --oneline`                 |

### Extended aliases

Each base alias has its extended versions with additional options.

An extended alias is one of the form `<BASE ALIAS><SUFFIX>` with suffix from the following:

| Extend suffix | Default options                                    |
| ------------- | ------------------------------------------ |
| `a`           | `--all --binary`                           |
| `d`           | `--only-dirs`                              |
| `i`           | `--icons --only-dirs`                      |
| `id`          | `--icons`                                  |
| `aa`          | `--all --binary --all`                     |
| `ad`          | `--all --binary --only-dirs`               |
| `ai`          | `--all --binary --icons`                   |
| `aid`         | `--all --binary --icons --only-dirs`       |
| `aad`         | `--all --binary --all --only-dirs`         |
| `aai`         | `--all --binary --all --icons`             |
| `aaid`        | `--all --binary --all --icons --only-dirs` |

Any of these suffixes appended to any previous base alias is a valid alias too (eg: `ll + a => lla`).

Examples:

```console
  la => --all --binary
        -------a------

llad => --all --binary --only-dirs --group --header --group-directories-first --long
        ------------ad------------  -----------------------ll------------------------

ltaa => --all --binary --all --group --header --group-directories-first --tree --level LEVEL
        ---------aa---------  ------------------------------lt--------------------------------
```

Extended options are always *prepended* to base aliases options.

### Auto detect git repository

Exa has `--git` options displaying git status of each file in a dedicated column (when using the long view).

When inside a git repo, the `--git` option will be automatically added to every alias beginning with `ll` (as `--git` only works with `--long`) (`lla, llaa, llid` etc).

## 🛠 Configuration

Configuration is done through environment variables.

To avoid spamming your `config.fish`, you can set environment variables using `set -Ux` once, to make them persistent across restarts and share them across fish's instances.

⚠️ : Don't use quotes in variables, set them as a list: `set -Ux EXA_STANDARD_OPTIONS --long --all`

### Default options

`EXA_STANDARD_OPTIONS`


default exa options used in all aliases except `l`

default : `--group --header --group-directories-first`

### Aliases options

You can define per alias options using an env variable named `EXA_<ALIAS>_OPTIONS`.

For example, to customize `ll` specific options, you would store them in `EXA_LL_OPTIONS`

Extended suffixes have their env variable as well : `EXA_<SUFFIX>_OPTIONS`.

## 📝 License

[MIT](https://github.com/Gazorby/fish-exa/blob/master/LICENSE)
