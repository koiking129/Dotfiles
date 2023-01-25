# Dotfiles

## Third-party plugins for zsh

### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

**This plugin should be activated after all the other plugins.**

## Neovim

### Install the latest Neovim

1. Download from [the latest release](https://github.com/neovim/neovim/releases/tag/stable)

```bash
sudo apt install ./nvim-linux64.deb
```

2. Install the symbolic links

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 50
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 50
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 50
```

### Install plugins

```vim
:PackerSync
```

### Install fonts

1. Download the [Nerd Fonts](https://www.nerdfonts.com/)

2. Unzip and move the `.ttf` files to `$HOME/.local/share/fonts/`

3. Check the installed fonts:

```bash
fc-list
```
