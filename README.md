# dotfiles MacOS and CentOS only

```
$ git clone https://github.com/ucan-lab/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

## zsh default shell

```
$ echo `which zsh` | sudo tee -a /etc/shells
$ chsh -s `which zsh`
```
