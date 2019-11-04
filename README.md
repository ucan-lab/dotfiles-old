# dotfiles MacOS and CentOS only

```
$ rm -rf ~/dotfiles
$ git clone https://github.com/ucan-lab/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

# tips

## nodenv

```
$ nodenv install -h # インストール可能なバージョン一覧
$ nodenv install 13.0.1
$ nodenv global 13.0.1
$ node -v
```

## change default shell

```
$ chsh -s `which zsh`
```

`chsh: /bin/zsh: non-standard shell` が出た場合は zsh のパスを `/etc/shells` へ追記すれば良い

```
$ echo `which zsh` | sudo tee -a /etc/shells
```
