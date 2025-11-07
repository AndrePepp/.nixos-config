set -e # Exit if anything fails

echo "Adding in git ~/.nixos-config..."
sudo git add .

read -p "Commit description: " desc

if [ -z "$desc"]; then
	desc="Backup from /etc/nixos on $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo "Commiting to Git..."
git add .
git commit -m "(gitsync) $desc"
git push

