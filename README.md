# Dotfiles

## Install

### 1. Clone as a bare repository

```bash
git clone --bare git@github.com:Zhniing/Dotfiles.git $HOME/Projects/Dotfiles.git
```

### 2. Create an alias `dit` (**d**otfiles & g**it**)

After the `.zshrc` being sourced, you can interact with this bare repository
using `git` directly **when** your working directory is `$HOME`

```bash
alias dit="git --git-dir=$HOME/Projects/Dotfiles.git --work-tree=$HOME"
```

### 3. Ignore untracked files in `git status`

```bash
dit config --local status.showUntrackedFiles no
```

### 4. Restore files (will overwrite existing files):

```bash
dit checkout HEAD <FILE>  # Restore the specific file
dit reset --hard HEAD     # Restore all files
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

### Install plugins

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
