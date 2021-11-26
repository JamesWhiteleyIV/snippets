# Linux Setup

Setup vim, zsh, and python3
```bash
sudo apt-get update && sudo apt-get -y install curl zsh git-all python3-pip gnupg && \
curl https://raw.githubusercontent.com/JamesWhiteleyIV/snippets/dotfiles/main/vimrc -o ~/.vimrc && \
mkdir -p ~/.vim/colors && \
curl https://raw.githubusercontent.com/JamesWhiteleyIV/snippets/dotfiles/main/vimfiles/colors/vscode.vim -o ~/.vim/colors/vscode.vim && \ 
curl https://raw.githubusercontent.com/JamesWhiteleyIV/snippets/dotfiles/main/vimfiles/colors/pastel.vim -o ~/.vim/colors/pastel.vim && \
unset $ZSH && \
cd ~ && \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k && \
echo "alias gits='git status'" >> ~/.zshrc && \
echo "alias gitb='git branch'" >> ~/.zshrc && \
echo "alias gitco='git checkout'" >> ~/.zshrc && \
echo "alias gitac='git add --all && git commit -m'" >> ~/.zshrc && \
echo "alias gitpom='git push origin master'" >> ~/.zshrc && \
echo "alias python='python3'" >> ~/.zshrc && \
echo "alias py='python3'" >> ~/.zshrc && \
echo "alias pip='pip3'" >> ~/.zshrc && \
echo "alias open='xdg-open'" >> ~/.zshrc && \
echo "alias start='xdg-open'" >> ~/.zshrc && \
echo "alias ..='cd ..'" >> ~/.zshrc && \
echo "alias ...='cd ..; cd ..'" >> ~/.zshrc && \
echo "alias ....='cd ..; cd ..; cd ..'" >> ~/.zshrc && \
echo "export EDITOR=vim" >> ~/.zshrc 
```
Set ZSH_THEME=powerlevel10k/powerlevel10k in your ~/.zshrc then restart your terminal to start the configuration process of powerlevel10k


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

