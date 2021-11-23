# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install python 3, autohotkey, spotify
choco install python3 autohotkey spotify -y

# install cmake
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'

# install vim
choco install vim --params "'/NoDefaultVimrc /NoDesktopShortcuts'" -y

# install git 
choco install git --params "/GitOnlyOnPath /WindowsTerminal /NoAutoCrlf" -y

# restart powershell to refresh and get git on PATH

# set git config credentials
#git config --global user.email "you@example.com"
git config --global user.email "$env.EMAIL"
git config --global user.name "James Whiteley"

# setup ssh key, copy from clipboard into git web
#ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-keygen -t ed25519 -C "$env.EMAIL"
cmd /c 'clip < "%USERPROFILE%\.ssh\id_ed25519.pub"'

# copy dot files and autohotkey script
md -Force "$env:USERPROFILE\git\personal"
cd "$env:USERPROFILE\git\personal"
git clone git@github.com:JamesWhiteleyIV/dotfiles.git
echo f | xcopy /Y /F .\dotfiles\vimrc "$env:USERPROFILE\.vimrc"
echo f | xcopy /Y /F .\dotfiles\gitconfig "$env:USERPROFILE\.gitconfig"
echo f | xcopy /Y /F .\dotfiles\hotkeys.ahk "$env:USERPROFILE\hotkeys.ahk"
echo f | xcopy /Y /F .\dotfiles\hotkeys.ahk "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\hotkeys.ahk"
echo d | xcopy /Y /F /S .\dotfiles\vimfiles\colors "$env:USERPROFILE\vimfiles\colors"

