set -e  # Exit if anything fails

echo "Adding in git /etc/nixos..."
cd /etc/nixos || exit 1
sudo git add .

echo "Rebuilding system..."
sudo nixos-rebuild switch --flake /etc/nixos#seven 

echo "Copying /etc/nixos → ~/.nixos-config..."
sudo cp -r /etc/nixos/* ~/.nixos-config/

cd ~/.nixos-config || exit 1

read -p "Commit description: " desc

if [ -z  "$desc" ]; then
	desc="Backup from /etc/nixos on $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo "Committing to Git..."
git add .
git commit -m "(rebuild) $desc"
git push
