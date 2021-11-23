### System
- OS: Ubuntu 21.04 (Hippo)
- GFX Card: Nvidia GeForce GTX 1660 Ti Mobile   

### Install most up to date driver (replace 470 with latest game ready driver)
```bash
sudo apt update
sudo apt install nvidia-driver-470
```    

### Launch Nvidia control panel, set to max performance
```bash
sudo nvidia-settings
```  
	
### Setup Xbone Controller
This is the only way I was able to get my Xbox One controller working via bluetooth on Ubuntu. It would connect and then immediately disconnect otherwise. Or would say connected but the controller wouldn't actually connect.
```bash
sudo apt install dkms git linux-headers-`uname -r`
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh
sudo reboot now
```
