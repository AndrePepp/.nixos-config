set -e  # Exit if anything fails

sudo git add .

echo "Rebuilding system..."
sudo nixos-rebuild switch --flake ~/.nixos-config#seven 

read -p "Commit description: " desc

if [ -z  "$desc" ]; then
	desc="Backup from /etc/nixos on $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo "Committing to Git..."
git add .
git commit -m "(rebuild) $desc"
git push
