# Instruction

## Install dotfiles

1. Clone as a bare repository

```bash
git clone --bare git@github.com:Zhniing/Dotfiles.git
```

2. Use the alias `cit` (combo of "config" and "git") to interact with the bare repository instead of the plain `git`

```bash
alias cit="git --git-dir=$HOME/Projects/Dotfiles.git --work-tree=$HOME"
```

3. Restore files (overwrite existing files):

```bash
cit checkout HEAD <FILE>  # Restore the specific file
cit reset --hard HEAD     # Restore all files
```

Miscellaneous:

```bash
# Ignore untracked files when running `git status`
cit config --local status.showUntrackedFiles no
```

Resources: 
- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Hard reset of a single file](https://stackoverflow.com/a/7147320)

## Zsh

### Install oh-my-zsh

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```

### Install third-party plugins

1. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

*"zsh-syntax-highlighting" should be activated after all the other plugins.*

## Alacritty

### Install fonts

1. Download **Hack Nerd Font** from [the latest release](https://github.com/ryanoasis/nerd-fonts/releases/latest)

2. Unzip and move the `.ttf` files to `$HOME/.local/share/fonts/`

3. Check the installed fonts:

```bash
fc-list
```

## Neovim

### Install Neovim

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

## Ranger

```bash
sudo apt install highlight  # Syntax highlight when previewing
sudo apt install ueberzug  # Preview images
```
