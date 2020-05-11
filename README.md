# fish-exa

## 🚀 Install

Install using fisher :

```console
fisher add Gazorby/fish-exa
```
## 🔧 Usage

### Aliases
alias | default options
------|-------
`l` | `exa`
`ll` | `exa --long --all --group --header --git` if in git repo else `exa --long --all --group --header`
`la` | `exa --long --all --group --header --binary --links --inode --blocks`
`ld` | `exa --long --all --group --header --list-dirs`
`lg` | `exa --long --all --group --header --git`
`le` | `exa --long --all --group --header --extended`
`lt` | `exa --long --all --group --header --tree --level LEVEL`

## 🛠 Configuration

Configuration is done through environment variables.

To avoid spamming your `config.fish`, you can set environment variables using `set -Ux` once, to make them persistent across restarts and share them across fish's instances

⚠️ : Don't use quotes in variables, set them as a list : `set -Ux EXA_STANDARD_OPTIONS --long --all`

### Default options

`EXA_STANDARD_OPTIONS`


default exa options used in all aliases except `l`

default : `--long --all --group --header`

### Aliases options

You can define per alias options using an env variable with name `EXA_<ALIAS>_OPTIONS`.

For example, to customize `ll` specific options, you would store them in `EXA_LL_OPTIONS`

Here are the defaults :

- `EXA_LL_OPTIONS` : No specific options
- `EXA_LA_OPTIONS` : `--binary --links --inode --blocks`
- `EXA_LD_OPTIONS` : `--list-dirs`
- `EXA_LG_OPTIONS` : `--git`
- `EXA_LE_OPTIONS` : `--extended`
- `EXA_LT_OPTIONS` : `--tree --level LEVEL` You must pass the max number of levels to `--level` option

## 📝 License

[MIT](https://github.com/Gazorby/fish-exa/blob/master/LICENSE)
