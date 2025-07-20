set -e # Exit if anything fails

echo "Adding in git /etc/nixos..."
sudo git add .

echo "Copying /etc/nixos -> ~/.nixos-config..."
sudo cp -r /etc/nixos/* ~/.nixos-config/

cd ~/.nixos-config  || exit 1

read -p "Commit description: " desc

if [ -z "$desc"]; then
	desc="Backup from /etc/nixos on $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo "Commiting to Git..."
git add .
git commit -m "(gitsync) $desc"
git push

