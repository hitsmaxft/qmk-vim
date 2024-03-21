# qmk-vim Plugin, for qmk user who using vim editor

Welcome to the qmk-vim plugin! This Vim plugin provides syntax highlighting for QMK keymap files and info.json files, as well as virtual text support for symbol keycodes, to enhance your firmware development process within the editor.

## Features

- Syntax Highlighting
- Symbol Keycode Virtual Text
- JSON Highlighting

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

Plugin 'hitsmaxft/qmk-vim'

Then run the following in Vim:

:source %
:PluginInstall

### Pathogen

Run the following in a terminal:

cd ~/.vim/bundle
git clone https://github.com/hitsmaxft/qmk-vim.git

### Dein.vim

Add the following to your .vimrc:

call dein#add('hitsmaxft/qmk-vim')

And install with:

:call dein#install()

## Usage

After installation, the syntax highlighting and virtual text features will automatically activate for files with appropriate extensions when you open them in Vim.

```vim
// vim set ft=hjson.qmkkm
```


## Contributing

Contributions to qmk-vim are welcome! Please review the contributing guidelines before submitting pull requests.

## License

This Vim plugin is open source and released under the MIT License.

## Support

If you encounter any issues or have suggestions, please open an issue on the GitHub repository.

## Acknowledgements

Special thanks to all contributors and the QMK Firmware community.
