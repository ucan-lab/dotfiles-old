# dotfiles MacOS only

```
xcode-select --install
```

```
git clone https://github.com/ucan-lab/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

# tips

## brew cask install

```
cd ~/dotfiles && ./brew-cask-install.sh
```

## nodenv

```
nodenv install -h # インストール可能なバージョン一覧
nodenv install 13.0.1
nodenv global 13.0.1
node -v
```
