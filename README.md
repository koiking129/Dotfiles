# Instruction

## Install dotfiles

### 1. Clone as a bare repository

```bash
git clone --bare git@github.com:Zhniing/Dotfiles.git $HOME/Projects/Dotfiles.git
```

### 2. Create an alias `cit` (**c**onfig & g**it**) to access this bare repository

After the `.zshrc` being sourced, you can access this repository using `git` straightforwardly **when** your working directory is `$HOME`

```bash
alias cit="git --git-dir=$HOME/Projects/Dotfiles.git --work-tree=$HOME"
```

### 3. Ignore untracked files in `git status`

```bash
cit config --local status.showUntrackedFiles no
```

### 4. Restore files (will overwrite existing files):

```bash
cit checkout HEAD <FILE>  # Restore the specific file
cit reset --hard HEAD     # Restore all files
```

Resources: 
- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Hard reset of a single file](https://stackoverflow.com/a/7147320)

## Zsh

### Choose a `.zshrc`

```bash
ln -s .omz.zshrc .zshrc  # Use Oh-My-Zsh
ln -s .grml.zshrc .zshrc  # Use grml-zsh-config
```

### Install oh-my-zsh

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```

### Install third-party plugins

#### 1. zsh-autosuggestions

[zsh-users/zsh-autosuggestions: Fish-like autosuggestions for zsh](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### 2. fast-syntax-highlighting

[zdharma-continuum/fast-syntax-highlighting: Feature-rich syntax highlighting for ZSH](https://github.com/zdharma-continuum/fast-syntax-highlighting)

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

#### 3. fzf-tab

[Aloxaf/fzf-tab: Replace zsh's default completion selection menu with fzf!](https://github.com/Aloxaf/fzf-tab)

```bash
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

#### 4. fzf-git.sh

[junegunn/fzf-git.sh: bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)

```bash
wget https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh -O ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/fzf-git.zsh
```

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

#### 1. Install from source

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
sudo apt-get install ninja-build gettext cmake unzip curl
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Refer to [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)

#### 2. Install the symbolic links

```bash
nvim_bin="/usr/local/bin/nvim"
sudo update-alternatives --install /usr/bin/vi vi "$nvim_bin" 50
sudo update-alternatives --install /usr/bin/vim vim "$nvim_bin" 50
sudo update-alternatives --install /usr/bin/editor editor "$nvim_bin" 50
```

### Install plugins

```vim
:PackerSync
```

## Utilities

```bash
sudo apt install ranger  # File manager
sudo apt install highlight  # Syntax highlight when previewing
sudo apt install flameshot  # Screenshot
sudo apt install sxhkd  # Custom hotkey
sudo apt install picom  # Compositor
sudo apt install rofi  # Application launcher
sudo apt install betterlockscreen  # Lockscreen
```

### ueberzugpp

[jstkdng/ueberzugpp: Drop in replacement for ueberzug written in C++](https://github.com/jstkdng/ueberzugpp)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jstkdng/programs/ueberzugpp
```

## Modern unix commands

[ibraheemdev/modern-unix: A collection of modern/faster/saner alternatives to common unix commands.](https://github.com/ibraheemdev/modern-unix)

### 1. fzf

[junegunn/fzf: :cherry\_blossom: A command-line fuzzy finder](https://github.com/junegunn/fzf)

```bash
sudo apt install fzf
```

### 2. ag

[ggreer/the\_silver\_searcher: A code-searching tool similar to ack, but faster.](https://github.com/ggreer/the_silver_searcher)

```bash
sudo apt install silversearcher-ag
```

### 3. lsd

[lsd-rs/lsd: The next gen ls command](https://github.com/lsd-rs/lsd)

```bash
sudo apt isntall lsd
```

### 4. bat

[sharkdp/bat: A cat(1) clone with wings.](https://github.com/sharkdp/bat)

```bash
sudo apt install bat
```

### 5. delta

[dandavison/delta: A syntax-highlighting pager for git, diff, and grep output](https://github.com/dandavison/delta/releases/latest)

```bash
git config --global --add include.path "~/.config/delta.gitconfig"
```

### 6. zoxide

[ajeetdsouza/zoxide: A smarter cd command. Supports all major shells.](https://github.com/ajeetdsouza/zoxide)

```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

### 7. procs

[dalance/procs: A modern replacement for ps written in Rust](https://github.com/dalance/procs/releases/latest)


### 8. duf

[muesli/duf: Disk Usage/Free Utility - a better 'df' alternative](https://github.com/muesli/duf)

```bash
sudo apt install duf
```

### 9. dust

[bootandy/dust: A more intuitive version of du in rust](https://github.com/bootandy/dust/releases/latest)

## Git

Install [tig](https://github.com/jonas/tig)

```bash
git clone git@github.com:jonas/tig.git
cd tig
sudo make install prefix=/usr/local
sudo make install-doc prefix=/usr/local  # Install the docs
```
