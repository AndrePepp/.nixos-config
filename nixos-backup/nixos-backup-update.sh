set -e  # Exit if anything fails

echo "Updating flakes..."
cd /etc/nixos
sudo nix flake update

echo "Copying /etc/nixos → ~/.nixos-config..."
sudo cp -r /etc/nixos/* ~/.nixos-config/

cd ~/.nixos-config || exit 1

read -p "Commit description: " desc

if [ -z "$desc" ]; then
	desc= "Backup from /etc/nixos on $(date '+%Y-%m-%d  %H:%M:%S')"
fi

echo "Committing to Git..."
git add .
git commit -m "(flake-update) $desc"
git push
