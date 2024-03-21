# qmk-vim Plugin, for qmk user who using vim editor

Welcome to the qmk-vim plugin! This Vim plugin provides syntax highlighting for QMK keymap files , as well as virtual text support for symbol keycodes, to enhance keymap  editing  experience

## Features

- Enhanced hjson syntax support for keymap.json
- todo: syntax enhance for keymap.c keyboard.json/info.json
- showing  Symbol Keycode in Virtual Text

## Installation

qmk-vim can be installed with several popular Vim plugin managers. Choose your favorite one and follow the instructions below:

### Vim-Plug

Place this in your .vimrc:

Plug 'hitsmaxft/qmk-vim'

Then run the following in Vim:

:source %
:PlugInstall

### Vundle

Place this in your .vimrc:

```vim
Plugin 'hitsmaxft/qmk-vim'
```

Then run the following in Vim:

```
:source %
:PluginInstall
```

### Pathogen

Run the following in a terminal:

```shell
cd ~/.vim/bundle
git clone https://github.com/hitsmaxft/qmk-vim.git
```

### Dein.vim

Add the following to your .vimrc:

```vim
call dein#add('hitsmaxft/qmk-vim')
```

And install with:

```
:call dein#install()
```


## Usage

add a model line to first line of your keymap.json

```vim
// vim: set ft=hjson.qmkkm:
```

After installation, the syntax highlighting and virtual text features will automatically activate for files with appropriate extensions when you open them in Vim.

dont worry, keymap.json is hjson, add comment is allowed.


## Contributing

Contributions to qmk-vim are welcome! Please review the contributing guidelines before submitting pull requests.

## License

This Vim plugin is open source and released under the MIT License.

## Support

If you encounter any issues or have suggestions, please open an issue on the GitHub repository.

## Acknowledgements

Special thanks to all contributors and the QMK Firmware community.
