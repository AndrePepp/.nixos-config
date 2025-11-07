set -e  # Exit if anything fails

echo "Updating flakes..."
sudo nix flake update

read -p "Commit description: " desc

if [ -z "$desc" ]; then
	desc="Backup from /etc/nixos on $(date '+%Y-%m-%d  %H:%M:%S')"
fi

echo "Committing to Git..."
git add .
git commit -m "(flake-update) $desc"
git push
