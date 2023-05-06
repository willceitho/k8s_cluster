echo "[Task0] Add ssh key"
echo "Config keys"
cp /shared_data/keys/id_rsa /root/.ssh/id_rsa && chmod 400 /root/.ssh/id_rsa
cat /shared_data/keys/id_rsa.pub > /root/.ssh/authorized_keys

echo "Install needed apps"
apt install zsh tree make -y

echo "Config zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
cp /shared_data/.zshrc /root/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
