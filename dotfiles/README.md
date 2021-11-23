# Linux Setup

View this README from terminal
```bash
curl https://raw.githubusercontent.com/JamesWhiteleyIV/dotfiles/main/README.md
```

Install some basic applications
```bash
sudo apt-get update && sudo apt-get install vim-gtk xclip curl gnupg python3-pip git-all
```

Remap caps-lock to escape
```bash
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```

Add .vimrc and vimfiles
```bash
curl https://raw.githubusercontent.com/JamesWhiteleyIV/dotfiles/main/vimrc -o ~/.vimrc && \
mkdir -p ~/.vim/colors && \
curl https://raw.githubusercontent.com/JamesWhiteleyIV/dotfiles/main/vimfiles/colors/james.vim -o ~/.vim/colors/james.vim && \ 
curl https://raw.githubusercontent.com/JamesWhiteleyIV/dotfiles/main/vimfiles/colors/pastel.vim -o ~/.vim/colors/pastel.vim
```

Make your terminal beautiful
```bash
cd ~ && \
sudo apt-get update && sudo apt-get install zsh && \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
Set ZSH_THEME=powerlevel10k/powerlevel10k in your ~/.zshrc then restart your terminal to start the configuration process of powerlevel10k


Update .bashrc
```bash
echo "alias com='git add --all && git commit -m'" >> ~/.bashrc && \
echo "alias po='git push origin'" >> ~/.bashrc && \
echo "alias st='git status'" >> ~/.bashrc && \
echo "alias python='python3'" >> ~/.bashrc && \
echo "alias py='python3'" >> ~/.bashrc && \
echo "alias pip='pip3'" >> ~/.bashrc && \
echo "alias open=xdg-open" >> ~/.bashrc && \
echo "alias ..='cd ..'" >> ~/.bashrc && \
echo "alias ...='cd ..; cd ..'" >> ~/.bashrc && \
echo "alias ....='cd ..; cd ..; cd ..'" >> ~/.bashrc && \
echo "export GREP_OPTIONS=' — color=auto'" >> ~/.bashrc && \
echo "export EDITOR=vim" >> ~/.bashrc && \
echo "export PS1='\033[01;34m\][\W]\[\033[00m\]\$ '" >> ~/.bashrc && \
echo "alias rpibox='ssh pi@192.168.0.100'" >> ~/.bashrc
```

Configure git (set EMAIL and NAME env vars before; add the ssh key to github after)
```bash
git config --global user.email $EMAIL && \
git config --global user.name $NAME && \
ssh-keygen -t ed25519 -C $EMAIL && \
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
```

Install Docker
```bash
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates lsb-release && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \ 
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get install docker-ce docker-ce-cli containerd.io
}
```

