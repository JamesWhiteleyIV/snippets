# Linux Setup

Setup vim, bash, and python3
```bash
sudo apt-get update && sudo apt-get -y install curl zsh git-all python3-pip gnupg && \
curl https://raw.githubusercontent.com/JamesWhiteleyIV/snippets/master/dotfiles/vimrc -o ~/.vimrc && \
mkdir -p ~/.vim/colors && \
curl https://raw.githubusercontent.com/JamesWhiteleyIV/snippets/master/dotfiles/vimfiles/colors/vscode.vim -o ~/.vim/colors/vscode.vim && \ 
curl https://raw.githubusercontent.com/JamesWhiteleyIV/snippets/master/dotfiles/vimfiles/colors/pastel.vim -o ~/.vim/colors/pastel.vim && \
echo "alias gits='git status'" >> ~/.bashrc && \
echo "alias gitb='git branch'" >> ~/.bashrc && \
echo "alias gitco='git checkout'" >> ~/.bashrc && \
echo "alias gitac='git add --all && git commit -m'" >> ~/.bashrc && \
echo "alias gitpom='git push origin master'" >> ~/.bashrc && \
echo "alias python='python3'" >> ~/.bashrc && \
echo "alias py='python3'" >> ~/.bashrc && \
echo "alias pip='pip3'" >> ~/.bashrc && \
echo "alias open='xdg-open'" >> ~/.bashrc && \
echo "alias start='xdg-open'" >> ~/.bashrc && \
echo "alias ..='cd ..'" >> ~/.bashrc && \
echo "alias ...='cd ..; cd ..'" >> ~/.bashrc && \
echo "alias ....='cd ..; cd ..; cd ..'" >> ~/.bashrc && \
echo "export EDITOR=vim" >> ~/.bashrc 
echo "export PS1=\"[\D{%H:%M:%S}]$ \"" >> ~/.bashrc 
```


Remap caps-lock to escape
```bash
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```


Configure git (set EMAIL and NAME env vars before; add the ssh key to github after)
```bash
sudo apt-get update && sudo apt-get install xclip && \
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

