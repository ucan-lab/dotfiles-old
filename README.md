# dotfiles MacOS and CentOS only

```
$ git clone https://github.com/ucan-lab/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
$ chsh -s `which zsh`
```

## デフォルトシェルの変更時にエラーが置きた場合

`chsh: /bin/zsh: non-standard shell` が出た場合は zsh のパスを `/etc/shells` へ追記すれば良い

```
$ echo `which zsh` | sudo tee -a /etc/shells
```

