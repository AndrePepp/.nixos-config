set -e  # Exit if anything fails

echo "Copying /etc/nixos → ~/.nixos-configs..."
sudo cp -r /etc/nixos/* ~/.nixos-configs/

cd ~/.nixos-configs || exit 1

echo "Committing to Git..."
git add .
git commit -m "Backup from /etc/nixos on $(date '+%Y-%m-%d %H:%M:%S')"
git push

echo "Rebuilding system..."
sudo nixos-rebuild switch --flake /etc/nixos#seven
